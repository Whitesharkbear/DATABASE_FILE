<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
			  $.ajax({
				  url: "emp_json_proc.jsp", 
				  success: function(result){
					  // JSON 객체로 파싱 - JSON.parse(서버에서 전송된 문자열)
					  var jdata = JSON.parse(result);
			   		  // alert(jdata.jlist[0].empno);
			   		  var output = "<h1> Emp 사원정보</h1>";
			   		  output += "<table border = 1>";
			   		  output += "<tr><th>사원번호</th><th>사원명</th><th>직무</th><th>입사일</th><th>부서번호</th></tr>";
			   		  for(var i in jdata.jlist){
			   		 	 output += "<tr>";
			   		  	 output += "<td>" + jdata.jlist[i].empno + "</td>";
				   		 output += "<td class = 'ename' id = '"+ jdata.jlist[i].empno +"'>" + jdata.jlist[i].ename + "</td>";
				   		 output += "<td>" + jdata.jlist[i].job + "</td>";
				   		 output += "<td>" + jdata.jlist[i].hiredate + "</td>";
				   		 output += "<td>" + jdata.jlist[i].deptno + "</td>";
			   		  	 output += "</tr>";
			   		  }
			   		  output += "</table>";
			   		  output += "<div class = 'modal'>";
			   		  output += "<div class = 'modal_body'></div>";
			   		  output += "</div>";
			   		  
			   		  $("body").append(output);
			   		  
					  // 사원명을 클릭했을때 발생하는 클릭 이벤트
			   		  $(".ename").click(function(){
						// 자신의 id(사원번호)를 출력
						// alert($(this).attr("id"));
						
						// 자신의 id(사원번호)를 가지고 ajax메소드를 이용하여 DB연동
						$.ajax({
							url: "emp_json_proc2.jsp?empno=" + $(this).attr("id"),
							success: function(content){
								// 문자열인 content를 파싱해서 Json객체로 변환
								var employee = JSON.parse(content);
								
								// 모달창에 출력
								$(".modal").css("display","block");
								
								var modal_output = "<div id='content'>";
								modal_output += "<table border = 1>";
								modal_output += "<h3>사 원 정 보</h3>";
								modal_output += "<tr><th>사원번호</th><td>"+ employee.empno +"</td></tr>";
								modal_output += "<tr><th>사원명</th><td>"+ employee.ename +"</td></tr>";
								modal_output += "<tr><th>직무</th><td>"+ employee.job +"</td></tr>";
								modal_output += "<tr><th>입사일</th><td>"+ employee.hiredate +"</td></tr>";
								modal_output += "<tr><th>급여</th><td>"+ employee.sal +"</td></tr>";
								modal_output += "<tr><th>커미션</th><td>"+ employee.comm +"</td></tr>";
								modal_output += "<tr><th>부서번호</th><td>"+ employee.deptno +"</td></tr>";
								modal_output += "</table>";
								modal_output += "<button type='button' id='close'>닫기</button>";
								modal_output += "</div>";
								
								$("#content").remove();
								$(".modal_body").append(modal_output);
								
								//모달창 닫기
								$("#close").click(function() {
									$(".modal").css("display","none");
								});
								
								
							}
						});
						/*
						$(".modal").css("display","block");
						
						var modal_output = "<div>"+$(this).attr("id")+"</div>";
						modal_output += "<button type='button' id='close'>닫기</button>";
						
						$("#close").remove();
						$(".modal_body").append(modal_output);
						
						//모달창 닫기
						$("#close").click(function() {
							$(".modal").css("display","none");
						});*/
					});
			  
			}}); // ajax
	}); // ready
</script>
<style>
	#content{
		text-align: center;
	}
	
	#close{
		position: absolute;
		top: 265px; left: 163px;
		background-color: orange;
		color: white;
		border: 1px solid white;
		padding: 5px 15px;
		border-radius: 5px;
	}
	.modal_body{
		position: absolute;
		top: 100px; left: 400px;
		width: 15%; height: 300px;
		border-radius: 7px;
		background-color: white;
	}
	.modal{
		position: absolute;
		top: 0; left: 0;
		width: 100%; height: 100%;
		background-color: rgba(0,0,0,0.2);
		display: none;
	}
	.ename:hover{text-decoration: underline; color: tomato;}
</style>
</head>
<body>

</body>
</html>
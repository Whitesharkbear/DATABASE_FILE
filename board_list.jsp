<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/mycgv/css/mycgv.css">
<script src="http://localhost:9000/mycgv/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		//1. ajax() --> 게시글 전체리스트 JSON타입 가져오는 작업
		$.ajax({
			url : "board_list_json.jsp",
			success: function(result){
				//alert(result);
				var blist = JSON.parse(result);
				//alert(blist);
				
				//2. result 값을 DHTML 형식으로 출력
				var output = "<table class='content_layout'>";
				output += "<tr><th>번호</th><th>제목</th><th>조회수</th><th>등록일</th></tr>";
				for(var i in blist.list){
					output += "<tr>";
					output += "<td>"+ blist.list[i].rno +"</td>";
					output += "<td class='btitle' id='"+ blist.list[i].bid +"'>"+ blist.list[i].btitle +"</td>";
					output += "<td>"+ blist.list[i].bhits +"</td>";
					output += "<td>"+ blist.list[i].bdate +"</td>";
					output += "</tr>";
				}
				output += "<tr><td colspan='4'><< 1   2   3   4   5>></td></tr>";
				output += "</table>";
				output += "<div class='modal'>";
				output += "<div class='modal_body'></div>";
				output += "</div>";
				
				$("h1.title").after(output);
				
				//제목을 클릭했을 때 모달로 띄우는 이벤트 처리
				$(".btitle").click(function(){
					//alert($(this).attr("id"));
					
					$.ajax({
						url:"board_content_json.jsp?bid="+$(this).attr("id"),
						success:function(content){
							//alert(content);
							//문자열인 content를 파싱해서 JSON 객체로 변환
							var board = JSON.parse(content);
							
							//모달창에 출력
							$(".modal").css("display","block");
							
							var modal_output = "<div id='bcontent'>";
							modal_output += "<h3>게시글 상세보기</h3>";
							modal_output += "<table border=1>";
							modal_output += "<tr><th>제목</th><td>"+ board.btitle  +"</td></tr>";
							modal_output += "<tr><th>내용</th><td>"+ board.bcontent  +"</td></tr>";
							modal_output += "<tr><th>조회수</th><td>"+ board.bhits  +"</td></tr>";
							modal_output += "<tr><th>등록일</th><td>"+ board.bdate  +"</td></tr>";							
							modal_output += "</table>";
							modal_output += "<button type='button' id='close'>닫기</button>";
							modal_output += "</div>";
							
							$("#bcontent").remove();
							$(".modal_body").append(modal_output);
							
							//모달창 닫기 이벤트
							$("#close").click(function(){
								$(".modal").css("display","none");
							});//modal close
							
						}
					
					});//ajax					
					
					
				});//modal open
				
			}//succ
		});//ajax
	});	//ready
</script>
<style>
	#bcontent { text-align:center; }
	#bcontent table { width:70%; margin:auto; font-size:10pt;}
	#close {
		position:absolute;
		top:250px;  left:430px;
		background-color:tomato;
		color:white;
		border:1px solid white;
		padding: 5px 15px;
		border-radius:5px;
	}
	.modal_body {
		position:absolute;
		top:100px;  left:400px;
		width:40%;  height:300px;
		border-radius:7px;
		background-color:white;
	}
	.modal {
		position: absolute;
		top:0;  left:0;
		width:100%; height:100%;
		background-color:rgba(0,0,0,0.3);
		display:none;
	}
	.btitle:hover { text-decoration:underline; color:tomato; }
</style>
</head>
<body>
	<!--  header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<section class="board_list">
			<h1 class="title">게시판(JSON)</h1>
			<%-- <table class="content_layout">
				<tr>
					<td colspan="4">
						<a href="board_write.jsp"><button type="button">글쓰기</button></a>
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<th>제목</th>	
					<th>조회수</th>
					<th>등록일</th>
				</tr>
				<% for(CgvBoardVO vo : list){ %>
				<tr>
					<td><%= vo.getRno() %></td>
					<td><a href="board_content.jsp?bid=<%=vo.getBid()%>&rno=<%=vo.getRno()%>"><%= vo.getBtitle() %></a></td>
					<td><%= vo.getBhits() %></td>
					<td><%= vo.getBdate() %></td>
				</tr>
				<% } %>
				<tr>
					<td colspan="4"><< 1   2   3   4   5>></td>					
				</tr>
			</table> --%>
		</section>
		
	</div>
	
	<!--  footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
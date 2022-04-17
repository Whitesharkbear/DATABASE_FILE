<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function loginCheck() {
		var id = document.getElementById("id");
		var pass = document.getElementById("pass");
		// id,pass = object(객체)이다.
		
		if(id.value == ""){
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
		}else if(pass.value == ""){
			alert("패스워드를 입력해주세요.");
			pass.focus();
			return false;
		}
		
		// 폼이름.submit();
		LoginForm.submit();
		
	}
</script>
</head>
<body>
	<h1>로그인 화면</h1>
	<form name="LoginForm" action="02_loginProc.jsp" method="post">
		<ul>
			<li>
				<label>아이디</label>
				<input type="text" name="id" id="id">
			</li>
			<li>
				<label>패스워드</label>
				<input type="password" name="pass" id="pass">
			</li>
			<li>
				<button type="button" onclick="loginCheck()">로그인</button>
				<button type="reset">다시쓰기</button>
			</li>
		</ul>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String sid = (String)session.getAttribute("sid");
	if(sid != null && sid.equals("admin")){

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 페이지 입니다.</h1>
</body>
</html>
<% } else{%>
	<script>
		alert("로그인이 필요한 페이지입니다.");
		location.href="http://localhost:9000/mycgv/login/login.jsp";
	</script>
<% } %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- Include 지시자 : hello.jsp include --%>
	<%@ include file="hello.jsp" %>
	
	<%-- 전역변수 선언 --%>
	<%! int number = 100; %>
	
	<%-- 스크립트릿을 이용한 자바코드 삽입 --%>
	<%
		String name="hong";
		System.out.println("My name is" + name); //서버 콘솔에 출력
		out.write("My name is" + name); //브라우저 화면에 출력
	%>
	
	<%-- 표현식을 이용한 name 변수 출력 --%>
	<h3>My name is <%= name %></h3>
	
</body>
</html>
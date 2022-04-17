<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.myweb.vo.LoginVO"
    %>
    
<%-- 클라이언트의 요청 처리 --%>
<jsp:useBean id="vo" class="com.myweb.vo.LoginVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%--
	LoginVO vo = new LoginVO();
	vo.setId(request.getParameter("id"));
	vo.setPass(request.getParameter("pass"));
	/*String id = request.getParameter("id");
	String pass = request.getParameter("pass");*/
--%>


<%-- 클라이언트의 응답결과 전송 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 결과 전송</h1>
	<h3>VO객체 아이디 : <%= vo.getId() %></h3>
	<h3>VO객체 패스워드 : <%= vo.getPass()%></h3>
</body>
</html>
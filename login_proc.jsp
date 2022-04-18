<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.mycgv.vo.CgvMemberVO, com.mycgv.dao.CgvMemberDAO"
    %>
    
<jsp:useBean id = "vo" class = "com.mycgv.vo.CgvMemberVO"/>
<jsp:setProperty name = "vo" property="*"/>
<%
	CgvMemberDAO dao = new CgvMemberDAO();
	int result = dao.select(vo);
	if(result == 1){
		// 로그인 성공
		session.setAttribute("sid", vo.getId());
		response.sendRedirect("../index.jsp?login=succ");
	}else{
		// 로그인 실패
		response.sendRedirect("login.jsp?login=fail");
	}
	

%>
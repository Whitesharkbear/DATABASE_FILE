<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.mycgv.dao.CgvMemberDAO"
    %>
    
<%
	// ajax 메소드에서 중복체크를 요청한 id 
	String id = request.getParameter("id");

	// DB연동
	CgvMemberDAO dao = new CgvMemberDAO();
	int result = dao.idCheck(id);

	// ajax success로 결과값 전송 : String 값으로 전송함!
	out.write(String.valueOf(result));
%>

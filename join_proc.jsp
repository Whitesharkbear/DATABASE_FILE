<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.mycgv.vo.CgvMemberVO, com.mycgv.dao.CgvMemberDAO"
    %>
    
<jsp:useBean id = "vo" class = "com.mycgv.vo.CgvMemberVO" />
<jsp:setProperty name = "vo" property="*" />

<%
	CgvMemberDAO dao = new CgvMemberDAO();
	int result = dao.insert(vo);
	String msg = "";
	if(result==1){
		// 성공 --> index.jsp 이동
		response.sendRedirect("http://localhost:9000/mycgv/login/login.jsp?join=succ");
	}else{
		// 실패 --> 에러 페이지 이동
		response.sendRedirect("http://localhost:9000/mycgv/errorpage.jsp");
	}

%>

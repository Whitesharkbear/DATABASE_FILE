<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.mycgv.vo.CgvBoardVO, com.mycgv.dao.CgvBoardDAO"
%>

<%
	// bid
	String bid = request.getParameter("bid");
	CgvBoardDAO dao = new CgvBoardDAO();
	int result = dao.delete(bid);//삭제메소드
	
	if(result == 1){
		response.sendRedirect("board_list.jsp");
	}
 %>


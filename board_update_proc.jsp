<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.mycgv.vo.CgvBoardVO, com.mycgv.dao.CgvBoardDAO"
%>

<jsp:useBean id="vo" class="com.mycgv.vo.CgvBoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%
   CgvBoardDAO dao = new CgvBoardDAO();
   int result = dao.update(vo);
   
   if(result == 1) {
      response.sendRedirect("board_list.jsp");
   } else {
      response.sendRedirect("errorPage.jsp");
   }

%>

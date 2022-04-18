<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.mycgv.dao.CgvBoardDAO, com.mycgv.vo.CgvBoardVO,
    			com.google.gson.*"
    %>
<%
	String bid = request.getParameter("bid");
	CgvBoardDAO dao = new CgvBoardDAO();
	CgvBoardVO vo = dao.select(bid);
	Gson gson = new Gson();
	
	JsonObject jobject = new JsonObject();
	jobject.addProperty("bid", vo.getBid());
	jobject.addProperty("btitle", vo.getBtitle());
	jobject.addProperty("bcontent", vo.getBcontent());
	jobject.addProperty("bhits", vo.getBhits());
	jobject.addProperty("bdate", vo.getBdate());
	//{"bid":"b_23",...}
	
	out.write(gson.toJson(jobject));
%>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.mycgv.dao.CgvBoardDAO, com.mycgv.vo.CgvBoardVO,
    			java.util.ArrayList, com.google.gson.*"
    %>
<%
	CgvBoardDAO dao = new CgvBoardDAO();
	ArrayList<CgvBoardVO> list = dao.select();
	
	//JSON 변환객체 생성
	//gson 라이브러리는 WEB-INF\lib 폴더에 저장
	//{"list":[{"rno":1,"btitle":..},{}...]}
	JsonObject jobject = new JsonObject(); //{}
	JsonArray jarray = new JsonArray();  //[]
	Gson gson = new Gson();
	
	for(CgvBoardVO vo : list){
		JsonObject obj = new JsonObject();
		obj.addProperty("rno", vo.getRno());
		obj.addProperty("btitle", vo.getBtitle());
		obj.addProperty("bhits", vo.getBhits());
		obj.addProperty("bdate", vo.getBdate());
		obj.addProperty("bid", vo.getBid());
		
		jarray.add(obj);
	}
	
	jobject.add("list",jarray);
	
	out.write(gson.toJson(jobject));
%>



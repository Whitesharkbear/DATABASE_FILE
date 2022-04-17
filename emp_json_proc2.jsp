<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myweb.dao.EmpDAO, com.myweb.vo.EmpVO, com.google.gson.*"
    %>
<%
	String empno = request.getParameter("empno");
	
	EmpDAO dao = new EmpDAO();
	EmpVO vo = dao.getContent(empno);
	
	// {"empno":7369, "ename":"smith",...}
	JsonObject obj = new JsonObject(); // {}
	obj.addProperty("empno", vo.getEmpno()); //{"empno":7369}
	obj.addProperty("ename", vo.getEname());
	obj.addProperty("job", vo.getJob());
	obj.addProperty("hiredate", vo.getHiredate());
	obj.addProperty("sal", vo.getSal());
	obj.addProperty("comm", vo.getComm());
	obj.addProperty("deptno", vo.getDeptno());
	
	Gson gson = new Gson();
	
	out.write(gson.toJson(obj));
%>
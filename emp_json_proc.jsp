<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myweb.vo.EmpVO, com.myweb.dao.EmpDAO, java.util.ArrayList,
    			com.google.gson.*"
    %>
<%
	EmpDAO dao = new EmpDAO();
	ArrayList<EmpVO> list = dao.getList();
	
	// list 객체를 json 객체로 변환하는 작업 필요! ---> GSON 라이브러리 다운로드 - 메이븐레파지토리
	// var jdata = {"jlist":[{"empno":2323,"ename":"smith"...},
	                       //{"empno":2424,"ename":"peter"...}, ...]};
	JsonObject jdata = new JsonObject();	// jdata = {}
	JsonArray jlist = new JsonArray();		// jlist = []
	Gson gson = new Gson();
			
	for(EmpVO vo : list){
		JsonObject obj = new JsonObject();			// obj = {}
		obj.addProperty("empno", vo.getEmpno());	// obj={"empno":7369}
		obj.addProperty("ename", vo.getEname());	// obj={"empno":7369, "ename":"smith"}
		obj.addProperty("job", vo.getJob());		// obj={"empno":7369,"ename":"smith",.}
		obj.addProperty("hiredate", vo.getHiredate());
		obj.addProperty("deptno", vo.getDeptno());
		
		jlist.add(obj);								// jlist:[{"empno":7369,"ename":"smith",.},...]
	}
	
	jdata.add("jlist", jlist);						// {"jlist":[{"empno":7369,"ename":"smith",.},...]}

	out.write(gson.toJson(jdata));
%>
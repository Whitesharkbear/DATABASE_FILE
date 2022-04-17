<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myweb.dao.DeptDAO, java.util.ArrayList, com.myweb.vo.DeptVO"
    %>
    
<%
	// DeptDAO 클래스의 객체 생성
	DeptDAO dao = new DeptDAO();
	ArrayList<DeptVO> list = dao.getList();
	dao.close();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>DEPT 테이블 정보</h1>
	<!-- 테이블 형식 출력 -->
	<table>
		<tr>
			<th>DEPTNO</th>
			<th>DNAME</th>
			<th>LOC</th>
		</tr>
		<% for(DeptVO vo : list){%>
		<tr>
			<td><%= vo.getDeptno() %></td>
			<td><%= vo.getDname() %></td>
			<td><%= vo.getLoc() %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>


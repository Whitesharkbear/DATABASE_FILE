<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.myweb.dao.EmpDAO, com.myweb.vo.EmpVO, java.util.ArrayList"
    %>
    
 <%
 	EmpDAO dao = new EmpDAO();
 	ArrayList<EmpVO> list = dao.getList();
 	dao.close();
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EMP 테이블 정보</h1>
	<table border=1>
		<tr>
			<td>사원번호</td>
			<td>사원명</td>
			<td>직급</td>
			<td>매니저</td>
			<td>입사일</td>
			<td>급여</td>
			<td>커미션</td>
			<td>부서번호</td>
		</tr>
		<% for(EmpVO vo : list){ %>
		<tr>
			<td><%= vo.getEmpno()%></td>
			<td><%= vo.getEname() %></td>
			<td><%= vo.getJob() %></td>
			<td><%= vo.getMgr() %></td>
			<td><%= vo.getHiredate() %></td>
			<td><%= vo.getSal() %></td>
			<td><%= vo.getComm() %></td>
			<td><%= vo.getDeptno() %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>
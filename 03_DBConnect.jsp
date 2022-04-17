<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
    
<%-- DB 연동 작업 --%>
<%
	// 0. 드라이버 준비
	// 1. 드라이버 로딩
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pass = "tiger";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("-----> 1단계 성공");
	
	// 2. Connection 생성
	Connection conn = DriverManager.getConnection(url, user, pass);
	System.out.println("-----> 2단계 성공");
	
	// 3. Statement 생성
	Statement stmt = conn.createStatement();
	System.out.println("-----> 3단계 성공");
	
	// 4. SQL 실행 및 ResultSet 생성
	ResultSet rs = stmt.executeQuery("SELECT * FROM DEPT");
	
	// 5. ResultSet 객체에서 데이터 꺼내오기
	while(rs.next()){
		System.out.print(rs.getInt(1)+"\t");
		System.out.print(rs.getString(2)+"\t");
		System.out.print(rs.getString(3)+"\n");
	}
	
	// 6. Close - 객체 종료
	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
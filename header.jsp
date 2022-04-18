
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String)session.getAttribute("sid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
		<div>
			<nav>
				<% if (sid == null){ //로그인 하기 전 또는 로그인 실패시 %>
				<ul>
					<li><a href="http://localhost:9000/mycgv/login/login.jsp">로그인</a><div></div></li>
					<li><a href="http://localhost:9000/mycgv/join/join.jsp">회원가입</a><div></div></li>
					<!-- <li><a href="#">MyCGV</a><div></div></li> -->
					<li><a href="http://localhost:9000/mycgv/board/board_list.jsp">게시판</a><div></div></li>
					<li><a href="http://localhost:9000/mycgv/board2/board_list.jsp">게시판(JSON)</a><div></div></li>
					<li><a href="#">공지사항</a><div></div></li>
					<li><a href="#">VIP라운지</a><div></div></li>
					<!-- <li><a href="#">Admin</a></li> -->
				</ul>
				<% }else{ //로그인 성공 시 %>
				<ul>		
					<li><a href="#"><%= sid %>님, 환영합니다!</a><div></div></li>
					<li><a href="http://localhost:9000/mycgv/login/logout.jsp">로그아웃</a><div></div></li>
					<!-- <li><a href="http://localhost:9000/mycgv/join/join.jsp">회원가입</a><div></div></li> -->
					<li><a href="#">MYCGV</a><div></div></li>
					<li><a href="http://localhost:9000/mycgv/board/board_list.jsp">게시판</a><div></div></li>
					<li><a href="http://localhost:9000/mycgv/board2/board_list.jsp">게시판(JSON)</a><div></div></li>
					<li><a href="#">공지사항</a><div></div></li>
					<li><a href="#">VIP라운지</a><div></div></li>
					<% if (sid.equals("admin")){%>
						<li><a href="http://localhost:9000/mycgv/admin/admin.jsp">ADMIN</a></li>
					<% } %>
				</ul>
				<% } %>
			</nav>
			<div>
				<a href="http://localhost:9000/mycgv/index.jsp"><img src="http://localhost:9000/mycgv/images/h1_cgv.png"></a>
				<div>
					<img src="http://localhost:9000/mycgv/images/h2_cultureplex.png">
					<nav>
						<ul>
							<li><a href="#">영화</a></li>
							<li><a href="#">예매</a></li>
							<li><a href="#">극장</a></li>
							<li><a href="#">이벤트&컬처</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
</body>
</html>
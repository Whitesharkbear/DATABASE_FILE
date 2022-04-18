<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.mycgv.vo.CgvBoardVO, com.mycgv.dao.CgvBoardDAO"
    %>
    
<%
	// content에서 넘어오는 bid, rno 받기
	String bid = request.getParameter("bid");
	String rno = request.getParameter("rno");
	
	CgvBoardDAO dao = new CgvBoardDAO();
	CgvBoardVO vo = dao.select(bid);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/mycgv/css/mycgv.css">
<script src="http://localhost:9000/mycgv/js/mycgv.js"></script>
</head>
<body>
	<!--  header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<section class="board_write">
			<h1 class="title">게시판</h1>
			<form name="" action="board_update_proc.jsp" method="post">
				<input type="hidden" name="bid" value="<%= vo.getBid()%>"> <!-- 꼭 hidden을 써야함 -->
				<table class="content_layout">
					<tr>
						<th>제목</th>
						<td><input type="text" name="btitle" value="<%= vo.getBtitle()%>"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="bcontent"><%= vo.getBcontent() %> </textarea></td>
					</tr>
					<tr>
						<th>파일</th>
						<td><input type="file" name="bfile"></td>
					</tr>
					<tr>					
						<td colspan="2">
							<button type="submit" class="btn_style2">수정완료</button>
							<button type="reset" class="btn_style2">취소</button>
							<a href="board_content.jsp?bid=<%= vo.getBid()%>&rno=<%=rno%>"><button type="button" class="btn_style2">이전페이지</button></a>
							<a href="board_list.jsp"><button type="button" class="btn_style2">리스트</button></a>
						</td>
					</tr>
				</table>
			</form>
		</section>
		
	</div>
	
	<!--  footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
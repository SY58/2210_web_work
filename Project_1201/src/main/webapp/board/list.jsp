<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	
	List<BoardDto> list=BoardDao.getInstance().getList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
</head>
<body>
	<div class="container">
		<h1>회원 레시피 게시판입니다.</h1>
		<a href="${pageContext.request.contextPath }/board/private/uploadform.jsp">게시물 올리기</a>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>					
				</tr>
			</thead>
			<tbody>
			<%for(BoardDto dto:list){ %>
				<tr>				
					<td><%=dto.getNum() %></td>
					<td><%=dto.getTitle() %></td>
					<td><%=dto.getWriter() %></td>
					<td><%=dto.getViewCount() %></td>
					<td><%=dto.getRegdate() %></td>				
				</tr>
			<%} %>
			</tbody>
		</table>
	
	</div>
</body>
</html>
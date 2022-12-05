<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String writer=(String)session.getAttribute("id");
	String title=request.getParameter("title");;
	String content=request.getParameter("content");
	BoardDto dto=new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess=BoardDao.getInstance().insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/private/upload.jsp</title>
</head>
<body>
	<script>
		<% if(isSuccess){%>
			alert("새 글이 작성되었습니다.");
			location.href="${pageContext.request.contextPath }/board/list.jsp";		
		<%}else{%>
			alert("새 글 작성에 실패했습니다.");
			location.href="/uploadform.jsp";
		<%}%>
	</script>
</body>
</html>
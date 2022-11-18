<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 할일을 읽어와서
	request.setCharacterEncoding("utf-8");
	String content=request.getParameter("content");	
	//TodoDto에 담고
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	//DB에 저장하고
	boolean isSuccess=TodoDao.getInstance().insert(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<div class="container">
		<% if(isSuccess) {%>
			<p>
				할일 추가에 성공했습니다.
				<a href="list.jsp">리스트로 돌아가기</a>
			</p>
		<%}else { %>
			<p>
				할일 추가에 실패했습니다.
				<a href="insertform.jsp">다시 시도</a>
			</p>
		<%} %>
	</div>
</body>
</html>
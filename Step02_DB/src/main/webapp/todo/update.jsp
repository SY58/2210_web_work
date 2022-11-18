<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%     
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");

	TodoDto dto=new TodoDto();
	dto.setNum(num);
	dto.setContent(content);
	dto.setRegdate(regdate);
	//수정반영
	boolean isSuccess=TodoDao.getInstance().update(dto);
	//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo.update.jsp</title>
</head>
<body>
	<script>
		let a=<%=isSuccess%>;
		
		<% if(isSuccess) {%>
			alert("할일 수정에 성공했습니다.")
			location.href="list.jsp";			
		<%}else { %>
			alert("할일 수정에 실패했습니다.")
			location.href="updateform.jsp?num=<%=num %>";					
		<%} %>
	</script>
</body>
</html>
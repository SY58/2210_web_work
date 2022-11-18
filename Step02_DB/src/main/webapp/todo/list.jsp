<%@page import="test.todo.dao.TodoDao"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//TodoDao 객체를 이용해서 할일 목록을 얻어온다.
	TodoDao dao=TodoDao.getInstance();
	List<TodoDto> list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="todo" name="thisPage"/>
	</jsp:include>	

	<div class="container">
		<h1 style="border-bottom:2px solid orange; padding:10px 0px 10px;">할일 목록입니다.</h1>
		<a style="color:maroon; text-decoration-line:none;"  
		href="${pageContext.request.contextPath }/todo/insertform.jsp">[할일 추가 하러가기]</a>
		<table class="table table-striped table-hover">
			<thead>
				<tr class="table-warning">
					<th>번호</th>
					<th>내용</th>
					<th>등록일</th>
					<th>수정</th>
					<th>삭제</th>					
				</tr>			
			</thead>
			<tbody class="table-group-divider">
				<%for(TodoDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td><a href="${pageContext.request.contextPath }/todo/updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
						<td><a href="${pageContext.request.contextPath }/todo/delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>						
					</tr>				
				<% } %>
			</tbody>		
		</table>	
	</div>
</body>
</html>
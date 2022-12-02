<%@page import="java.util.List"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<UsersDto> list=UsersDao.getInstance().getList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/userlist.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원목록 보기</h1>
		<table class="table">
			<thead>
				<tr class="table-warning text-center">
					<th>프로필</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>가입일</th>					
				</tr>
			</thead>				
			<tbody>
			<%for(UsersDto tmp:list) {%>
				<tr class="text-center">
					<td>
					<%if(tmp.getProfile() == null){ %>
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill-exclamation" viewBox="0 0 16 16">
						  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
						  <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-3.5-2a.5.5 0 0 0-.5.5v1.5a.5.5 0 0 0 1 0V11a.5.5 0 0 0-.5-.5Zm0 4a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1Z"/>
						</svg>
             		<%}else{ %>
						<img src="${pageContext.request.contextPath }<%=tmp.getProfile() %>" width="50" height="50" />
					<%} %>
						</td>
					<td><%=tmp.getId() %></td>
					<td><%=tmp.getEmail() %></td>
					<td><%=tmp.getRegdate() %></td>
				</tr>
				<%} %>
			</tbody>		
		</table>	
	</div>
</body>
</html>
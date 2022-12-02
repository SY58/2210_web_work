<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	//dao 삭제하는 메소드
	UsersDao.getInstance().delete(id);
	//로그아웃 처리하기
	session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
</head>
<body>
	<p>
		<strong><%=id %>님 탈퇴 처리 되었습니다.</strong>
		<a href="${pageContext.request.contextPath }/">인덱스로 가기</a>
	</p>
</body>
</html>
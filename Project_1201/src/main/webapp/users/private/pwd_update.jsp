<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	//사용자가 입력한 값 읽어오기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("pwd2");
	//dto에 담기
	UsersDto dto= new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	//dao 메소드로 DB 수정반영
	boolean isSuccess=UsersDao.getInstance().updatePwd(dto);
	
	//성공하면 로그아웃시키기!
	if(isSuccess){
		session.removeAttribute("id");
	}
	//응답
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>	
	<script>
		<%if(isSuccess){%>
			alert("비밀번호를 수정하고 로그아웃되었습니다.");
			location.href="${pageContext.request.contextPath}/users/private/loginform.jsp";
		<%}else{%>
			alert("구 비밀번호가 일치하지 않습니다.");
			location.href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp";		
		<%}%>
	</script>
</body>
</html>
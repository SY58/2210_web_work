<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	//사용자가 입력한 정보 읽어와서
	String email=request.getParameter("email");
	String profile=request.getParameter("profile");
	
	//dto에 담아주고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	
	//프로필 이미지가 empty가 아니라면 
	if(!profile.equals("empty")){
		//dto에 전송된 프로필 이미지 경로를 담아준다.
		dto.setProfile(profile);
	}
	//데이터에 반영
	boolean isSuccess=UsersDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){%>
			alert("정보 수정 완료되었습니다.");
			location.href="${pageContext.request.contextPath }/users/private/info.jsp";
		<%}else{%>
			alert("회원정보 수정 실패!")
			location.href="${pageContext.request.contextPath }/users/private/info.jsp";
		<%}%>
	</script>
</body>
</html>
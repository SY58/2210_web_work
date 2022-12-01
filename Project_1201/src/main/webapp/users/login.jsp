<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	//로그인후 가야할 목적지 정보
	String url=request.getParameter("url");
	//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비한다.
	String encodedUrl=URLEncoder.encode(url);

	//1. 폼 전송하는 아이디, 비밀번호 읽어오기
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");	
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	//2. DB에 실제로 존재하는 맞는 정보인지 확인한다.(맞는 정보이면 로그인 처리도 한다.)
	boolean isSuccess=UsersDao.getInstance().isValid(dto);	
	if(isSuccess){
		//session scope에 id라는 키값으로 로그인된 아이디 담기
		session.setAttribute("id", id);
	}
	//3. 응답
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<script>
		<% if(isSuccess){%>
			alert("<%=dto.getId()%>님 로그인되었습니다.");
			location.href="<%=url %>";
		<%}else{%>
			alert("로그인 실패");
			location.href="${pageContext.request.contextPath }/users/loginform.jsp?url=<%=encodedUrl%>";		
		<%}%>
	</script>
</body>
</html>
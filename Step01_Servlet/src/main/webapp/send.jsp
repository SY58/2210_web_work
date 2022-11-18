<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/send.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String msg=request.getParameter("msg");
		System.out.println("msg:"+msg);
	%>	
	<p>메시지가 전송되었어요.</p>
</body>
</html>
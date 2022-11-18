<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//친구목록 (sample data)
	List<String> names=new ArrayList<>();
	names.add("바나나");
	names.add("딸기");
	names.add("복숭아");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend/list.jsp</title>
</head>
<body>
	<ul>
	<% 
		for(String tmp:names){
			out.println("<li>"+tmp+"</li>");
		}
	%>	
	</ul>
	
	<ul>
		<% for(String tmp:names){ %>
			<li><%=tmp %></li>
		<%} %>
	</ul>
</body>
</html>
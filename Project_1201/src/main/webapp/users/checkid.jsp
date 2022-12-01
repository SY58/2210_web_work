<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//inputId라는 파라미터명으로 전달되는 문자열 읽어오기
	String inputId=request.getParameter("inputId");
	//dto는 null일수도 있고 아닐 수도 있다.
	UsersDto dto=UsersDao.getInstance().getData(inputId);
%>
<%-- 만일 null이면 존재하지 않는 아이디(회원가입이 가능한 아이디) --%>
<% if(dto==null){%>
	{"isExist":false}	
<%}else{%> <%-- 만일 null이 아니면 이미 존재하는 아이디(회원가입이 불가능한 아이디) --%>
	{"isExist":true}	
<%}%>
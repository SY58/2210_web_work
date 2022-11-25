<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage=request.getParameter("thisPage"); // "index" | "member" | "todo"
	String id=(String)session.getAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/include/navbar.jsp</title>	
</head>
<body>
	<nav class="navbar navbar-dark navbar-expand-md bg-primary">
	  <div class="container-fluid">
	  
	    <a class="navbar-brand" href="http://localhost:8888/Step04_Final/index.jsp">
	    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
			  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
			  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
			</svg>
	    	HELLO!
	    </a>	    
	    
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">	        
	        <li class="nav-item">
	          <a class="nav-link <%=thisPage.equals("study") ? "active": "" %>" href="${pageContext.request.contextPath }/private/study.jsp">회원전용공간(공부)</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link <%=thisPage.equals("game") ? "active": "" %>" href="${pageContext.request.contextPath }/private/game.jsp">회원전용공간(게임)</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link <%=thisPage.equals("file") ? "active": "" %>" href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link <%=thisPage.equals("cafe") ? "active": "" %>" href="${pageContext.request.contextPath }/cafe/list.jsp">글목록보기</a>
	        </li>	       
	        
			<%if(id != null) {%>
			<%-- 회원정보 보기 --%>
	        <li class="nav-item">
	          <a class="nav-link <%=thisPage.equals("userinfo") ? "active": "" %>" href="${pageContext.request.contextPath }/users/private/info.jsp">
	          	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>	          	
	          </a>
	        </li>
	        <%-- 로그아웃 버튼 --%>
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath }/users/logout.jsp">
	          	LOGOUT	          	
	          </a>
	        </li>
	        <%}else{ %>	        
	        <%-- 회원 가입하기 --%>
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath }/users/signup_form.jsp">
	          	JOIN	          	
	          </a>
	        </li>
			<%-- 회원 로그인하기 --%>
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath }/users/loginform.jsp">
	          	LOGIN	          	
	          </a>
	        </li>
	        <%} %>
	      </ul>
	    </div>
	  </div>
	</nav>
</body>
</html>
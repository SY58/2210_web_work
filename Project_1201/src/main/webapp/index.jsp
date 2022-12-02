<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">		
		<% if(id != null){ %>
		<p>
			<a href="${pageContext.request.contextPath }/users/private/info.jsp">회원정보 보기</a>
		</p>
		<p>
			<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
		</p>
		<%}else{ %>		
		<p>
			<a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
		</p>		
		<p>
			<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
		</p>
		<%} %>
		<p>인덱스입니다.</p>
		<div class="row row-cols-1 row-cols-md-2 g-4">
		  <div class="col">
		    <div class="card">
		      <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">RECIPE</h5>
		        <p class="card-text">레시피 소개</p>
		        <a href="" class="btn btn-warning">레시피 보기</a>
		      </div>
		    </div>
		  </div>
		  <div class="col">
		    <div class="card">
		      <img src="https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">GALLERY</h5>
		        <p class="card-text">사진 갤러리</p>
		        <a href="#" class="btn btn-warning">갤러리</a>
		      </div>
		    </div>
		  </div>
		  <div class="col">
		    <div class="card">
		      <img src="https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">USER LIST</h5>
		        <p class="card-text">회원목록 보기</p>
		        <a href="#" class="btn btn-warning">회원목록</a>
		      </div>
		    </div>
		  </div>
		  <div class="col">
		    <div class="card">
		      <img src="https://images.unsplash.com/photo-1496412705862-e0088f16f791?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="card-img-top" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">SITEMAP</h5>
		        <p class="card-text">관련사이트 모음</p>
		        <a href="#" class="btn btn-warning">사이트맵</a>
		      </div>
		    </div>
		  </div>
		</div>
		
	</div>
	
</body>
</html>
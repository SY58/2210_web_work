<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	.text-center{
		border: 1px solid;
		margin: 10px 0px 10px; 
	}
	
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
	</jsp:include>

	<div class="container">
		<%--
			1. sessionScope.id != null
			2. id != null
			3. id ne null
			4. not empty id
			
			el에서 1,2,3,4는 모두 같은 결과이다.
		 --%>
		<c:choose>
			<c:when test="${not empty id}">
			<p>
				<a href="${pageContext.request.contextPath }/users/private/info.jsp">회원정보보기</a>
				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			</p>
			</c:when>
			<c:otherwise>
			<p>
				<a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입  </a>
	       		<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
	       	</p>
			</c:otherwise>


		</c:choose>
		
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="https://cdn.pixabay.com/photo/2015/02/25/07/39/church-648430_960_720.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://cdn.pixabay.com/photo/2017/07/28/00/57/christmas-2547356_960_720.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://cdn.pixabay.com/photo/2019/12/19/10/56/christmas-market-4705885_960_720.jpg" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>		
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
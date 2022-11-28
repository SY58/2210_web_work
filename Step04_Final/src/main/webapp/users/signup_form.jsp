<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	h1{
		 margin: 20px 0px 20px; border-bottom:3px solid #0d6efd; padding:10px 0px 10px;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
	<jsp:param value="signupform" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h1>회원 가입 폼입니다.</h1>
		<form action="signup.jsp" method="post">
			<div>
			 	<label for="id" class="control-label">아이디</label>
			 	<input type="text" class="form-control" name="id" id="id" />
			</div>
			<div>
				<label for="pwd" class="control-label">비밀번호</label>
				<input type="text" class="form-control" name="pwd" id="pwd" />
			</div>
			<div>
				<label for="email" class="control-label">이메일</label>
				<input type="text" class="form-control" name="email" id="email" />
			</div>	
			<button class="btn btn-outline-primary" style="margin-top: 10px;" type="submit">회원가입</button>			
		</form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
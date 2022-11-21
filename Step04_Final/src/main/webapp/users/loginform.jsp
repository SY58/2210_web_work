<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>로그인 폼</h1>
		<form action="login.jsp" method="post">
			<div>
				<label for="id" class="form-label">아이디</label>
				<input type="text" name="id" id="id" class="form-control" />
			</div>
			<div>
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="password" name="pwd" id="pwd" class="form-control" />
			</div>
			<button class="btn btn-primary" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>
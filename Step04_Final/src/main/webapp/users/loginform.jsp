<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 읽어와 본다.
	String url=request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url==null){
		//로그인 후에 인덱스 페이지로 갈 수 있도록 한다.
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
%>
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
			<!-- 로그인 성공후 어디로 갈지에 대한 정보를 url이라는 파라미터 명으로 같이 전송되도록 한다. -->
			<input type="hidden" name="url" value="<%=url %>" />
			<div>
				<label for="id" class="form-label">아이디</label>
				<input type="text" name="id" id="id" class="form-control" />
			</div>
			<div>
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="password" name="pwd" id="pwd" class="form-control" />
			</div>
			<button class="btn btn-primary" style="margin-top: 10px;" type="submit">로그인</button>
		</form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h3 style="margin: 0px 0px 10px; border-bottom:3px solid #0d6efd; padding:5px 0px 5px;">파일 업로드 폼입니다.</h3>
		<!--
			파일 업로드 폼 작성방법
			1. method="post"
			2. enctype="multipart/form-data"
			3.<input type="file" />
			- enctype-"multipart/form-data"가 설정된 폼을 전송하면
			폼전송된 내용을 추출할때 HttpServletRequest 객체로 추출할 수 없다.
			MultipartRequest 객체를 이용해서 추출해야 한다.		
		-->
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" />
			</div>
			<div>
				<label for="myFile">첨부파일</label>
				<input type="file" name="myFile" id="myFile" />
			</div>
			<button type="submit" class="btn btn-primary" style="margin-top: 10px;">업로드</button>
		</form>
	</div>
</body>
</html>
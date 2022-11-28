<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>비밀번호 수정 폼</h1>
		<form action="pwd_update.jsp" method="post" id="myForm">
			<div>
				<label for="pwd">기존 비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
			</div>
			<div>
				<label for="newPwd">새 비밀번호</label>
				<input type="password" name="newPwd" id="newPwd" />
			</div>
			<div>
				<label for="newPwd2">새 비밀번호 확인</label>
				<input type="password" id="newPwd2" />
			</div>
			<button class="btn btn-primary" style="margin-top:10px;" type="submit">수정하기</button>
			<button type="reset" class="btn btn-outline-primary" style="margin-top:10px;">리셋</button>
		</form>
	</div>
	<script>
		document.querySelector("#myForm").addEventListener("submit", function(event){
			let pwd1=document.querySelector("#newPwd").value;
			let pwd2=document.querySelector("#newPwd2").value;
			//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
			if(pwd1!=pwd2){
				alert("비밀번호를 확인하세요!");
				event.preventDefault();//폼 전송 막기
			}
		});
	</script>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
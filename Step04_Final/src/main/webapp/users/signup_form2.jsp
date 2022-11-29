<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form2.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	h1{
		 margin: 20px 0px 20px; 
		 border-bottom:3px solid #0d6efd; 
		 padding:10px 0px 10px;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
	<jsp:param value="signupform" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h1>회원 가입 폼입니다.</h1>
		<form action="signup.jsp" method="post" id="signupForm">
			<div>
			 	<label for="id" class="control-label">아이디</label>
			 	<input type="text" class="form-control" name="id" id="id" />
			 	<div class="valid-feedback">사용할 수 있습니다.</div>
			 	<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
			<div>
				<label for="pwd" class="control-label">비밀번호</label>
				<input type="password" class="form-control" name="pwd" id="pwd" />
				<div class="invalid-feedback">비밀번호를 확인하세요.</div>
			</div>
			<div>
				<label for="pwd2" class="control-label">비밀번호 확인</label>
				<input type="password" class="form-control" name="pwd2" id="pwd2" />
			</div>
			<div>
				<label for="email" class="control-label">이메일</label>
				<input type="text" class="form-control" name="email" id="email" />
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>	
			<button class="btn btn-outline-primary" style="margin-top: 10px;" type="submit">회원가입</button>			
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		//유효성 여부를 저장할 변수를 만들고 초기값 대입
		let isIdValid=false;	
		let isPwdValid=false;
		let isEmailValid=false;
	
		//아래의 코드를 jQuery를 활용한 구조로 변경해 보세요.
		
		//id가 email인 요소에 input 이벤트가 일어났을 때 실행할 함수 등록
		$("#email").on("input", function(){
			//두개의 클래스 제거하기
			$(this).removeClass("is-valid").removeClass("is-invalid");
			
			const inputEmail=$(this).val();
			const reg=/@/;
			
			if(!reg.test(inputEmail)){
	           $(this).addClass("is-invalid");
	           isEmailVaild=false;
	        }else{//통과했다면
	           $(this).addClass("is-valid");
	           isEmailVaild=true;
	        }
		});
		
		function checkPwd(){
			//먼저 2개의 클래스를 제거하고			
			$("#pwd").removeClass("is-valid is-invalid");
			
			const pwd=$("#pwd").val();
			const pwd2=$("#pwd2").val();
			
			if(pwd != pwd2){
				$("#pwd").addClass("is-invalid");
				isPwdVaild=false;
			}else{
				$("#pwd").addClass("is-valid");
				return true;
			}
		}
		
		$("#pwd, #pwd2").on("input", function(){
			checkPwd();
		});
					
			
		//id를 입력할때마다 호출되는 함수 등록
		$("#id").on("input", function(){
			//input 요소의 참조값을 self에 미리 담아놓기
			const self=this;
			//일단 2개의 클래스를 모두 제거한 다음			
			$(self).removeClass("is-valid is-invalid");
			
			//1.입력한 아이디를 읽어와서
			const inputId=$(self).val();
			
			//2.서버에 페이지 전환 없이 전송을 하고 응답을 받는다.
			
			$.ajax({
				url:"checkid.jsp?inputId="+inputId,
				success: function(data){
					console.log(data);
					if(data.isExist){
						$(self).addClass("is-invalid")
						isIdVaild=false;
					}else{
						$(self).addClass("is-valid")
						isIdVaild=true;
					}
				}
			});			
		});
		
		//폼에 submit 이벤트가 일어났을 때 실행할 함수 등록
		$("#signupForm").on("submit", function(){									
			//아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행되도록 해야한다.
			//폼 전체의 유효성 여부 
			const isFormValid = isIdValid && isPwdValid && isEmailValid;
			//만일 폼이 유효하지 않으면
			if(!isFormValid){
				return false; //폼 전송을 막는다(jQuery에서 submit 이벤트리스너 함수 안에서 폼전송 막는 방법)
			}			
		});
		
	</script>	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
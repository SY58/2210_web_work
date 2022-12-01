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
			 	<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
			 	<div class="valid-feedback">사용할 수 있습니다.</div>
			 	<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
			<div>
				<label for="pwd" class="control-label">비밀번호</label>
				<input type="password" class="form-control" name="pwd" id="pwd" />
				<small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
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
	
	    document.querySelector("#email").addEventListener("input", function(){
	        
	        this.classList.remove("is-valid");
	        this.classList.remove("is-invalid");
	        //입력한 이메일
	        const inputEmail=this.value;
	        //이메일을 검증할 정규 표현식 
	        const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	                
	        //만일 입력한 이메일이 정규표현식 검증을 통과하지 못했다면
	        if(!reg.test(inputEmail)){
	           this.classList.add("is-invalid");
	           isEmailVaild=false;
	        }else{//통과했다면
	           this.classList.add("is-valid");
	           isEmailVaild=true;
	        }
		});	
			    
	    
		function checkPwd(){
			//먼저 두개의 클래스를 제거하고
			document.querySelector("#pwd").classList.remove("is-valid");
			document.querySelector("#pwd").classList.remove("is-invalid");
			//입력한 두개의 비밀번호를 읽어와서
			const pwd=document.querySelector("#pwd").value;
			const pwd2=document.querySelector("#pwd2").value;
						
			//비교하기전에 정규표현식 검증			
			const reg=/[\W]/; // /[\W]/ 이어도 된다.
			//만일 정규표현식 검증을 통과하지 못했다면
			if(!reg.test(pwd)){
				document.querySelector("#pwd").classList.add("is-invalid")
				isPwdValid=false;
				return;	            
	        }
			
			//만일 비밀번호 입력란과 확인란이 다르다면
			if(pwd != pwd2){
				document.querySelector("#pwd").classList.add("is-invalid");
				isPwdVaild=false;
			}else{
				document.querySelector("#pwd").classList.add("is-valid");
				isPwdVaild=true;
			}			
		}	
	
		document.querySelector("#pwd").addEventListener("input", function(){
			checkPwd();
		});
		document.querySelector("#pwd2").addEventListener("input", function(){
			checkPwd();			
		});				
					
		
		//id를 입력할때마다 호출되는 함수 등록
		document.querySelector("#id").addEventListener("input", function(){
			//input 요소의 참조값을 self에 미리 담아놓기
			const self=this;
			//일단 2개의 클래스를 모두 제거한 다음
			self.classList.remove("is-valid");
			self.classList.remove("is-invalid");
			
			//1.입력한 아이디를 읽어와서
			const inputId=self.value;
			
			//아이디를 검즐할 정규표현식
			const reg=/^[a-z].{4,9}$/; //처음은 영소문자, 다음은 아무글자나, 최대 4~9개까지, 끝을 명시
			//입력한 아이디가 정규표현식과 매칭이 되는지(통과되는지)
			const isMatch=reg.test(inputId)			
			//만일 매칭되지 않는다면
			if(!isMatch){
				self.classList.add("is-invalid")
				isIdValid=false;
				return; //함수를 여기서 끝내기
			}
						
			//2.서버에 페이지 전환 없이 전송을 하고 응답을 받는다.
			fetch("checkid.jsp?inputId="+inputId)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				//3. 사용가능한지 여부에 따라 id 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거
				console.log(data);
				if(data.isExist){
					self.classList.add("is-invalid")
					isIdVaild=false;
				}else{
					self.classList.add("is-valid")
					isIdVaild=true;
				}
			});			
		});
		
		//폼에 submit이벤트가 일어났을 때 실행할 함수 등록
		document.querySelector("#signupForm").addEventListener("submit", function(event){
			
			//아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행되도록 해야한다.
			//폼 전체의 유효성 여부 
			const isFormValid= isIdValid && isPwdValid && isEmailValid;
			//만일 폼이 유효하지 않으면
			if(!isFormValid){
				event.preventDefault(); //폼 전송 막기
			}
		});
		
	</script>	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
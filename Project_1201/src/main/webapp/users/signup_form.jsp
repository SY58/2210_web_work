<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form3.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
	<%-- nav --%>
	<div class="container">
		<h1>회원 가입 폼입니다.</h1>		
		<form v-on:click="onSubmit" action="signup.jsp" method="post" id="signupForm">
		<p>폼의 유효성 여부 : <strong>{{isFormValid}}</strong></p>
			<div class="mb-2">
			 	<label for="id" class="control-label">아이디</label>
			 	<input 
			 		v-on:input="onIdInput" 
			 		v-model="id"
			 		v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty }" 
			 		type="text" class="form-control" name="id" id="id" />
			 	<div class="valid-feedback">사용할 수 있습니다.</div>
			 	<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
			<div class="mb-2">
				<label for="pwd" class="control-label">비밀번호</label>
				<input 
					v-on:input="onPwdInput" 
			 		v-model="pwd"
			 		v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty }"				
					type="password" class="form-control" name="pwd" id="pwd" />
				<div class="invalid-feedback">비밀번호를 확인하세요.</div>
			</div>
			<div class="mb-2">
				<label for="pwd2" class="control-label">비밀번호 확인</label>
				<input
					v-on:input="onPwdInput" 
			 		v-model="pwd2" 
					type="password" class="form-control" name="pwd2" id="pwd2" />
			</div>
			<div class="mb-2">
				<label for="email" class="control-label">이메일</label>
				<input
					v-on:input="onEmailInput" 
			 		v-model="email"
			 		v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty }"  
					type="text" class="form-control" name="email" id="email" />
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>	
			<button v-bind:disabled="!isFormValid" class="btn btn-primary" style="margin-top: 10px;" type="submit">회원가입</button>			
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		new Vue({
	        el:"#signupForm",
	        data:{
	           isIdValid:false,
	           isPwdValid:false,
	           isEmailValid:false,
	           id:"",
	           email:"",
	           pwd:"",
	           pwd2:"",
	           isIdDirty:false,
	           isEmailDirty:false,
	           isPwdDirty:false,	           
	        },
	        computed:{
	        	isFormValid(){
	        		//모델을 활용해서 얻어낼 값이 있으면 얻어낸다.
	        		let result=this.isIdValid && this.isPwdValid && this.isEmailValid;
	        		//함수에서 리턴해주는 값을 모델처럼 사용하면 된다.
	        		return result;
	        	}
	        },
	        
	        methods:{
	        	onSubmit(e){
	        		//폼 전체의 유효성 여부
	        		//const isFormValid= this.isIdValid && this.isPwdValid && this.isEmailValid;
	        		//만일 폼이 유효하지 않으면
	        		if(! this.isFormValid){
	        			e.preventDefault();
	        		}
	        	},
	        	
	        	onPwdInput:function(){
	        		this.isPwdDirty=true;
	        		//비밀번호를 검증할 정규 표현식
	        		const reg=/[\W]/; 
	    			//만일 정규표현식 검증을 통과하지 못했다면
	    			if(!reg.test(this.pwd)){	    				
	    				this.isPwdValid=false;
	    				return;	//함수를 여기서 끝내라     
	    	        }
	    			
	    			//만일 비밀번호 입력란과 확인란이 다르다면
	    			if(this.pwd != this.pwd2){	    				
	    				this.isPwdValid=false;
	    			}else{ //같다면		
	    				this.isPwdValid=true;
	    			}			
	        	},
	        	
	        	onEmailInput:function(){
	        		this.isEmailDirty=true;
	        		//이메일을 검증할 정규표현식
					const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;									
					//만일 입력된 이메일이 정규표현식 검증을 통과하지 못했다면
					if(!reg.test(this.email)){
						this.isEmailValid=false;						
					}else{
						this.isEmailValid=true;
					};
					
	        	},
	        	
	        	
				onIdInput:function(){
				//아이디를 한번이라도 입력하면 아이디가 더럽혀 졌는지 여부를 true 로 바꿔준다. 
				this.isIdDirty=true;

				//아이디를 검증할 정규표현식
				const reg=/^[a-z].{4,9}$/;
				//입력한 아이디가 정규표현식과 매칭이 되는지(통과 되는지) 확인한다. 
				const isMatch=reg.test(this.id);
				//만일 매칭되지 않는다면
				if(!isMatch){
					this.isIdValid=false;
					return; //함수를 여기서 끝내라
				}
				
				//Vue 객체의 참조값을 self 에 담기
				const self=this;
				
				//2. 서버에 페이지 전환없이 전송을 하고 응답을 받는다.
				fetch("checkid.jsp?inputId="+this.id)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
				   //3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
				   console.log(data);
				   if(data.isExist){   
				      self.isIdValid=false;
				   }else{
				      self.isIdValid=true;
				   }
				});
	          	}
	        }
		});
				
	</script>	
	<%-- footer --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<body>

	<form class="form-horizontal" role="form" id ="form"
		action="<c:url value ='/signup/insert'/>" method="POST">
		<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title">회원가입</h4>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<div class="col-md-12">
										<p>아이디</p>
										<div class ="form-inline">
											<input type="text" class="form-control col-md-6"
												placeholder="6자 이상 영문과 숫자를 입력해주세요." id="id" name="ID"><label
												id="id_input" class="text-danger"></label>
										</div>	
									<button class="btn btn-default btn-xs" type = "button" onclick="IdCheck()">중복확인</button><label id = "id_check"></label>										

									
										
								</div>

								<hr>
									<div class="col-md-12">
										<p>비밀번호</p>
										 <div class ="form-inline">
											 <input type="password" class="form-control col-md-6"
												placeholder="8~20자 이내 영문과 숫자를 입력해주세요." id = "password" name="PW"><label id = "password_input" class = "text-danger"></label>
										 </div>
									</div>
								<hr>
									<div class="col-md-12">
										<p>비밀번호확인</p>
										<div class ="form-inline"> 									
											 <input type="password" class="form-control col-md-6"
												placeholder="패스워드를 재입력하세요" id = "password2" name="PW2"><label id = "password2_input" class = "text-danger"></label>									
										</div>
									</div>
								<hr>
									<div class="col-md-12">
										<p>이메일</p>
										<div class ="form-inline"> 
											 <input type="email" class="form-control col-md-8"
												placeholder="이메일 형식에 맞춰 입력하세요" id = "email" name="EMAIL"><label id = "email_input" class = "text-danger"></label>
										</div>
									</div>
								<hr>
									<div class="col-md-12">
										<p>이름</p>
										<div class ="form-inline">
											<input type="text" class="form-control col-md-3"
												placeholder="이름을 입력하세요" id = "name" name="NAME">
										</div>
									</div>
								<hr>
									<div class="col-md-12">
										<p>휴대폰 번호</p>
										<div class ="form-inline">
											<input type="tel" class="form-control col-md-4"
												placeholder="'-'을 제외한 숫자만 입력하세요" id = "tel" name="TEL"><label id = "tel_input" class = "text-danger"></label>
										</div>	 
									</div>
								<hr>
									<div class="col-md-12">
										<p>주소</p>
										<div class ="form-inline">
											<input type="text" class="form-control col-md-10"
												placeholder="주소를 입력하세요" id = "address" name="ADDRESS">
										</div>	 
									</div>
								<hr>
									<div class="col-md-12">
										<p>상세주소</p>
										<div class ="form-inline">
											<input type="text" class="form-control col-md-10"
												placeholder="상세주소를 입력하세요" id = "address_detail" name="ADDRESS_DETAIL">
										</div>	 
									</div>
							</div>

							
							<div class="card-footer">
								<label id = "signup_check"></label>
								<div class=float-right>
									<div class="col-md-1">
										<button class="btn btn-default" type = "button" id = "signup">회원가입</button>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>

<script>

// 중복된 아이디 검사
function IdCheck(){
	
	var ID = $("#id").val();
	var re_id = /^[a-z0-9_-]{6,30}$/; // 아이디 검사식
	
	if($("#id").val() == ''){
		$("#id_input").text("아이디를 입력하세요.");
	}else if(re_id.test($("#id").val()) != true && $("#id").val().length != 0 ) {
        $("#id_input").text("6자 이상 영문과 숫자를 입력해주세요.");   
	}else{
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ws/idcheck'/>",
		    data : {"ID" : ID} 
		  	  		, 
		    dataType: "json",
		    cache : false,
		    success : function(data) {
		       		$("#id_check").text("아이디가 존재합니다.");
		       		
		    },
		  
		    error : function(xhr,status, exception) {
	 	    		$("#id_check").text("사용 가능한 아이디입니다.");
				return false;	      
		    }
		 });
	}
	
}
</script>

<script>
   $(document).ready(function() {
      var re_id = /^[a-z0-9_-]{6,30}$/; // 아이디 검사식
      var re_pw = /^[a-z0-9_-]{8,20}$/; // 비밀번호 검사식
      var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
      var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
      var id_flag = "false";
      var pw_flag = "false";
      var pw2_flag = "false";
      var email_flag = "false";
      var name_flag = "false";
      var tel_flag = "false";
      var address_flag = "false";
      var address2_flag = "false";
	
      
      //아이디 입력 창
      $("#id").blur(function(e) {
         if (re_id.test($("#id").val()) != true && $("#id").val().length != 0 ) {
            $("#id_input").text("6자 이상 영문과 숫자를 입력해주세요.");
			id_flag = "false";
         }else{
        	$("#id_input").text(""); 
			id_flag = "true";
         }
      });
      //비밀번호 입력창
      $("#password").blur(function(e) {
         if (re_pw.test($("#password").val()) != true && $("#password").val().length != 0) {
            $("#password_input").text("8~20자 이내 영문과 숫자를 입력해주세요.");
            pw_flag = "false";
         }else{
        	$("#password_input").text("");
        	pw_flag = "true";
         }
      });
      //비밀번호 확인 입력 창
      $("#password2").blur(function(e) {
         if ($("#password").val() != $("#password2").val() && $("#password2").val().length != 0) {     
            $("#password2_input").text("패스워드가 일치하지 않습니다. 재입력하세요.");
            pw2_flag = "false";
         }else{
        	$("#password2_input").text("");
        	pw2_flag = "true";
         }
      });
      //이메일 입력 창
      $("#email").blur(function(e) {
         if (re_mail.test($("#email").val()) != true && $("#email").val().length != 0) {
            $("#email_input").text("이메일 형식에 맞게 입력해 주세요.");
            email_flag = "false";
         }else{
        	 $("#email_input").text("");
        	 email_flag = "true";
         }
      });
      //이름 입력 창
      $("#name").blur(function(e) {
    	  if($("#name").val().length == 0){
    		  name_flag = "false";
    	  }else{
    		  name_flag = "true";
    	  }
      });
      
      //전화번호 입력 창
      $("#tel").blur(function(e) {
         if (re_tel.test($("#tel").val()) != true && $("#tel").val().length != 0) {
            $("#tel_input").text("전화번호 입력오류 : 숫자만 입력해 주세요(11자리).");
            tel_flag = "false";
         }else{
        	 $("#tel_input").text("");
        	 tel_flag = "true";
         }
      });
      //주소 입력창
      $("#address").blur(function(e) {
    	  if($("#address").val().length == 0){
    		  address_flag = "false";
    	  }else{
    		  address_flag = "true";
    	  }
      });
      //상세주소 입력창
      $("#address_detail").blur(function(e) {
    	  if($("#address_detail").val().length == 0){
    		  address2_flag = "false";
    	  }else{
    		  address2_flag = "true";
    	  }
      });

   // 회원가입 최종 조건 검사, 승인 
   		$("#signup").click(function SignupCheck(){
	      	if(id_flag == "true" && pw_flag == "true" && pw2_flag == "true" && email_flag == "true"
	      			 && tel_flag == "true" && name_flag == "true" && address_flag == "true"
	      			 && address2_flag == "true" && $("#id_check").text().length != 0){
	      		$("#form").submit();
	      	}else{
	      		$("#signup_check").text("아이디 중복체크를 하지 않았거나 정보가 제대로 입력되지 않았습니다.");
	      	}
      });
      
      
      
      
   });
</script>











<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
   $(document).ready(function() {
      var re_id = /^[a-z0-9_-]{6,30}$/; // 아이디 검사식
      var re_pw = /^[a-z0-9_-]{8,20}$/; // 비밀번호 검사식
      var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
      var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
      //아이디 입력 창
      $("#id").blur(function(e) {
         if (re_id.test($("#id").val()) != true && $("#id").val().length != 0 ) {
            alert("[ID 입력오류 : 6자 이상 영문과 숫자를 입력해주세요.]");
         }
      });
      //비밀번호 입력창
      $("#password").blur(function(e) {
         if (re_pw.test($("#password").val()) != true && $("#password").val().length != 0) {
            alert("[PW 입력오류 : 8~20자 이내 영문과 숫자를 입력해주세요.]");
         }
      });
      //비밀번호 확인 입력 창
      $("#password2").blur(function(e) {
         if ($("#password").val() != $("#password2").val() && $("#password2").val().length != 0) {
            alert("[PW 입력오류 : 패스워드가 일치하지 않습니다. 재입력하세요.");
         }
      });
      //이메일 입력 창
      $("#email").blur(function(e) {
         if (re_mail.test($("#email").val()) != true && $("#email").val().length != 0) {
            alert("[이메일 입력오류 : 이메일 형식에 맞게 입력해 주세요.]");
         }
      });
      //전화번호 입력 창
      $("#tel").blur(function(e) {
         if (re_tel.test($("#tel").val()) != true && $("#tel").val().length != 0) {
            alert("[전화번호 입력오류 : 숫자만 입력해 주세요.]");
         }
      });
   });
</script>

<body>
<form class="form-horizontal" role="form" action = "<c:url value ='/signup/insert'/>" method="POST">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">회원가입</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<div class="col-md-12">
									아이디
									<div class ="form-inline"> 
									<input type="text" class="form-control col-md-6"
									placeholder="6자 이상 영문과 숫자를 입력해주세요." id = "id" name="ID"><label id = "id_check">abc</label>
									</div> 		
									<button class="btn btn-default btn-xs" type = "button" onclick="IdCheck()">중복확인</button>
										
								</div>
								<hr>
								<div class="col-md-6">
									<p>
										비밀번호 <input type="password" class="form-control"
											placeholder="8~20자 이내 영문과 숫자를 입력해주세요." id = "password" name="PW">
									</p>
								</div>
								<hr>
								<div class="col-md-6">
									<p>
										비밀번호확인 <input type="password" class="form-control"
											placeholder="패스워드를 재입력하세요" id = "password2" name="PW2">
									</p>
								</div>
								<hr>
								<div class="col-md-8">
									<p>
										이메일 <input type="email" class="form-control"
											placeholder="이메일 형식에 맞춰 입력하세요" id = "email" name="EMAIL">
									</p>
								</div>
								<hr>
								<div class="col-md-3">
									<p>
										이름 <input type="text" class="form-control"
											placeholder="이름을 입력하세요" id = "name" name="NAME">
									</p>
								</div>
								<hr>
								<div class="col-md-4">
									<p>
										휴대폰 번호 <input type="tel" class="form-control"
											placeholder="'-'을 제외한 숫자만 입력하세요" id = "tel" name="TEL">
									</p>	 
								</div>
								<hr>
								<div class="col-md-10">
									<p>
										주소 <input type="text" class="form-control"
											placeholder="주소를 입력하세요" id = "address" name="ADDRESS">
									</p>	 
								</div>
								<hr>
								<div class="col-md-10">
									<p>
										상세주소 <input type="text" class="form-control"
											placeholder="상세주소를 입력하세요" id = "address_detail" name="ADDRESS_DETAIL">
									</p>	 
								</div>
							</div>

							
							<div class="card-footer">
								<div class=float-right>
									<div class="col-md-1">
										<button class="btn btn-default" type = "submit">회원가입</button>
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


function IdCheck(){
	
	var ID = $("#id").val(); 
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
</script>











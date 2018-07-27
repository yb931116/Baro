<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script>
	$(document).ready(function() { 
		var re_id = /^[a-z0-9_-]{6,30}$/; // 아이디 검사식
		var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
		
		//이메일 입력 창
		    $("#email").blur(function(e) {
		    	if($("#email").val()==''){
		            $("#email_input").text("이메일을 입력하세요.");
		    	}else if (re_mail.test($("#email").val()) != true && $("#email").val().length != 0) {
		            $("#email_input").text("이메일 형식에 맞게 입력해 주세요.");
		        }else{
		        	$("#email_input").text(""); 
		        }
		      });
	   // 아이디 입력 창
			$("#pw_find_id").blur(function(e) {
				if($("#pw_find_id").val() == ''){
					$("#id_input").text("아이디를 입력하세요.");
				}else if(re_id.test($("#pw_find_id").val()) != true && $("#pw_find_id").val().length != 0 ) {
			        $("#id_input").text("6자 이상 영문과 숫자를 입력해주세요.");   
				}else{
		        	$("#id_input").text(""); 
		        }
			});
	});
     </script>



				<h4 class="page-title">비밀번호 찾기</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="card"> 
							<div class="card-body">
								<div class="col-md-12">
									<p>
										아이디 <input type="text" class="form-control"
											placeholder="아이디를 입력하세요" id = "pw_find_id" name="ID">
											<label id="id_input" class="text-danger"></label>
									</p>
								</div>
								
								<div class="col-md-12">
									<p>
										이메일 <input type="email" class="form-control"
											placeholder="이메일을 입력하세요" id = "email" name="EMAIL">
											
											<label id = "email_input" class = "text-danger"></label>
									</p>
									
								</div>
									
								
								 
							<div class="card-footer">

									<label id = "pw_find"></label>
									<div class=float-right> 
										<button class="btn btn-default" type = "button" onclick = "pwFind()">비밀번호 찾기</button> 
									</div>
										
									
								
							</div> 
						</div>
						<div class="card-action">
							<button class="btn btn-success mr-3" data-dismiss="modal" aria-hidden="true">확인</button>
							<button class="btn btn-danger" data-dismiss="modal"
								aria-hidden="true">취소</button>
								
							
						</div>
					</div>
				</div>
			</div>
	<script>
	function pwFind(){
		
			var ID = $("#pw_find_id").val();
			var EMAIL = $("#email").val();
			
			
			$.ajax({
			    type : "POST",
			    url : "<c:url value='/ws/pwfind'/>",
			    data : {
			    	"ID" : ID,
			    	"EMAIL" : EMAIL	
			    } 
			  	  		, 
			    dataType: "json",
			    cache : false,
			    success : function(data) {
			       		$("#pw_find").text("비밀번호 : "+data.PW);
			       		
			       		
			    },
			  
			    error : function(xhr,status, exception) {
			    		
		 	    		$("#pw_find").text("입력하신 정보에 해당하는 비밀번호가 존재하지 않습니다.");
					return false;	      
			    }
			 });
	}
		
	
	

</script>
			
			
			
			
			
			
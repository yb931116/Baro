<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script>
	$(document).ready(function() { 
		var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
		
		//전화번호 입력 창
      $("#tel").blur(function(e) {
         if (re_tel.test($("#tel").val()) != true && $("#tel").val().length != 0) {
            $("#tel_input").text("전화번호 입력오류 : 길이에 맞춰 숫자만 입력해 주세요.");
         }else if($("#tel").val()==''){
        	 $("#tel_input").text("전화번호를 입력하세요"); 
         }else{
        	 $("#tel_input").text(""); 
         }
      });
		//이름 입력 창
      $("#name").blur(function(e) {
    	 if($("#name").val()==''){ 
    		 $("#name_input").text("이름을 입력하세요");
    	 }else{
        	 $("#name_input").text(""); 
         }
      });
		
	});
     </script>



				<h4 class="page-title">아이디 찾기</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="card"> 
							<div class="card-body">
								<div class="col-md-12">
									<p>
										이름 <input type="text" class="form-control"
											placeholder="이름을 입력하세요" id = "name" name="NAME"><label id = "name_input" class = "text-danger"></label>
									</p>
								</div>
								
								<div class="col-md-12">
									<p>
										휴대전화번호 <input type="tel" class="form-control"
											placeholder="'-'을 제외한 숫자만 입력하세요" id = "tel" name="TEL"><label id = "tel_input" class = "text-danger"></label>
									</p>
									
								</div>
									
								
								 
							<div class="card-footer">

									
									<div class=float-right> 
										<button class="btn btn-default" type = "submit">아이디 찾기</button> 
									</div>
							<!-- c 태그 확인 필요 -->
							<c:if test="${paramMap.fail eq true}"> 
										<span style="color:red">이름과 휴대전화번호를 확인하세요.</span>
							</c:if>
									
								
							</div> 
						</div>
						<div class="card-action">
							<button class="btn btn-success mr-3" type = "button" onclick = "IdFind()">확인</button>
							<button class="btn btn-danger" data-dismiss="modal"
								aria-hidden="true">취소</button>
								
							
						</div>
					</div>
				</div>
			</div>

<script>
	function IdFind(){
	
		
	
	}

</script>

	

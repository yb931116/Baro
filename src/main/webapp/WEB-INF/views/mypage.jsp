<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="main-panel" style="background-color: white;">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">마이페이지</h4>
				<div class="row">

					<!-- 나의 게시물 현황 - 문제점 시작점 -->
					
					
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title" id ="my_problem">나의 게시물 현황 - 문제점</div>
							</div>
							
							<div class="card-body" style ="padding-top:0">

								<table class="table mt-4 table-hover" id = "problem">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">프로젝트명</th>
											<th scope="col">작성자</th>
											<th scope="col">문제점</th>
										</tr>
									</thead>

									<tbody id = "myproblem">
										<!-- Ajax 활용 -->
									</tbody>

								</table>

							</div>



						</div>
					</div>

					<!-- 나의 게시물 현황 - 문제점 끝 -->


					<!-- 나의 게시물 현황 - 해결책 시작 -->
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title" id ="my_solve">나의 게시물 현황 - 해결책</div>
							</div>
							<div class="card-body" style ="padding-top:0 ">

								<table class="table mt-4 table-hover" id = "solve">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">프로젝트명</th>
											<th scope="col">작성자</th>
											<th scope="col">해결책</th>
										</tr>
									</thead>

									<tbody id = "mysolve">
										<!-- Ajax 활용 -->
									</tbody>

								</table>

							</div>


							
						</div>
					</div>

					<!-- 나의 게시물 현황 - 해결책 끝 -->










					<!-- 나의 정보 조회 및 수정 시작 -->
					<div class="col-md-8">
						<div class="card">
							<form class = "mypage_update" action = "<c:url value ='/mypage/update'/>" role="form" method="POST">
							<div class="card-header">
								<div class="card-title">나의 정보 조회 및 수정</div>
							</div>
							<div class="card-body">
								<div class="form-inline">
									<!-- Ajax 활용 -->
								</div>
							</div>


							<div class="card-footer">

								<div class=float-right>
									<label class = "warning text-danger" style ="color: red"></label>
									<button class="btn btn-default" id ="update_button" type = "button">수정하기</button>
								</div>

							</div>
							</form>
						</div>
					</div>
					<!-- 나의 정보 조회 및 수정 끝 -->



				</div>
			</div>
		</div>
	</div>
</body>

<script>

	

	var ID = '${pageContext.request.userPrincipal.name}';
	$(function() {
		
		$.ajax({
			
			type : "POST",
			url : "<c:url value='/ws/myproblem_list'/>",
			data : {
				"ID" : ID
				
			},
			traditional:true,
			dataType : "json",
			cache : false,
			success : function(data) {
				// 나의 게시물 현황 - 문제점
				var html = "";
				for(var i = 0; i < data.myproblemList.length; i++){
					html = html
					+"<tr>"
					+ "	<td>"+ (i+1) +"</td>"
					+ "	<td>"+data.myproblemList[i].business_name+"</td>"
					+ "	<td>"+data.myproblemList[i].id+"</td>"
					+ "	<td>"+data.myproblemList[i].summary+"</td>"
					+ "</tr>";
				}	
					$("#myproblem").html(html);
					document.getElementById("my_problem").innerHTML = '나의 게시물 현황 - 문제점(' + data.myproblemList.length + ')';
				// 나의 게시물 현황 - 해결책	
				html = "";
				for(var i = 0; i < data.myanswerList.length; i++){
					html = html
					+"<tr>"
					+ "	<td>"+ (i+1) +"</td>"
					+ "	<td>"+data.myanswerList[i].business_name+"</td>"
					+ "	<td>"+data.myanswerList[i].id+"</td>"
					+ "	<td>"+data.myanswerList[i].summary+"</td>"
					+ "</tr>";
				}	
					$("#mysolve").html(html);
					document.getElementById("my_solve").innerHTML = '나의 게시물 현황 - 해결책(' + data.myanswerList.length + ')';	
				
					// 개인 정보 조회
					html = "<label class='col-md-3' style = 'display: block' for = 'text'>"+"아이디"+"</label>"
 					 + "<input type='text' class='form-control form-control-sm col-md-9' id='text' name='id' value='"+data.user_info.id+"'readonly>"
 					 + "<hr style='margin-top: 3px; margin-bottom: 3px'>"
					 
					 + "<label class='col-md-3' style = 'display: block' for = 'name'>이름</label>"
					 + "<input type='text'	class='form-control form-control-sm col-md-9' placeholder='이름을 입력하세요.' value='"+data.user_info.name+"' id='name' name='name'>" 
					 + "<hr style='margin-top: 3px; margin-bottom: 3px'>"
					 
					 + "<label class='col-md-3' style = 'display: block' for = 'tel'>휴대폰 번호</label>"
					 + "<input type='tel' class='form-control form-control-sm col-md-9' placeholder='휴대전화를 입력하세요.' value='"+data.user_info.tel+"' id='tel' name='tel'>"
					 + "<hr style='margin-top: 3px; margin-bottom: 3px'>"

					 + "<label class='col-md-3' style = 'display: block' for = 'email'>이메일</label>"
					 + "<input type='email' class='form-control form-control-sm col-md-9' placeholder='이메일을 입력하세요.' value='"+data.user_info.email+"' id='email' name='email'>"
  					 + "<hr style='margin-top: 3px; margin-bottom: 3px'>"
  					 
  					 + "<label class='col-md-3' style = 'display: block' for = 'password'>현재비밀번호</label>"
  					 + "<input type='password'	class='form-control form-control-sm col-md-9' placeholder='현재 비밀번호' id='password' name='pw'>"
					 + "<hr style='margin-top: 3px; margin-bottom: 3px'>"
  					 
					 + "<label class='col-md-3' style = 'display: block' for = 'password1'>새 비밀번호</label>"
					 + "<input type='password'	class='form-control form-control-sm col-md-9' placeholder='새 비밀번호' id='password1'	name='pw1'>"
					 + "<hr style='margin-top: 3px; margin-bottom: 3px'>"

					 + "<label class='col-md-3' style = 'display: block' for = 'password2'>새 비밀번호 확인</label>"
					 + "<input type='password' class='form-control form-control-sm col-md-9' placeholder='새 비밀번호 확인' id='password2'	name='pw2'>"
					 + "<hr style='margin-top: 3px; margin-bottom: 3px'>"
					 
					 + "<label class='col-md-3' style = 'display: block' for = 'address'>주소</label>"
					 + "<input type='text' class='form-control form-control-sm col-md-9'placeholder='주소를 입력하세요.' value='"+data.user_info.address+"' id='address' name='address'>"
					 + "<hr style='margin-top: 3px; margin-bottom: 3px'>"

					 + "<label class='col-md-3' style = 'display: block' for = 'address_detail'>상세주소</label>"
					 + "<input type='text'	class='form-control form-control-sm col-md-9' placeholder='상세주소를 입력하세요.' value='"+data.user_info.address_detail+"' id='address_detail' name='address_detail'>"
					 
					 ;
				$(".form-inline").html(html);
					
								
		
						
			},
				


			
			error : function(xhr, status, exception) {
				alert("실패");

						 
			}
		});
		$(document).on("focus","#name",function(){
			$("#name").val("");
		});
		$(document).on("focus","#tel",function(){
			$("#tel").val("");
		});
		$(document).on("focus","#email",function(){
			$("#email").val("");
		});
		$(document).on("focus","#address",function(){
			$("#address").val("");
		});
		$(document).on("focus","#address_detail",function(){
			$("#address_detail").val("");
		});
		
	$("#update_button").click(function(){
			if($("#name").val() == ''){
				$(".warning").text("이름을 입력하세요.");
			}else if($("#tel").val() == ''){
				$(".warning").text("휴대폰 번호를 입력하세요.");
			}else if($("#email").val() == ''){
				$(".warning").text("이메일을 입력하세요.");
			}else if($("#password").val() == ''){
				$(".warning").text("현재 비밀번호를 입력하세요.");
			}else if($("#password1").val() == ''){
				$(".warning").text("새 비밀번호를 입력하세요.");
			}else if($("#password2").val() == ''){
				$(".warning").text("새 비밀번호 확인을 입력하세요.");
			}else if($("#address").val() == ''){
				$(".warning").text("주소를 입력하세요.");
			}else if($("#address_detail").val() == ''){
				$(".warning").text("상세주소를 입력하세요.");
			}else if($("#password1").val() != $("#password2").val() ){
				$(".warning").text("새 비밀번호가 일치하지 않습니다.");
			}else{
				
				$.ajax({
					
					type : "POST",
					url : "<c:url value='/ws/myinfo'/>",
					data : {
						"ID" : ID
						
					},
					traditional:true,
					dataType : "json",
					cache : false,
					success : function(data) {
						if( $("#password").val() != data.pw ){
							$(".warning").text("현재 비밀번호가 잘못되었습니다.");
						}else{
// 							console.log($("#tel").val());
 							$(".mypage_update").submit();
						}
					},
					error : function(xhr, status, exception) {
						alert("실패");

								 
					}
				});
			}
			
		});
		

	});
</script>
			
							
							
							
							
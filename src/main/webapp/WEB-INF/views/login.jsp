<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<form class="form-horizontal" role="form" action="<c:url value ='/j_spring_security_check'/>" method="POST">
	<div class="main-panel" style="background-color: white;">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">로그인</h4>
				<div class="row">
					<div class="col-md-8">
						<div class="card"> 
							<div class="card-body">
								<div class="col-md-6">
									<p>
										아이디 <input type="text" class="form-control"
											placeholder="아이디를 입력하세요" id = "id" name="id" value = "${resultMap.ID}">
									</p>
								</div>
								
								<div class="col-md-6">
									<p>
										비밀번호 <input type="password" class="form-control"
											placeholder="패스워드를 입력하세요" id = "password" name="password">
									</p>
									<label class="form-check-label">
										<input class="form-check-input" type="checkbox" value="">
										<span class="form-check-sign">아이디 저장</span>
									</label>
								</div>
									
								 
									<c:if test="${paramMap.fail eq true}">
										<span class="col-md-1" style="color:red">아이디와 비밀번호를 확인하세요.</span>
									</c:if>
								 
							<div class="card-footer">

									<a href="<c:url value = '/signup/index'/>"><button class="btn btn-default btn-xs" type = "button">회원가입</button></a>
									<button class="btn btn-default btn-xs" type = "button" id = "findID">아이디찾기</button>
									<button class="btn btn-default btn-xs" type = "button" id = "findPW">비밀번호찾기</button>
									<div class=float-right> 
										<button class="btn btn-default" type = "submit">로그인</button> 
									</div>
									
								
							</div>	 
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="myModal"></div>
			<div class="modal fade" id="myModal1"></div>
		</div>
	</div>
	</div>
	</form>
</body>

<script>
//Modal - findID
	$(document).ready(function() {
	   $("#findID").click(function() {
	      fn_selectContentsPop();
	   });
	   
	   $("#findPW").click(function() {
	 	      fn_selectContentsPop1();
	   });
	});
	
	var fn_selectContentsPop = function() {
	  
	   var url ;
	   
	   url= "<c:url value='/login/open_findID'/>"; 
	   common.layerPopup(url, "#myModal"); 
	};
	
	//Modal - findPW
// 	$(document).ready(function() {
// 	   $("#findPW").click(function() {
// 	      fn_selectContentsPop1();
// 	   });
// 	});
	
	var fn_selectContentsPop1 = function() {
	  
	   var url ;
	   
	   url= "<c:url value='/login/open_findPW'/>"; 
	   common.layerPopup(url, "#myModal1"); 
	};


</script>

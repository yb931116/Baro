<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<form class="form-horizontal" role="form" action="<c:url value ='/j_spring_security_check'/>" method="POST">
	<div class="main-panel">
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
											placeholder="아이디를 입력하세요" id = "id" name="id">
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
									
								<hr>
								 
							<div class="card-footer">

									<a href="<c:url value = '/signup/signup'/>"><button class="btn btn-default btn-xs" type = "button">회원가입</button></a>
									<button class="btn btn-default btn-xs" type = "button">아이디찾기</button>
									<button class="btn btn-default btn-xs" type = "button">비밀번호찾기</button>
									<div class=float-right> 
										<button class="btn btn-default" type = "submit">로그인</button> 
									</div>
									<c:if test="${paramMap.fail eq true}">
										<span style="color:red">아이디와 비밀번호를 확인하세요.</span>
									</c:if>
									
								
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



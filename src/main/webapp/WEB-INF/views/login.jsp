<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">로그인</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="card"> 
							<div class="card-body">
								<div class="col-md-6">
									<p>
										아이디 <input type="text" class="form-control"
											placeholder="아이디를 입력하세요" id = "text" name="id">
									</p>
								</div>
								
								<div class="col-md-6">
									<p>
										비밀번호 <input type="password" class="form-control"
											placeholder="패스워드를 입력하세요" id = "password" name="pw">
									</p>
									<label class="form-check-label">
										<input class="form-check-input" type="checkbox" value="">
										<span class="form-check-sign">아이디 저장</span>
									</label>
								</div>
									
								<hr>
								 
							<div class="card-footer">
									<button class="btn btn-default btn-xs">회원가입</button>
									<button class="btn btn-default btn-xs">아이디찾기</button>
									<button class="btn btn-default btn-xs">비밀번호찾기</button>
									<div class="col-md-8">
									<div class=float-right> 
										<button class="btn btn-default">로그인</button> 
									</div>
									</div>
								
							</div>	 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>



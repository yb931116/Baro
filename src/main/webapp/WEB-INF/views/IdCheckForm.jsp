<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">아이디 중복체크</h4>
				<div class="row">
					<div class="col-md-8">
						<div class="card">
							<div class="card-body">
								<form class="form-inline">

									<label class="col-md-3"></label> <input type="text"
										class="form-control" placeholder="아이디를 입력하세요" id="text"
										name="id">
									<button class="btn btn-default">중복확인</button>

								</form>
							</div>




							<div class="card-footer">
								<label class="col-md-6"></label>
								<button class="btn btn-default btn-xs">취소</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
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

									<tbody>
										<%-- 						<c:forEach items="${resultList}" var="resultData" varStatus="loop"> --%>
										<tr>
											<td class="business_no">1</td>
											<td>창의적 공헌실적의 DB화</td>
											<td>Jsn</td>
											<td>R&D기획사업<br> 실적에 대한 사후 실적 관리
											</td>
										</tr>
										<tr>
											<td class="business_no">2</td>
											<td>창의적 공헌실적의 DB화</td>
											<td>Jsn</td>
											<td>경영/행정기획사업<br> 실적에 대한 사후 실적 관리
											</td>
										</tr>

										<%-- 						</c:forEach> --%>
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

									<tbody>
										<%-- 						<c:forEach items="${resultList}" var="resultData" varStatus="loop"> --%>
										<tr>
											<td class="business_no">1</td>
											<td>창의적 공헌실적의 DB화</td>
											<td>Jsn</td>
											<td>R&D기획사업<br> 실적에 대한 DB 수록관리로 공유/조회가 해결된다.
											</td>
										</tr>
										<tr>
											<td class="business_no">2</td>
											<td>창의적 공헌실적의 DB화</td>
											<td>Jsn</td>
											<td>경영/행정기획사업<br> 실적에 대한 DB 수록관리로 공유/조회가 해결된다.
											</td>
										</tr>
										<tr>
											<td class="business_no">3</td>
											<td>창의적 공헌실적의 DB화</td>
											<td>Jsn</td>
											<td>산출주체의 특허출원등록 내용 중의 문제점과 해결책만 발췌 실명 DB화 수록 
											</td>
										</tr>

										<%-- 						</c:forEach> --%>
									</tbody>

								</table>

							</div>


							
						</div>
					</div>

					<!-- 나의 게시물 현황 - 해결책 끝 -->










					<!-- 나의 정보 조회 및 수정 시작 -->
					<div class="col-md-8">
						<div class="card">
							<div class="card-header">
								<div class="card-title">나의 정보 조회 및 수정</div>
							</div>
							<div class="card-body">
								<form class="form-inline">
									
									<label class="col-md-3" style = "display: block" for = "text">아이디</label><input type="text"
										class="form-control form-control-sm col-md-9" id="text" name="id" value="아이디" disabled>
									
									<hr style="margin-top: 3px; margin-bottom: 3px">


									<label class="col-md-3" style = "display: block" for = "name">이름</label><input type="text"
										class="form-control form-control-sm col-md-9" placeholder="이름" id="name" name="name">

									<hr style="margin-top: 3px; margin-bottom: 3px">

									<label class="col-md-3" style = "display: block" for = "tel">휴대폰 번호</label><input type="tel"
										class="form-control form-control-sm col-md-9" placeholder="전화번호" id="tel" name="tel">

									<hr style="margin-top: 3px; margin-bottom: 3px">

									<label class="col-md-3" style = "display: block" for = "email">이메일</label><input type="email"
										class="form-control form-control-sm col-md-9" placeholder="이메일" id="email" name="email">

									<hr style="margin-top: 3px; margin-bottom: 3px">


									<label class="col-md-3" style = "display: block" for = "password">현재비밀번호</label><input type="password"
										class="form-control form-control-sm col-md-9" placeholder="패스워드" id="password" name="pw">

									<hr style="margin-top: 3px; margin-bottom: 3px">

									<label class="col-md-3" style = "display: block" for = "password1">새 비밀번호</label><input type="password"
										class="form-control form-control-sm col-md-9" placeholder="새 비밀번호" id="password1"
										name="pw1">

									<hr style="margin-top: 3px; margin-bottom: 3px">

									<label class="col-md-3" style = "display: block" for = "password2">새 비밀번호 확인</label><input type="password"
										class="form-control form-control-sm col-md-9" placeholder="새 비밀번호 확인" id="password2"
										name="pw2">

									<hr style="margin-top: 3px; margin-bottom: 3px">

									<label class="col-md-3" style = "display: block" for = "address">주소</label><input type="text"
										class="form-control form-control-sm col-md-9" placeholder="주소" id="address" name="address">

									<hr style="margin-top: 3px; margin-bottom: 3px">

									<label class="col-md-3" style = "display: block" for = "address_detail">상세주소</label><input type="text"
										class="form-control form-control-sm col-md-9" placeholder="상세주소" id="address_detail"
										name="address_detail">
								</form>
							</div>


							<div class="card-footer">

								<div class=float-right>
									<button class="btn btn-default">수정하기</button>
								</div>

							</div>
						</div>
					</div>
					<!-- 나의 정보 조회 및 수정 끝 -->



				</div>
			</div>
		</div>
	</div>
</body>

<script>
 	var tr = $('#problem tbody tr');
 	document.getElementById("my_problem").innerHTML = '나의 게시물 현황 - 문제점(' + tr.length + ')'; 
</script>

<script>
	var tr = $('#solve tbody tr');
	document.getElementById("my_solve").innerHTML = '나의 게시물 현황 - 해결책(' + tr.length + ')';
</script>
							
							
							
							
							
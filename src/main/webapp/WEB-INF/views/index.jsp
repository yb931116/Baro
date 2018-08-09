<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="wrapper">
			<div class="main-panel" style="background-color: white;">
				<div class="content">
					<div class="container-fluid">
						<div class="row justify-content-md-center mb-5">
						<img class="img-fluid mb-3" style="height: auto;" 
						src="<c:url value='/resources/img/ci.jpg'/>">
							<div class="col-sm-8">
								<form  action="">
								<div class="form-group">
									<input type="text" value="" placeholder="검색어를 입력하세요"
										class="form-control">
								</div>
							</form>
								</div>
						</div>
						
							<!----- Spacing ------>
								<div class="mb-5">&nbsp</div>
							<!--------------------->

					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">
										최근 생성된 프로젝트
									</div>
								</div>
								<table class="table mt-4 table-hover">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">프로젝트명</th>
											<th scope="col">생성자</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${resultMap.recentList}" var="resultData"
											varStatus="loop">
											<tr>
												<td class="project_no" style="display: none;">${resultData.project_no}</td>
												<td>${loop.index+1}</td>
												<td>${resultData.project_name}</td>
												<td>${resultData.user_name}</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>


						<div class="col-md-6">
							<div class="card">
							<div class="card-header">
									<div class="card-title">
										인기 프로젝트
									</div>
								</div>
								<table class="table mt-4 table-hover">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">프로젝트명</th>
											<th scope="col">생성자</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${resultMap.hotList}" var="resultData"
											varStatus="loop">
											<tr>
												<td class="project_no" style="display: none;">${resultData.project_no}</td>
												<td>${loop.index+1}</td>
												<td>${resultData.project_name}</td>
												<td>${resultData.user_name}</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
				</div>

			</div>
		</div>

</body>

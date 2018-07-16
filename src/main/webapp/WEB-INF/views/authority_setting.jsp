<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">회원 권한 설정</h4>
				<div class="row">

					<!-- 나의 게시물 현황 - 문제점 시작점 -->
					
					
					<div class="col-md-12">
						<div class="card">
														
							<div class="card-body" style ="padding-top:0">

								<table class="table mt-4 table-hover" id = "problem">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">회원 ID</th>
											<th scope="col">이름</th>
											<th scope="col">가입일</th>
											<th scope="col">권한</th>
											<th scope="col">권한변경</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${resultList}" var="resultData" varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td>${resultData.ID}</td>
											<td>${resultData.NAME}</td>
											<td>${resultData.generated_date}</td>
											<td>${resultData.authority_name}</td>
											<td>
												<select class="form-control input-square" id="squareSelect">
													<option>준회원</option>
													<option>정회원</option>	
												</select>
											</td>
										</tr>
										</c:forEach>
										

										
									</tbody>

								</table>
								<div class="card-footer">
									<div class = "float-right col-md-2">
										<button class="btn btn-default" type="button">권한변경</button>
									</div>
								</div>
							</div>



						</div>
					</div>

					<!-- 나의 게시물 현황 - 문제점 끝 -->


				</div>
			</div>
		</div>
	</div>
</body>


<script>

$(function() {
	$("#group_button").click(function() {
		if ($(".id").eq(0).text() == '') {
				$("#group_make").text("그룹원을 추가하지 않았습니다.");
				event.preventDefault();
		}
		else if ($("#group_name").val() == '') {
				$("#group_make").text("그룹명을 입력하지 않았습니다.");
				event.preventDefault();
		}else {
			$("#make_group").submit();
		}
	});
});

</script>
							
							
							
							
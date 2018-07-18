<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<form class="form-horizontal" role="form" id = authority_setting action="<c:url value ='/authority_setting/update'/>" method="POST">>
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
											<td class="originAuth">${resultData.authority_name}</td>
											<td>
												<select class="form-control input-square Auth" name="authority" form="authority_setting">
													<option value='준회원'>준회원</option>
													<option value='정회원'>정회원</option>	
												</select>
											</td>
											<input type = "hidden" name = 'list' value='${resultData.ID}'>
										</tr>
										</c:forEach>
										

										
									</tbody>

								</table>
								<div class="card-footer">
									<div class = "float-right col-md-2">
										<button class="btn btn-default" id = "authority_button" type="button">권한변경</button>
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
	</form>
</body>


<script>

$(function() {
	$("#authority_button").click(function() {

		var length = $(".originAuth").length;
		for(var i = 0 ; i < length ; i++){
			if($(".originAuth").eq(i).text()==$(".Auth").eq(i).val()){
				$(".originAuth").eq(i).parent().remove();
				length--;
				i--;
			}
		}
			$("#authority_setting").submit();

	});
	
	
});

</script>
							
							
							
							
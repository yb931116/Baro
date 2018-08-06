<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<form class="form-horizontal" role="form" id = authority_setting action="<c:url value ='/authority_setting/update'/>" method="POST">>
	<div class="main-panel" style="background-color: white;"> 
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">회원 권한 설정</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
														
							<div class="card-body" >
<!-- 								<form class="col-md-4 mb-3 nav-search ml-md-auto" -->
<%-- 									formaction="<c:url value='/authority_setting/index'/>"> --%>
<!-- 									<div class="input-group col-md-4 pull-right" style = "padding-bottom:24px"> -->
<!-- 										<input type="text" name="name_search" placeholder="이름 검색" class="form-control">  -->
<!-- 										<input type="hidden" name="search" value="true"> -->
<%-- 										<button type = "submit" formaction ="<c:url value='/authority_setting/index'/>"  --%>
<!-- 										class="btn btn-primary btn-sm"> -->
<!-- 											<i class="la la-search search-icon" style="color: white;"> -->
<!-- 											</i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 								</form> -->
								
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
									<c:set var="page" value="${resultMap.pagination}" />
									<tbody>
										<c:forEach items="${resultMap.resultList}" var="resultData" varStatus="loop">
										<tr>
											<td>${page.pageBegin+loop.index}</td>
											<td>${resultData.id}</td>
											<td>${resultData.name}</td>
											<td>${resultData.generated_date}</td>
											<td class="originAuth">${resultData.authority_name}</td>
											<td>
												<select class="form-control input-square Auth" name="authority" form="authority_setting">
													<option value ='권한입력'>권한입력</option>
													<option value='준회원'>준회원</option>
													<option value='정회원'>정회원</option>	
												</select>
											</td>
											<input type = "hidden" name = 'list' value='${resultData.id}'>
										</tr>
										</c:forEach>
											<input type='hidden' name = 'authority' value='dummy_authority' >
											<input type = "hidden" name = 'list' value='dummy_ID'>

										
									</tbody>

								</table>
								<div class="card-footer">
									<label class = "comment"></label>	
									<div class = "float-right col-md-2">
										<button class="btn btn-default" id = "authority_button" type="button">권한변경</button>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				
				<%-- 				<c:set var="page" value="${resultMap.pagination}" />  위에 table에 이미 선언해서 주석처리 참고용--%>
				
				<ul class="pagination pg-primary justify-content-center" style = "margin-bottom: 0px;">	
					<c:choose>
						<c:when test="${paramMap.search ne null}"> <!-- 검색 창 페이지 네이션 -->
							<c:choose>
								<c:when test = "${page.curPage==page.blockStart}">
										<li class="page-item" style = "display:none;">
											<!-- 맨 처음 페이지로 가면 왼쪽 화살표 없어짐   -->
										</li>								
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="/authority_setting/index?name_search=${paramMap.name_search}&search=${paramMap.search}&curPage=${page.prevPage}"/>" aria-label="Previous">
										<span aria-hidden="true">«</span> <span	class="sr-only">Previous</span></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>	<!-- 일반  페이지 네이션 -->
							<c:choose>
								<c:when test = "${page.curPage==1}">
									<li class="page-item" style = "display:none;">
											<!-- 맨 처음 페이지로 가면 왼쪽 화살표 없어짐   -->
									</li>								
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="/authority_setting/index?curPage=${page.prevPage}"/>" aria-label="Previous">
										<span aria-hidden="true">«</span> <span	class="sr-only">Previous</span></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					
					
					
					
					<c:forEach var="pageNum" begin="${page.blockStart}" end="${page.blockEnd}">
					<c:choose>
					<c:when test="${pageNum==page.curPage }">
						<li class="page-item active"><a class="page-link" >${pageNum}</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${paramMap.search ne null}">
								<li class="page-item"><a class="page-link" href="<c:url value="/authority_setting/index?name_search=${paramMap.name_search}&search=${paramMap.search}&curPage=${pageNum}" />">${pageNum}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="<c:url value="/authority_setting/index?curPage=${pageNum}" />">${pageNum}</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					
					
					<c:choose>
						<c:when test="${paramMap.search ne null}"> <!-- 검색 창 페이지 네이션 -->
							<c:choose>
								<c:when test = "${page.curPage==page.totPage}">
									<li class="page-item" style = "display:none;">
										<!-- 맨 마지막 페이지로 가면 오른쪽 화살표 없어짐   -->
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="/authority_setting/index?name_search=${paramMap.name_search}&search=${paramMap.search}&curPage=${page.nextPage}" />"aria-label="Next">
										<span aria-hidden="true">»</span><span class="sr-only">Next</span></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>	<!-- 일반 모든 그룹 리스트 페이지 네이션 -->
							<c:choose>
								<c:when test = "${page.curPage==page.totPage}">
									<li class="page-item" style = "display:none;">
										<!-- 맨 마지막 페이지로 가면 오른쪽 화살표 없어짐   -->
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="/authority_setting/index?curPage=${page.nextPage}" />"aria-label="Next">
										<span aria-hidden="true">»</span><span class="sr-only">Next</span></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
						
					</c:choose>
					
				</ul>
				<p class = "pull-right">Showing ${page.pageBegin} to ${page.pageEnd} of ${page.totalCount} entries</p>
			</div>
		</div>
	</div>
	</form>
</body>


<script>

$(function() {
	$("#authority_button").click(function() {

		var length = $(".originAuth").length;
		var count = 0;
		for(var i = 0; i < length; i++){
			if($(".originAuth").eq(i).text()==$(".Auth").eq(i).val() || $(".Auth").eq(i).val() == '권한입력'){
				count = count + 1;
			}
		}
		if(length == count){
			$(".comment").text("변경할 권한을 입력하지 않았거나 같은 권한을 입력하였습니다. 다시한번 확인하세요.");
		}else{
			for(var i = 0 ; i < length ; i++){
				if($(".originAuth").eq(i).text()==$(".Auth").eq(i).val() || $(".Auth").eq(i).val() == '권한입력'){
					$(".originAuth").eq(i).parent().remove();
					length--;
					i--;
				}
			}
			$(".main-panel").css("visibility","hidden")
	
			if($(".originAuth").length != 0){
	 			$("#authority_setting").submit(); 
				
			}
		}
 
	});
	
	
});

</script>
							
							
							
							
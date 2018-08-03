<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body> 
		
		<div class="main-panel" style="background-color: white;">
			<div class="content" >
				<div class="container-fluid">
					<h4 class="page-title">그룹 목록</h4>


				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">



								<form class="col-md-4 mb-3 nav-search ml-md-auto"
									action="<c:url value='/group/group_list'/>">
									<div class="input-group">
										<input type="text" name="group_name" placeholder="그룹명 검색"
											class="form-control"> <input type="hidden"
											name="search" value="true">
										<button class="btn btn-primary btn-sm">
											<i class="la la-search search-icon" style="color: white;">
											</i>
										</button>
									</div>
								</form>


								<table class="table mt-4 table-hover">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">그룹명</th>
											<th scope="col">생성자 ID</th>
											<th scope="col">생성자명</th>
											<th scope="col">그룹원 수</th>
											
										</tr>
									</thead>
									<c:set var="page" value="${resultMap.pagination}" />
									<tbody>
										<c:forEach items="${resultMap.resultList}" var="resultData" 
											varStatus="loop">
											<tr class="col">
												<td class="group_no" style="display: none;">${resultData.group_no}</td>
												<td>${page.pageBegin+loop.index}</td>
												<td class="group_name">${resultData.group_name}</td>
												<td>${resultData.id}</td>
												<td>${resultData.name}</td>
												<td>${resultData.group_count}</td>
												
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
				<!--  pagination -->
				
<%-- 				<c:set var="page" value="${resultMap.pagination}" />  위에 table에 이미 선언해서 주석처리 참고용--%>
				
				<ul class="pagination pg-primary justify-content-center" style = "margin-bottom: 0px;">
					
					
					<c:choose>
					<c:when test="${paramMap.search ne null}"> <!-- 검색 창 페이지 네이션 -->
						<li class="page-item">
							<a class="page-link" href="<c:url value="/group/group_list?group_name=${paramMap.group_name }&search=${paramMap.search}&curPage=${page.prevPage}"/>" aria-label="Previous">
							<span aria-hidden="true">«</span> <span	class="sr-only">Previous</span></a>
						</li>
					</c:when>
					<c:otherwise>	<!-- 일반 모든 그룹 리스트 페이지 네이션 -->
						<li class="page-item">
							<a class="page-link" href="<c:url value="/group/group_list?curPage=${page.prevPage}"/>" aria-label="Previous">
							<span aria-hidden="true">«</span> <span	class="sr-only">Previous</span></a>
						</li>
					</c:otherwise>
					</c:choose>
					
					
					
					
					<c:forEach var="pageNum" begin="${page.blockStart}" end="${page.blockEnd}">
					<c:choose>
					<c:when test="${pageNum==page.curPage }">
						<li class="page-item"><a class="page-link" href="#">${pageNum}</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${paramMap.search ne null}">
								<li class="page-item"><a class="page-link" href="<c:url value="/group/group_list?group_name=${paramMap.group_name }&search=${paramMap.search}&curPage=${pageNum}" />">${pageNum}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="<c:url value="/group/group_list?curPage=${pageNum}" />">${pageNum}</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					
					
					<c:choose>
					<c:when test="${paramMap.search ne null}"> <!-- 검색 창 페이지 네이션 -->
						<li class="page-item">
						<a class="page-link" href="<c:url value="/group/group_list?group_name=${paramMap.group_name }&search=${paramMap.search}&curPage=${page.nextPage}" />"aria-label="Next">
						<span aria-hidden="true">»</span><span class="sr-only">Next</span></a>
						</li>
					</c:when>
					<c:otherwise>	<!-- 일반 모든 그룹 리스트 페이지 네이션 -->
						<li class="page-item">
					<li class="page-item">
						<a class="page-link" href="<c:url value="/group/group_list?curPage=${page.nextPage}" />"aria-label="Next">
						<span aria-hidden="true">»</span><span class="sr-only">Next</span></a>
					</li>
					</c:otherwise>
					
					</c:choose>
					
				</ul>
				<p class = "pull-right">Showing ${page.pageBegin} to ${page.pageEnd} of ${page.totalCount} entries</p>
			</div>
			</div>
		</div>
	

</body>

<script>
	$(function() {
		$(".col").click(
				function() {
					var form = document.createElement("form");
					var group_no = document.createElement("input");
					var group_name = document.createElement("input");

					group_no.setAttribute("type", "hidden");
					group_no.setAttribute("name", "group_no");
					group_no.setAttribute("value", $(this).find(".group_no")
							.text());
					form.appendChild(group_no);

					group_name.setAttribute("type", "hidden");
					group_name.setAttribute("name", "group_name");
					group_name.setAttribute("value", $(this)
							.find(".group_name").text());
					form.appendChild(group_name);

					form.setAttribute("method", "POST");
					form.setAttribute("action",
							"<c:url value= '/group/group_detail'/>");
					$(document.body).append(form);
					form.submit();
				});
	});
</script>
	
	
	
	


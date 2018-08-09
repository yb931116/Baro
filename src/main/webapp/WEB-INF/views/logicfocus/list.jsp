<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<body> 

	<div class="main-panel" style="background-color: white;">
		<div class="content">
			<div class="container-fluid">
			<h4 class="page-title">프로젝트</h4>
			<div class="row">
				<div class="col-md-12">
					<div class="card">
					<div class="card-body"> 

			<div class = float-left >
			<div class = "col-md-1 mb-3">
				<a href="<c:url value='/logicfocus/edit'/>">
				<button class = "btn btn-default" >
				프로젝트 생성</button>
				</a>
			</div>
			
			</div>
			
			<form class="col-md-4 mb-3 nav-search ml-md-auto" action="<c:url value='/logicfocus/list'/>">
						<div class="input-group">
							<input type="text" name="project_name" placeholder="프로젝트명 검색" class="form-control">
							<input type="hidden" name="search" value="true">
						<button class="btn btn-primary btn-sm">
						<i class="la la-search search-icon" style="color:white;">
						</i></button>
						</div>
					</form> 

					
				<table class="table mt-4 table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">프로젝트명</th>
							<th scope="col">생성자 ID</th>
							<th scope="col">생성자명</th>
							<th scope="col">제기된 문제</th>
							<th scope="col">제안된 해결책</th>
						</tr>
					</thead>
					<c:set var="page" value="${resultMap.pagination}" />
					<tbody>
						<c:forEach items="${resultMap.resultList}" var="resultData" varStatus="loop">
							<tr class = "col">
								<td class="project_no" style="display:none;" >${resultData.project_no}</td>
								<td>${page.pageBegin+loop.index}</td>
								<td class = "project_name">${resultData.project_name}</td>
								<td>${resultData.id}</td>
								<td>${resultData.name}</td>
								<td>${resultData.problem_sum}</td>
								<td>${resultData.anwser_sum}</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				</div>
				</div>
				</div>
				</div>
				
				<%-- 				<c:set var="page" value="${resultMap.pagination}" />  위에 table에 이미 선언해서 주석처리 참고용--%>
				
				<ul class="pagination pg-primary justify-content-center" style = "margin-bottom: 0px;">
			 		<c:choose>
						<c:when test="${paramMap.search ne null}"> <!-- 검색 창 페이지 네이션 -->
							<c:choose>
								<c:when test = "${page.curPage==1}">
										<li class="page-item" style = "display:none;"> <!-- 맨 처음 페이지로 가면 왼쪽 화살표 없어짐 -->
										<a class="page-link" href="<c:url value="/logicfocus/list?project_name=${paramMap.project_name }&search=${paramMap.search}&curPage=${page.prevPage}"/>" aria-label="Previous">
										<span aria-hidden="true">«</span> <span	class="sr-only">Previous</span></a>  
										</li>								
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="/logicfocus/list?project_name=${paramMap.project_name }&search=${paramMap.search}&curPage=${page.prevPage}"/>" aria-label="Previous">
										<span aria-hidden="true">«</span> <span	class="sr-only">Previous</span></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>	<!-- 일반  페이지 네이션 -->
							<c:choose>
								<c:when test = "${page.curPage==1}">
									<li class="page-item" style = "display:none;">	<!-- 맨 처음 페이지로 가면 왼쪽 화살표 없어짐 -->  
									</li>								
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="/logicfocus/list?curPage=${page.prevPage}"/>" aria-label="Previous">
										<span aria-hidden="true">«</span> <span	class="sr-only">Previous</span></a>
									</li>
								</c:otherwise>						
							</c:choose>
						</c:otherwise>
					</c:choose>
					
					
					
					
					<c:forEach var="pageNum" begin="${page.blockStart}" end="${page.blockEnd}">
						<c:choose>
							<c:when test="${pageNum==page.curPage }">
								<li class="page-item active"><a class="page-link">${pageNum}</a></li> <!-- 선택된 페이지 숫자 클릭 안됨 -->
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${paramMap.search ne null}">	<!-- 검색 창 페이지 네이션 -->
										<li class="page-item"><a class="page-link" href="<c:url value="/logicfocus/list?project_name=${paramMap.project_name }&search=${paramMap.search}&curPage=${pageNum}" />">${pageNum}</a></li>
									</c:when>
									<c:otherwise>	<!-- 일반  페이지 네이션 -->
										<li class="page-item"><a class="page-link" href="<c:url value="/logicfocus/list?curPage=${pageNum}" />">${pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					
					 
					 
					<c:choose>
						<c:when test="${paramMap.search ne null}"> <!-- 검색 창 페이지 네이션 -->
							<c:choose>
								<c:when test = "${page.curPage==page.totPage}">
										<li class="page-item" style = "display:none;"> <!-- 맨 처음 페이지로 가면 왼쪽 화살표 없어짐 -->
										<a class="page-link" href="<c:url value="/logicfocus/list?project_name=${paramMap.project_name }&search=${paramMap.search}&curPage=${page.nextPage}"/>" aria-label="Next">
										<span aria-hidden="true">»</span> <span	class="sr-only">Next</span></a>  
										</li>								
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="/logicfocus/list?project_name=${paramMap.project_name }&search=${paramMap.search}&curPage=${page.nextPage}"/>" aria-label="Next">
										<span aria-hidden="true">»</span> <span	class="sr-only">Next</span></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>	<!-- 일반  페이지 네이션 -->
							<c:choose>
								<c:when test = "${page.curPage==page.totPage}">
									<li class="page-item" style = "display:none;">	<!-- 맨 처음 페이지로 가면 왼쪽 화살표 없어짐 -->  
									</li>								
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="/logicfocus/list?curPage=${page.nextPage}"/>" aria-label="Next">
										<span aria-hidden="true">»</span> <span	class="sr-only">Next</span></a>
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
</body>

<script>
 	$(function() {
 		$(".col").click(function(){
 			var form = document.createElement("form");
 			var project_no = document.createElement("input");
 			var project_name = document.createElement("input");
 			
 			project_no.setAttribute("type","hidden"); 
 			project_no.setAttribute("name","project_no");
 			project_no.setAttribute("value", $(this).find(".project_no").text());
 			form.appendChild(project_no);
 			
 			project_name.setAttribute("type","hidden");
 			project_name.setAttribute("name","project_name");
 			project_name.setAttribute("value",$(this).find(".project_name").text());
 			form.appendChild(project_name);
 			
 			
 			form.setAttribute("method","POST");
 			form.setAttribute("action","<c:url value= '/logicfocus/read'/>");
 			$(document.body).append(form);
 			form.submit();
 		});
	}); 

</script>
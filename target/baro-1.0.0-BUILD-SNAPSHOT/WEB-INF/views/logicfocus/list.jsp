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
							<input type="text" name="business_name" placeholder="프로젝트명 검색" class="form-control">
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
					
					<tbody>
						<c:forEach items="${resultList}" var="resultData" varStatus="loop">
							<tr class = "col">
								<td class="business_no" style="display:none;" >${resultData.business_no}</td>
								<td>${loop.index+1}</td>
								<td class = "business_name">${resultData.business_name}</td>
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
			</div>
		</div>
	</div>
</body>

<script>
 	$(function() {
 		$(".col").click(function(){
 			var form = document.createElement("form");
 			var business_no = document.createElement("input");
 			var business_name = document.createElement("input");
 			
 			business_no.setAttribute("type","hidden"); 
 			business_no.setAttribute("name","business_no");
 			business_no.setAttribute("value", $(this).find(".business_no").text());
 			form.appendChild(business_no);
 			
 			business_name.setAttribute("type","hidden");
 			business_name.setAttribute("name","business_name");
 			business_name.setAttribute("value",$(this).find(".business_name").text());
 			form.appendChild(business_name);
 			
 			
 			form.setAttribute("method","POST");
 			form.setAttribute("action","<c:url value= '/logicfocus/read'/>");
 			$(document.body).append(form);
 			form.submit();
 		});
	}); 

</script>
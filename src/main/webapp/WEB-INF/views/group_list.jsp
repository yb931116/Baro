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

									<tbody>
										<c:forEach items="${resultList}" var="resultData"
											varStatus="loop">
											<tr class="col">
												<td class="group_no" style="display: none;">${resultData.group_no}</td>
												<td>${loop.index+1}</td>
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








			</div>
			</div>
		</div>
	

</body>

<script>
 	$(function() {
 		$(".col").click(function(){
 			var form = document.createElement("form");
 			var group_no = document.createElement("input");
 			var group_name = document.createElement("input");
 			
 			group_no.setAttribute("type","hidden"); 
 			group_no.setAttribute("name","group_no");
 			group_no.setAttribute("value", $(this).find(".group_no").text());
 			form.appendChild(group_no);
 			
 			group_name.setAttribute("type","hidden");
 			group_name.setAttribute("name","group_name");
 			group_name.setAttribute("value",$(this).find(".group_name").text());
 			form.appendChild(group_name);
 			
 			
 			form.setAttribute("method","POST");
 			form.setAttribute("action","<c:url value= '/group/group_detail'/>");
 			$(document.body).append(form);
 			form.submit();
 		});
	}); 

</script>
	
	
	
	


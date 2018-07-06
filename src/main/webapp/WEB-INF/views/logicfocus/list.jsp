<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<body>

	<div class="main-panel" style="background-color: white;">
		<div class="content">
			<div class="container-fluid">
			
			<div class = float-left >
			<div class = "col-md-1 mb-3">
				<a href="<c:url value='/logicfocus/edit'/>">
				<button class = "btn btn-default" >
				프로젝트 생성</button>
				</a>
			</div>
			
			</div>
				<table class="table mt-4 table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">프로젝트명</th>
							<th scope="col">생성자</th>
							<th scope="col">제기된 문제</th>
							<th scope="col">해결된 문제</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${resultList}" var="resultData" varStatus="loop">
							<tr>
								<td class="business_no" style="display:none;" >${resultData.business_no}</td>
								<td>${loop.index+1}</td>
								<td>${resultData.business_name}</td>
								<td>Jsn</td>
								<td>10</td>
								<td>6</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>

			</div>
		</div>
	</div>
</body>

<script>
 	$(function() {
 		$("tr").click(function(){
 			var el =  $(this).find(".business_no");
 			var form = document.createElement("form");
 			var hidden = document.createElement("input");
 			hidden.setAttribute("type","hidden");
 			hidden.setAttribute("name","business_no");
 			hidden.setAttribute("value",el.text());
 			form.append(hidden);
 			form.setAttribute("method","POST");
 			form.setAttribute("action","<c:url value= '/logicfocus/read'/>");
 			$(document.body).append(form);
 			form.submit();
 		});
	}); 

</script>
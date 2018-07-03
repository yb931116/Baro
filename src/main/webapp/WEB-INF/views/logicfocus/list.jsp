<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<body>

	<div class="main-panel">
		<div class="content" style="background-color: white;">
			<div class="container-fluid">
				<table class="table table-striped mt-4">
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
							<tr
								class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">
								<td>${resultData.business_no}</td>
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
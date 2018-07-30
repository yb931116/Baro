<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.iconsize50 {
	font-size: 50px;
}

.iconsize20 {
	font-size: 20px;
}

.name {
	width: 10%;
}

th, td {
	text-align: center !important;
}
</style>

<body>
	<div class="main-panel" style="background-color: white;"> 
		<div class="content">
			
<!-- 			<span class="h2">Evaluation</span> -->
			
			<div class="container-fluid">
				<h4 class="page-title">그룹</h4>
				<div class="card">
					<div class="card-body">
						<h6 class="col-md-12 form-inline">${resultMap.group_name}</h6>
						<div class="row justify-content-md-center"> 
							<div class="form-group col-lg-3">
								<label class="mt-1">문제점 가중치</label> <input type="text" value=""
									id="Ppoints" class="form-control">
							</div>
							<div class="form-group col-lg-3">
								<label class="mt-1">해결책 가중치</label> <input type="text" value=""
									id="Apoints" class="form-control">
							</div>
							<div class="form-group row align-items-end">
								<button class="btn btn-default ml-3" onclick="apply()">적용</button>
							</div>
						</div>
						<div class="row justify-content-md-center">
							<table class="table-bordered col-lg-12" id="evaluation">
								<thead>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>문제점 건수</th>
									<th>문제점 점수</th>
									<th>해결책 건수</th>
									<th>해결책 점수</th>
									<th>합계</th>
									
								</tr>
								</thead>
								<tbody>
									<c:forEach items="${resultList}" var="resultData" varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td>${resultData.id}</td>
											<td>${resultData.name}</td>
											<td class = pro_cnt>${resultData.problem_count}</td>
											<td class = "proscore"></td>
											<td class = ans_cnt>${resultData.answer_count}</td>
											<td class = "ansscore"></td>
											<td class = "sum"></td>
											
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
</body>

<script>

	function apply() {

		var pro = $(".pro_cnt");
		var ans = $(".ans_cnt");
		var pronum = pro.length;
		var ansnum = ans.length;
		
		for(var i = 0 ; i < pronum ; i++){
			console.log(pro.eq(i).text()+"/"+$("#Ppoints").val());
			$(".proscore").eq(i).text(pro.eq(i).text()*$("#Ppoints").val());
			$(".ansscore").eq(i).text(ans.eq(i).text()*$("#Apoints").val());
			$(".sum").eq(i).text(pro.eq(i).text()*$("#Ppoints").val()+ans.eq(i).text()*$("#Apoints").val() );
		}

	}
	
</script>















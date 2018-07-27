<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
		
		<div class="main-panel" style="background-color: white;">
			<div class="content">
				<div class="container-fluid">
	<form class="form-horizontal" role="form" id=make_group action="<c:url value ='/group/insert'/>" method="POST">
					<h4 class="page-title">그룹 </h4>
					<div class="row">
						<div class="col-md-10">
							<div class="card">
								<div class="card-body">
									<div class="col-md-12">
										<p class="form-inline">
											<span class="col-md-2">그룹명</span> <input type="text"
												class="col-md-9 form-control" placeholder="그룹명을 입력하세요"
												id="group_name" name="group_name">
										</p>

									</div>


									<div class="col-md-12">
										<p class="form-inline">
											<span class="col-md-2">그룹원</span> <input type="text"
												class="col-md-8 form-control" placeholder="ID를 입력하세요"
												id="group_member" name="group_member">
											<button id="plus" class="col-md-1 btn btn-default btn-xs"
												type="button">추가</button>
										</p>
										<label id="id_check"></label>

									</div>
								</div>


								<div class="card-footer">

									<div class="col-md-12 row justify-content-md-center">
										<table class="table-bordered col-md-12" id="group_table">
											<tr>
												<th>번호</th>
												<th>ID</th>
												<th>이름</th>
												<th>삭제</th>
											</tr>
										</table>
									</div>

									<hr>


									<input type='hidden' name='ID_LIST' value='dummy_data'>
									<div class=float-right>
										<label id="group_make"></label>
										<button class="btn btn-default" id="group_button"
											type="button">그룹만들기</button>
									</div>



								</div>

							</div>
						</div>
					</div>
		</form>


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
			} else if ($("#group_name").val() == '') {
				$("#group_make").text("그룹명을 입력하지 않았습니다.");
				event.preventDefault();
			} else {
				$("#make_group").submit();
			}
		});
	});


	// 그룹 만들기 그룹원 추가 버튼////////////////////////////////////////////////////////////
	$(function() {
		var count = 0;
		$("#plus")
				.click(
						function() {
							var ID = $("#group_member").val();
							var flag = "true";

							$
									.ajax({
										type : "POST",
										url : "<c:url value='/ws/idcheck'/>",
										data : {
											"ID" : ID
										},
										dataType : "json",
										cache : false,
										success : function(data) {
											for (var i = 0; i < count; i++) {
												if ($(".id").eq(i).text() == $("#group_member").val()) {
													$("#id_check").text("이미 그룹에 아이디가 존재합니다.");
													flag = "false";
													break;
												}
											}

											if (flag == "true") {
												var html = $("#group_table").html();
												count = count + 1;
												$("#id_check").text("");
												$("#group_table")
														.html(html
																		+ "<tr>"
																		+ "	<td class = 'count'>"
																		+ count
																		+ "</td>"
																		+ "	<td class = 'id'><input type='hidden' id = 'ID_LIST' name = 'ID_LIST' value="+data.ID+" >"
																		+ data.ID
																		+ "</td>"
																		+ "	<td>"
																		+ data.NAME
																		+ "</td>"
																		+ "	<td style='text-align:center;'><i class=\"minus la la-minus-circle iconsize20\"></i></td>"
																		+ "</tr>"
																		+ "<tr>");

											}

										},

										error : function(xhr, status, exception) {

											$("#id_check").text(
													"아이디가 존재하지 않습니다.");
											return false;
										}
									});

						});
		$(document).on("click", ".minus", function() {
			count = count - 1;
			$(this).parent().parent().remove();

			for (var i = 0; i < count; i++) {
				$(".count").eq(i).text(i + 1);
			}

		});
	});
	
		
</script>

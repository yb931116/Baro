<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<body>
		
		<div class="main-panel" style="background-color: white;">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title">전체 그룹</h4>
					<c:forEach items="${groupNames}" var="groupName" varStatus="loop">
					<form class="form-horizontal list_form"  action = "<c:url value ='/admin_group/list?ID=${pageContext.request.userPrincipal.name}'/>" role="form" method="POST">
					<div class="row">
						<div class="col-md-10">
							<div class="card">
								<div class="card-header">
<!-- 											<p class="form-inline"> -->
											<h6 class="col-md-12 form-inline">${groupName.group_name}</h6>
											<label class = "form-inline col-md-2 float-right">그룹생성자 : <span>${groupName.id}</span></label>
											
<!-- 											</p> -->
											<input type='hidden' class = group_name name='group_name' value='${groupName.group_name}'>
								</div> 
								<div class="card-body">
									<div class="col-md-12">
										<p class="form-inline">
											<span class="col-md-2">그룹원</span> <input type="text"
												class="col-md-8 form-control
 												modify_group_member" placeholder="ID를 입력하세요" 
												name="modify_group_member">
											<button class="col-md-1 btn btn-default btn-xs modify_plus"
												type="button">추가</button>
										</p>
										<label class="modify_id_check"></label>

									</div>
									
																		<div class="col-md-12 row justify-content-md-center">
										<table class="table-bordered col-md-12
 												modify_group_table"> 

											<thead>
												<tr>
													<th>번호</th>
													<th>ID</th>
													<th>이름</th>
													<th>삭제</th>
												</tr>
											</thead>




											<tbody>
												
														<c:forEach items="${resultList.get(loop.index)}" var="tableData"
 															varStatus="loop2"> 
															<tr class="col">
 																<td class ="table_index">${loop2.index+1}</td> 
																<td class = "id">${tableData.id}</td> 
 																<td>${tableData.uname}</td>
																<td style='text-align: center;'><i
																	class="minus la la-minus-circle iconsize20"></i></td>
															</tr>
														</c:forEach>
													
											</tbody>
										</table>

									</div>
								</div>


								<div class="card-footer">




										<input type='hidden' name='ID_LIST' value='dummy_data'> <!-- 더미데이터 삽입 -->
									<div class=float-right>
										<label class="modify_group_make"></label>
										<button class="btn btn-default group_modify"
											type="button">수정하기</button>
										<button class="btn btn-default group_delete"
											type="button">그룹삭제</button>
											<input type='hidden' name='ID' value='${pageContext.request.userPrincipal.name}'> <!-- 그룹 리스트 다시 보여줄때 필요한 parameter 위한 hidden -->
									</div>



								</div>

							</div>
						</div>
					</div>
					</form>
	</c:forEach>



				</div>
			</div>
		</div>
	

</body>
<script>

	
	
	
	
	// 그룹 수정 
	

	
	$(function() {
		$(".modify_plus").click(function() {

							var ID = $(this).closest(".card-body").find(".modify_group_member").val();
							var flag = "true";
							var $button = $(this);
							var $count = $(this).closest(".card-body").find(".table_index").length;
							
							$.ajax({
										type : "POST",
										url : "<c:url value='/ws/idcheck'/>",
										data : {
											"ID" : ID
										},
										dataType : "json",
										cache : false,
										success : function(data) { 
											for (var i = 0; i < $count; i++) {

												if ($button.closest(".card-body").find(".id").eq(i).text() == $button.closest(".card-body").find(".modify_group_member").val()) {
													$button.closest(".card-body").find(".modify_id_check") 
															.text(
																	"이미 그룹에 아이디가 존재합니다.");
													flag = "false";
													break;
												}
											}

											if (flag == "true") {

												var html = $button.closest(".card-body").find(".modify_group_table").html();
												$count = $count + 1;
												$(".modify_id_check").text("");

												$button.closest(".card-body").find(".modify_group_table")
														.html(
																html
																		+ "<tr>"
																		+ "	<td class = 'table_index'>"
																		+ $count
																		+ "</td>"
																		+ "	<td class = 'id'>"
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

											$(this).closest(".modify_id_check")
											$(".modify_id_check")		
											
											$button.closest(".card-body").find(".modify_id_check")
											.text(
													"아이디가 존재하지 않습니다.");
											return false;
										}
									});

						});
		
			
			$(document).on("click",".minus", function() {
				var $count = $(this).closest(".card-body").find(".table_index").length;
				$count = $count - 1;
				var $table = $(this).closest(".card-body").find(".modify_group_table");
				$(this).parent().parent().remove();
				for (var i = 0; i <= $count; i++) {
					$table.find(".table_index").eq(i).text(i+1);
				}
			});
		
			$(".group_delete").click(function() {
					 $(this).closest(".delete_form").submit();
			});
			$(".group_modify").click(function() {
				var ID_LIST = [];
				for(var i = 0; i < $(this).closest('.card').find('.id').length; i++){
					ID_LIST.push($(this).closest('.card').find('.id').eq(i).text());
				}
				ID_LIST.push("dummy_data");

				console.log(ID_LIST); 
				console.log(ID_LIST.length); 
				
 

				var GROUP_NAME = $(this).closest(".card").find(".group_name").val();

				var button = $(this);
				$.ajax({
					type : "POST",
					url : "<c:url value='/ws/group_update'/>",
					data : {
						"group_name" : GROUP_NAME,
						"ID_LIST" : ID_LIST
					},
					traditional:true,
					dataType : "json",
					cache : false,
					success : function(data) {

						button.closest(".list_form").submit();


					},
					error : function(xhr, status, exception) {


								 
					}
				});
			});
	
	//그룹 삭제하기 
			$(".group_delete").click(function() {
			 
				
				var GROUP_NAME = $(this).closest(".card").find(".group_name").val();
				var button = $(this);
				$.ajax({
					type : "POST",
					url : "<c:url value='/ws/group_delete'/>",
					data : {
						"group_name" : GROUP_NAME,
					},
					traditional:true,
					dataType : "json",
					cache : false,
					success : function(data) {
						
						button.closest(".list_form").submit();
						
						
					},
					error : function(xhr, status, exception) {
						
					}
				});
			});

	
		
		});

	

		
		
		
</script>

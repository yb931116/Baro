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
	<div class="main-panel">
		<div class="content">
			<span class="h2">Evaluation</span>
			<hr>
			<div class="container-fluid">
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
						<tr>
							<th>번호</th>
							<th>ID</th>
							<th class="name">이름</th>
							<th>문제점 건수</th>
							<th>문제점 점수</th>
							<th>해결책 건수</th>
							<th>문제점 점수</th>
							<th>합계</th>
							<th>삭제</th>
						</tr>
					</table>
					<div class="row justify-content-md-center mt-3 col-lg-5">
						<select>
<!-- 							<option value="name">이름</option> -->
 							<option value="ID">아이디</option> 
						</select> 
						<input type="text" id="text" class="form-control col-lg-8 mr-2">
						<button id="plus" class="btn btn-default">추가</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(function() {


		$("#plus").click(function(){
				var text = $("#text").val();
				var type;
				if($("select").val() == "name"){
					type = "name";
				}else{
					type = "ID";
				}
				var num = 1;
				
				$.ajax({
					type : "POST",
				    url : "<c:url value='/ws/evaluation'/>",
				    data : {"type" : type,
				    		"text":text}, 
				    dataType: "json",
				    cache : false,
				    success : function(data) {
						for(var i = 0 ; i < num ; i++){
							if($(".ID").eq(i).text() == data.ID){
								alert("이미 등록되었습니다.")
								return false;
							}
						}
				    	
				    	var html = $("#evaluation").html();
						$("#evaluation").html(
							html
							+ "<tr>"
							+ "	<td>"+ num +"</td>"
							+ "	<td class=\"ID\">"+data.ID+"</td>"
							+ "	<td class=\"name\">"+data.NAME+"</td>"
							+ "	<td class=\"pronum\">"+data.PRONUM+"</td>"
							+ "	<td class=\"proscore\"></td>"
							+ "	<td class=\"ansnum\">"+data.ANSNUM+"</td>"
							+ "	<td class=\"ansscore\"></td>"
							+ "	<td class=\"sum\"></td>"
							+ "	<td style='text-align:center;'><i class=\"minus la la-minus-circle iconsize20\"></i></td>"
							+ "</tr>" + "<tr>");
						num++;
			    	},
				  
				    error : function(xhr,status, exception) {
						alert("해당하는 ID가 없습니다.");
				    	return false;
				    }
			    });

		$(document).on("click", ".minus", function() {
			$(this).parent().parent().remove();
		
		});	
		});

	});
	function apply() {

		var pro = $(".pronum");
		var ans = $(".ansnum");
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















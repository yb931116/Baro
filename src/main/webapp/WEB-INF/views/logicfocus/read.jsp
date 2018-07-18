<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="<c:url value='/resources/sass/ready/components/_tables.scss'/>"></script>
<style>
.customContent {
	background-color: white;
}

.customTable tr {
	height: 50px;
}

.table>tbody>tr>td, .table>tbody>tr>th {
	height: 150px;
} 

.colPro {
	width: 300px;
}

.colAns {
	width: 300px;
}

.colNum {
	width: 30px;
}
</style>


<div class="main-panel">
	<div class="content customContent">
		<div class="container-fluid">
			<div class="card-sub">이름아 나와라</div>

			<table class="table customTable">
				<thead>
					<tr>
						<th class="colNum">고유번호</th>
						<th class="colPro">목적 또는 문제점</th>
						<th class="colAns">해결책</th>
						<th class="colNum">원인 고유 번호</th>
						<th class="colPro">부정적 파생 문제점</th>
						<th class="colAns">2차 해결책</th>
						<th class="colNum">행선 고유 번호</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${resultMap.ProList}" varStatus="loop">
						<tr>
							<th class="colNum">${loop.index+1}</th>
							<td id = "colPro" class="colPro layerModal">
								<input class= "original_no" type = "hidden" value ="${resultMap.ProList[loop.index].original_no}">
								<input class = "source_no" type = "hidden" value ="${resultMap.ProList[loop.index].source_no}">
								<input class = "summary" type = "hidden" value ="${resultMap.ProList[loop.index].summary}">
								<input class = "contents" type = "hidden" value ="${resultMap.ProList[loop.index].contents}">
								<input class = "category" type = "hidden" value ="${resultMap.ProList[loop.index].category}">
								${resultMap.ProList[loop.index].summary}
							</td>
							<td class="colAns layerModal">
								<input class= "original_no" type = "hidden" value ="${resultMap.AnsList[loop.index].original_no}">
								<input class = "source_no" type = "hidden" value ="${resultMap.AnsList[loop.index].source_no}">
								<input class = "summary" type = "hidden" value ="${resultMap.AnsList[loop.index].summary}">
								<input class = "contents" type = "hidden" value ="${resultMap.AnsList[loop.index].contents}">
<<<<<<< HEAD
=======
								<input class = "category" type = "hidden" value ="${resultMap.AnsList[loop.index].category}">
>>>>>>> branch 'master' of https://github.com/yb931116/Baro.git
								${resultMap.AnsList[loop.index].summary}
							</td>
							<th scope="row" class="colNum"></th>
							<td class="colPro layerModal depPro"></td>
							<td class="colAns layerModal depAns"></td>
							<th scope="row" class="colNum"></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="modal fade" id="myModal"></div>
		</div>
	</div>
</div>

<script>
	// 테이블 hover
	$(function() {
		$("td").hover(function() {
			$(this).css('background-color', '#ebedf2');
		}, function() {
			$(this).css('background-color', 'white');
		});
<<<<<<< HEAD
=======
		var $Pro_Original_no = $(".colPro").find(".original_no");
		var $Pro_Source_no = $(".colPro").find(".source_no");
		var $Ans_Original_no = $(".colAns").find(".original_no");
		var $Ans_Source_no = $(".colAns").find(".source_no");
		
		for(var i = 0 ; i < $Ans_Original_no.length ; i++){
			var count =0;
			var depPro = new Array();
			var depAns = new Array();
			for(var j = 0; j < $Pro_Original_no.length ; j++){
				if($Ans_Original_no[i].val() == $Pro_Source_no[j].val()){
						indexs.add($Pro_Source_no[j]);
				}
			}
			if(indexs.length==0){
				$Ans_Original_no[i].parent().find(".depPro").text("");
				$Ans_Original_no[i].parent().find(".depAns").text("");
			}else if(indexs.length==1){
				indexs[0].parent().clone().appendTo(".depPro");
				indexs[0].parent().parent().find(".colAns").clone().appendTo(".dep");
				
			}else{
				$Ans_Original_no[i].parent().find(".depPro").text("");
			}
		}
		
>>>>>>> branch 'master' of https://github.com/yb931116/Baro.git
	});

	//   Modal
	$(document).ready(function() {
		$(".layerModal").click(function() {
			fn_selectContentsPop($(this));
		});
	});

	var fn_selectContentsPop = function(td) {
		var no = td.find(".colNum");
		var url="<c:url value='/logicfocus/read/detail'/>";
		var values = [td.find(".original_no").val(), 
					 td.find(".source_no").val(),
					 td.find(".summary").val(),
					 td.find(".contents").val(),
					 td.find(".category").val()];
		
		common.layerPopup(url,values,"#myModal");
	};
</script>
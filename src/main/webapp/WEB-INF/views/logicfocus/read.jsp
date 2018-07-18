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
						<tr class = "line">
							<th class="colNum origin">${loop.index+1}</th>
							<td  class="colPro layerModal originalPro">
								<input class= "original_no" type = "hidden" value ="${resultMap.ProList[loop.index].original_no}">
								<input class = "source_no" type = "hidden" value ="${resultMap.ProList[loop.index].source_no}">
								<input class = "summary" type = "hidden" value ="${resultMap.ProList[loop.index].summary}">
								<input class = "contents" type = "hidden" value ="${resultMap.ProList[loop.index].contents}">
								<input class = "category" type = "hidden" value ="${resultMap.ProList[loop.index].category}">
								${resultMap.ProList[loop.index].summary}
							</td>
							<td class="colAns layerModal originalAns">
								<input class= "original_no" type = "hidden" value ="${resultMap.AnsList[loop.index].original_no}">
								<input class = "source_no" type = "hidden" value ="${resultMap.AnsList[loop.index].source_no}">
								<input class = "summary" type = "hidden" value ="${resultMap.AnsList[loop.index].summary}">
								<input class = "contents" type = "hidden" value ="${resultMap.AnsList[loop.index].contents}">
								<input class = "category" type = "hidden" value ="${resultMap.AnsList[loop.index].category}">
								${resultMap.AnsList[loop.index].summary}
							</td>
							<th scope="row" class="colNum source"></th>
							<td class="colPro layerModal depPro"></td>
							<td class="colAns layerModal depAns"></td>
							<th scope="row" class="colNum destination"></th>
						</tr>
					</c:forEach>
						<tr >
							<th class="colNum origin"></th>
							<td  class=" layerModal "></td>
							<td class=" layerModal "></td>
							<th scope="row" class="colNum "></th>
							<td class=" layerModal "></td>
							<td class=" layerModal "></td>
							<th scope="row" class="colNum "></th>
						</tr>
				</tbody>
			</table>
			<div class="modal fade" id="myModal"></div>
		</div>
	</div>
</div>

<script>
	// 테이블 hover
	$(function() {		
		var $trLine = $(".line")
		
		for(var i = 0 ; i < $trLine.length ; i++){
			var count =0;
			var dest = new Array();
			for(var j = 0; j < $trLine.length ; j++){
				if($trLine.eq(j).find(".colPro").find(".source_no").val()=="" || $trLine.eq(j).find(".colPro").find(".source_no").val()==null){
					continue;
				}
				if($trLine.eq(i).find(".colAns").find(".original_no").val() == $trLine.eq(j).find(".colPro").find(".source_no").val()){
					dest.push(j);
/* 					console.log((i+1)+"번째 ans의 orignal: "+ $trLine.eq(i).find(".colAns").find(".original_no").val());
					console.log((j+1)+"번째 pro의 source: "+ $trLine.eq(j).find(".colPro").find(".source_no").val()); */
				}
			}
			if(dest.length==0){
				// 부정적 파생문제점이 없을때
			}else if(dest.length==1){
				$trLine.eq(i).find(".depPro").html($trLine.eq(dest[0]).find(".originalPro").html());
				$trLine.eq(i).find(".depAns").html($trLine.eq(dest[0]).find(".originalAns").html());
				$trLine.eq(i).find(".destination").text(dest[0]+1);
			}else{
				var temp_des = new String();
				for(var k=0 ; k < dest.length ; k++){
					temp_des = temp_des + (dest[k]+1) + "<br>";
				}
				$trLine.eq(i).find(".destination").html(temp_des);
			}
		}
		
	});

	$("td").hover(function() {
		$(this).css('background-color', '#ebedf2');
	}, function() {
		$(this).css('background-color', 'white');
	});
	
	//   Modal
	$(document).ready(function() {
		$(".layerModal").click(function() {
			fn_selectContentsPop($(this));
		});
	});

	var fn_selectContentsPop = function(td) {
		var business_no = "${resultMap.business_no}";
		var no = td.find(".colNum");
		var url="<c:url value='/logicfocus/read/detail'/>";
		var values = [td.find(".original_no").val(), 
					 td.find(".source_no").val(),
					 td.find(".summary").val(),
					 td.find(".contents").val(),
					 td.find(".category").val(),
					 business_no];  
		
		common.layerPopup(url,values,"#myModal");
	};
</script>
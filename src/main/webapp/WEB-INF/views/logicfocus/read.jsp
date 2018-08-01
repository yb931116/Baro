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
		<div class="row mb-2">
			<h4>${resultMap.business_name}</h4>
			<div class="pull-right">
			 <label for="upDown" >이 항목을 평가해주세요.</label>
                     <div id="upDown">
                     <div class="input-group">
                     <input id = "comment" class = "form-control" type="text">
                     <div class="input-group-append">
                        <span class="input-group-text">
                           <button class="eval btn btn-primary btn-sm mr-1 up">
                           <i style="font-size: 20" class="la la-thumbs-up"></i>
                           </button>
                           <button class="eval btn btn-primary btn-sm down">
                           <i style="font-size: 20" class="la la-thumbs-down"></i>
                           </button>
                        </span>
                        </div>
                     </div>
                    </div>
                   </div>
                  </div>
			
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
							<td class=" layerModal able originalPro"></td>
							<td class=" layerModal disable"></td>
							<th scope="row" class="colNum "></th>
							<td class=" layerModal disable"></td>
							<td class=" layerModal disable"></td>
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
		$("td").hover(function() {
			$(this).css('background-color', '#ebedf2');
		}, function() {
			$(this).css('background-color', 'white');
		});
		
		var $trLine = $(".line")

		for (var i = 0; i < $trLine.length; i++) {
			var count = 0;
			var dest = new Array();
			for (var j = 0; j < $trLine.length; j++) {
				if ($trLine.eq(j).find(".colPro").find(".source_no").val() == ""|| $trLine.eq(j).find(".colPro").find(".source_no").val() == null) {
					continue;
				}
				if ($trLine.eq(i).find(".colAns").find(".original_no").val() == $trLine.eq(j).find(".colPro").find(".source_no").val()) {
					dest.push(j);
					
				}
			}
			if (dest.length == 0) {
				// 부정적 파생문제점이 없을때
			} else if (dest.length == 1) {
				$trLine.eq(i).find(".depPro").html(
						$trLine.eq(dest[0]).find(".originalPro").html());
				$trLine.eq(i).find(".depAns").html(
						$trLine.eq(dest[0]).find(".originalAns").html());
				$trLine.eq(i).find(".destination").text(dest[0] + 1);
				$trLine.eq(dest[0]).find(".source").text(i + 1);
			} else {
				var temp_des = new String();
				for (var k = 0; k < dest.length; k++) {
					$trLine.eq(dest[k]).find(".source").text(k + 1);
					temp_des = temp_des + (dest[k] + 1) + "<br>";
				}
				$trLine.eq(i).find(".destination").html(temp_des);
			}
		}
		
		$(".layerModal").click(function() {
			fn_selectContentsPop($(this));
		});
		 
	 	var td = $("td");
 		for(var i=0 ; i<td.length; i++){
			if (td.eq(i).find(".original_no").val() == "" || td.eq(i).find(".original_no").val() == null) {
				if(td.eq(i).hasClass("originalAns") || td.eq(i).hasClass("depAns")){
					if(td.eq(i).prev().find(".original_no").val()=="" || td.eq(i).prev().find(".original_no").val()==null ){
						td.eq(i).off(); 
					}
				}else if (td.eq(i).hasClass("depPro")){
					if(td.eq(i).prev().prev().find(".original_no").val()=="" || td.eq(i).prev().prev().find(".original_no").val()==null){
						td.eq(i).off();		
					}
				}
			
			}
			if(td.eq(i).hasClass("disable")){
				td.eq(i).off();
			}
			if (td.eq(i).hasClass("able")) {
				continue;
			}

		}
		console.log("${resultMap.business_no}");
		console.log("${business_no}");
	});

	//   Modal

	var fn_selectContentsPop = function(td) {
		var business_no = "${resultMap.business_no}";
		var url = "<c:url value='/logicfocus/read/detail'/>";
		var values={};
		var source_values={};

		values = [td.find(".original_no").val(),
			  td.find(".source_no").val(),
			  td.find(".summary").val(),
			  td.find(".contents").val(),
			  td.find(".category").val(), 
			  business_no ];
		
		if(td.hasClass("originalPro")){
			
			for(var i = 0 ; i < $("td").length ; i++){
				if($("td").eq(i).find(".original_no").val()==td.find(".source_no").val()){
					source_values = [ $("td").eq(i).find(".original_no").val(),
						$("td").eq(i).find(".source_no").val(),
						$("td").eq(i).find(".summary").val(),
						$("td").eq(i).find(".contents").val(),
						$("td").eq(i).find(".category").val(), 
						  business_no ];
					values[1]=$("td").eq(i).find(".original_no").val();
				}
			}
			
			console.log("originalPro");
			values[4] = "problem";
		}else if(td.hasClass("originalAns") || td.hasClass("depAns")){

			source_values = [ td.prev().find(".original_no").val(),
				  td.prev().find(".source_no").val(),
				  td.prev().find(".summary").val(),
				  td.prev().find(".contents").val(),
				  td.prev().find(".category").val(), 
				  business_no ]; 
			
			values[1] = td.prev().find(".original_no").val();
			values[4] = "answer";
			console.log("Ans");
			
		}else if(td.hasClass("depPro")){
			source_values = [ td.prev().prev().find(".original_no").val(),
							  td.prev().prev().find(".source_no").val(),
							  td.prev().prev().find(".summary").val(),
							  td.prev().prev().find(".contents").val(),
							  td.prev().prev().find(".category").val(), 
							  business_no ]; 

			values[1] = td.prev().prev().find(".original_no").val();
			values[4] = "problem";
			console.log("depPro"); 
		}
		console.log(source_values,values);
		common.layerPopup(url, source_values ,values, "#myModal");
		
	};
</script>
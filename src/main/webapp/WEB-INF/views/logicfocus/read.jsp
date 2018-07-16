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
							<th scope="row" class="colNum">${loop.index+1}</th>
							<td class="colPro layerModal">
								${resultMap.ProList[loop.index].summary}
							</td>
							<td class="colAns layerModal">${resultMap.AnsList[loop.index].summary}</td>
							<th scope="row" class="colNum"></th>
							<td class="colPro layerModal"></td>
							<td class="colAns layerModal"></td>
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
			$(this).css('background-color', '#ebedf2')
		}, function() {
			$(this).css('background-color', 'white')
		});
		
		
	});

	//   Modal
	$(document).ready(function() {
		$(".layerModal").click(function() {
			fn_selectContentsPop($(this));
		});
	});

	var fn_selectContentsPop = function(td) {
		var tr = td.parent();
		var no = tr.find(".colNum");
		var url;

		if (td.text() != "") {
			url = "<c:url value='/logicfocus/read/detail?ORIGINAL_NO="
					+ no.text() + "'/>";
		} else if (td.hasClass("colPro")) {
			url = "<c:url value='/logicfocus/insert/problem?ORIGINAL_NO="
					+ no.text() + "' />";
		} else if (td.hasClass("colAns")) {
			url = "<c:url value='/logicfocus/insert/answer?ORIGINAL_NO="
					+ no.text() + "' />";
		}
		common.layerPopup(url, "#myModal");
	};
</script>
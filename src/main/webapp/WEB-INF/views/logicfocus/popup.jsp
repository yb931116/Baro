<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="row" id="modal">
		<div class="col-md-12" id="detail">
			<div class="card">
				<div class="card-header">
					<div class="card-title">상세</div>
				</div>
				<div class="card-body">

					<div class="form-group">

			<!--1. Original_no    2. Source_no  3. summary 4. contents  -->
			
						<div class="form-group">
							<label for="comment">Summary</label>
							<textarea class="form-control" disabled="disabled"
								id="detailsummary" rows="4">${resultMap.summary}</textarea>
						</div>
						<div class="form-group">
							<label for="comment">Detail</label>
							<textarea class="form-control" disabled="disabled"
								id="detailcomment" rows="6">${resultMap.contents}</textarea>
						</div>

						<div class="form-group">
							<label for="FormControlFile">증빙 사진파일</label> <input type="text"
								class="form-control-file" id="FormControlFile"
								disabled="disabled">
						</div>
					</div>
					
					<div class="card-action row py-3">
						<div class="col-6 d-flex align-items-center h100">
						<div id="popupLeftButtons">
						<button class="btn btn-success mr-2" data-dismiss="modal"
							aria-hidden="true">확인</button>
						<button id="insertbutton" class="btn btn-default ml-6">추가</button>
						</div>
						</div>
						<div class=" col-6">
							<label class="pull-right">이 항목을 평가해주세요.</label>
							<div id="upDown" class="pull-right">
								<button class="btn btn-primary btn-sm">
								<i style="font-size: 22" class="la la-thumbs-up"></i>
								</button>
								<button class="btn btn-primary btn-sm">
								<i style="font-size: 22" class="la la-thumbs-down"></i>
								</button>
								</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>

<div class='col-md-6' style="display:none" id='insert' >
	<div class='card'>
		<div class='card-header'>
			<div class='card-title'>제기</div>
		</div>
		<div class='card-body'>
		<form action="<c:url value='/logicfocus/insert'/>">
			<div class='form-group'>
				<div class='form-group'>
					<label for='comment'>표에 표시 할 내용을 간단히 작성하세요.</label>
					<input class='form-control row-4' id='comment'>
				</div>
				<div class='form-group'>
					<label for='comment'>상세 설명을 입력하세요.</label>
					<input class='form-control row-6' id='comment'>
				</div>
				<div class='form-group'>
					<label for='FormControlFile'>증빙 사진파일</label> 
					<input type='file' class='form-control-file' id='FormControlFile'>
				</div>
			</div>
			<div class='card-action'>
				<button type="submit" class='btn btn-success mr-3'>확인</button>
				<button type="button" class='btn btn-danger' data-dismiss='modal'
					aria-hidden='true'>취소</button>
			</div>
			</form>
		</div>
	</div>
</div>
	</div>
</body>





<script>
	$(function() {
		$("#insertbutton").click(function() {
			$(".modal-dialog").css("max-width", "1000px");
			var html = $("#modal").html();
			$("#detail").removeClass("col-md-12");
			$("#detail").addClass("col-md-6");
			$("#insert").css("display","block");
			$("#popupLeftButtons").html("");
		});
	
	});
</script>

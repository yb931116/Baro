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

						<div class="form-group">
							<label for="comment">Summary</label>
							<textarea class="form-control" disabled="disabled"
								id="detailsummary" rows="2"></textarea>
						</div>
						<div class="form-group">
							<label for="comment">Detail</label>
							<textarea class="form-control" disabled="disabled"
								id="detailcomment" rows="5"></textarea>
						</div>

						<div class="form-group">
							<label for="FormControlFile">증빙 사진파일</label> <input type="text"
								class="form-control-file" id="FormControlFile"
								disabled="disabled">
						</div>

					</div>
					<div class="card-action">
						<button class="btn btn-success mr-3" data-dismiss="modal"
							aria-hidden="true">확인</button>
						<button id="insertbutton" class="btn btn-default ml-8">추가</button>
						
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
			<div class='form-group'>
				<div class='form-group'>
					<label for='comment'>표에 표시 할 내용을 간단히 작성하세요.</label>
					<textarea class='form-control' id='comment' rows='2'></textarea>
				</div>
				<div class='form-group'>
					<label for='comment'>상세 설명을 입력하세요.</label>
					<textarea class='form-control' id='comment' rows='5'></textarea>
				</div>
				<div class='form-group'>
					<label for='FormControlFile'>증빙 사진파일</label> <input type='file'
						class='form-control-file' id='FormControlFile'>
				</div>
			</div>
			<div class='card-action'>
				<button class='btn btn-success mr-3'>확인</button>
				<button class='btn btn-danger' data-dismiss='modal'
					aria-hidden='true'>취소</button>
			</div>
		</div>
	</div>
</div>
	</div>
</body>



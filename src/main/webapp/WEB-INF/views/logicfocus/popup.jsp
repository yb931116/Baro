<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
   <div class="row" id="modal">
   
      <div class="col-md-4" id="readPrevious" style="display: none;">
         <div class="card">
            <div class="card-header">
               <div class="card-title">이전 항목 상세</div>
            </div>
            <div class="card-body">

               <div class="form-group">

                  <div class="form-group">
                     <label for="source_detailsummary">요약</label>
                     <textarea class="form-control" disabled="disabled"
                        id="source_detailsummary" rows="4">${resultMap.source_summary}</textarea>
                  </div>
                  <div class="form-group">
                     <label for="source_detailcomment">상세 설명</label>
                     <textarea class="form-control" disabled="disabled"
                        id="source_detailcomment" rows="6">${resultMap.source_contents}</textarea>
                  </div>

                  <div class="form-group">
                     <label for="FormControlFile">증빙 사진파일</label> <input type="text"
                        class="form-control-file" id="FormControlFile"
                        disabled="disabled">
                  </div>
               </div>
                  </div>
                  </div>
               </div>
            
   
      <div class="col-md-12" id="detail" style="display: none;">
         <div class="card">
            <div class="card-header">
               <div class="card-title">현재 항목 상세</div>
            </div>
            <div class="card-body">

               <div class="form-group">

         <!--1. original_no    2. Source_no  3. summary 4. contents  -->
         
                  <div class="form-group">
                     <label for="detailsummary">요약</label>
                     <textarea class="form-control" disabled="disabled"
                        id="detailsummary" rows="4">${resultMap.summary}</textarea>
                  </div>
                  <div class="form-group">
                     <label for="detailcomment">상세 설명</label>
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
                  <div class=" col-12">
               		<div class="progress">
					  <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
					</div>
                  </div>
               </div>
               
               
               <div class="card-action row py-3">
                  <div class=" col-12">
                     <label>이 항목을 평가해주세요.</label>
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
                  <div class="row">
                  <div class="col-6 mt-3">
                     <div id="readLeftButtons">
                        <button class="btn btn-success mr-1" data-dismiss="modal"
                           aria-hidden="true">확인</button>
                        <button id="insertButton" class="btn btn-default ml-1">추가</button>
                     </div>
                  </div>
                  <div class="col-6 mt-3">
                        <button id="detailReadPrevious" class="btn btn-default pull-right">이전 항목 보기</button>
                  </div>
                  </div>
               </div>
               
            </div>
         </div>
      </div>
      </div>

   

<div class='col-md-12' style="display:none" id='insert' >
   <div class='card'>
      <div class='card-header'>
         <div class='card-title'>문제 및 해결책 제기/제안</div>
      </div>
      <div class='card-body'>
      <form action="<c:url value='/logicfocus/logicInsert'/>" method="post">
         <div class='form-group'>
            <div class='form-group'>
               <label for='summary'>표에 표시 할 내용을 간단히 작성하세요.</label>
               <textarea class='form-control' rows="4" name='summary' id ='summary'></textarea>
            </div>
            <div class='form-group'>
               <label for='contents'>상세 설명을 입력하세요.</label>
               <textarea class='form-control' rows="6" id ='contents' name='contents'></textarea>
                <input type="hidden" value="${resultMap.business_no}"  name="business_no">
               <input type="hidden" value="${pageContext.request.userPrincipal.name}"  name="id">
               <input type="hidden" value='${resultMap.category}' name="category">
               <input type="hidden" value="${resultMap.original_no}"  name="original_no">
               <input type="hidden" value="${resultMap.source_original_no}"  name="source_no">
            </div>
            <div class='form-group'>
               <label for='FormControlFile'>증빙 사진파일</label> 
               <input type='file' class='form-control-file' id='FormControlFile'>
            </div>
         </div>
         <div class='card-action'>
            <button id="submit" class='btn btn-success'>확인</button>
            <button type="button" class='btn btn-danger' data-dismiss='modal'
               aria-hidden='true'>취소</button>
               <button id="insertReadPrevious" type="button" class="btn btn-default ml-6 pull-right">이전 항목 보기</button>
         </div>
         </form>
      </div>
      </div>
      </div>
   </div>

</body>




<script>
	var original_no = "<c:out value="${resultMap.original_no}" />";
	var source_original_no = "<c:out value="${resultMap.source_original_no}" />";

	var category = "<c:out value="${resultMap.category}" />";

	var clickCount = 0;

	$(function() {
		console.log("${resultMap.sum}");
		console.log("${resultMap.sumOfAccept}");
		refreshEval("${resultMap.sum}","${resultMap.sumOfAccept}");
	
		if (source_original_no == "") {
			$("#insertReadPrevious").css("display", "none");
			$("#detailReadPrevious").css("display", "none");
		}

		if (original_no != "") {
			$("#detail").css("display", "block");
		} else {
			$("#insert").css("display", "block");
		}

		$("#insertButton").click(function() {
			var html = $("#modal").html();
			$("#detail").removeClass("col-md-12");
			$("#detail").addClass("col-md-4");

			$("#insert").css("display", "block");
			$("#insert").removeClass("col-md-12");
			$("#insert").addClass("col-md-4");
			$("#readLeftButtons").css("display", "none");

			resoultionSetting();
		});

		$("#insertReadPrevious").click(function() {
			var html = $("#modal").html();
			$("#insert").removeClass("col-md-12");
			$("#insert").addClass("col-md-4");

			$("#readPrevious").css("display", "block");
			$("#readLeftButtons").css("display", "none");
			$("#insertReadPrevious").css("display", "none");

			resoultionSetting();
		});

		$("#detailReadPrevious").click(function() {
			var html = $("#modal").html();
			$("#detail").removeClass("col-md-12");
			$("#detail").addClass("col-md-4");

			$("#readPrevious").css("display", "block");
			$("#insertReadPrevious").css("display", "none");
			$("#detailReadPrevious").css("display", "none");

			resoultionSetting();
		});

		document.getElementById("submit").addEventListener('keydown',
				function(event) {
					if (event.keyCode === 13) {
						event.preventDefault();
					}
				}, true);

		$(".eval").click(function() {

			var $btn = $(this);
			var flag;
			var comment = $("#comment").val();
			if ($btn.hasClass("up")) {
				flag = "Accept";
			} else if ($btn.hasClass("down")) {
				flag = "Denial";

			}
			console.log(original_no);
			console.log(comment);
			console.log(flag);
			console.log($btn);
			if (confirm("평가는 수정이 불가합니다. 평가를 완료하시겠습니까 ?")) {

				$.ajax({
					type : "POST",
					url : url = "<c:url value='/ws/setEvaluation'/>",
					data : {
						"original_no" : original_no,
						"COMMENT" : comment,
						"SCORE" : flag
					},
					dataType : "json",
					cache : false,
					success : function(data) {
						console.log(data);
						refreshEval(data.sum,data.sumOfAccept);

					},
					error : function(xhr, status, exception) {

					}
				});

			}
			;
		});

	});

	function resoultionSetting() {
		clickCount++;
		if (clickCount == 1) {
			$(".modal-dialog").css("max-width", "1200px");
			$("#detail").removeClass("col-md-12");
			$("#insert").removeClass("col-md-12");
			$("#readPrevious").removeClass("col-md-12");

			$("#detail").addClass("col-md-6");
			$("#insert").addClass("col-md-6");
			$("#readPrevious").addClass("col-md-6");
		} else if (clickCount == 2) {
			$(".modal-dialog").css("max-width", "1200px");
			$("#detail").removeClass("col-md-6");
			$("#insert").removeClass("col-md-6");
			$("#readPrevious").removeClass("col-md-6");

			$("#detail").addClass("col-md-4");
			$("#insert").addClass("col-md-4");
			$("#readPrevious").addClass("col-md-4");
		}
	}

	function refreshEval(sum,sumOfAccept) {
		if(sum=="" || sum == null || sum==0)
			sum=1;
		if(sumOfAccept=="" || sumOfAccept == null)
			sumOfAccept=0;	
		
		
		var AcceptPerSum = Math.round(sumOfAccept / sum *100);
		$(".progress-bar").css("width", AcceptPerSum + "%");
		$(".progress-bar").attr("aria-valuenow", AcceptPerSum);
		$(".progress-bar").text(AcceptPerSum+"%");
	}
</script>
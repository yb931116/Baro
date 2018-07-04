<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<body>

	<div class="main-panel" style="background-color: white;">
		<div class="content">
			<div class="container-fluid">
			

		<!-- 조건을 선택하면 Ajax가 동작하여 조건 별 테이블이 표시됨 -->
			<label for="squareSelect">통계 조건을 선택하세요.</label>
				<select name="statistics_condition" onchange="statistics_function()"
				class="form-control input-square mb-3" id="squareSelect" style="width: 300px;">
					<option>선택하세요</option>
					<option value="whole">전체</option>
					<option value="individual">개인</option>
					<option value="project">프로젝트</option>
				</select>
				
				<div id="statistics_content">
				<!-- 조건을 선택하면 이곳에 테이블이 표시됨 -->
				</div>
				
				
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

/*========= 조건 별 Ajax ===========*/
var fn_statistics = function(params) {
	
		var condition= $("#squareSelect").val();
		
		
     $.ajax({
              type : "POST",
              url : null,
              data : params, 
              dataType: "text",
              cache : false,
              success : function(data) {
            	  var tableTag="";
            	  
					/* $.each(data , function(i, item) {
						tableTag+="<label class='.checkbox-inline' >";
						tableTag+="<input type='checkbox' name='AUTHORITY_ID' value='" +item.AUTHORITY_ID+"'>"+item.NAME;
						tableTag+="&nbsp&nbsp&nbsp&nbsp&nbsp</label>";
					}); */
					
					if(condition=="whole"){
						tableTag="<table class='table mt-4 table-hover'>"+
					"<thead>"+
						"<tr>"+
							"<th scope='col'>아이디</th>"+
							"<th scope='col'>성명</th>"+
							"<th scope='col'>제기한 문제</th>"+
							"<th scope='col'>제안한 해결책</th>"+
							"<th scope='col'>참여한 프로젝트</th>"+
						"</tr>"+
					"</thead>"+
					
					"<tbody><tr><td>yb931116</td><td>유병욱</td><td>21</td><td>32</td><td>8</td></tr>"+
					"<tr><td>rudxor456</td><td>오경택</td><td>4</td><td>11</td><td>3</td></tr><tr>"+
					"<td>gmlrjs95020</td><td>김희건</td><td>34</td><td>8</td><td>9</td></tr>"+
					"</tbody></table>";
					}else if(condition=="individual"){
						tableTag="<form><input type='text' placehold='아이디 검색'></form>";
					}else if(condition=="project"){
						tableTag="<label>프로젝트명: 창의적 공헌실적의 DB화</label>"+
						"<table class='table mt-4 table-hover'>"+
					"<thead>"+
						"<tr>"+
							"<th scope='col'>아이디</th>"+
							"<th scope='col'>성명</th>"+
							"<th scope='col'>제기한 문제</th>"+
							"<th scope='col'>제안한 해결책</th>"+
							"<th scope='col'>참여한 프로젝트</th>"+
						"</tr>"+
					"</thead>"+
					
					"<tbody><tr><td>yb931116</td><td>유병욱</td><td>21</td><td>32</td><td>8</td></tr>"+
					"<tr><td>rudxor456</td><td>오경택</td><td>4</td><td>11</td><td>3</td></tr><tr>"+
					"<td>gmlrjs95020</td><td>김희건</td><td>34</td><td>8</td><td>9</td></tr>"+
					"</tbody></table>";
					}
					
					
				  $('#statistics_content').html(tableTag);
				
              },
              error : function(xhr,status, exception) {
                 alert("Failure \n ("+ status + ")");
                 return false;
              }
           });
  }


  function statistics_function() {
     fn_statistics();
  }
	/*========= END OF Ajax  ===========*/
	
</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<body>
	<div class="main-panel" style="background-color: white;"> 
		<div class="content">
			<div class="container-fluid">
			 <h4 class="page-title">통계</h4>
				<div class="row">
					<div class="col-md-12">
					<div class="card">
						<div class="card-body">	
		<!-- 조건을 선택하면 Ajax가 동작하여 조건 별 테이블이 표시됨 -->
			<label for="squareSelect">통계표시 조건을 선택하세요.</label>
				<select name="statistics_condition" onchange="fn_statistics()"
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
				</div>
			</div>
		</div>
	</div>
</body>


<script type="text/javascript">

var searchResult = new Array();

function fn_searchButton(){
	
	searchResult = new Array();
  	var size = "${fn:length(resultList)}"; 
 	var List_ID = new Array();
 	var List_NAME = new Array();
 	var List_PRO = new Array();
 	var List_ANS = new Array();
 	var List_PROJECT = new Array();
 	
 	<c:forEach items="${resultList}" var="item">
	 	List_ID.push("${item.ID}");
	 	List_NAME.push("${item.NAME}");
	 	List_PRO.push("${item.PRONUM}");
	 	List_ANS.push("${item.ANSNUM}");
	 	List_PROJECT.push("${item.PROJECTNUM}");
 	</c:forEach>
 	
  	for(var i = 0 ; i < size ; i++){
		if(List_ID[i].indexOf($("#searchid").val())>-1){
			searchResult.push(i);
		}  
	}  
  	console.log(searchResult);
  	var tableTag = "<thead>"
		+ "					<tr>"
		+ "						<th scope = 'col'>아이디</th>"
		+ "						<th scope = 'col'>성명 </th>"
		+ "						<th scope = 'col'>제기한 문제</th>"
		+ "						<th scope = 'col'>제안한 해결책</th>"
		+ "						<th scope = 'col'>참여한 프로젝트</th>"
		+ "					</tr>"
		+ "				</thead>"
		+ "				<tbody>";
		console.log(tableTag);
		
		for(var i=0; i<searchResult.length;i++){
			tableTag= tableTag 
			+ "						<tr>"
			+ "							<th scope = 'col'>"+List_ID[searchResult[i]]+"</th>"
			+ "							<th scope = 'col'>"+List_NAME[searchResult[i]]+"</th>"
			+ "							<th scope = 'col'>"+List_PRO[searchResult[i]]+"</th>"
			+ "							<th scope = 'col'>"+List_ANS[searchResult[i]]+"</th>"
			+ "							<th scope = 'col'>"+List_PROJECT[searchResult[i]]+"</th>"
			+ "						</tr>";
			console.log(List_ID[searchResult[i]]);
		}
		
			tableTag= tableTag + "	</tbody>";
	$("#individualTable").html(tableTag);
	
	console.log("what");
			
};

/*========= 조건 별 Ajax ===========*/
function fn_statistics(){
	
	var condition= $("#squareSelect").val();				
	var tableTag="";
	
	if (condition == "whole") {
			tableTag = "<table class='table mt-4 table-hover'>"
					+ "				<thead>"
					+ "					<tr>"
					+ "						<th scope = 'col'>아이디</th>"
					+ "						<th scope = 'col'>성명 </th>"
					+ "						<th scope = 'col'>제기한 문제</th>"
					+ "						<th scope = 'col'>제안한 해결책</th>"
					+ "						<th scope = 'col'>참여한 프로젝트</th>"
					+ "					</tr>"
					+ "				</thead>"
					+ "				<tbody>"
					+ "					<c:forEach items='${resultList}' var='resultData' varStatus='loop'>"
					+ "						<tr>"
					+ "							<th scope = 'col'>${resultData.ID}</th>"
					+ "							<th scope = 'col'>${resultData.NAME}</th>"
					+ "							<th scope = 'col'>${resultData.PRONUM}</th>"
					+ "							<th scope = 'col'>${resultData.ANSNUM}</th>"
					+ "							<th scope = 'col'>${resultData.PROJECTNUM}</th>"
					+ "						</tr>" + "					</c:forEach>" 
					+ "				</tbody>"
					+ "				</table>";
		} else if (condition == "individual") {
 
			tableTag ="<div class='input-group col-lg-5 pl-0'>"
					+ "<input id = 'searchid' type='text' placeholder='아이디 검색' class='form-control'  >"
					+ "<button id ='search' type='button' class='btn btn-primary btn-sm' onclick='fn_searchButton()'>검색</button>"
					+ "</div>"
					+ "<table id='individualTable' class='table mt-4 table-hover'>"
					+ "				</table>";

			$('#statistics_content').html(tableTag);

		} else if (condition == "project") {
			tableTag = "<label>프로젝트명: 창의적 공헌실적의 DB화</label>"
					+ "<table class='table mt-4 table-hover'>"
					+ "<thead>"
					+ "<tr>"
					+ "<th scope='col'>아이디</th>"
					+ "<th scope='col'>성명</th>"
					+ "<th scope='col'>제기한 문제</th>"
					+ "<th scope='col'>제안한 해결책</th>"
					+ "</tr>"
					+ "</thead>"
					+

					"<tbody><tr><td>yb931116</td><td>유병욱</td><td>5</td><td>13</td></tr>"
					+ "<tr><td>rudxor456</td><td>오경택</td><td>0</td><td>4</td></tr><tr>"
					+ "<td>gmlrjs95020</td><td>김희건</td><td>18</td><td>5</td></tr>"
					+ "</tbody></table>";
		}

		$('#statistics_content').html(tableTag);

	}

</script>


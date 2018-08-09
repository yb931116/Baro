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
										class="form-control input-square mb-3" id="squareSelect"
										style="width: 300px;">
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

function fn_searchByID(){
	
	searchResult = new Array();
  	var size = "${fn:length(resultMap.resultList)}"; 
 	var List_ID = new Array();
 	var List_NAME = new Array();
 	var List_PRO = new Array();
 	var List_ANS = new Array();
 	var List_PROJECT = new Array();
 	console.log(size);
 	<c:forEach items="${resultMap.resultList}" var="item">
	 	List_ID.push("${item.ID}");
	 	List_NAME.push("${item.NAME}");
	 	List_PRO.push("${item.PRONUM}");
	 	List_ANS.push("${item.ANSNUM}");
	 	List_PROJECT.push("${item.PROJECTNUM}");
 	</c:forEach>
 	console.log(size);
  	for(var i = 0 ; i < size ; i++){
	console.log(List_ID[i].indexOf($("#searchid").val()));
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
	
}


function fn_searchByProject(){
	var html = "<div class='input-group col-lg-5 pl-0'>"
				+ "<input id = 'searchProject' type='text' placeholder='프로젝트 검색' class='form-control'  >"
				+ "<button id ='searchbyProject' type='button' class='btn btn-primary btn-sm' onclick='fn_searchByProject()'>검색</button>"
				+ "</div> <br><br>";
	$.ajax({
		type : "POST",
		url : "<c:url value='/ws/searchProject'/>",
		data : {
			projectName:"%"+$("#searchProject").val()+"%"
		},
		dataType : "json",
		cache : false,
		success : function(data) {
			
			var ProjectName = "";
			for(var i = 0 ; i < data.dataList.length ; i++ ){
				if(ProjectName != data.dataList[i].project_name){
					if(i != 0){
						html = html 
							   + "</tbody>"
							   + "</table>";
					}
					html = html + "<span class ='h5'>"
								+ data.dataList[i].project_name
								+ "</span>"
								+ "<table class='table mt-4 table-hover'>"
								+ "<thead>"
								+ "<tr>"
								+ "<th scope='col'>아이디</th>"
								+ "<th scope='col'>성명</th>"
								+ "<th scope='col'>제기한 문제</th>"
								+ "<th scope='col'>제안한 해결책</th>"
								+ "</tr>"
								+ "</thead>"
								+ "<tbody>";
					ProjectName = data.dataList[i].project_name;
					console.log(ProjectName);
				}
				
				html = html + "<tr>"
							+ "<td>" + data.dataList[i].id + "<td>"
							+ "<td>" + data.dataList[i].name + "<td>"
							+ "<td>" + data.dataList[i].PRONUM + "<td>"
							+ "<td>" + data.dataList[i].ANSNUM + "<td>";
							
				
			}
			html = html 
			   + "</tbody>"
			   + "</table>"; 
			$('#statistics_content').html(html);
			
		},
		error : function(xhr, status, exception) {
			
		}
	});
	
}


/*========= 조건 별 Ajax ===========*/
function fn_statistics(){
	
	var condition= $("#squareSelect").val();				
	var tableTag="";
	
	if (condition == "whole") {
			tableTag = "<table class='table mt-4 table-hover'>"
					+ "				<thead>"
					+ "					<tr>"
					+ "						<th scope = 'col'>#</th>"
					+ "						<th scope = 'col'>아이디</th>"
					+ "						<th scope = 'col'>성명 </th>"
					+ "						<th scope = 'col'>제기한 문제</th>"
					+ "						<th scope = 'col'>제안한 해결책</th>"
					+ "						<th scope = 'col'>참여한 프로젝트</th>"
					+ "					</tr>"
					+ "				</thead>"
					+ "				<c:set var='page' value='${resultMap.pagination}' />"
					+ "				<tbody>"
					+ "					<c:forEach items='${resultMap.resultList}' var='resultData' varStatus='loop'>"
					+ "						<tr>"
					+ "							<th scope = 'col'>${page.pageBegin+loop.index}</th>"
					+ "							<th scope = 'col'>${resultData.ID}</th>"
					+ "							<th scope = 'col'>${resultData.NAME}</th>"
					+ "							<th scope = 'col'>${resultData.PRONUM}</th>"
					+ "							<th scope = 'col'>${resultData.ANSNUM}</th>"
					+ "							<th scope = 'col'>${resultData.PROJECTNUM}</th>"
					+ "						</tr>" + "					</c:forEach>" 
					+ "				</tbody>"
					+ "				</table>"
					
					
					+ "<ul class='pagination pg-primary justify-content-center' style = 'margin-bottom: 0px;'>"

					+ "			<c:if test = '${page.curPage==1}'>"
					+ "				<li class='page-item' style = 'display:none;'>"
										//<!-- 맨 처음 페이지로 가면 왼쪽 화살표 없어짐   -->
					+ "				</li>"
					+ "			</c:if>"
					+ "			<c:if test = '${page.curPage!=1}'>"
					+ "				<li class='page-item'>"
					+ "					<a class='page-link' href='<c:url value='/statistics/index?curPage=${page.prevPage}'/>' aria-label='Previous'>"
					+ "					<span aria-hidden='true'>«</span> <span	class='sr-only'>Previous</span></a>"
					+ "				</li>"
					+ "			</c:if>"
					
					+ " <c:forEach var='pageNum' begin='${page.blockStart}' end='${page.blockEnd}'>"
					+ " 	<c:if test='${pageNum==page.curPage }'>"
					+ "			<li class='page-item active'><a class='page-link'>${pageNum}</a></li>"	//<!-- 선택된 페이지 숫자 클릭 안됨 -->
					+ " 	</c:if>"
					+ " 	<c:if test='${pageNum!=page.curPage }'>"
					+ "			<li class='page-item'><a class='page-link' href='#' onclick = 'page_move(${pageNum})'>${pageNum}</a></li>"
					+ "		</c:if>"
					+ " </c:forEach>"
	
					+ "			<c:if test = '${page.curPage==page.totPage}'>"
					+ "				<li class='page-item' style = 'display:none;'>"
										//<!-- 맨 마지막 페이지로 가면 오른쪽 화살표 없어짐   -->
					+ "				</li>"
					+ "			</c:if>"
					+ "			<c:if test = '${page.curPage!=page.totPage}'>"
					+ "				<li class='page-item'>"
					+ "				<a class='page-link' href='<c:url value='/statistics/index?curPage=${page.nextPage}' />'aria-label='Next'>"
					+ "				<span aria-hidden='true'>»</span><span class='sr-only'>Next</span></a>"
					+ "				</li>"
					+ "			</c:if>"
					 
					+ " </ul>"
					+ " <p class = 'pull-right'>Showing ${page.pageBegin} to ${page.pageEnd} of ${page.totalCount} entries</p>"
					
					
					
					;
		} else if (condition == "individual") {
 
			tableTag ="<div class='input-group col-lg-5 pl-0'>"
					+ "<input id = 'searchid' type='text' placeholder='아이디 검색' class='form-control'  >"
					+ "<button id ='searchbyid' type='button' class='btn btn-primary btn-sm' onclick='fn_searchByID()'>검색</button>"
					+ "</div>"
					+ "<table id='individualTable' class='table mt-4 table-hover'>"
					+ "				</table>";

			$('#statistics_content').html(tableTag);

		} else if (condition == "project") {
			
			tableTag ="<div class='input-group col-lg-5 pl-0'>"
				+ "<input id = 'searchProject' type='text' placeholder='프로젝트 검색' class='form-control'  >"
				+ "<button id ='searchbyProject' type='button' class='btn btn-primary btn-sm' onclick='fn_searchByProject()'>검색</button>"
				+ "</div> <br><br>";
		}

	
	
		$('#statistics_content').html(tableTag);

	}

function page_move(curPage){
	var html = "";
	
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ws/move_page'/>",
		data : {
			"curPage":curPage
		},
		dataType : "json",
		cache : false,
		success : function(data) {

			console.log(data.pagination.curPage);
			console.log(data.pagination);
			console.log(curPage);

					html = html
					+ "<table class='table mt-4 table-hover'>"
					+ "				<thead>"
					+ "					<tr>"
					+ "						<th scope = 'col'>#</th>"
					+ "						<th scope = 'col'>아이디</th>"
					+ "						<th scope = 'col'>성명 </th>"
					+ "						<th scope = 'col'>제기한 문제</th>"
					+ "						<th scope = 'col'>제안한 해결책</th>"
					+ "						<th scope = 'col'>참여한 프로젝트</th>"
					+ "					</tr>"
					+ "				</thead>"

					+ "				<tbody>";
					for(var i = 0; i < data.resultList.length; i++){

							html = html
							+ "						<tr>"
							+ "							<th scope = 'col'>"+(data.pagination.pageBegin+i)+"</th>"
							+ "							<th scope = 'col'>"+data.resultList[i].ID+"</th>"
							+ "							<th scope = 'col'>"+data.resultList[i].NAME+"</th>"
							+ "							<th scope = 'col'>"+data.resultList[i].PRONUM+"</th>"
							+ "							<th scope = 'col'>"+data.resultList[i].ANSNUM+"</th>"
							+ "							<th scope = 'col'>"+data.resultList[i].PROJECTNUM+"</th>"
							+ "						</tr>"; 

						}
					html = html
					   + "</tbody>"
					   + "</table>"
					   + "<ul class='pagination pg-primary justify-content-center' style = 'margin-bottom: 0px;'>"
					  if(data.pagination.curPage == 1){
					   html = html
					    + "				<li class='page-item' style = 'display:none;'>"
											//<!-- 맨 처음 페이지로 가면 왼쪽 화살표 없어짐   -->
					    + "				</li>";
					  }else{
						html = html
						+ "				<li class='page-item'>"
						+ "					<a class='page-link' href='#' onclick = 'page_move("+data.pagination.prevPage+")' aria-label='Previous'>"
						+ "					<span aria-hidden='true'>«</span> <span	class='sr-only'>Previous</span></a>"
						+ "				</li>";
					  }
						
				for(var i = data.pagination.blockStart; i < data.pagination.blockEnd; i++){
					
					if(i == data.pagination.curPage){
					html = html
						+ "			<li class='page-item active'><a class='page-link'>"+i+"</a></li>";	//<!-- 선택된 페이지 숫자 클릭 안됨 -->
					
					}else{
					html = html
						+ "			<li class='page-item'><a class='page-link' href='#' onclick = 'page_move("+i+")'>"+i+"</a></li>";
					
					}
				}
				
				html = html
				if(data.pagination.curPage == data.pagination.totPage){
					html = html
				+ "				<li class='page-item' style = 'display:none;'>"
									//<!-- 맨 마지막 페이지로 가면 오른쪽 화살표 없어짐   -->
				+ "				</li>";
				}else{
					html = html
				+ "				<li class='page-item'>"
				+ "				<a class='page-link' href='#' onclick='page_move("+data.pagination.nextPage+")' aria-label='Next'>"
				+ "				<span aria-hidden='true'>»</span><span class='sr-only'>Next</span></a>"
				+ "				</li>";
				}
				html = html
				+ " </ul>"
				+ " <p class = 'pull-right'>Showing "+data.pagination.pageBegin+" to "+data.pagination.pageEnd+" of "+data.pagination.totalCount+" entries</p>"; 
			
			$('#statistics_content').html(html);
			
		}, 
		error : function(xhr, status, exception) {
			
		}
	});
	
}
</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">Insert</h4>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
								<form action="<c:url value='/logicfocus/insert'/>" method="POST">
									<div class="card-header">
											<div class="col-md-9">
												<p>해당 사업명
												<input type = "text" class = "form-control" 
												placeholder = "제목을 입력하세요" name = "business_name">
												</p>
											</div>
										<hr>
									
												<input type = "text" hidden="true" class = "form-control" 
												 name = "id" value="ddorai92">
									</div>

									<div class="card-body">
										<div class = "col-md-12">
											<p>내용</p>
												<textarea class = "form-control" rows = "10" name = "content" placeholder = "내용을 입력하세요."></textarea>
											
										</div>
									</div>
									<div class="card-footer">
										<div class = float-right>
											<div class = "col-md-1">
												<button type="submit" class = "btn btn-default">작성하기</button>
											</div>
										</div>
										
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
</div>
				
			


</body>

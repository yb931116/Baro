<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principalBean"/>
   </sec:authorize>
			<div class="sidebar">
				<div class="sidebar-wrapper">
					
					<ul class="nav">
						<li class="nav-item">
							<a href="<c:url value='/'/>"> 
								<i class="la la-search"></i>
								<p>Main</p>
							</a>
						</li>
						
						<li class="nav-item">
							<a href="<c:url value='/logicfocus/list'/>">
								<i class="la la-list-ul"></i>
								<p>프로젝트</p>
							</a>
						</li>

						
						<li class="nav-item">
							<a href="<c:url value='/signup/index'/>">
								<i class="la la-dashboard"></i>
								<p>회원가입</p>
							</a>
						</li>

				
						<li class="nav-item">
							<a href="<c:url value='/statistics/index'/>">
								<i class="la la-bar-chart"></i>
								<p>통계</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="<c:url value='/evaluation'/>">
								<i class="la la-check-square"></i>
								<p>평가</p>
							</a>
						</li>
						
						
						
						<li class = "nav-item"> 

							<a class="collapsed dropdown-toggle" data-toggle="collapse" data-target = "#collapseExample" href="#collapseExample" aria-expanded="false">

								<i class="la la-group"></i>
								<p>그룹</p>
							</a>
							<div class="clearfix"></div>

							<div class="in collapse" id="collapseExample" aria-expanded="true" style="">
								<ul class="nav" style = "margin-top: 0px">
									<li class="nav-item">
										<a href="<c:url value='/group/group_list'/>">
											<i class="la la-group"></i>
											<p>그룹</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<c:url value='/group/make_group'/>">
											<i class="la la-plus"></i>
											<p>그룹 만들기</p> 
										</a>
									</li>
									<li class="nav-item">
										<a href="<c:url value='/group/mygroup_list'/>">
											<i class="la la-list-ol"></i>
											<p>내가 만든 그룹</p> 
										</a>
									</li>
									
								</ul>
							</div>

					</li>
						
						
						
						<c:if test="${principalBean.authorities eq '[관리자]'}">
						
						<li class = "nav-item"> 

							<a class="collapsed dropdown-toggle" data-toggle="collapse" data-target = "#collapseExample2" href="#collapseExample" aria-expanded="false">

								<i class="la la-male"></i>
								<p>관리자</p>
							</a>
							<div class="clearfix"></div>

							<div class="in collapse" id="collapseExample2" aria-expanded="true" style="">
								<ul class="nav" style = "margin-top: 0px">
									<li class = "nav-item">
										<a href="<c:url value='/authority_setting/index'/>">

											<i class="la la-exchange"></i>
											<p>관리자 회원 권한 전환</p> 
										</a>
									</li>
									<li>
										<a href="<c:url value='/admin_group/list?ID=${pageContext.request.userPrincipal.name}'/>">
											<i class="la la-group"></i>
											<p>관리자 그룹 관리</p>
										</a>
									</li>
									
								</ul>
							</div>

					</li>
						</c:if>
						
						
						
					</ul>
				</div>
			</div>
			
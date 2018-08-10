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
						<li class="nav-item">	<!-- 메인 화면으로 돌아가는 기능 -->
							<a href="<c:url value='/'/>"> 
								<i class="la la-search"></i>
								<p>Main</p>
							</a>
						</li>
						
						<li class="nav-item">  <!-- 프로젝트 보기(핵심기능) -->
							<a href="<c:url value='/logicfocus/list'/>">
								<i class="la la-list-ul"></i>
								<p>프로젝트</p>
							</a>
						</li>

						
						<li class="nav-item">	<!--  회원가입 탭 -->
							<a href="<c:url value='/signup/index'/>">
								<i class="la la-dashboard"></i>
								<p>회원가입</p>
							</a>
						</li>

				
						<li class="nav-item">	<!-- 통계 확인 가능 탭 -->
							<a href="<c:url value='/statistics/index'/>">
								<i class="la la-bar-chart"></i>
								<p>통계</p>
							</a>
						</li>
						
						<li class = "nav-item"> <!--  그룹 탭 스크롤 바 -->

							<a class="collapsed dropdown-toggle" data-toggle="collapse" data-target = "#collapseExample" href="#collapseExample" aria-expanded="false">

								<i class="la la-group"></i>
								<p>그룹</p>
							</a>
							<div class="clearfix"></div>

							<div class="in collapse" id="collapseExample" aria-expanded="true" style="">
								<ul class="nav" style = "margin-top: 0px">
									<li class="nav-item">	<!--  그룹 리스트 확인 가능 탭 -->
										<a href="<c:url value='/group/group_list'/>">
											<i class="la la-group"></i>
											<p>그룹</p>
										</a>
									</li>
									<li class="nav-item">	<!--  그룹 만들기 탭 -->
										<a href="<c:url value='/group/make_group'/>">
											<i class="la la-plus"></i>
											<p>그룹 만들기</p> 
										</a>
									</li>
									<li class="nav-item"> <!--  내가 만든 그룹 리스트 확인 및 수정 탭 -->
										<a href="<c:url value='/group/mygroup_list'/>">
											<i class="la la-list-ol"></i>
											<p>내가 만든 그룹</p> 
										</a>
									</li>
									
								</ul>
							</div>

					</li>
						
						
						
						<c:if test="${principalBean.authorities eq '[관리자]'}">	<!--  관리자만 보이는 탭 -->
						
						<li class = "nav-item"> 

							<a class="collapsed dropdown-toggle" data-toggle="collapse" data-target = "#collapseExample2" href="#collapseExample" aria-expanded="false">

								<i class="la la-male"></i>	<!-- 관리자 탭 스크롤  -->
								<p>관리자</p>
							</a>
							<div class="clearfix"></div>

							<div class="in collapse" id="collapseExample2" aria-expanded="true" style="">
								<ul class="nav" style = "margin-top: 0px">
									<li class = "nav-item">
										<a href="<c:url value='/authority_setting/index'/>"> <!-- 관리자가 회원들의 권한을 설정할 수 있는 탭 -->

											<i class="la la-exchange"></i>
											<p>관리자 회원 권한 전환</p> 	
										</a>
									</li>
									<li>
										<a href="<c:url value='/admin_group/list'/>"> <!-- 관리자가 생성된 그룹 전체를 볼 수 있고 수정 및 삭제가 가능한 탭 -->
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
			
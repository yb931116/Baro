<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
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
								<p>List</p>
							</a>
						</li>

						
						<li class="nav-item">
							<a href="<c:url value='/signup/index'/>">
								<i class="la la-dashboard"></i>
								<p>Signup</p>
							</a>
						</li>

				
						<li class="nav-item">
							<a href="<c:url value='/statistics'/>">
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
						<li class="nav-item">
							<a href="<c:url value='/group/index'/>">
								<i class="la la-group"></i>
								<p>그룹</p>
							</a>
						</li>
						<li class="nav-item dropdown">
							<a class = "dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
								<i class="la la-male"></i>
								<p>관리자</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="<c:url value='/group/index'/>">
								<i class="la la-group"></i>
								<p>관리자 그룹 삭제</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="<c:url value='/authority_setting/index'/>">
								<i class="la la-group"></i>
								<p>관리자 회원 권한 전환</p>
							</a>
						</li>

					</ul>
				</div>
			</div>
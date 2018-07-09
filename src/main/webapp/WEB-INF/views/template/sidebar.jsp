<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
			<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					
					<ul class="nav">
						<li class="nav-item">
							<a href="<c:url value='/'/>">
								<i class="la la-dashboard"></i>
								<p>Main</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						
						<li class="nav-item">
							<a href="<c:url value='/logicfocus/list'/>">
								<i class="la la-dashboard"></i>
								<p>List</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>

						<li class="nav-item">
							<a href="<c:url value='/login/login'/>">
								<i class="la la-dashboard"></i>
								<p>Login</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="<c:url value='/signup/signup'/>">
								<i class="la la-dashboard"></i>
								<p>Signup</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>

				
						<li class="nav-item">
							<a href="<c:url value='/statistics'/>">
								<i class="la la-dashboard"></i>
								<p>통계</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="<c:url value='/evaluation'/>">
								<i class="la la-dashboard"></i>
								<p>평가</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>

					</ul>
				</div>
			</div>
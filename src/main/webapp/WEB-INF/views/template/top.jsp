<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principalBean"/>
<c:set var="principalName"
	value="${principalBean.name}" />
</sec:authorize>


<div class="main-header">
	<div class="logo-header">
		<a href="<c:url value='/'/>" class="logo"> Logic Focus </a>
		<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
			data-toggle="collapse" data-target="collapse" aria-controls="sidebar"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<button class="topbar-toggler more">
			<i class="la la-ellipsis-v"></i>
		</button>
	</div>
	<nav class="navbar navbar-header navbar-expand-lg">
		<div class="container-fluid">

			<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">

				<c:if test="${principalName ne null}">

					<li class="nav-item dropdown"><a
						class="dropdown-toggle profile-pic" data-toggle="dropdown"
						href="#" aria-expanded="false"> <span> ${principalName}
						</span>
					</a>
						<ul class="dropdown-menu dropdown-user">
							<li>
								<div class="user-box">

									<div class="u-text">
										<h4>${principalName}</h4>
									</div>
								</div>
							</li>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="<c:url value='/mypage'/>"><i
								class="ti-user"></i> My Page</a>
							<a class="dropdown-item" 
								href="<c:url value='/j_spring_security_logout'/>"><i
								class="fa fa-power-off"></i> Logout</a>

						</ul> <!-- /.dropdown-user --></li>

				</c:if>

				<c:if test="${principalName eq null}">

					<li class="nav-item"><a class="dropdown-toggle profile-pic"
						href="<c:url value='/login/index'/>" aria-expanded="false"><span>Login</span></a></li>
					<li class="nav-item"><a class="profile-pic"
						href="<c:url value='/signup/index'/>" aria-expanded="false"><span>Signup</span></a></li>
				</c:if>

			</ul>

		</div>
	</nav>
</div>
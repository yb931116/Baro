<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%-- <sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principalBean"/>
<c:set var="principalName"
	value="${principalBean.name}" />
</sec:authorize> --%>
<c:set var="principalName"
	value="${pageContext.request.userPrincipal.name}"/>

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
					<li class="nav-item dropdown hidden-caret"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="la la-envelope"></i>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>
					<li class="nav-item dropdown hidden-caret"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="la la-bell"></i> <span
							class="notification">3</span>
					</a>
						<ul class="dropdown-menu notif-box"
							aria-labelledby="navbarDropdown">

							<li>
								<div class="dropdown-title">You have 4 new notification</div>
							</li>
							<li>
								<div class="notif-center">
									<a href="#">
										<div class="notif-icon notif-primary">
											<i class="la la-user-plus"></i>
										</div>
										<div class="notif-content">
											<span class="block"> New user registered </span> <span
												class="time">5 minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-icon notif-success">
											<i class="la la-comment"></i>
										</div>
										<div class="notif-content">
											<span class="block"> Rahmad commented on Admin </span> <span
												class="time">12 minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-img">

											<img src="<c:url value='/resources/img/profile2.jpg'/>"
												alt="Img Profile">
										</div>
										<div class="notif-content">
											<span class="block"> Reza send messages to you </span> <span
												class="time">12 minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-icon notif-danger">
											<i class="la la-heart"></i>
										</div>
										<div class="notif-content">
											<span class="block"> Farrah liked Admin </span> <span
												class="time">17 minutes ago</span>
										</div>
									</a>
								</div>
							</li>
							<li><a class="see-all" href="javascript:void(0);"> <strong>See
										all notifications</strong> <i class="la la-angle-right"></i>
							</a></li>
						</ul></li>










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
<!-- 							<a class="dropdown-item" href="#"></i> My Balance</a> -->
<!-- 							<a class="dropdown-item" href="#"><i class="ti-email"></i> -->
<!-- 								Inbox</a> -->
<!-- 							<div class="dropdown-divider"></div> -->
<!-- 							<a class="dropdown-item" href="#"><i class="ti-settings"></i> -->
<!-- 								Account Setting</a> -->
<!-- 							<div class="dropdown-divider"></div> -->
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
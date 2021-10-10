<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-23
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="headroom">
 <!-- Main navbar -->
	<div class="navbar navbar-dark navbar-expand-md bg-indigo content-boxed">
		<div class="navbar-brand wmin-200">
			<a href="#" class="d-inline-block">
				<img src="${pageContext.request.contextPath}/resources/images/Logo.svg" alt="" style="height: 1.8rem;">
			</a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-mobile">
			<span class="badge bg-light shadow-1 text-indigo-700 ml-md-auto mr-md-3">Active</span>

			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a href="#"
							class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
								<i class="icon-paragraph-justify3"></i>
						</a></li>

					</ul>
				</li>

				<li class="nav-item dropdown dropdown-user">
					<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
						<img src="../../../../global_assets/images/placeholders/placeholder.jpg" class="rounded-circle mr-2" height="34" alt="">
						<span>
							 <sec:authorize access="isAuthenticated()">
								<sec:authentication
										property="principal.name" />님
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }">
							</sec:authorize>
					</span>
					</a>
					
					<div class="dropdown-menu dropdown-menu-right">
						<a href="#" class="dropdown-item"><i class="icon-switch2"></i> Logout</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->


	<!-- Page header -->
	<div class="page-header">
		<div class="breadcrumb-line breadcrumb-line-light content-boxed header-elements-md-inline">
			<div class="d-flex">
				<div class="breadcrumb">
					<a href="index.html" class="breadcrumb-item"><i class="icon-home2 mr-2"></i> Home</a>
					<span class="breadcrumb-item active">Dashboard</span>
				</div>

				<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
			</div>

			<div class="header-elements d-none">
				<div class="breadcrumb justify-content-center">
					<a href="#" class="breadcrumb-elements-item">
						<i class="icon-comment-discussion mr-2"></i>
						Support
					</a>

					<div class="breadcrumb-elements-item dropdown p-0">
						<a href="#" class="breadcrumb-elements-item dropdown-toggle" data-toggle="dropdown">
							<i class="icon-gear mr-2"></i>
							Settings
						</a>

						<div class="dropdown-menu dropdown-menu-right">
							<a href="#" class="dropdown-item"><i class="icon-user-lock"></i> Account security</a>
							<a href="#" class="dropdown-item"><i class="icon-statistics"></i> Analytics</a>
							<a href="#" class="dropdown-item"><i class="icon-accessibility"></i> Accessibility</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item"><i class="icon-gear"></i> All settings</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="page-header-content header-elements-md-inline content-boxed">
			<div class="page-title d-flex">
				<h4><i class="icon-arrow-left52 mr-2"></i> <span class="font-weight-semibold">Home</span> - Dashboard</h4>
				<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
			</div>
		</div>
	</div>
	<!-- /page header -->
    
</div>

<div class=" navbar-expand-md">


</div>

<script>
    // Basic initialization
    var navbarTop = document.querySelector('.fixed-top');
    // Construct an instance of Headroom, passing the element
    var headroomTop  = new Headroom(document.querySelector('.navbar-slide-top'), {
        offset: navbarTop.offsetHeight,
        tolerance: {
            up: 10,
            down: 10
        },
        onUnpin : function() {
            $('.headroom').find('.show').removeClass('show');

        }
    });

    // Initialise
    headroomTop.init();
</script>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-23
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<!-- Page content -->
	<!-- Page content -->
	<div class="page-content content-boxed pt-0">

		<!-- Main sidebar -->
		<div class="sidebar sidebar-light sidebar-main sidebar-expand-md align-self-start">

			<!-- Sidebar mobile toggler -->
			<div class="sidebar-mobile-toggler text-center">
				<a href="#" class="sidebar-mobile-main-toggle">
					<i class="icon-arrow-left8"></i>
				</a>
				<span class="font-weight-semibold">Main sidebar</span>
				<a href="#" class="sidebar-mobile-expand">
					<i class="icon-screen-full"></i>
					<i class="icon-screen-normal"></i>
				</a>
			</div>
			<!-- /sidebar mobile toggler -->


			<!-- Sidebar content -->
			<div class="sidebar-content">

				<!-- User menu -->
				<div class="sidebar-user-material">
					<div class="sidebar-user-material-body card-img-top">
						<div class="card-body text-center">
							<a href="#">
								<img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-fluid rounded-circle shadow-2 mb-3" width="80" height="80" alt="">
							</a>
							<h6 class="mb-0 text-white text-shadow-dark">Victoria Baker</h6>
							<span class="font-size-sm text-white text-shadow-dark">Santa Ana, CA</span>
						</div>
													
						<div class="sidebar-user-material-footer">
							<a href="#user-nav" class="d-flex justify-content-between align-items-center text-shadow-dark dropdown-toggle" data-toggle="collapse"><span>My account</span></a>
						</div>
					</div>

					<div class="collapse" id="user-nav">
						<ul class="nav nav-sidebar">
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i class="icon-user-plus"></i>
									<span>My profile</span>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i class="icon-coins"></i>
									<span>My balance</span>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i class="icon-comment-discussion"></i>
									<span>Messages</span>
									<span class="badge bg-success-400 badge-pill align-self-center ml-auto">58</span>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i class="icon-cog5"></i>
									<span>Account settings</span>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i class="icon-switch2"></i>
									<span>Logout</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- /user menu -->


				<!-- Navigation -->
				<div class="card card-sidebar-mobile">
					<div class="card-header header-elements-inline">
						<h6 class="card-title">Navigation</h6>
						<div class="header-elements">
							<div class="list-icons">
								<a class="list-icons-item" data-action="collapse"></a>
							</div>
						</div>
					</div>

					<div class="card-body p-0">
						<ul class="nav nav-sidebar" data-nav-type="accordion">

							<!-- 어드민 -->
							<li class="nav-item-header pt-0 mt-0"><div class="text-uppercase font-size-xs line-height-xs">관리자꺼 c:if?</div> <i class="icon-menu" title="Main"></i></li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">
									<i class="icon-home4"></i>
									<span>
										Dashboard
										<span class="d-block font-weight-normal opacity-50">No active orders</span>
									</span>
								</a>
							</li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/maintenance/member" class="nav-link"><i class="icon-copy"></i><span>회원관리</span></a></li>
							
							<li class="nav-item nav-item-submenu">
								<a href="#" class="nav-link"><i class="icon-copy"></i> <span>업체관리</span></a>

								<ul class="nav nav-group-sub" data-submenu-title="Layouts">
									<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/maintenance/company" class="nav-link">업체등록관리</a></li>
									<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/maintenance/confirmCompany" class="nav-link">업체정보관리</a></li>
								</ul>
							</li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/maintenance/report" class="nav-link"><i class="icon-copy"></i><span>신고글관리</span></a></li>
							
							<!-- /main -->
							
							<!-- 업체 -->
							<li class="nav-item-header pt-0 mt-0"><div class="text-uppercase font-size-xs line-height-xs">업체꺼</div> <i class="icon-menu" title="Main"></i></li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/company/dashboard" class="nav-link">
									<i class="icon-home4"></i>
									<span>
										Dashboard
										<span class="d-block font-weight-normal opacity-50">No active orders</span>
									</span>
								</a>
							</li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/company/editInfo?seq=${cmpnSeq}" class="nav-link"><i class="icon-copy"></i><span>정보 수정</span></a></li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/company/rent?cmpnSeq=${cmpnSeq}" class="nav-link"><i class="icon-copy"></i><span>렌트내역관리</span></a></li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/company/car?seq=${cmpnSeq}" class="nav-link"><i class="icon-copy"></i><span>보유렌트카리스트</span></a></li>
							
							<!-- /main -->

						</ul>
					</div>
				</div>
				<!-- /navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
		<!-- /main sidebar -->
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
	<!-- Page content -->
	<div class="page-content container pt-0">

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
						<h6 class="mb-0 text-white text-dark">
							<sec:authorize access="isAuthenticated()">
								<a class="menu-button" href="#"><sec:authentication
										property="principal.name" />님</a>
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }">
							</sec:authorize>
						</h6>
					</div>
													
						
					</div>

				</div>
				<!-- /user menu -->


				<!-- Navigation -->
				<div class="card card-sidebar-mobile">
					<div class="card-header header-elements-inline">
						<h6 class="card-title">Menu</h6>
						<div class="header-elements">
							<div class="list-icons">
								<a class="list-icons-item" data-action="collapse"></a>
							</div>
						</div>
					</div>

					<div class="card-body p-0">
						<ul class="nav nav-sidebar" data-nav-type="accordion">
							<c:if test="${member.author eq 'ROLE_ADMIN'}">
							<!-- 어드민 -->
							<li class="nav-item-header pt-0 mt-0"><div class="text-uppercase font-size-xs line-height-xs"></div> <i class="icon-menu" title="Main"></i></li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">
									<i class="icon-home4"></i>
									<span>
										Dashboard
									</span>
								</a>
							</li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/maintenance/member" class="nav-link"><i class="icon-users"></i><span>회원관리</span></a></li>
							
							<li class="nav-item nav-item-submenu">
								<a href="#" class="nav-link"><i class="icon-car"></i> <span>업체관리</span></a>

								<ul class="nav nav-group-sub" data-submenu-title="Layouts">
									<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/maintenance/company" class="nav-link">업체등록관리</a></li>
									<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/maintenance/confirmCompany" class="nav-link">업체정보관리</a></li>
								</ul>
							</li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/maintenance/report" class="nav-link"><i class="icon-warning2"></i><span>신고글관리</span></a></li>
							</c:if>
							<!-- /main -->
							
							<!-- 업체 -->
							<c:if test="${member.author eq 'ROLE_COMPANY'}">
							<li class="nav-item-header pt-0 mt-0"><div class="text-uppercase font-size-xs line-height-xs"></div> <i class="icon-menu" title="Main"></i></li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/company/dashboard" class="nav-link">
									<i class="icon-home4"></i>
									<span>
										Dashboard
									</span>
								</a>
							</li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/company/editInfo?cmpnSeq=${cmpnSeq}" class="nav-link"><i class="icon-user-plus"></i><span>정보 수정</span></a></li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/company/car?cmpnSeq=${cmpnSeq}" class="nav-link"><i class="icon-car"></i><span>보유렌트카리스트</span></a></li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/company/rent?cmpnSeq=${cmpnSeq}" class="nav-link"><i class="icon-clipboard"></i><span>렌트내역관리</span></a></li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/company/estSubmit?cmpnSeq=${cmpnSeq}" class="nav-link"><i class="icon-clipboard"></i><span>프리미엄 견적 제출 리스트</span></a></li>
							
							</c:if>
							<!-- /main -->

						</ul>
					</div>
				</div>
				<!-- /navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
		<!-- /main sidebar -->
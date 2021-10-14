<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-23
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--<div id="preloader">--%>
<%--    <div id="status">--%>
<%--        <img src="${pageContext.request.contextPath}/resources/images/loader.gif" id="preloader_image" alt="loader">--%>
<%--    </div>--%>
<%--</div>--%>
<!-- hs Navigation Start -->
<!-- Main navbar -->
<div class="navbar navbar-expand-lg bg-white navbar-slide-top fixed-top">
	<div class="container">

		<div class="navbar-brand">
			<a href="${pageContext.request.contextPath}/" class="d-inline-block">
				<img src="${pageContext.request.contextPath}/resources/images/Logo.svg" alt="logo" class="h-auto" style="width:100px;">
			</a>
		</div>

		<div class="d-lg-none">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
				<i class="icon-tree5"></i>
			</button>
			<button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
				<i class="icon-paragraph-justify3"></i>
			</button>
		</div>

		<div class="collapse navbar-collapse" id="navbar-mobile">
			<ul class="h5 navbar-nav">
				<li class="nav-item"> <a class="navbar-nav-link d-none d-md-block text-dark" href="${pageContext.request.contextPath}/">홈</a></li>
				<li class="nav-item"> <a class="navbar-nav-link d-none d-md-block text-dark" href="${pageContext.request.contextPath}/commonRent">일반 렌트</a></li>
				<li class="nav-item"> <a class="navbar-nav-link d-none d-md-block text-dark" href="${pageContext.request.contextPath}/premiumRent/estimate">프리미엄 렌트</a></li>
				<li class="nav-item"> <a class="navbar-nav-link d-none d-md-block text-dark" href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
				<li class="nav-item dropdown">
					<a href="#" class="navbar-nav-link dropdown-toggle text-dark" data-toggle="dropdown">커뮤니티</a>
					<div class="dropdown-menu">
						<a href="${pageContext.request.contextPath}/community/notice" class="dropdown-item"> 공지사항</a>
						<a href="${pageContext.request.contextPath}/community/course" class="dropdown-item"> 여행코스</a>
						<a href="${pageContext.request.contextPath}/community/tour" class="dropdown-item"> 여행지</a>
						<a href="${pageContext.request.contextPath}/qna/list" class="dropdown-item"> 1:1 문의</a>
						<a href="${pageContext.request.contextPath}/faq/list" class="dropdown-item"> FAQ</a>
					</div>
				</li>
				<li class="nav-item"> <a class="navbar-nav-link d-none d-md-block text-dark" href="${pageContext.request.contextPath}/mypage/dashboard">마이페이지</a></li>
			</ul>
			<ul class="navbar-nav align-items-center ml-md-auto">
				<sec:authorize access="isAnonymous()">
					<li class="nav-item dropdown">
						<a href="${pageContext.request.contextPath}/login" class="m-0 h5 btn btn-primary shadow-1">로그인</a>
					</li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown dropdown-user">
						<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
							<img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="rounded-circle mr-2" height="34" alt="">
							<span><sec:authentication property="name"/></span>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="#" class="dropdown-item"><i class="icon-user-plus"></i> 마이페이지</a>
							<sec:authorize access="hasRole('COMPANY')">
								<a href="${pageContext.request.contextPath}/company/dashboard" class="dropdown-item"><i class="icon-gear"></i> 업체 관리</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMIN')">
								<a href="${pageContext.request.contextPath}/admin/dashboard" class="dropdown-item"><i class="icon-gear"></i> 사이트 관리</a>
							</sec:authorize>
							<a href="#" class="dropdown-item"><i class="icon-car"></i> 렌트 내역</a>
							<a href="#" class="dropdown-item"><i class="icon-newspaper2"></i> 견적 내역</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item"><i class="icon-gear"></i> 정보 수정</a>
							<a id="logOutBtn" href="#" class="dropdown-item"><i class="icon-switch2"></i> 로그아웃</a>
						</div>
					</li>
					<form action="${pageContext.request.contextPath}/logout" method="post" id="logoutFrm" name="logoutFrm">
						<sec:csrfInput/>
					</form>
				</sec:authorize>
			</ul>
		</div>
	</div>
</div>
<!-- /main navbar -->
<script>
    <c:if test="${resultMsg != null}">
        customAlert('<c:out value="${resultTitle}" default="알림" />' , "${resultMsg}");
    </c:if>
    <c:if test="${alertMsg != null}">
        customAlert('<c:out value="${alertTitle}" default="경고" />', '${alertMsg}');
    </c:if>
<%--    <c:if test="${deleteMsg != null}">--%>
<%--    customAlert("견적 삭제", "${deleteMsg}");--%>
<%--    </c:if>--%>

    $(function(){
		$('#logOutBtn').on("click",function(){
			logoutFrm.submit();
		});
	});
</script>

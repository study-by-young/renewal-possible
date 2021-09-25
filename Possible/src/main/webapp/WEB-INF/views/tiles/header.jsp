<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-23
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<div id="preloader">--%>
<%--    <div id="status">--%>
<%--        <img src="${pageContext.request.contextPath}/resources/images/loader.gif" id="preloader_image" alt="loader">--%>
<%--    </div>--%>
<%--</div>--%>
<!-- hs Navigation Start -->
<div class="fake-header-space d-none"></div>
<div class="hs_navigation_header_wrapper">
    <div class="container">
        <div class="row">
            <div class=" col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                <div class="hs_logo_wrapper d-none d-sm-none d-xs-none d-md-block text-center">
                    <a href="${pageContext.request.contextPath}/">
                        <img src="${pageContext.request.contextPath}/resources/images/Logo.svg" class="img-responsive" alt="logo" title="Logo" style="width: 80px;" />
                    </a>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 col-12">
                <div class="hs_navi_cart_wrapper  d-none d-sm-none d-xs-none d-md-block d-lg-block d-xl-block">
                    <div class="dropdown-wrapper menu-button menu_button_end">
                        <a class="menu-button" href="${pageContext.request.contextPath}/login">로그인</a>

                    </div>
                </div>
                <nav class="hs_main_menu d-none d-sm-none d-xs-none d-md-block float-left">
                    <ul>
                        <li> <a class="menu-button single_menu" href="${pageContext.request.contextPath}/">홈</a></li>
                        <li> <a class="menu-button single_menu" href="${pageContext.request.contextPath}/">일반 렌트</a></li>
                        <li> <a class="menu-button single_menu" href="${pageContext.request.contextPath}/">프리미엄 렌트</a></li>
                        <li> <a class="menu-button single_menu" href="${pageContext.request.contextPath}/">공지사항</a></li>
                        <li> <a class="menu-button single_menu" href="${pageContext.request.contextPath}/">커뮤니티</a></li>
                        <li> <a class="menu-button single_menu" href="${pageContext.request.contextPath}/">마이페이지</a></li>
                    </ul>
                </nav>
                <header class="mobail_menu d-none d-block d-xs-block d-sm-block d-md-none d-lg-none d-xl-none">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-6">
                                <div class="hs_logo">
                                    <a href="${pageContext.request.contextPath}/">
                                        <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="logo" title="Logo" style="width: 70px;" />
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-6">
                                <div class="cd-dropdown-wrapper">
                                    <a class="house_toggle" href="#0">
                                        <i class="icon-three-bars icon-2x" style="font-size: 2rem;"></i>
                                    </a>
                                    <!-- .cd-dropdown -->
                                </div>
                                <nav class="cd-dropdown bg-primary-400">
                                    <h2>
                                        <a href="${pageContext.request.contextPath}/">
                                            Shall We Trip?
                                        </a>
                                    </h2>
                                    <a href="#0" class="cd-close">Close</a>
                                    <ul class="cd-dropdown-content">
                                        <li> <a href="#">홈</a></li>
                                        <li> <a href="#">일반 렌트</a></li>
                                        <li> <a href="about.html">프리미엄 렌트</a></li>
                                        <li> <a href="team.html">공지사항</a></li>
                                        <li class="has-children"> <a href="services.html">커뮤니티</a>
                                            <ul class="cd-secondary-dropdown is-hidden">
                                                <li class="go-back"><a href="#0">Menu</a>
                                                </li>
                                                <li> <a href="blog_category.html">Blog Categories</a>
                                                </li>
                                                <!-- .has-children -->
                                                <li> <a href="blog_single.html">Blog Single</a>
                                                </li>
                                                <!-- .has-children -->
                                            </ul>
                                            <!-- .cd-secondary-dropdown -->
                                        </li>
                                        <li> <a href="#">마이페이지</a></li>
                                    </ul>
                                    <!-- .cd-dropdown-content -->
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- .cd-dropdown-wrapper -->
                </header>
            </div>
        </div>
    </div>
</div>

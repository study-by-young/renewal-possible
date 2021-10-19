<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
    .in {
        display: inline-block;
        color:#4f5dec;
        border: 1px solid;
    }
.nav-tabs-bottom .nav-link::after {
		position: absolute; content:""; 
		display: block; 
		border-bottom: 2px solid #1E88E5; 
		transition: width 350ms ease-in-out; 
		left: auto; width: auto;} 
.nav-tabs-bottom .nav-link:hover::after {width: 100%;  left: 0; } 
    
</style>


<!-- x blog main and sidebar Wrapper Start -->
<div class="x_blog_sidebar_main_wrapper float_left padding_tb_100">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="x_blog_left_side_wrapper float_left">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="lr_bc_first_box_main_wrapper">
                               <!-- 메뉴 -->
		                         <ul class="nav nav-tabs nav-tabs-bottom border-bottom-0 border-top-0 ">
									<li class="nav-item h5"><a href="${pageContext.request.contextPath}/mypage/dashboard"  class="nav-link">홈</a></li>
									<li class="nav-item h5"><a href="${pageContext.request.contextPath}/mypage/editProfile"  class="nav-link">회원정보수정</a></li>
									<li class="nav-item h5"><a href="${pageContext.request.contextPath}/mypage/estimate" data-toggle="nav_link" class="nav-link">견적관리</a></li>
									<li class="nav-item h5"><a href="${pageContext.request.contextPath}/mypage/rent" class="nav-link" >렌트관리</a></li>
									<li class="nav-item h5"><a href="${pageContext.request.contextPath}/mypage/community" class="nav-link" >커뮤니티관리</a></li>
									<li class="nav-item h5"><a href="${pageContext.request.contextPath}/mypage/qna" class="nav-link" >나의문의</a></li>
								 </ul>
								<div class="col-md-12">
                                    <div class="blog_single_comment_heading">
                                        <h4>프리미엄 견적 신청 상세정보</h4>
                                    </div>
                                </div>
								<div class="col-12">
									<c:set var="est" value="${estimate.get('estimate')}" />
									<c:set var="options" value="${estimate.get('options')}" />
									<c:set var="items" value="${estimate.get('items')}" />
               						<div class="row">
                    					<div class="col-md-12">
                       						<div class="x_car_detail_main_wrapper float_left">
                            					<div class="x_car_detail_slider_bottom_cont float_left">
                                			<div class="row">
                                    			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        			<div class="x_slider_form_main_wrapper x_slider_form_main_wrapper_ccb float_left pt-5">
                                            			<div class="lr_bc_slider_first_wrapper text-center">
                                                			<img src="${pageContext.request.contextPath}/resources/images/cars/KIA/k8.png" alt="fresh_food_img">
                                            			</div>
                                            			
                                            <div class="row">
                                                <div class="col-md-12 pb-4">
                                                    <div class="x_slider_form_input_wrapper float_left my-2">
                                                        <h2 class="text-center font-weight-bold">
                                                             ${est.brand } ${est.model}
                                                        	<p class="small text-muted pt-2">${est.trim}</p>
                                                        </h2>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-sec-header text-center">
                                                        <label class="h6">렌트 시작</label>
                                                        <p class="form-control w-75 mx-auto bg-primary text-white h-auto" style="border-radius: 5rem;"><fmt:formatDate value="${est.startDate}" type="both"/></p>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-sec-header text-center">
                                                        <label class="h6"></label>
                                                        <p><i class="icon-arrow-right8 icon-2x"></i></p>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-sec-header text-center">
                                                        <label class="h6">렌트 종료</label>
                                                        <p class="form-control w-75 mx-auto bg-primary text-white h-auto" style="border-radius: 5rem;"><fmt:formatDate value="${est.endDate}" type="both"/></p>
                                                    </div>
                                                </div>
                                                <div class="w-100 my-4"></div>
                                                <div class="col-md-6">
                                                    <div class="x_slider_form_input_wrapper">
                                                        <label class="h6">수령 희망 장소</label>
                                                        <p class="h-auto">${est.takePlaceCode} ${est.takePlaceBasic} ${est.takePlaceDetail}</p>
                                                    </div>
                                                    <div class="w-100 my-2"></div>
                                                    <div id="takePlaceMap" style="height:300px;"></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="x_slider_form_input_wrapper">
                                                        <label class="h6">차량 옵션</label>
                                                    </div>
                                                    <div class="x_car_offer_heading x_car_offer_heading_listing float_left x_car_offer_heading_inner_car_names x_car_offer_heading_inner_car_names2 mt-2">
                                                        <ul class="">
                                                            <c:forEach var="opt" items="${estimate.options}" begin="0" end="4">
                                                                <li>	<a href="#"><i class="fa fa-users"></i> &nbsp;${opt}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <li>
                                                                <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 더보기</span>
                                                                    <ul class="list" style="width:250px;">
                                                                        <c:forEach var="opt" items="${estimate.options}" begin="5">
                                                                            <li class="dpopy_li" style="width:100% !important;"><a href="#"><i class="fa fa-snowflake-o"></i> ${opt}</a>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="w-100 my-3 float_left"></div>
                                                    <div class="x_slider_form_input_wrapper">
                                                        <label class="h6">여행 용품</label>
                                                    </div>
                                                    <div class="x_car_offer_heading x_car_offer_heading_listing float_left x_car_offer_heading_inner_car_names x_car_offer_heading_inner_car_names2 mt-2">
                                                        <ul class="">
                                                            <c:forEach var="item" items="${estimate.items}" begin="0" end="4">
                                                                <li>	<a href="#"><i class="fa fa-users"></i> &nbsp;${item}</a>
                                                                </li>
                                                            </c:forEach>
                                                                <li>
                                                                    <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 더보기</span>
                                                                        <ul class="list" style="width:250px;">
                                                                            <c:forEach var="item" items="${items}" begin="5">
                                                                                <li class="dpopy_li" style="width:100% !important;"><a href="#"><i class="fa fa-snowflake-o"></i> ${item}</a>
                                                                                </li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <hr class="float_left">
                                                <div class="col-md-12 text-center">
                                                    <a href="${pageContext.request.contextPath}/mypage/estiamte/update?seq=${est.seq}" class="btn btn-primary btn-lg w-25">견적 수정</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 사이드바 -->
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="x_blog_right_side_wrapper float_left">
                    <div class="row">

                        <div class="col-md-12">
                            <div
                                    class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">

                                <div>
                                    <br>
                                    <br>
                                    <div align="center">
                                        <img style="border-radius: 50%;"
                                             src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                             alt="comment_img" class="img-responsive img-circle" />
                                    </div>
                                    <br>
                                    <div align="center">
                                        <h3>
                                            <sec:authorize access="isAuthenticated()">
                                                <a class="menu-button" href="#"><sec:authentication
                                                        property="principal.username" />님</a>
                                                <input type="hidden" name="${_csrf.parameterName }"
                                                       value="${_csrf.token }">
                                            </sec:authorize>

                                        </h3>
                                    </div>

                                </div>
                                <div class="jp_rightside_job_categories_content">
                                    <ul >
                                        <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                                href="#">예약완료 </a></li>
                                        <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                                href="#">쿠폰함 </a></li>
                                        <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                                href="#">포인트 </a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div
                                    class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">
                                <div>
                                    <br>
                                    <br>
                                    <div align="center">
                                        <h4>고객센터</h4>
                                        <br>
                                        <div>
                                            <img style="border-radius: 50%;"
                                                 src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                                 alt="comment_img" class="img-responsive img-circle" />
                                        </div>
                                        <br>
                                        <div align="center">
                                            <h3>1544-1544</h3>
                                        </div>
                                        <hr>
                                    </div>
                                </div>
                                <br>
                                <div align="center">
                                    <h4>카카오톡 1:1 상담</h4>
                                    <br>
                                    <div>
                                        <img style="border-radius: 50%;"
                                             src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                             alt="comment_img" class="img-responsive img-circle" />
                                    </div>
                                </div>

                                <br>
                                <div class="jp_rightside_career_main_content"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    <c:if test="${updateMsg != null}">
        alert("${updateMsg}");
    </c:if>

    $(function(){
        var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    });
</script>
<!-- x blog main and sidebar Wrapper End -->

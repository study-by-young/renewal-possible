<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-01
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="est" value="${estimate.get('estimate')}" />
<c:set var="options" value="${estimate.get('options')}" />
<c:set var="items" value="${estimate.get('items')}" />
<div class="btc_tittle_main_wrapper">
    <div class="btc_tittle_img_overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
                <div class="btc_tittle_left_heading">
                    <h1>렌트 견적 상세</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left  mt-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
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
                                                            ${est.brand} ${est.model}
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
                                                
                                                <!-- 까지 -->
                                                
                                                
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
                                                            <c:forEach var="opt" items="${options}" begin="0" end="4">
                                                                <li>	<a href="#"><i class="fa fa-users"></i> &nbsp;${opt}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <li>
                                                                <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 더보기</span>
                                                                    <ul class="list" style="width:250px;">
                                                                        <c:forEach var="opt" items="${options}" begin="5">
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
                                                            <c:forEach var="item" items="${items}" begin="0" end="4">
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
                                                    <a href="${pageContext.request.contextPath}/premiumRent/submit/insert?seq=${est.seq}" class="btn btn-primary btn-lg w-25">견적 작성</a>
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
            <div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
                <div class="x_car_book_left_siderbar_wrapper float_left">

                </div>
            </div>
        </div>
    </div>
</div>
<!-- x car book sidebar section Wrapper End -->
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

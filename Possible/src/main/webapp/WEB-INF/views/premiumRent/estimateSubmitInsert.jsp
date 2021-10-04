<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-28
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
    <div class="btc_tittle_img_overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
                <div class="btc_tittle_left_heading">
                    <h1>렌트 견적 작성</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- btc tittle Wrapper End -->
<div class="my-4"></div>
<div class="x_car_book_sider_main_Wrapper float_left">
    <div class="container">
        <form id="estimateForm" name="estimateForm" method="post">
            <input type="hidden" name="memSeq" id="memSeq" value="1">
            <div class="row">
                <div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
                    <div class="x_carbooking_right_section_wrapper float_left">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="x_car_checkout_right_main_box_wrapper float_left">
                                    <div class="car-filter order-billing margin-top-0">
                                        <div class="heading-block text-left margin-bottom-0">
                                            <h4>견적 작성</h4>
                                        </div>
                                        <hr>
                                        <ul class="list-unstyled row">
                                            <li class="col-md-12">
                                                <label class="w-100">렌트카
                                                    <select name="brand" id="brand" class="myselect select2-hidden-accessible select2-search--hide" onchange="searchModelByBrand()" required>
                                                        <option>렌트카를 선택하세요. 선택된 렌트카는 견적 제출 이후 예약불가 상태로 변경됩니다.</option>
                                                        <optgroup label="예약 가능 렌트카">
                                                            <c:forEach var="brand" items="${brands}">
                                                                <option value="${brand.code}">${brand.name}</option>
                                                            </c:forEach>
                                                        </optgroup>
                                                    </select>
                                                </label>
                                            </li>
                                            <li class="col-md-12 my-3">
                                                <label>차량 옵션</label>
                                                <hr class="my-2">
                                                <div class="x_slider_checkbox_bottom_filter_use">
                                                    <c:forEach var="option" items="${carOpt}" varStatus="status">
                                                        <label class="pr-3">
                                                            <input name="options" id="options" type="checkbox" value="${option.name}">
                                                                ${option.name}</label>
                                                    </c:forEach>
                                                </div>
                                            </li>
                                            <li class="col-md-12 my-3">
                                                <label>캠핑 옵션</label>
                                                <hr class="my-2">
                                                <div class="x_slider_checkbox_bottom_filter_use">
                                                    <c:forEach var="option" items="${carOpt}" varStatus="status">
                                                        <label class="pr-3">
                                                            <input name="items" id="items" type="checkbox" value="${option.name}">
                                                                ${option.name}</label>
                                                    </c:forEach>
                                                </div>

                                            </li>
                                            <li class="col-md-6 mb-3">
                                            </li>
                                            <li class="col-md-6 mb-3">
                                            </li>
                                            <li class="col-md-12">
                                                <label>렌트카 수령 장소</label>
                                                <hr class="my-2">
                                            </li>
                                            <li class="col-md-6 mb-3">
                                                <label for="takePlaceCode">우편번호</label>
                                                <input type="text" id="takePlaceCode" name="takePlaceCode" class="form-control" required>
                                            </li>
                                            <li class="col-md-6 mb-3 align-self-end">
                                                <button type="button" class="btn " onclick="daumPostcode($('#postalWrapper')[0],takePlaceCode,takePlaceBasic,takePlaceDetail)">주소 검색</button>
                                            </li>
                                            <li class="col-md-6 mb-3">
                                                <label for="takePlaceBasic">기본 주소</label>
                                                <input type="text" id="takePlaceBasic" name="takePlaceBasic" placeholder="기본 주소" class="form-control" required>
                                            </li>
                                            <li class="col-md-6 mb-3 ">
                                                <label for="takePlaceDetail">상세 주소</label>
                                                <input type="text" id="takePlaceDetail" name="takePlaceDetail" placeholder="상세 주소" class="form-control">
                                            </li>
                                            <li class="col-md-12 mb-3">
                                                <div id="postalWrapper" class="border"></div>
                                            </li>
                                            <li class="col-md-12 mb-3">
                                                <label for="memo">참고 사항</label>
                                                <textarea name="memo" id="memo" class="form-control"></textarea>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
                    <div class="x_car_book_left_siderbar_wrapper float_left">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <!-- Filter Results -->
                                <div class="car-filter accordion x_inner_car_acc_accor">
                                    <h3>견적 상세</h3>
                                    <hr>
                                    <!-- Resources -->
                                    <div class="x_car_access_filer_top_img">
                                        <img class="img-fluid" src="images/c2.png" alt="car_img">
                                        <h3></h3>
                                    </div>
                                    <hr>
                                    <!-- Company -->
                                    <!-- Attributes -->
                                    <div class="panel panel-default x_car_inner_acc_acordion_padding">
                                        <div class="panel-heading car_checkout_caret">
                                            <h5 class="panel-title"> <a href="#"> 렌트 시작 날짜</a> </h5>
                                        </div>
                                        <div class="collapse show">
                                            <div class="panel-body">
                                                <div class="x_car_acc_filter_date">
                                                    <ul>
                                                        <li>Tue 16 Jan 2018 @ 10:00</li>
                                                        <li>Barcelona, Airport</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
                                        <div class="panel-heading car_checkout_caret">
                                            <h5 class="panel-title"> <a href="#"> 렌트 종료 날짜</a> </h5>
                                        </div>
                                        <div class="collapse show">
                                            <div class="panel-body">
                                                <div class="x_car_acc_filter_date">
                                                    <ul>
                                                        <li>Tue 16 Jan 2018 @ 10:00</li>
                                                        <li>Barcelona, Airport</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
                                        <div class="panel-heading car_checkout_caret">
                                            <h5 class="panel-title"> <a href="#"> 렌트카 수령 장소</a> </h5>
                                        </div>
                                        <div class="collapse show">
                                            <div class="panel-body">
                                                <div class="x_car_acc_filter_date">
                                                    <ul>
                                                        <li>Tue 17 Jan 2018 @ 10:00</li>
                                                        <li>Barcelona, Airport</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="x_car_acc_filter_bottom_total">
                                        <div class="contect_btn contect_btn_contact">
                                            <button type="submit" class="btn btn-lg btn-primary w-100">작성 완료<i class="fa fa-arrow-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- x car book sidebar section Wrapper End -->
<script>
</script>

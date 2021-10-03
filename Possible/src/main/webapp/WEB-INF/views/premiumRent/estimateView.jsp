<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="x_car_detail_main_wrapper float_left">
                            <div class="lr_bc_slider_first_wrapper text-center">
                                <img src="${pageContext.request.contextPath}/resources/images/cars/KIA/k8.png" alt="fresh_food_img">
                            </div>
                            <div class="x_car_detail_slider_bottom_cont float_left">
                                <div class="x_car_detail_slider_bottom_cont_left">
                                    <h3>${est.brand} ${est.model} ${est.trim}</h3>
                                </div>
                                <div class="x_car_detail_slider_bottom_cont_center float_left">
                                    <p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, rem a quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Dssed odio sit amet nibh vulputate cursus a sit amt mauris. Morbi accumsan ipsum velit.
                                        <br>
                                        <br>This is Photoshop's version of Lorem Ipsum. Proin gravida n vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum tor. This is Photoshop's version of Lorem Ipsum.</p>
                                </div>
                                <div class="x_car_offer_heading x_car_offer_heading_listing float_left x_car_offer_heading_inner_car_names x_car_offer_heading_inner_car_names2">
                                    <ul class="">
                                        <li>	<a href="#"><i class="fa fa-users"></i> &nbsp;4 Seats</a>
                                        </li>
                                        <li>	<a href="#"><i class="fa fa-clone"></i> &nbsp;4 Doors</a>
                                        </li>
                                        <li>	<a href="#"><i class="fa fa-shield"></i> &nbsp;9 Manual</a>
                                        </li>

                                        <li>	<a href="#"><i class="fa fa-briefcase"></i> &nbsp;4 Bag Space</a>
                                        </li>
                                        <li>	<a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2 Air: Yes</a>
                                        </li>
                                        <li>
                                            <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> Others (2)</span>
                                                <ul class="list">
                                                    <li class="dpopy_li"><a href="#"><i class="fa fa-snowflake-o"></i> Air Conditioning</a>
                                                    </li>
                                                    <li class="dpopy_li"><a href="#"><i class="fa fa-code-fork"></i> Transmission</a>
                                                    </li>
                                                    <li class="dpopy_li"><a href="#"><i class="fa fa-user-circle-o"></i> Minimum age</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="">
                                        <li>	<a href="#"><i class="fa fa-users"></i> &nbsp;4 Seats</a>
                                        </li>
                                        <li>	<a href="#"><i class="fa fa-clone"></i> &nbsp;4 Doors</a>
                                        </li>
                                        <li>	<a href="#"><i class="fa fa-shield"></i> &nbsp;9 Manual</a>
                                        </li>

                                        <li>	<a href="#"><i class="fa fa-briefcase"></i> &nbsp;4 Bag Space</a>
                                        </li>
                                        <li>	<a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2 Air: Yes</a>
                                        </li>
                                        <li>
                                            <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> Others (2)</span>
                                                <ul class="list">
                                                    <li class="dpopy_li"><a href="#"><i class="fa fa-snowflake-o"></i> Air Conditioning</a>
                                                    </li>
                                                    <li class="dpopy_li"><a href="#"><i class="fa fa-code-fork"></i> Transmission</a>
                                                    </li>
                                                    <li class="dpopy_li"><a href="#"><i class="fa fa-user-circle-o"></i> Minimum age</a>
                                                    </li>
                                                </ul>
                                            </div>
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
                            <div class="x_slider_form_main_wrapper x_slider_form_main_wrapper_ccb float_left">
                                <div class="x_slider_form_heading_wrapper x_slider_form_heading_wrapper_carbooking float_left">
                                    <h3>Let’s find your perfect car</h3>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="x_slider_form_input_wrapper float_left">
                                            <h3>Pick-up Location</h3>
                                            <input type="text" placeholder="City, Airport, Station, etc.">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-sec-header">
                                            <h3>Pick-up Date</h3>
                                            <label class="cal-icon">Pick-up Date
                                                <input type="text" placeholder="Tue 16 Jan 2018" class="form-control datepicker">
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-sec-header">
                                            <h3>Drop-Off Date</h3>
                                            <label class="cal-icon">Pick-up Date
                                                <input type="text" placeholder="Tue 16 Jan 2018" class="form-control datepicker">
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="x_slider_checout_right x_slider_checout_right_carbooking">
                                            <ul>
                                                <li><a href="#">search <i class="fa fa-arrow-right"></i></a>
                                                </li>
                                            </ul>
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
<!-- x car book sidebar section Wrapper End -->

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오후 1:38
  To change this template use File | Settings | File Templates.
--%>
<!-- 일반 렌트: 렌터카 예약(결제 완료) 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
    <div class="btc_tittle_img_overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
                <div class="btc_tittle_left_heading">
                    <h1>결제완료</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- btc tittle Wrapper End -->

<div class="x_car_donr_main_box_wrapper float_left" style="margin-top: 100px;">
    <div class="container">
        <div class="x_car_donr_main_box_wrapper_inner">
            <div class="order-done">
                <i class="icon-checked"><img src="images/icon-checked.png"
                                             alt=""></i>
                <h4>예약완료! 이용해주셔서 감사합니다.</h4>
                <h4>
                    주문번호: <span>#887768</span>
                </h4>
                <hr>
                <h4>예약내역</h4>
                <ul class="row list-unstyled">
                    <li class="col-md-6">
                        <h6>예약자 정보</h6>
                        <p>
                            {name} <br>
                            {phone} <br>
                            {birth} <br>
                            {email} <br>
                        </p>
                    </li>
                    <li class="col-md-6">
                        <h6>업체 정보</h6>
                        <p>
                            {name} <br>
                            {tel} <br>
                            {addr_code} + {addr_basic} + {addr_detail} <br>
                        </p>
                    </li>
                    <li class="col-md-6">
                        <h6>일시</h6>
                        <p>
                            대여일시 <span>{2021.09.28(화) 09:00}</span>
                        </p>
                        <p>
                            반납일시 <span>{2021.09.28(화) 09:00}</span>
                        </p>
                    </li>
                    <li class="col-md-6">
                        <h6>장소</h6>
                        <p>
                            픽업장소 <span>Barcelona, Airport</span>
                        </p>
                        <p>
                            반납장소 <span>Barcelona, Airport</span>
                        </p>
                    </li>
                    <li class="col-md-6">
                        <h6>차량정보</h6>
                        <p>
                            Dakota GT86 <span>{price}</span>
                        </p>
                        <p>Coupe</p>
                    </li>
                    <li class="col-md-6">
                        <h6>옵션</h6>
                        <p>
                            {옵션1} <span>$19</span>
                        </p>
                        <p>
                            {옵션2} <span>$199</span>
                        </p>
                        <p>
                            {옵션3}
                        </p>
                        <p>
                            {옵션4} <span>$199</span>
                        </p>
                    </li>
                    <li class="col-md-6">
                        <h6>보험</h6>
                        <p>
                            완전자차 <span>{insure_price}</span>
                        </p>
                    </li>
                    <li class="col-md-6">
                        <h6>Total</h6>
                        <p>
                            총 결제금액 <span>{price} + {insure_price}</span>
                        </p>
                    </li>
                </ul>
                <hr>
                <div class="contect_btn contect_btn_contact">
                    <ul>
                        <li><a href="#">나의 주문정보 <i class="fa fa-arrow-right"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

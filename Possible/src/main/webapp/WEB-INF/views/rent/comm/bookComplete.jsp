<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 렌트 예약완료(결제완료) 페이지 -->

<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600 text-dark">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title text-white">
                        <h1 class="font-weight-bold">렌트카 결제 완료</h1>
                        <h6>결제가 완료되었습니다. 즐거운 여행 되세요!</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- btc tittle Wrapper End -->

<div class="x_car_donr_main_box_wrapper float_left mt-4">
	<div class="container">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <div class="x_car_donr_main_box_wrapper_inner card">
                    <div class="card-header text-center bg-white">
                        <div class="text-primary py-3">
                            <i class="fas fa-check-circle fa-5x"></i>
                        </div>
                        <div class="card-title">
                            <h3 class="font-weight-bold">이용해주셔서 감사합니다!<br>렌트가 완료되었습니다.</h3>
                            <h4>예약번호: <span class="font-weight-bold">${rent.merchantUid}</span></h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <h3 class="text-center pb-3 font-weight-bold">예약정보</h3>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="border-bottom">
                                    <h6 class="font-weight-bold">렌트일시</h6>
                                </div>
                                <div>
                                    <p>시작<span class="float-right"><fmt:formatDate value="${rent.startDate}" pattern="yyyy년 MM월 dd일"/></span></p>
                                    <p>종료<span class="float-right"><fmt:formatDate value="${rent.endDate}" pattern="yyyy년 MM월 dd일"/></span></p>
                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="border-bottom">
                                    <h6 class="font-weight-bold">대여/반납 장소</h6>
                                </div>
                                <div>
                                    <p>(${rent.companyVO.postal})</p>
                                    <p>(${rent.companyVO.addr1})</p>
                                    <p>(${rent.companyVO.addr2})</p>
                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="border-bottom">
                                    <h6 class="font-weight-bold">렌트정보</h6>
                                </div>
                                <div>
                                    <p>시작<span class="float-right"><fmt:formatDate value="${rent.startDate}" pattern="yyyy년 MM월 dd일"/></span></p>
                                    <p>종료<span class="float-right"><fmt:formatDate value="${rent.endDate}" pattern="yyyy년 MM월 dd일"/></span></p>

                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="border-bottom">
                                    <h6 class="font-weight-bold">보험정보</h6>
                                </div>
                                <div>
                                    <p>시작<span class="float-right"><fmt:formatDate value="${rent.startDate}" pattern="yyyy년 MM월 dd일"/></span></p>
                                    <p>종료<span class="float-right"><fmt:formatDate value="${rent.endDate}" pattern="yyyy년 MM월 dd일"/></span></p>

                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="border-bottom">
                                    <h6 class="font-weight-bold">예약자 정보</h6>
                                </div>
                                <div>
                                    <p>시작<span class="float-right"><fmt:formatDate value="${rent.startDate}" pattern="yyyy년 MM월 dd일"/></span></p>
                                    <p>종료<span class="float-right"><fmt:formatDate value="${rent.endDate}" pattern="yyyy년 MM월 dd일"/></span></p>

                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="border-bottom">
                                    <h6 class="font-weight-bold">결제금액</h6>
                                </div>
                                <div>
                                    <p>시작<span class="float-right"><fmt:formatDate value="${rent.startDate}" pattern="yyyy년 MM월 dd일"/></span></p>
                                    <p>종료<span class="float-right"><fmt:formatDate value="${rent.endDate}" pattern="yyyy년 MM월 dd일"/></span></p>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="order-done">
                        <h4></h4>
                        <ul class="row list-unstyled">
                            <li class="col-md-6">
                                <h6>렌트일시</h6>
                                <p>
                                    시작 <span>${rent.startDate}</span>
                                </p>
                                <p>
                                    종료 <span>${rent.endDate}</span>
                                </p>
                            </li>
                            <li class="col-md-6">
                                <h6>대여/반납 장소</h6>
                                <p>
                                    <span>${rent.takePlaceCode} ${rent.takePlaceBasic} ${rent.takePlaceDetail}</span>
                                </p>
                            </li>
                            <li class="col-md-6">
                                <h6>렌트정보</h6>
                                <p>차량정보 <span>${car.brand} ${car.model} ${car.year} ${car.fuel}</span></p>
                                <p>옵션 <span>넣을깝쇼</span></p>
                                <p>업체명 <span>{cmpn.name}</span></p>
                                <p>업체번호 <span>{cmpn.tel}</span></p>
                            </li>
                            <li class="col-md-6">
                                <h6>보험정보</h6>
                                <p>보험종류 <span>{일반자차/완전자차}</span></p>
                                <p>금액 <span>{보험금액}</span></p>
                            </li>
                            <li class="col-md-6">
                                <h6>예약자 정보</h6>
                                <p>
                                    이름 <span>${rent.receiver}</span>
                                </p>
                                <p>
                                    연락처 <span>{rent.phone}</span>
                                </p>
                                <p>
                                    결제방법 <span>${rent.payMethod}</span>
                                </p>
                            </li>
                            <li class="col-md-6">
                                <h6>Total</h6>
                                <p>
                                    총 결제금액 <span>${rent.price}원</span>
                                </p>
                            </li>
                        </ul>
                        <hr>
                        <div class="contect_btn contect_btn_contact">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/mypage/rent">렌트내역 확인</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

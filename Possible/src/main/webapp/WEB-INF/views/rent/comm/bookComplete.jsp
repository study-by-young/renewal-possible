<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 렌트 예약완료(결제완료) 페이지 -->
<c:set var="during" value="${rent.endDate.date - rent.startDate.date}"/>
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
                            <h4>예약번호: <span class="font-weight-bold text-primary-400">${rent.merchantUid}</span></h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <h3 class="text-center pb-3 font-weight-bold">예약정보</h3>
                            </div>
                            <div class="col-lg-10 offset-lg-1">
                                <div class="row">
                                    <div class="col-lg-6 mb-4">
                                        <div class="border-bottom mb-2">
                                            <h6 class="font-weight-bold">렌트일시</h6>
                                        </div>
                                        <div>
                                            <p>시작<span class="float-right"><fmt:formatDate value="${rent.startDate}" pattern="yyyy년 MM월 dd일"/></span></p><div class="clearfix"></div>
                                            <p>종료<span class="float-right"><fmt:formatDate value="${rent.endDate}" pattern="yyyy년 MM월 dd일"/></span></p><div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 mb-4">
                                        <div class="border-bottom mb-2">
                                            <h6 class="font-weight-bold">대여/반납 장소</h6>
                                        </div>
                                        <div>
                                            <p>업체명<span class="float-right">${rent.companyVO.name}</span></p><div class="clearfix"></div>
                                            <p>주소<span class="float-right text-right">(${rent.companyVO.postal}) ${rent.companyVO.addr1}<br>${rent.companyVO.addr2}</span></p><div class="clearfix"></div>
                                            <p>업체번호<span class="float-right">${rent.companyVO.tel}</span></p><div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 mb-4">
                                        <div class="border-bottom mb-2">
                                            <h6 class="font-weight-bold">렌트정보</h6>
                                        </div>
                                        <div>
                                            <p>차량정보<span class="float-right text-right">${rent.carVO.brandCodeVO.name} ${rent.carVO.modelCodeVO.name}<br>${rent.carVO.trimCodeVO.name}</span></p><div class="clearfix"></div>
                                            <p>보험정보<span class="float-right">${rent.insuranceCodeVO.optName}</span></p><div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 mb-4">
                                        <div class="border-bottom mb-2">
                                            <h6 class="font-weight-bold">예약자 정보</h6>
                                        </div>
                                        <div>
                                            <p>이름<span class="float-right">${rent.memberVO.name}</span></p><div class="clearfix"></div>
                                            <p>연락처<span class="float-right">${rent.memberVO.phone}</span></p><div class="clearfix"></div>
                                            <p>결제방법<span class="float-right">${rent.payMethod}</span></p><div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="col-12 mb-4">
                                        <div class="border-bottom mb-2">
                                            <h6 class="font-weight-bold">결제금액</h6>
                                        </div>
                                        <div>
                                            <p>대여가<span class="float-right">${rent.carVO.price}원</span></p><div class="clearfix"></div>
                                            <p>보험가<span class="float-right">${rent.insuranceCodeVO.price}원</span></p><div class="clearfix"></div>
                                            <p>대여일<span class="float-right">${during}일</span></p><div class="clearfix"></div>
                                            <p>총계<span class="float-right">${(rent.carVO.price + rent.insuranceCodeVO.price) * during}원</span></p><div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/mypage/rent" class="h5 btn btn-block mb-0 btn-lg btn-primary">렌트내역 확인</a>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

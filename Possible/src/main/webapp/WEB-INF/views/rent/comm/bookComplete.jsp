<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 렌트 예약완료(결제완료) 페이지 -->

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

<div class="x_car_donr_main_box_wrapper float_left" style="margin-top: 50px;">
	<div class="container">
		<div class="x_car_donr_main_box_wrapper_inner">
			<div class="order-done">
				<i class="icon-checked"><img src="images/icon-checked.png"
					alt=""></i>
				<h4>이용해주셔서 감사합니다! 렌트가 완료되었습니다.</h4>
				<h4>
					예약번호: <span>${rent.merchantUid}</span>
				</h4>
				<hr>
				<h4>예약정보</h4>
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
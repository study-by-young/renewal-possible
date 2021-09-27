<!-- 일반 렌트: 렌터카 예약(결제 진행) 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

.form-style {
    display: block;
    width: 100%;
    height: calc(1.5385em + 1rem + 2px);
    padding: .5rem 1rem;
    font-size: .8125rem;
    font-weight: 400;
    line-height: 1.5385;
    color: #333;
    background-color: transparent;
    background-clip: padding-box;
    border: 1px solid #ddd;
    border-radius: 0;
    box-shadow: 0 0 0 0 transparent;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    background-clip: border-box;
    border-width: 1px 0;
    border-top-color: rgb(238, 238, 238);
}

.page_link ul {
	background: #e6e6e6;
	float: right;
	padding: 15px 30px 15px 30px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	margin-left: 10px;
}

.car_detail {
	padding: 15px;
	background-color: white;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	margin-bottom: 15px;
}

.insurance_select {
	width: 98%;
	background-color: white;
	padding: 15px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	cursor: pointer;
}

.insurance_select {
	width: 98%;
	background-color: white;
	padding: 20px;
	margin-bottom: 20px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	box-shadow: 0 0 0 1px #e6e6e6 inset;
}

.pay_select {
	width: 98%;
	background-color: white;
	padding: 20px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	padding-bottom: 47px;
	box-shadow: 0 0 0 1px #e6e6e6 inset;
}

.insurance_select hr {
	margin-top: 10px;
	margin-bottom: 10px;
}

.insurance_select input {
	opacity: 100%;
}

.car-filter {
	float: left;
	width: 100%;
	background: #ffffff;
	position: relative;
	min-height: 50px;
	animation-delay: 2.6s;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	padding-top: 0;
}

.car_booking_onliy_side {
	padding: 0px;
	margin-top: 0px;
}

input[type="radio"] {
	float: none;
    width: 14px;
    height: 14px;
	background-color: initial;
	cursor: default;
	appearance: auto;
	box-sizing: border-box;
	margin: 0px;
	padding: initial;
	border: initial;
	color: #6495ed;
	transition: all ease 2s 0s;
}

.ins_text {
    display: block;	
    font-size: 1rem;
    font-weight: 800 !important;
    float: left;
    color: black;
}

.insurance_select:hover {
	box-shadow: 0 0 0 2px #6495ed inset;
}

.insurance_select:focus {
	box-shadow: 0 0 0 2px #6495ed inset;
}

.order-billing .billing-form li label {
    line-height: 20px;
    margin: 0px;
    text-transform: uppercase;
    font-weight: 800;
    font-size: 16px;
    width: 100%;
    color: #111;
}

</style>


<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="btc_tittle_img_overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
				<div class="btc_tittle_left_heading">
					<h1>결제진행</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- btc tittle Wrapper End -->

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left" style="margin-top: 100px;">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
				<div class="x_car_book_left_siderbar_wrapper float_left">
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<!-- Filter Results -->
							<div class="car-filter accordion x_inner_car_acc_accor">
								<h3 style="padding-top: 20px;">예약정보</h3>
								<hr>
								<!-- Resources -->
								<div class="x_car_access_filer_top_img">
									<img src="images/c2.png" alt="car_img">
									<h3 style="padding-left: 0px;">{model}</h3>
									<p>{price}</p>
								</div>
								<hr>
								<!-- Company -->

								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#"> 대여일시&장소</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>2021.09.28(화) 09:00</li>
													<li>Barcelona, Airport</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#"> 반납일시&장소</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>{일시}</li>
													<li>{장소}</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">업체/차량</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>대여업체 <span>{name}</span>
													</li>
													<li>차량 <span>{model}{year}{fuel}</span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">보상/면제범위</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>보험 <span>{자차보험}</span></li>
													<li>면책금 <span>면제</span></li>
													<li>보상한도 <span>{보상한도}</span></li>
													<li>휴차보상료 <span>면제</span></li>
													<li>단독사고 <span>보장불가</span></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<input type="text" placeholder="Coupon Code">
												<button type="submit">
													<i class="fa fa-arrow-right"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="x_car_acc_filter_bottom_total">
									<ul>
										<li>총 결제금액 <span>{가격+보험} 원</span> <!-- 차량 금액 + 보험 금액 -->
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
				<div class="x_carbooking_right_section_wrapper float_left">
					<div class="row">
						<div class="col-md-12">
							<div class="x_car_checkout_right_main_box_wrapper float_left">

								<!-- 결제정보 -->
								<div class="car-filter order-billing margin-top-0">
									<div class="heading-block text-left margin-bottom-0">
										<h4>결제정보</h4>
									</div>
									<hr>

									<div class="x_car_detail_slider_bottom_cont float_left" style="padding-top: 0px; padding-bottom: 40px;">

										<div class="car-filter accordion car_booking_onliy_side" style="padding-top: 0px;">
											<!-- Resources -->
											<div class="panel panel-default">

										<!-- 보험 -->
										<div class="payme-opton">
											<div class="collapse show">
												<div class="panel-body">
													<div class="x_car_acc_filter_date">
														<div class="pay_select" style="padding-bottom: 20px; font-size: 15px;">
															<div><font style="font-weight: bold; color: black;">차량정보</font> <span>{연식}{오토/수동}{문
																		개수}{배기량}{색상}{mission}{트렁크}</span>
															</div>
															<div><font style="font-weight: bold; color: black;">차량상세옵션</font> <span>{네비}{금연}{블랙박스}{에어컨}{어쩌구}{저쩌구}</span>
															</div>
														</div>
													</div>

												</div>
											</div>
										</div>
													
											</div>
										</div>
										<hr>
									</div>

									<!-- form 예약자 정보 -->
									<form class="billing-form">
										<ul class="list-unstyled row col-lg-9">
											<li class="col lg-12 col-md-12"><label>이름 * 
												<input id="name" name="name" placeholder="" class="form-style">
											</label></li>
											<li class="col-lg-12 col-md-12"><label>연락처 * 
												<input id="phone" name="phone" placeholder="" class="form-style">
											</label></li>
											<li class="col-lg-12 col-md-12"><label>생년월일 
												<input id="birth" name="birth" placeholder="" class="form-style">
											</label></li>
											<li class="col-lg-12 col-md-12"><label>이메일 * 
												<input id="email" name="email" placeholder="" class="form-style">
											</label></li>
										</ul>
										
										<div class="pay_select" style="margin-top: 40px; padding-bottom: 20px; border: 1px solid #363636;">
											<div style="text-align: center;"><img src="${pageContext.request.contextPath}/resources/images/licenseimg.svg"  style="align: center; padding: 10px;"></div>
											<div style="font-size: 14px; font-weight: 800; text-align: center; color: black;">차량 대여 시, 운전자는 운전면허증을 꼭 지참해주세요.</div>
											<div style="font-size: 14px; text-align: center;">면허증 확인 및 계약서 작성이 꼭 필요합니다.</div>
										</div>
										
										<hr>

										<!-- 보험 -->
										<div class="payme-opton">
											<div class="heading-block text-left margin-bottom-30">
												<h4>자동차보험</h4>
											</div>

											<div class="collapse show">
												<div class="panel-body">
													<div class="x_car_acc_filter_date">
														<div class="insurance_select" id="ins1">
															<div><div class="ins_text">일반자차</div>&nbsp;&nbsp;<input type="radio" id="ins_code1" name="insurance" value="ins_code1" checked> <span>+{0}원</span>
															</div>
															<div>만 26세 이상 / 면허 취득 1년 이상</div>
															<hr>
															<div>보상한도 <span>{200}만원</span>
															</div>
															<div>자기부담금 <span>10~30만원</span>
															</div>
														</div>
													</div>

													<div class="collapse show">
														<div class="panel-body">
															<div class="x_car_acc_filter_date">
																<div class="insurance_select" id="ins2">
																	<div><div class="ins_text">완전자차</div>&nbsp;&nbsp;<input type="radio" id="ins_code2" name="insurance" value="ins_code2"> <span>+{4,850}원</span></div>
																	<div>만 26세 이상 / 면허 취득 2년 이상</div>
																	<div><hr></div>
																	<div>보상한도 <span>{200}만원</span></div>
																	<div>자기부담금 <span>0원</span></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<hr>

										<!-- 결제방법 -->
										<div class="payme-opton">
											<div class="heading-block text-left margin-bottom-30">
												<h4>결제방법</h4>
											</div>
											<div class="pay_select">
												<div class="radio">
													<input type="radio" name="pay_method" id=kakao value="kakao"
														checked> <label for="kakao">카카오페이</label>
												</div>
												<div class="radio">
													<input type="radio" name="pay_method" id="toss" value="toss">
													<label for="toss">TOSS</label>
												</div>
												<div class="radio">
													<input type="radio" name="pay_method" id="naver" value="naver">
													<label for="naver">네이버페이</label>
												</div>
												<div class="radio">
													<input type="radio" name="pay_method" id="common_pay" value="common_pay">
													<label for="common_pay">일반결제</label>
												</div>
												<div class="radio">
													<input type="radio" name="pay_method" id="stripe" value="stripe">
													<label for="stripe">계좌이체</label>
												</div>
											</div>
										</div>
										<hr>
									</form>
									<!-- End of form 예약자 정보 -->

									<div class="x_car_detail_slider_bottom_cont float_left"
										style="padding-top: 40px; padding-bottom: 50px;">

										<div class="panel panel-default">
											<div class="panel-heading">
												<div class="x_slider_form_input_wrapper float_left"
													style="margin-top: 30px;">
													<h3 style="color: red;">꼭 확인해주세요!</h3>
													<div class="car_detail">
														<p style="font-size: 13px;">
															1. 업체 및 차량마다 요구하는 운전경력 및 나이가 상이하니 반드시 대여규정을 확인해 주시기 바랍니다.<br>
															2. 운전자 정보는 렌터카 이용 시 긴급사항 발생에 대비하여 즉시 연락이 가능한 정보를 입력하셔야
															합니다.<br> 3. 잘못된 정보 또는 수신이 불가한 정보 입력으로 발생되는 불이익에 대해
															당사는 책임지지 않으니 유의해 주시기 바랍니다.<br> 4. 운전자 추가 등록은 차량 대여 시
															현장에서 신청 가능합니다.<br> 5. 대여규정 및 약관동의 미확인으로 인한 불이익에 대해
															당사는 책임지지 않으니 유의해주시기 바랍니다.<br> 6. 면허증 미지침시 인수 거절 될 수
															있으므로 유의해주시기 바랍니다.<br>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- End of 차량정보 -->

									<div class="checkbox car_checkout_chekbox">
										<input type="checkbox" id="c3" name="cb"> <label
											for="c3">위 결제/대여 규정 내용을 모두 확인하였으며, 회원 본인은 결제에 동의합니다.
											*</label>
									</div>


								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="contect_btn contect_btn_contact">
								<ul>
									<li><a href="#">결제하기 <i class="fa fa-arrow-right"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- x car book sidebar section Wrapper End -->


<script>
	$('#ins1').on('click', function(){
	    $('#ins_code1').prop("checked", true);
	});
	
	$('#ins2').on('click', function(){
	    $('input:radio[id="ins_code2"]').prop("checked", true);
	});
</script>

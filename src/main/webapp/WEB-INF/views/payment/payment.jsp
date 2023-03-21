<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 렌트 예약(결제) 페이지 -->

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>
	.hide {
		display: none;
	}
	
	.cont {
		cursor: pointer;
	}
	
	.contbox {
		height: 250px;
		overflow: auto;
	}
	
	.driver2 {
		display: none;
	}
	
	.order-billing .billing-form li {
    	margin-bottom: 9px;
	}
	
	small {
		color: lightgray;
	}
	
	.how_many_driver {
		width: 50%;
		margin: 10px;
		margin-bottom: 20px;
		padding: 10px;
		padding-left: 0px;
		margin-left: 0px;
		float: left;
	}
	
	.how_many_driver ul {
		float: left;
	}
	
	.how_many_driver ul li {
		float: left;
		margin: 10px;
		padding-left: 0px;
		margin-left: 0px;
		padding-right: 20px;
		font-weight: 900;
		font-color: black;
	}
	
	.license_warning {
		width: 75%;
		margin: 0 auto;
		padding: 30px;
		background-color: white;
		border-radius: 10px;
		border: 1px solid #ebebeb;
	}
</style>

<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="btc_tittle_img_overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
				<div class="btc_tittle_left_heading">
					<h1>렌트</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- btc tittle Wrapper End -->

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
				<div class="x_car_book_left_siderbar_wrapper float_left">
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<!-- Filter Results -->
							<div class="car-filter accordion x_inner_car_acc_accor">
								<h3>예약정보</h3>
								<hr>
								<!-- Resources -->
								<div class="x_car_access_filer_top_img">
									<img src="images/c2.png" alt="car_img">
									<h3>{car.model}</h3>
									<p>{car.price}</p>
								</div>
								<hr>
								<!-- Company -->
								
								<!-- Attributes -->
								<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">렌트 시작 일시</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>{startDate}<input type="date" id="startDate" value=""></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">렌트 종료 일시</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>{endDate}<input type="date" id="endDate" value=""></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">렌트카 대여/반납 장소</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>
														<a>{takePlaceCode}<input type="hidden" id="takePlaceCode" value="takePlaceCode"></a>&nbsp;
														<a>{takePlaceBasic}<input type="hidden" id="takePlaceBasic" value="takePlaceBasic"></a>&nbsp;
														<a>{takePlaceDetail}<input type="hidden" id="takePlaceDetail" value="takePlaceDetail"></a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">렌트정보</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>렌트타입<span>{rentType}<input type="hidden" id="rentType" name="rentType" value="rentType"></span>
													</li>
													<li>ESTIMATE<span>100<input type="hidden" id="estimate" name="estimate" value="100"></span>
													</li>
													<li>대여업체<span>100<input type="hidden" value="업체"></span>
													</li>
													<li>차량정보</li>
														<li>{car.brand}<input type="hidden" value="{car.brand}"></li>
														<li>{car.year}<input type="hidden" value="{car.year}"></li>
														<li>{car.fuel}<input type="hidden" value="{car.fuel}"></li>
													<li>옵션</li>
														<li>{차량option}<input type="hidden" value="{option}"></li>
														<li>{여행option}<input type="hidden" value="{option}"></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<!-- 
								<hr>
								<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">보험정보</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>Sales (1%) <span>$1</span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
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
								-->
								<div class="x_car_acc_filter_bottom_total">
									<ul>
										<li>총 결제금액 <span>{차가격+보험가격}원<input type="hidden" id="price" value="100"></span>
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
								<div class="car-filter order-billing margin-top-0">
									<div class="heading-block text-left margin-bottom-0">
										<h4>결제정보</h4>
									</div>
									<hr>
									<div class="how_many_driver">
										<ul>
											<li><label><input type="radio" name="driver" id="driver1" checked> 운전자 1명</label></li>
											<li><label><input type="radio" name="driver" id="driver2"> 운전자 2명</label></li>
										</ul>
									</div>
									<form class="billing-form">
										<ul class="list-unstyled row" style="margin-bottom: 50px;">
											<li>예약자 정보</li>
											<li class="col-md-12"><label>이름* <input id="receiver" name="receiver" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>연락처* <input id="phone" name="phone" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>생년월일* <br><input id="birth1" name="birth1" size="20" type="text" placeholder="">
																- <input id="birth2" name="birth2" size="5" type="text" placeholder="">* * * * * *
											</label></li>
											<li class="col-md-12"><label>이메일* <input id="email" name="email" type="text" placeholder="" class="form-control">
											</label></li>
										</ul>
										
										<ul class="list-unstyled row driver2" style="margin-bottom: 50px;">
											<li>제 2 운전자 정보</li>
											<li class="col-md-12"><label>이름* <input id="receiverB" name="receiverB" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>연락처* <input id="phoneB" name="phoneB" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>생년월일* <br><input id="birthB1" name="birthB1" size="20" type="text" placeholder="">
																- <input id="birthB2" name="birthB2" size="5" type="text" placeholder="">* * * * * *
											</label></li>
											<li class="col-md-12"><label>이메일* <input id="emailB" name="emailB" type="text" placeholder="" class="form-control">
											</label></li>
										</ul>
										
										<div class="license_warning" style="text-align: center;">
											<div style="text-align: center;"><img src="${pageContext.request.contextPath}/resources/images/licenseimg.svg"></div>
											<div style="text-align: center;">차량 대여 시, 운전자는 운전면허증을 꼭 지참해주세요.</div>
											<div style="text-align: center;">면허증 확인 및 계약서 작성이 꼭 필요합니다.</div>
										</div>										
										<hr>
										
										<!-- 자동차 보험 -->
										<div class="payme-opton">
											<div class="heading-block text-left margin-bottom-30">
												<h4>자차보험</h4>
											</div>
											<div>
												<ul>
													<li>{OPT_CODE}</li>
													<li>+{price}원<input type="hidden" id="" name="" value="{price}"></li>
												</ul>
											</div>
											
										</div>
										<hr>
										
										<!-- 결제수단 -->
										<div class="payme-opton">
											<div class="heading-block text-left margin-bottom-30">
												<h4>결제수단</h4>
											</div>
											<div>
												<label><input type="radio" name="pay" value="kakaopay"> 카카오페이</label>
											</div>
											<div>
												<label><input type="radio" name="pay" value="card"> 신용/체크카드</label>
											</div>
											<div>
												<label><input type="radio" name="pay" value="trans"> 실시간계좌이체</label>
											</div>
											<div>
												<label><input type="radio" name="pay" value="vbank"> 가상계좌</label>
											</div>
										</div>
										<hr>
										
										<!-- 유의사항 -->
										<div class="payme-opton">
											<div class="heading-block text-left margin-bottom-30">
												<h4>유의사항</h4>
											</div>
											<div>
												<ol>
													<li>업체 및 차량마다 요구하는 운전경력 및 나이가 상이하니 반드시 대여규정을 확인해 주시기 바랍니다.</li>
													<li>렌터카 이용 시 긴급사항 발생에 대비하여 즉시 연락이 가능한 정보를 입력하셔야 합니다.</li>
													<li>수신이 불가한 정보 입력으로 발생하는 불이익에 대해 당사는 책임지지 않으니 유의해 주시기 바랍니다.</li>
													<li>운전자 추가 등록은 차량 대여 시 현장에서 신청 가능합니다.</li>
													<li>대여규정 및 약관 미확인으로 인한 불이익에 대해 당사는 책임지지 않으니 유의해 주시기 바랍니다.</li>
													<li>면허증 미지침시 인수가 거절 될 수 있으므로 유의해 주시기 바랍니다.</li>
												</ol>
											</div>
											
										</div>
										<hr>
										
											<div class="agreemnet">
												<ul class="agree_list">
													<li class="on">
														<dl>
															<dt class="cont">여행갈카 대여 규정 및 약관 동의 <span style="float: right;">보기</span></dt>
															<dd id="88" class="hide contbox">
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>
												대여조건<br>
												운전자 나이 만 21세 이상<br>
												
												면허취득일 1년 이상<br>
												
												차량 대여 시 실물면허증 소지 (2종 보통 면허 이상 필요)
												
												업체별 대여규정 준수 (외국인 대여, 낚시용품/애견 동반, 주행거리제한 규정 등)
												· 대여조건 미달로 렌트가 불가한 경우, 추가 수수료가 발생합니다.
												· 제 2운전자도 대여조건에 충족해야 하며, 계약서 작성을 해야 보험 효력이 발생합니다.
												자동차 보험
												자동차 보험의 정확한 보장 범위는 대여 시 작성하는 계약서를 기준으로 결정됩니다. 차량 대여 시 작성하는 계약서 내용을 반드시 확인해주세요.
												
												[유의사항]
												· 사고 발생 시, 대인 1·2, 대물, 자손, 자차에서 각각의 면책금과 휴차 보상료가 발생합니다.
												· 단독 사고, 휠/타이어, 중과실 사고 시에는 자차에 대한 보상이 적용이 불가할 수 있습니다.
												· 차량 반납 이후에는 보험이 적용되지 않으며 보험 계약이 자동 해지됩니다.
												
												* 카모아는 사고 시 운전자 피해 최소화를 위해 자동차 보험(대인 1·2, 대물, 자손, 자차) 가입 차량만 취급하고 있습니다.
												차량 정비 및 사고
												· 차량 정비는 렌트카 업체의 규정에 따라야 하며 이를 이행하지 않았을 경우 서비스 이용이 제한됩니다.
												· 사고가 발생했을 경우 사고 상황을 즉시 렌트카 업체로 통보해야 하며 사고 처리는 렌트카 업체와의 계약 약관에 따라 진행됩니다.
												· 이를 위해 차량 대여 시 보험, 정비 등 렌트카 업체의 규정에 관한 내용 및 작성한 계약서의 내용을 반드시 숙지해야 합니다.
												차량배달 서비스 비용
												· 렌트카 업체의 차량 배달이 시작된 후 예약을 취소할 경우, 왕복 배달 비용이 발생합니다. 왕복 배달 비용은 업체마다 상이합니다.
												· 반차 주소 변경 시, 추가 비용이 발생할 수 있습니다. 추가 비용은 업체마다 상이합니다.
												· 약속된 반납장소 외 주차 시 비용이 청구될 수 있습니다.
												연료 규정
												· 차량 반납 시, 대여 시의 연료량과 동일하도록 주유하여 반납해야 합니다. (차량 대여 직후 계기판 사진 촬영 권장)
												· 연료량이 모자를 경우, 추가 비용이 발생할 수 있으며 기존 연료량보다 많을 경우, 환불이 불가능합니다.
												· 반납 시 주유 불충분에 대해서는 주유소의 가격과 상이할 수 있으며, 주유서비스 비용이 함께 청구될 수 있습니다.
												약정 주행거리
												약정 주행거리는 렌트카 업체의 대여 규정을 확인해 주세요
												주행거리 초과 시, km당 추가 요금이 발생하거나 이후 이용이 어려울 수 있습니다.
												월렌트 보증금
												· 업체/차량에 따라 보증금은 상이합니다.
												· 보증금은 현장에서 현금 결제 또는 계좌 이체로 지불하시면 됩니다.
												· 보증금은 카모아 결제금액에 포함되지 않습니다.
												취소규정
												· 결제 후 1시간 이내에 취소할 경우 취소 수수료는 발생하지 않습니다. 단, 결제 후 1시간 이내에 취소를 하였더라도 대여 시간이 지났을 경우 예약 금액에 대한 환불이 불가능합니다.
																</p>
															</dd>
														</dl>
													</li>
												</ul>
											</div>
											
											<div class="agreemnet">
												<ul class="agree_list">
													<li class="on">
														<dl>
															<dt class="cont">개인정보 수집·이용 및 제3자 정보제공 <span style="float: right;">보기</span></dt>
															<dd id="88" class="hide contbox">
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
															</dd>
														</dl>
													</li>
												</ul>
											</div>
											
											<div class="agreemnet">
												<ul class="agree_list">
													<li class="on">
														<dl>
															<dt class="cont">취소 및 위약금 규정 동의 <span style="float: right;">보기</span></dt>
															<dd id="88" class="hide contbox">
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
															</dd>
														</dl>
													</li>
												</ul>
											</div>
											
											<div class="agreemnet">
												<ul class="agree_list">
													<li class="on">
														<dl>
															<dt class="cont">자동차 표준 대여 약관 동의 <span style="float: right;">보기</span></dt>
															<dd id="88" class="hide contbox">
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
															</dd>
														</dl>
													</li>
												</ul>
											</div>
											
											<div class="agreemnet">
												<ul class="agree_list">
													<li class="on">
														<dl>
															<dt class="cont">대여자격 확인 동의 <span style="float: right;">보기</span></dt>
															<dd id="88" class="hide contbox">
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
																<p>내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
															</dd>
														</dl>
													</li>
												</ul>
											</div>
										<br>
										<div><label><input type="checkbox" id="chk_all" name="agreement" value="selectAll"> 위 결제/대여 규정을 모두 확인하였으며, 회원 본인은 결제에 동의합니다.</label></div>
										<div style="margin-bottom: 40px;"><small>팀 Possible은 통신판매중개자로서 여행갈카의 거래당사자가 아니며 상품정보, 거래조건 및 거래에 관련한 의무와 책임은 각 판매자에게 있습니다.</small></div>
										<div class="text-center">
											<input id="payBtn" name="payBtn" class="btn btn-main btn-round-full" type="button" value="결제하기" disabled>
										</div>
									</form>
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

<form action="">
	<input type="hidden" id="memSeq" value="2">
	<input type="hidden" id="carSeq" value="41">
</form>


<script>
	// 문제1. seq값을 넘겨서 단건조회를 하고 싶은데 seq값을 넘기는 방법을 모르겠음.
	$(document).ready(function(){

		IMP.init('imp77605435'); /* 가맹점 식별코드 초기화 */
	
		/* 폼전송 버튼 누르면 paymentFnc() 실행 */
		$('.btn').on('click', function(event) {
			event.preventDefault();
			paymentFnc();
		})
		
		/* 결제 함수 */
		function paymentFnc() {
			let merchantUid = 'm_' + Math.floor(Math.random() * 10000000000) + 1; /* 주문번호 */
			let payMethod = $('input[name="pay"]:checked').val(); /* 결제방법 */

			let rentType = $('#rentType').val();
			let startDate = $('#startDate').val();
			let endDate = $('#endDate').val();
			let receiver = $('#receiver').val();
			let price = $('#price').val();
			let estimate = $('#estimate').val();
			let status = '예약완료';
			let takePlaceCode = $('#takePlaceCode').val();
			let takePlaceBasic = $('#takePlaceBasic').val();
			let takePlaceDetail = $('#takePlaceDetail').val();
			let carSeq = $('#carSeq').val();
			let memSeq = $('#memSeq').val();
			
			IMP.request_pay({
				pg : 'html5_inicis', 
				pay_method : payMethod,
				merchant_uid : merchantUid,
				name : 'SM5 여행갈카', /* 주문명 */
				amount : price, /* 가격 */
				buyer_name : receiver,
				buyer_tel : $('#phone').val(),
				m_redirect_url : 'http://localhost:8080/orderCompleteMobile'
				
			}, function(rsp) {
				if (rsp.success) {
					let msg = '결제가 완료되었습니다.';
					alert(msg);
					
					// DB에 데이터 삽입
					$.ajax({
						url: 'payment',
						type: 'POST',
						dataType: 'text',
						contentType: 'application/json',
						data: JSON.stringify({ 
								rentType : rentType,
								startDate : startDate,
								endDate : endDate,
								receiver : receiver,
								price : price,
								estimate : estimate,
								status : status,
								takePlaceCode : takePlaceCode,
								takePlaceBasic : takePlaceBasic,
								takePlaceDetail : takePlaceDetail,
								merchantUid : merchantUid,
								payMethod : payMethod,
								carSeq : carSeq,
								memSeq : memSeq				
						}),
						success: function(response) {
							location.href = 'paymentFin?merchantUid=' + merchantUid + "&carSeq=" + carSeq;
						},
						error: function(xhr, status, message){
							alert('status: ' + status + ' er: ' + message);
						}
					});
					/* data.submit(); 성공 시 data폼의 데이터를 submit 한다. */
				} else {
					let msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
		}

	});
	
	
	// 결제수단을 선택하고 + 약관에 동의해야 결제버튼 활성화 됨
	$('#chk_all').on('click', function(){
		let chk = $(this).is(':checked');
		let pay = $('input[name="pay"]').is(':checked');
		
		if(chk == true && pay == true){
			$('.btn').removeAttr('disabled');
		}
		else if(chk == false && pay == true){
			$('.btn').attr('disabled', true);
		}
		else {
			$('.btn').attr('disabled', true);
		}
	});
	
	$('input[name="pay"]').on('click', function(){
		let chk = $('#chk_all').is(':checked');
		let pay = $(this).is(':checked');
		
		if(chk == true && pay == true){
			$('.btn').removeAttr('disabled');
		}
		else if(chk == false && pay == true){
			$('.btn').attr('disabled', true);
		}
		else {
			$('.btn').attr('disabled', true);
		}
	});
	
	
	// 결제 및 대여 약관 토글
	$(function() {
		var agree_open;

		$('.agree_list li dl dt').on('click', function() {
			var idx = $(this).parent().parent().index();
			
			if (agree_open == idx) {
				$('.agree_list li dl dd').css('display', 'none');
				$('.agree_list li').removeClass('on');
				agree_open = '99'; // 임의 상수 리셋
			} else {
				$('.agree_list li').removeClass('on');
				$('.agree_list li dl dd').css('display', 'none');
				$(this).parent().parent().find('dd').css('display', 'block');
				$(this).parent().parent().addClass('on');
				agree_open = idx;
			}
			return false;
		});
	});
	
	// 운전자 추가 시 폼 출력
	$('input[name="driver"]').on('click', function(){
		let chk = $('#driver2').is(':checked');
		
		if(chk == true){
			$('.driver2').css('display', 'block');
		}
		if(chk == false){
			$('.driver2').css('display', 'none');
		}
	});
	
</script>

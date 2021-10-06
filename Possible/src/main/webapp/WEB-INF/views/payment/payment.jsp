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
</style>


<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="btc_tittle_img_overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
				<div class="btc_tittle_left_heading">
					<h1>예약페이지 테스트</h1>
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
								<h3>Order Details</h3>
								<hr>
								<!-- Resources -->
								<div class="x_car_access_filer_top_img">
									<img src="images/c2.png" alt="car_img">
									<h3>Dakota gtx</h3>
									<p>$69 (1 day)</p>
								</div>
								<hr>
								<!-- Company -->
								
								<!-- Attributes -->
								<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#"> Pick-up Date & place</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>2021. 10. 3.<input type="hidden" id="startDate" value="2021-10-03"></li>
													<li><a>Barcelona <input type="hidden" id="takePlaceBasic" value="Barcelona"></a><a>Airport<input type="hidden" id="takePlaceDetail" value="Airport"></a></li>
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
											<a href="#"> Drop-Off Date & place</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>2021. 10. 4.<input type="hidden" id="endDate" value="2021-10-04"></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">옵션</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>TYPE <span>일반<input type="hidden" id="rentType" value="일반"></span>
													</li>
													<li>ESTIMATE <span>100<input type="hidden" id="estimate" value="100"></span>
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
											<a href="#">보험</a>
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
								<div class="x_car_acc_filter_bottom_total">
									<ul>
										<li>total <span>100<input type="hidden" id="price" value="100"></span>
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
										<h4>Billing Details</h4>
									</div>
									<hr>
									<form class="billing-form">
										<ul class="list-unstyled row">
											<li class="col-md-6"><label>이름 <input id="receiver" name="receiver" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-6"><label>연락처 <input id="phone" name="phone" type="text" placeholder="" class="form-control">
											</label></li>
										</ul>
										<hr>
										<div class="payme-opton">
											<div class="heading-block text-left margin-bottom-30">
												<h4>결제수단</h4>
											</div>
											<div>
												<label><input type="radio" name="pay" value="kakaopay">카카오페이</label>
											</div>
											<div>
												<label><input type="radio" name="pay" value="card">신용/체크카드</label>
											</div>
											<div>
												<label><input type="radio" name="pay" value="trans">실시간계좌이체</label>
											</div>
											<div>
												<label><input type="radio" name="pay" value="vbank">가상계좌</label>
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
										<div><label><input type="checkbox" id="chk_all" name="agreement" value="selectAll">위 결제/대여 규정을 모두 확인하였으며, 회원 본인은 결제에 동의합니다.</label></div>
										<br>
										<div>Possible은 통신판매중개자로서 여행갈카의 거래당사자가 아니며 상품정보, 거래조건 및 거래에 관련한 의무와 책임은 각 판매자에게 있습니다.</div>
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
									<li><a href="#">Place an Order <i
											class="fa fa-arrow-right"></i></a></li>
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
	<input type="hidden" id="carSeq" value="2">
	<input type="hidden" id="takePlaceCode" value="23413">
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
							location.href = 'paymentFin?seq=' + 120;
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
	
</script>

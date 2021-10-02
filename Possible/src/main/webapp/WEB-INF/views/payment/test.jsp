<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


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
													<li>2021. 10. 3.<input type="hidden" id="startDate" value="2021. 10. 3."></li>
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
													<li>2021. 10. 4.<input type="hidden" id="endDate" value="2021. 10. 4."></li>
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
										<div class="chkbox_group">
											<div><label><input type="checkbox" id="chk_all" name="agreement" value="selectAll">전체동의</label></div>
											<div><label><input type="checkbox" class="chk" id="chk1" name="agreement" value="terms1">여행갈카 대여 규정 및 약관 동의 (필수)</label></div>
											<div><label><input type="checkbox" class="chk" id="chk2" name="agreement" value="terms2">개인정보 수집·이용 및 제3자 정보제공 (필수)</label></div>
											<div><label><input type="checkbox" class="chk" id="chk3" name="agreement" value="terms3">취소 및 위약금 규정 동의 (필수)</label></div>
											<div><label><input type="checkbox" class="chk" id="chk4" name="agreement" value="terms4">자동차 표준 대여 약관 동의 (필수)</label></div>
											<div><label><input type="checkbox" class="chk" id="chk5" name="agreement" value="terms5">대여자격 확인 동의 (필수)</label></div>
										</div>
										<div>Possible은 통신판매중개자로서 여행갈카의 거래당사자가 아니며 상품정보, 거래조건 및 거래에 관련한 의무와 책임은 각 판매자에게 있습니다.</div>
										<div class="text-center">
											<input id="payBtn" name="payBtn" class="btn btn-main btn-round-full" type="button" value="결제하기">
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
</form>


<script>
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
					// DB에 데이터 삽입
					$.ajax({
						url: 'payment',
						type: 'POST',
						dataType: 'json',
						contentType: 'application/json',
						data: { 
								rentType : rentType,
								startDate : startDate,
								endDate : endDate,
								receiver : receiver,
								price : price,
								estimate : estimate,
								status : status,
								takePlaceBasic : takePlaceBasic,
								takePlaceDetail : takePlaceDetail,
								carSeq : carSeq,
								memSeq : memSeq				
						},
						success: function(response) {
							if(response.result == true) {
								let msg = '결제가 완료되었습니다.';
								alert(msg);
							}
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

	
	
	/* 체크박스 전체 선택, 전체 해제 */
	$('.chkbox_group').on('click', '#chk_all', function() {
		console.log(this);
		const checked = $(this).is(':checked');

		if (checked) {
			$(this).parents('.chkbox_group').find('input').prop('checked', true);
		} else {
			$(this).parents('.chkbox_group').find('input').prop('checked', false);
		}
	});
	
	/* 개별 체크박스 항목이 선택 해제 될 때 전체선택 해제 */
	$('.chkbox_group').on('click', '.chk', function() {
		let is_checked = true;

		$('.chkbox_group .chk').each(function() {
			is_checked = is_checked && $(this).is(':checked');
		});

		$('#chk_all').prop('checked', is_checked);
	});
</script>

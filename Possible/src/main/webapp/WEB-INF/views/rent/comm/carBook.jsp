<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    background-color: yellow;
	    padding-top: 5px;
	    padding-left: 35px;
	    padding-right: 12px;
	    border-radius: 10px;
	    padding-bottom: 4px;
	}

	.how_many_driver ul li {
		float: left;
		margin: 10px;
		padding-left: 0px;
		margin-left: 0px;
		padding-right: 20px;
		font-weight: 600;
	}

	.how_many_driver ul li label {
		margin-bottom: 0px;
	}

	.license_warning {
		width: 75%;
		margin: 0 auto;
		padding: 30px;
		background-color: white;
		border-radius: 10px;
		border: 1px solid #a9a9a9 /* #ebebeb */;
	}

	.pay-method {
		display: inline-block;
		padding-right: 80px;
	}

	.pay-method:last-child {
		padding-right: 20px;
	}

	.pay-method-wrapper {
		background-color: yellow;
		padding-top: 15px;
		padding-bottom: 5px;
		padding-left: 35px;
		width: 100%;
		background-color: yellow;
		border-radius: 10px;
	}

	input[type=radio], input[type=checkbox] {
		vertical-align: middle;
	}


	.option-box {
		border-radius: 10px;
		border: 1px solid #ebebeb;
		min-height: 50px;
		font-weight: 400;
		overflow: hidden;
	}

	.option-box li {
		float: left;
		margin-right: 45px;
	}

	.order-billing .billing-form li label {
	    line-height: 20px;
	    margin: 0px;
	    text-transform: uppercase;
	    font-weight: 600;
	    font-size: 15px;
	    width: 100%;
	}

	.ins_label {
		line-height: 20px;
	    margin: 0px;
	    text-transform: uppercase;
	    width: 100%;
	    padding-top: 15px;
	    padding-left: 15px;
	    cursor: pointer;
	}

</style>

<div class="btc_tittle_main_wrapper">
	<div class="mb-3">
		<div class="page-header page-header-dark bg-primary-600 text-dark">
			<div class="container py-2">
				<div class="page-header-content header-elements-inline">
					<div class="page-title text-white">
						<h1 class="font-weight-bold">렌트카 예약</h1>
						<h6>예약 전 한번 더 꼼꼼히 확인해주세요!</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left my-4">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4">
				<div class="x_car_book_left_siderbar_wrapper float_left">
					<!-- Filter Results -->
					<div class="car-filter accordion x_inner_car_acc_accor card">
						<div class="card-header bg-white">
							<h5 class="card-title">
								예약정보
							</h5>
						</div>
						<!-- Resources -->
						<div class="card-img p-3 border-bottom">
							<img class="card-img-top img-fluid" src="${pageContext.request.contextPath}${car.modelCodeVO.img}" alt="car_img">
							<h6 class="mt-2">${car.brandCodeVO.name} ${car.modelCodeVO.name}</h6>
							<p>${car.trimCodeVO.name}</p>
							<h3 class="text-center text-primary font-weight-bold">${car.price}원</h3>
						</div>
						<div class="card-body">
							<div class="form-group">
								<h6 class="font-weight-bold">대여 날짜</h6>
								<input type="text" id="start" name="start" class="form-control pickadate-format">
							</div>
							<div class="form-group">
								<h6 class="font-weight-bold">반납 날짜</h6>
								<input type="text" id="end" name="end" class="form-control pickadate-format">
							</div>
							<div class="form-group">
								<h6 class="font-weight-bold">렌트카 대여/반납 장소</h6>
								(${car.companyVO.postal})<br>
								${car.companyVO.addr1}<br>
								${car.companyVO.addr2}
							</div>
							<hr>
							<div class="form-group">
								<h6 class="font-weight-bold">렌트정보</h6>
								<ul class="list-unstyled">
									<li><i class="icon-check2 pr-2"></i>렌트타입 : 일반렌트</li>
									<li><i class="icon-check2 pr-2"></i>대여업체 : ${car.companyVO.name}</li>
									<li>
										<i class="icon-check2 pr-2"></i>차량정보
										<ul>
											<li>연식 : ${car.year}년식</li>
											<li>연료 : ${car.fuelCodeVO.name}</li>
											<li>색상 : ${car.colorCodeVO.name}</li>
											<li>기어 : ${car.missionCodeVO.name}</li>
											<li>연비 : ${car.kmpl}km/l</li>
										</ul>
									</li>
									<li><i class="icon-check2 pr-2"></i>옵션
										<ul>
											<c:forEach var="option" items="${car.optionList}">
												<li><i class="icon-checkbox-checked pr-2"></i>${option.optName}</li>
											</c:forEach>
										</ul>
									</li>
								</ul>
							</div>
						</div>
						<div class="x_car_acc_filter_bottom_total card-footer">
							총 결제금액 <span>{차가격+보험가격}원<input type="hidden" id="price" value="100"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8">
				<div class="x_carbooking_right_section_wrapper card">
					<div class="card-header">
						<h4 class="card-title">결제정보</h4>
					</div>
					<div class="card-body">

					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="x_car_checkout_right_main_box_wrapper float_left">
								<div class="car-filter order-billing margin-top-0">
									<hr>
									<div class="how_many_driver">
										<ul>
											<li><label><input type="radio" name="driver" id="driver1" checked> 운전자 1명</label></li>
											<li><label><input type="radio" name="driver" id="driver2"> 운전자 2명</label></li>
										</ul>
									</div>
									<form class="billing-form">
										<ul class="list-unstyled row" style="margin-bottom: 50px;">
											<li style="padding: 10px 15px; font-weight: bold; color: black;}">예약자 정보</li>
											<li class="col-md-12"><label>이름* <input id="receiver" name="receiver" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>연락처* <input id="phone" name="phone" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>생년월일(yy/mm/dd)* <br><input id="birth" name="birth" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>이메일* <input id="email" name="email" type="text" placeholder="" class="form-control">
											</label></li>
										</ul>

										<ul class="list-unstyled row driver2" style="margin-bottom: 50px;">
											<li style="padding: 15px; padding-bottom: 10px; padding-top: 0px; font-weight: bold; color: black;}">제 2 운전자 정보</li>
											<li class="col-md-12"><label>이름* <input id="receiver2" name="receiver2" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>연락처* <input id="phone2" name="phone2" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>생년월일(yy/mm/dd)* <br><input id="birth2" name="birthB" type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-12"><label>이메일* <input id="email2" name="email2" type="text" placeholder="" class="form-control">
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
												<ul class="option-box iop01" style="width: 60%;">
													<li style="margin-bottom: 0px;">
														<a href="#"><label for="iop01" class="ins_label iop01_label" ><input class="ins_radio" type="radio" id="iop01" name="insure" value="">
														<i class="fa fa-check-square" style="font-size: 12px;"></i>&nbsp;&nbsp;<span style="margin-right: 210px;">일반자차 </span><span>+{0}원</span></label></a>
													</li>
												</ul>
											</div>

											<div>
												<ul class="option-box iop02 mt-3" style="width: 60%;">
													<li style="margin-bottom: 0px;">
														<a href="#"><label for="iop02" class="ins_label iop02_label" ><input class="ins_radio" type="radio" id="iop02" name="insure" value="">
														<i class="fa fa-check-square" style="font-size: 12px;"></i>&nbsp;&nbsp;<span style="margin-right: 210px;">완전자차 </span><span>+{25,000}원</span></label></a>
													</li>
												</ul>
											</div>

										</div>
										<hr>

										<!-- 결제수단 -->
										<div class="payme-opton">
											<div class="heading-block text-left margin-bottom-30">
												<h4>결제수단</h4>
											</div>
											<div class="pay-method-wrapper">
												<div class="pay-method">
													<label><input type="radio" name="pay" value="kakaopay"> 카카오페이</label>
												</div>
												<div class="pay-method">
													<label><input type="radio" name="pay" value="card"> 신용/체크카드</label>
												</div>
												<div class="pay-method">
													<label><input type="radio" name="pay" value="trans"> 실시간계좌이체</label>
												</div>
												<div class="pay-method">
													<label><input type="radio" name="pay" value="vbank"> 가상계좌</label>
												</div>
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
															<p style="padding: 15px;">
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
															<p style="padding: 15px;">내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
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
															<p style="padding: 15px;">내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
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
															<p style="padding: 15px;">내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
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
															<p style="padding: 15px;">내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
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
						<!--
						<div class="col-md-12">
							<div class="contect_btn contect_btn_contact">
								<ul>
									<li><a href="#">결제하기 <i class="fa fa-arrow-right"></i></a></li>
								</ul>
							</div>
						</div>
						 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		initPickadate();
	})

	function initPickadate(){
		let startPicker = $("#start").pickadate('picker');
		let endPicker = $("#end").pickadate('picker');

		startPicker.set('select', new Date('<fmt:formatDate value="${start}" pattern="yyyy/MM/dd" />') );
		endPicker.set({
			min : 1,
			select : new Date('<fmt:formatDate value="${end}" pattern="yyyy/MM/dd" />')
		});

		startPicker.on('close', function(){
			let minDate = new Date(startPicker.get('select','yyyy,mm,dd'));
			minDate.setDate(minDate.getDate()+1);
			endPicker.set('min', minDate).set('clear');
		});
	}

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
							location.href = 'bookCmpl?merchantUid=' + merchantUid + "&carSeq=" + carSeq;
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

	$('.ins_radio').hide();


	$('.iop01_label').on('click', function(){
		$('.iop01').prop('checked', true);
	});

	$('.iop02_label').on('click', function(){
		$('.iop02').prop('checked', true);
	});


	$('.option-box li').on('click', function(){
		var chk01 = $('#iop01').is(':checked');
		var chk02 = $('#iop02').is(':checked');

		if(chk01 == true){
			$('.iop01').css('background-color', 'yellow');
			$('.iop02').css('background-color', 'white');
		}

		if(chk02 == true){
			$('.iop01').css('background-color', 'white');
			$('.iop02').css('background-color', 'yellow');
		}

	});

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


<div style="margin-top: 100px;">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- div3 card -->
			<div class="card shadow p-5 mb-5 rounded">
				<h4>결제창</h4>
				<!-- div2 -->
				<div>
					<!-- div1 -->
					<div>
						<!-- 결제폼 -->
						<form id="payFrm" name="payFrm" action="payment.do" method="post">
							<input type="hidden" id="" name="">

							<!-- 이용자정보 -->
							<div>
								<div>
									<div>예약자 정보</div>
									<div>이름: {이름}</div>
									<div>연락처: {연락처}</div>
									<div>생년월일: {생년월일}</div>
									<div>이메일: {이메일}</div>
								</div>
								<div>
									<div>운전자 정보</div>
									<div>[체크] 예약자와 동일함</div>
									<!-- 예약자와 동일함 체크 시, 예약자 정보가 넘어온다. -->
									<div>이름: {이름}</div>
									<div>연락처: {연락처}</div>
									<div>생년월일: {생년월일}</div>
									<div>이메일: {이메일}</div>
								</div>
							</div>

							<!-- 결제정보 -->
							<div class="col-lg-12">
								<input type="hidden" id="" name=""> <!-- 가격 -->
								<div>결제수단</div>
								<div>
									<label><input type="radio" name="pay" value="kakaopay">카카오페이</label>
									<label><input type="radio" name="pay" value="card">신용/체크카드</label>
									<label><input type="radio" name="pay" value="trans">실시간계좌이체</label>
									<label><input type="radio" name="pay" value="vbank">가상계좌</label>
								</div>
							</div>


							<table border="1">
								<tr>
									<th width="200">이용권</th>
									<td colspan="2"><select id="ticket" name="ticket">
											<option value="">선택</option>
											<option value="1000">30분(1,000원)</option>
											<option value="2000">1시간(2,000원)</option>
											<option value="3500">2시간(3,500원)</option>
											<option value="7000">4시간(7,000원)</option>
											<option value="10000">8시간(10,000원)</option>
											<option value="15000">12시간(15,000원)</option>
											<option value="25000">24시간(25,000원)</option>
									</select></td>
								</tr>
							</table>

							<!-- 꼭 확인해주세요!
										1. 업체 및 차량마다 요구하는 운전경력 및 나이가 상이하니 반드시 대여규정을 확인해 주시기 바랍니다.
										2. 운전자 정보는 렌터카 이용 시 긴급사항 발생에 대비하여 즉시 연락이 가능한 정보를 입력하셔야 합니다.
										3. 잘못된 정보 또는 수신이 불가한 정보 입력으로 발생되는 불이익에 대해 당사는 책임지지 않으니 유의해 주시기 바랍니다.
										4. 운전자 추가 등록은 차량 대여 시 현장에서 신청 가능합니다.
										5. 대여규정 및 약관동의 미확인으로 인한 불이익에 대해 당사는 책임지지 않으니 유의해주시기 바랍니다.
										6. 면허증 미지참시 인수 거절 될 수 있으므로 유의해주시기 바랍니다. -->

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
								<input class="btn btn-main btn-round-full" type="button" value="결제하기">
							</div>
							<!-- [체크박스] 위 내용을 모두 확인하였으며, 회원 본인은 결제에 동의합니다. -->
						</form>
						<!-- End of payment form -->
					</div>
					<!-- End of div1 -->
				</div>
				<!-- End of div2 -->
			</div>
			<!-- End of div3 card -->
		</div>
		<!-- End of row -->
	</div>
	<!-- End of container -->
</div>

<!-- DB 데이터 입력폼 -->
<form name="data" action="insertDB.do" method="post">
	<!-- otd / payment table -->
	<input type="hidden" id="payment_price" name="payment_price" value="">
	<input type="hidden" id="payment_method" name="payment_method" value="">
	<!-- otd / history table -->
	<input type="hidden" id="ticket_no" name="ticket_no" value="">
	<input type="hidden" id="history_date" name="history_date" value="">
	
	
	<!-- payment table -->
	<input type="hidden" id="mdUid" name="mdUid" value="">
	<input type="hidden" id="name" name="name" value="">
	<input type="hidden" id="amount" name="amount" value="">
	<input type="hidden" id="method" name="method" value="">
	<input type="hidden" id="buyerName" name="buyerName" value="">
	<input type="hidden" id="buyerTel" name="buyerTel" value="">
	<input type="hidden" id="memSeq" name="memSeq" value="">
</form>

<!-- 
	mdUid
	name
	amount
	method
	buyerName
	buyerTel
	memSeq
-->


<script>
	$(document).ready(function(){
		
		IMP.init('imp77605435'); /* 가맹점 식별코드 초기화 */
	
		/* 폼전송 버튼 누르면 paymentFnc() 실행 */
		$('.btn').on('click', function(event) {
			event.preventDefault();
			paymentFnc();
		})
		
		function paymentFnc() {

			/* 
			data.ticket_no.value = merchant_uid; //21/08/18
			data.payment_price.value = ticketSelect;
			data.payment_method.value = payment; */
			
			let merchant_uid = 'pay_' + new Date().getTime(); /* 주문번호 */
			let payment = $('input[name="pay"]:checked').val(); /* 결제방법 */
			let ticketSelect = $('#ticket').val(); /* 테스트용 가격 */

			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : payment,
				merchant_uid : merchant_uid,
				name : 'goods', /* 주문명 */
				amount : ticketSelect,
				buyer_name : '${sessionName}',
				buyer_tel : '${sessionPhone}'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					alert(msg);
					// 그 다음 실행
					data.submit();
				} else {
					var msg = '결제에 실패하였습니다.';
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

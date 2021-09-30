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
						<form id="payFrm" name="payFrm" action="" method="post">
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
<form id="data" name="data" action="paymentInsert" method="post">
	<input type="hidden" id="seq" name="seq" value="${seq.seq}">
	<input type="hidden" id="rentType" name="rentType" value="rentType">
	<input type="hidden" id="startDate" name="startDate" value="2021/09/29">
	<input type="hidden" id="receiveDate" name="receiveDate" value="2021/09/29">
	<input type="hidden" id="returnDate" name="returnDate" value="2021/09/29">
	<input type="hidden" id="endDate" name="endDate" value="2021/09/29">
	<input type="hidden" id="receiver" name="receiver" value="박기자">
	<input type="hidden" id="price" name="price" value="500">
	<input type="hidden" id="estimate" name="estimate" value="500">
	<input type="hidden" id="status" name="status" value="status">
	<input type="hidden" id="takePlaceCode" name="takePlaceCode" value="00000">
	<input type="hidden" id="takePlaceBasic" name="takePlaceBasic" value="경상북도 울릉군 남면도동 1번지">
	<input type="hidden" id="takePlaceDetail" name="takePlaceDetail" value="동경 132 북위 37">
	<input type="hidden" id="merchantUid" name="merchantUid" value="123456789">
	<input type="hidden" id="payMethod" name="payMethod" value="kakaopay">
	<input type="hidden" id="carSeq" name="carSeq" value="1">
	<input type="hidden" id="memSeq" name="memSeq" value="1">
</form>

<script>

	const seq = $('#seq').val();
	
	$(document).ready(function(){
		IMP.init('imp77605435'); /* 가맹점 식별코드 초기화 */
	
		/* 폼전송 버튼 누르면 paymentFnc() 실행 */
		$('.btn').on('click', function(event) {
			event.preventDefault();
			paymentFnc();
		})
		
		/* 결제함수 */
		function paymentFnc() {
			let merchant_uid = new Date().getTime(); /* 주문번호 */
			let payment = $('input[name="pay"]:checked').val(); /* 결제방법 */

			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : payment,
				merchant_uid : merchant_uid,
				name : 'SM5여행갈카', /* 주문명 */
				amount : '500', /* 가격 */
				buyer_name : '{sessionName}',
				buyer_tel : '{sessionPhone}',
				m_redirect_url : 'http://localhost:8080/orderCompleteMobile'
				
			}, function(rsp) {
				
				console.log(rsp);
				/* 결제검증 */
				$.ajax({
		        	type : "POST",
		        	url : "/verifyIamport/" + rsp.imp_uid 
		        }).done(function(data) {
		        	console.log(data);
		        	/* rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증) */
		        	if(rsp.paid_amount == data.response.amount){
			        	alert("결제가 완료되었습니다.");
						data.submit();
						location.href = "paymentOneSelect";	
		        	} else {
		        		let msg = '결제에 실패하였습니다.';
		        		msg += '에러내용 : ' + rsp.error_msg;
		        		alert(msg);
		        	}
		        });				
			});
			
		}

		

/* 		if (rsp.success) {
			let msg = '결제가 완료되었습니다.';
			alert(msg);
			data.submit();
			location.href = "paymentOneSelect";
		} else {
			let msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}		 */

		
		
		/* DB에 결제 정보 넘기기 AJAX로 해보려고 했던 흔적
		$.ajax({
			url: '/paymentInsert',
			data: { 
					rentType : $('#rentType').val()
					, startDate : $('#startDate').val()
					, receiveDate : $('#receiveDate').val()
					, returnDate : $('#returnDate').val()
					, endDate : $('#endDate').val()
					, receiver : $('#receiver').val()
					, price : $('#price').val()
					, estimate : $('#estimate').val()
					, status : $('#status').val()
					, takePlaceCode : $('#takePlaceCode').val()
					, takePlaceBasic : $('#takePlaceBasic').val()
					, takePlaceDetail : $('#takePlaceDetail').val()
					, merchantUid : merchant_uid
					, payMethod : payment
					, carSeq : $('#carSeq').val()
					, memSeq : $('#memSeq').val()
			},
			type: 'POST',
			success: function(data){
				location.href = "payment";
			},
			error: function(){
				alert('error');
			}
		});
		 */
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

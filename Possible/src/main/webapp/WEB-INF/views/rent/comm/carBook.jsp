<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 렌트 예약(결제) 페이지 -->

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<c:set var="during" value="${endDate.date - startDate.date}"/>
<sec:authentication property="principal" var="user"/>
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
							<h6 class="font-weight-bold mt-2 mb-1">${car.brandCodeVO.name} ${car.modelCodeVO.name}</h6>
							<p class="mb-0">${car.trimCodeVO.name}</p>
                            <hr>
                            <p>대여가격<span class="h5 float-right text-primary font-weight-bold">${car.price * during}원</span></p><div class="clearfix"></div>
                            <p>보험가격<span class="h5 float-right text-primary font-weight-bold">${insurance.price * during}원</span></p><div class="clearfix"></div>
						</div>
						<div class="card-body">
							<div class="form-group position-relative">
								<h6 class="font-weight-bold">대여 날짜</h6>
                                <p>
                                    <fmt:formatDate value="${startDate}" pattern="yyyy년 MM월 dd일 (EEE)" />
                                </p>
							</div>
							<div class="form-group position-relative">
								<h6 class="font-weight-bold">반납 날짜</h6>
                                <p>
                                    <fmt:formatDate value="${endDate}" pattern="yyyy년 MM월 dd일 (EEE)" />
                                </p>
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
                                    <li><i class="icon-check2 pr-2"></i>보험종류 : ${insurance.optName}</li>
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
						<div class="x_car_acc_filter_bottom_total card-footer text-center">
                            <h5>총 결제금액 <span class="h3 text-primary font-weight-bold pl-2">${(car.price + insurance.price) * during}원</span></h5>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8">
				<div class="x_carbooking_right_section_wrapper card">
					<div class="card-header bg-white">
						<h5 class="card-title">결제정보</h5>
					</div>
					<div class="card-body">
                        <form id="payFrm" name="payFrm" class="billing-form">
                            <input type="hidden" name="rentType" value="일반렌트">
                            <input type="hidden" name="start" value="<fmt:formatDate value="${startDate}" pattern="yy/MM/dd" />">
                            <input type="hidden" name="end" value="<fmt:formatDate value="${endDate}" pattern="yy/MM/dd" />">
                            <input type="hidden" name="price" value="${(car.price + insurance.price) * during}">
                            <input type="hidden" name="cmpn_postal" value="${car.companyVO.postal}">
                            <input type="hidden" name="cmpn_addr1" value="${car.companyVO.addr1}">
                            <input type="hidden" name="cmpn_addr2" value="${car.companyVO.addr2}">
                            <input type="hidden" name="car" value="${car.seq}">
                            <input type="hidden" name="user" value="${user.seq}">
                            <input type="hidden" name="cmpn" value="${car.companyVO.seq}">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card rounded-lg border-primary-300 border-1">
                                        <div class="card-header">
                                            <h4 class="card-title font-weight-bold">예약자 정보</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label>성함 <span class="text-danger">*</span></label>
                                                <input type="text" name="receiver" class="form-control" value="${user.name}">
                                            </div>
                                            <div class="form-group">
                                                <label>연락처 <span class="text-danger">*</span></label>
                                                <input type="text" name="phone" class="form-control" value="${user.phone}">
                                            </div>
                                            <div class="form-group position-relative">
                                                <label>생년월일 <span class="text-danger">*</span></label>
                                                <input type="text" name="birth" class="form-control pickadate-format" value="<fmt:formatDate value="${user.birth}" pattern="yyyy/MM/dd"/>">
                                            </div>
                                            <div class="form-group">
                                                <label>이메일 <span class="text-danger">*</span></label>
                                                <input type="text" name="email" class="form-control" value="${user.email}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card rounded-lg border-grey-300 border-1">
                                        <div class="card-body text-center">
                                            <div class="mb-3"><img src="${pageContext.request.contextPath}/resources/images/licenseimg.svg" alt=""></div>
                                            <div>차량 대여 시, 운전자는 운전면허증을 꼭 지참해주세요.</div>
                                            <div>면허증 확인 및 계약서 작성이 꼭 필요합니다.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card rounded-lg border-primary-300 border-1">
                                        <div class="card-header">
                                            <h4 class="card-title font-weight-bold">보험 정보</h4>
                                        </div>
                                        <div class="card-body">
                                            <h6 class="font-weight-bold">대인/대물/자손 보상한도</h6>
                                            <table class="table table-sm table-bordered">
                                                <colgroup>
                                                    <col width="60%">
                                                    <col width="40%">
                                                </colgroup>
                                                <tr>
                                                    <td class="bg-indigo-300">
                                                        <h6 class="mb-0">대인1·2</h6>
                                                        상대방 인명피해 시
                                                    </td>
                                                    <td class="text-center">무한</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-indigo-300">
                                                        <h6 class="mb-0">대물</h6>
                                                        상대방 물건(차량) 피해 시
                                                    </td>
                                                    <td class="text-center">최대 5,000만원</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-indigo-300">
                                                        <h6 class="mb-0">자손</h6>
                                                        운전자 본인 사망 시
                                                    </td>
                                                    <td class="text-center">최대 1,000만원</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-indigo-300">
                                                        <h6 class="mb-0">자손</h6>
                                                        운전자 본인 부상 시
                                                    </td>
                                                    <td class="text-center">최대 1,000만원</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-indigo-300">
                                                        <h6 class="mb-0">자손</h6>
                                                        운전자 본인 후유장애 시
                                                    </td>
                                                    <td class="text-center">최대 1,000만원</td>
                                                </tr>
                                            </table>
                                            <p class="h6 mt-3">보험은 현장에서 작성하는 계약서를 기준으로 적용됩니다. 반드시 계약서를 확인해주시기 바랍니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card rounded-lg border-primary-300 border-1">
                                        <div class="card-header">
                                            <h4 class="card-title font-weight-bold">결제 수단</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="payme-opton">
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
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card rounded-lg border-primary-300 border-1">
                                        <div class="card-header">
                                            <h4 class="card-title font-weight-bold">유의사항</h4>
                                        </div>
                                        <div class="card-body">
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
                                            <hr>
                                            <div>
                                                <div class="card mb-0 rounded-bottom-0">
                                                    <div class="card-header">
                                                        <h6 class="card-title">
                                                            <a data-toggle="collapse" class="text-default collapsed" href="#collapsible-item-group1" aria-expanded="false">여행갈카 대여 규정 및 약관 동의</a>
                                                        </h6>
                                                    </div>

                                                    <div id="collapsible-item-group1" class="collapse" style="">
                                                        <div class="card-body">
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
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card mb-0 rounded-0 border-y-0">
                                                    <div class="card-header">
                                                        <h6 class="card-title">
                                                            <a class="text-default collapsed" data-toggle="collapse" href="#collapsible-item-group2" aria-expanded="false">개인정보 수집·이용 및 제3자 정보제공</a>
                                                        </h6>
                                                    </div>

                                                    <div id="collapsible-item-group2" class="collapse" style="">
                                                        <div class="card-body">
                                                            내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card mb-0 rounded-0 border-y-0">
                                                    <div class="card-header">
                                                        <h6 class="card-title">
                                                            <a class="text-default collapsed" data-toggle="collapse" href="#collapsible-item-group3" aria-expanded="false">취소 및 위약금 규정 동의</a>
                                                        </h6>
                                                    </div>

                                                    <div id="collapsible-item-group3" class="collapse" style="">
                                                        <div class="card-body">
                                                            내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card mb-0 rounded-0 border-y-0">
                                                    <div class="card-header">
                                                        <h6 class="card-title">
                                                            <a class="text-default collapsed" data-toggle="collapse" href="#collapsible-item-group4" aria-expanded="false">자동차 표준 대여 약관 동의</a>
                                                        </h6>
                                                    </div>

                                                    <div id="collapsible-item-group4" class="collapse" style="">
                                                        <div class="card-body">
                                                            내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card rounded-top-0">
                                                    <div class="card-header">
                                                        <h6 class="card-title">
                                                            <a class="text-default collapsed" data-toggle="collapse" href="#collapsible-item-group5" aria-expanded="false">대여자격 확인 동의</a>
                                                        </h6>
                                                    </div>

                                                    <div id="collapsible-item-group5" class="collapse" style="">
                                                        <div class="card-body">
                                                            내용ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="car-filter order-billing margin-top-0">
                                                <div>
                                                    <label><input type="checkbox" id="chk_all" name="agreement" value="selectAll"> 위 결제/대여 규정을 모두 확인하였으며, 회원 본인은 결제에 동의합니다.</label>
                                                </div>
                                                <small>팀 Possible은 통신판매중개자로서 여행갈카의 거래당사자가 아니며 상품정보, 거래조건 및 거래에 관련한 의무와 책임은 각 판매자에게 있습니다.</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
					</div>
                    <div class="card-footer">
                        <button id="payBtn" type="button" class="btn btn-block mb-0 btn-lg h5 btn-primary" disabled>결제하기</button>
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
		let startPicker = $("[name='birth']").pickadate('picker');
		startPicker.set({
            format: 'yyyy년 mm월 dd일',
            min : false,
            select : new Date($("[name='birth']").val())
        });
	}

	// 문제1. seq값을 넘겨서 단건조회를 하고 싶은데 seq값을 넘기는 방법을 모르겠음.
	$(document).ready(function(){

		IMP.init('imp77605435'); /* 가맹점 식별코드 초기화 */

		/* 폼전송 버튼 누르면 paymentFnc() 실행 */
		$('#payBtn').on('click', function(event) {
			event.preventDefault();
			paymentFnc();
		})

		/* 결제 함수 */
		function paymentFnc() {
			let merchantUid = 'm_' + Math.floor(Math.random() * 10000000000) + 1; /* 주문번호 */
			let payMethod = $('input[name="pay"]:checked').val(); /* 결제방법 */

            let rentType = payFrm.rentType.value;
			let startDate = payFrm.start.value;
			let endDate = payFrm.end.value;
			let receiver = payFrm.receiver.value;
			let price = 100;// payFrm.price.value;
			let email = payFrm.email.value;
			// let estimate = $('#estimate').val();
			let takePlaceCode = payFrm.cmpn_postal.value;
			let takePlaceBasic = payFrm.cmpn_addr1.value;
			let takePlaceDetail = payFrm.cmpn_addr2.value;
			let carSeq = payFrm.car.value;
			let memSeq = payFrm.user.value;
			let cmpnSeq = payFrm.cmpn.value;

			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : payMethod,
				merchant_uid : merchantUid,
				name : '${car.brandCodeVO.name.concat(" ").concat(car.modelCodeVO.name)} 여행갈카', /* 주문명 */
				amount : price, /* 가격 */
				buyer_name : receiver,
				buyer_tel : payFrm.phone.value,
                buyer_email: email,
                buyer_addr: '${user.addrBasic.concat(" ").concat(user.addrDetail)}',
                buyer_postcode: '${user.addrCode}',
				m_redirect_url : 'http://localhost:8080/orderCompleteMobile'

			}, function(rsp) {
				if (rsp.success) {
					// DB에 데이터 삽입
					$.ajax({
						url: '${pageContext.request.contextPath}/commonRent/payment',
						type: 'POST',
						dataType: 'text',
						contentType: 'application/json',
						data: JSON.stringify({
								rentType : rentType,
								startDate : startDate,
								endDate : endDate,
								receiver : receiver,
								price : price,
								status : 'RST01',
								takePlaceCode : takePlaceCode,
								takePlaceBasic : takePlaceBasic,
								takePlaceDetail : takePlaceDetail,
								merchantUid : merchantUid,
								payMethod : payMethod,
								carSeq : carSeq,
								memSeq : memSeq,
                                cmpnSeq : cmpnSeq
						}),
						success: function(result) {
						    if(result === 'true'){
                                let msg = '결제가 완료되었습니다.';
                                customConfirm("결제 완료", msg, function(){
                                    location.href = 'bookCmpl?merchantUid=' + merchantUid;
                                });
                            }
						},
						error: function(xhr, status, message){
							alert('status: ' + status + ' er: ' + message);
						}
					});
					/* data.submit(); 성공 시 data폼의 데이터를 submit 한다. */
				} else {
					let msg = '결제에 실패하였습니다.\n';
					msg += '실패 이유 : ' + rsp.error_msg;
					customAlert("결제 실패",msg);
				}
			});
		}

	});


	// 결제수단을 선택하고 + 약관에 동의해야 결제버튼 활성화 됨
	$('#chk_all').on('click', function(){
		let chk = $(this).is(':checked');
		let pay = $('input[name="pay"]').is(':checked');

		if(chk === true && pay === true){
			$('#payBtn').prop('disabled', false);
		} else {
            $('#payBtn').prop('disabled', true);
		}
	});

	$('input[name="pay"]').on('click', function(){
		let chk = $('#chk_all').is(':checked');
		let pay = $(this).is(':checked');

		if(chk === true && pay === true){
            $('#payBtn').prop('disabled', false);
		} else {
            $('#payBtn').prop('disabled', true);
		}
	});
</script>

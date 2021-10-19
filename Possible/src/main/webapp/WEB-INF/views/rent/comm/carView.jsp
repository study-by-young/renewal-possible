<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 일반 렌트: 렌터카 목록 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="during" value="${endDate.date - startDate.date}"/>
<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600 text-dark">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title text-white">
                        <h1 class="font-weight-bold">렌트카 상세</h1>
                        <h6>고객님이 찾던 렌트카입니다!</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left mt-5">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4">
                <form id="payFrm" action="${pageContext.request.contextPath}/commonRent/view/book" method="get">
                    <input type="hidden" name="seq" value="${car.seq}">
                    <input type="hidden" name="ins" value="${insurance.optCode}">
                    <input type="hidden" name="startDate" value="<fmt:formatDate value="${startDate}" pattern="yyyy/MM/dd" />">
                    <input type="hidden" name="endDate" value="<fmt:formatDate value="${endDate}" pattern="yyyy/MM/dd" />">
                    <div class="x_car_book_left_siderbar_wrapper float_left card">
                        <div class="fee-information card-header bg-white car_booking_onliy_side">
                            <h5 class="card-title">결제정보</h5>
                        </div>
                        <div class="card-body">
                            <div class="x_slider_form_input_wrapper float_left form-group">
                                <h6>대여요금(자차보험 미포함)</h6>
                                <div>
                                    <span class="small text-muted">
                                        ${car.price}원 * ${during}일
                                    </span>
                                    <span class="h6 float-right font-weight-bold text-primary">${car.price * during}원</span>
                                </div>
                            </div>
                            <div class="x_slider_form_input_wrapper float_left form-group">
                                <h6>자차보험</h6>
                                <div>
                                    <span class="small text-muted">
                                        ${insurance.price}원 * ${during}일
                                    </span>
                                    <span class="h6 float-right font-weight-bold text-primary">${insurance.price * during}원</span>
                                </div>
                            </div>
                            <div class="x_slider_form_input_wrapper float_left">
                                <h6>예상 결제액</h6>
                                <div class="text-right font-weight-bold text-primary">
                                    <h6>${(car.price + insurance.price) * during}원</h6>
                                </div>
                            </div>
                        </div>
                        <div class="x_slider_checout_right card-footer">
                            <button class="h5 mb-0 btn btn-block btn-primary">예약하기</button>
                        </div>
                    </div>
                </form>
			</div>
			<!-- 차량 상세조회 -->
			<div class="col-xl-9 col-lg-8">
				<div class="x_slider_form_main_wrapper card">
					<div class="card-body">
						<div class="row">
							<div class="col-12">
                                <!-- 이미지 -->
                                <div class="lr_bc_slider_first_wrapper text-center py-2">
                                    <img src="${pageContext.request.contextPath}${car.modelCodeVO.img}" alt="car_img">
                                    <div>
                                        <small class="text-muted">차량 이미지는 이해를 돕기 위한 예시로, 배차 차량과 다를 수 있습니다.</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="text-center">
                                    <h4>${car.brandCodeVO.name} ${car.modelCodeVO.name} ${car.trimCodeVO.name}</h4>
                                </div>
                            </div>
                            <div class="col-12 my-5">
                                <div class="row text-center">
                                    <div class="col-md-5">
                                        <div class="form-sec-header text-center">
                                            <label class="h6">렌트 시작</label>
                                            <p class="form-control w-75 mx-auto bg-primary text-white h-auto"
                                                    style="border-radius: 5rem;"><fmt:formatDate value="${startDate}" pattern="yy/MM/dd (EEE)"/></p>
                                        </div>
                                    </div>
                                    <div class="col-md-2 align-self-end">
                                        <div class="form-sec-header text-center">
                                            <p class="text-grey-600"><i class="icon-arrow-right8 icon-2x"></i></p>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-sec-header text-center">
                                            <label class="h6">렌트 종료</label>
                                            <p class="form-control w-75 mx-auto bg-primary text-white h-auto"
                                                    style="border-radius: 5rem;"><fmt:formatDate value="${endDate}" pattern="yy/MM/dd (EEE)"/></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="card-body">
                                    <div class="border-bottom mb-4">
                                        <ul class="nav nav-tabs justify-content-center nav-tabs-solid border-0 bg-white shadow-0 mb-0">
                                            <li class="nav-item"><a href="#solid-rounded-tab1" class="nav-link active" data-toggle="tab">예약정보</a></li>
                                            <li class="nav-item"><a href="#solid-rounded-tab2" class="nav-link" data-toggle="tab">이용후기</a></li>
                                            <li class="nav-item"><a href="#solid-rounded-tab3" class="nav-link" data-toggle="tab">유의사항</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="solid-rounded-tab1">
                                            <div class="home-tab mb-4">
                                                <div class="home-tab-title">
                                                    <h5 class="font-weight-bold">차량 정보</h5>
                                                </div>
                                                <div class="border border-grey-400 rounded p-3 text-grey-600">
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.year}년식
                                                    </span>
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.fuelCodeVO.name}</span>
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.segmentCodeVO.name}
                                                    </span>
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.passenger}인
                                                    </span>
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.colorCodeVO.name}
                                                    </span>
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.missionCodeVO.name}
                                                    </span>
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.trunk}리터(L)
                                                    </span>
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.door}개
                                                    </span>
                                                    <span class="d-inline-block pr-2"><i class="icon-circle-small"></i>${car.kmpl}km/l</span>
                                                </div>
                                            </div>

                                            <!-- 차량옵션 -->
                                            <div class="home-tab mb-4">
                                                <div class="home-tab-title">
                                                    <h5 class="font-weight-bold">차량 옵션</h5>
                                                </div>
                                                <div class="border border-grey-400 rounded p-3 text-grey-600">
                                                    <c:forEach var="option" items="${car.optionList}">
                                                        <span class="pr-2 mb-1"><i class="icon-checkbox-checked2 text-primary"></i> ${option.optName}
                                                        </span>
                                                    </c:forEach>
                                                </div>
                                            </div>

                                            <!-- 운전자 대여조건 -->
                                            <div class="home-tab mb-4">
                                                <div class="home-tab-title">
                                                    <h5 class="font-weight-bold">운전자 대여조건</h5>
                                                </div>
                                                <div>
                                                    <p>
                                                        <i class="icon-checkbox-checked2 text-primary"></i> 운전자 나이 <strong>만 26세</strong> 이상
                                                    </p>
                                                    <p>
                                                        <i class="icon-checkbox-checked2 text-primary"></i> 면허취득일 <strong>1년 이상</strong></p>
                                                    <p>
                                                        <i class="icon-checkbox-checked2 text-primary"></i> 차량 대여 시 실물면허증 소지 (<strong>2종 보통</strong> 면허 이상 필요)
                                                    </p>
                                                    <p>
                                                        <i class="icon-checkbox-checked2 text-primary"></i> 업체별 <strong>대여규정 준수</strong> (외국인 대여, 낚시용품/애견 동반, 주행거리제한 규정 등)
                                                    </p>
                                                </div>
                                            </div>

                                            <!-- 셔틀운행 -->
                                            <div class="home-tab mb-4">
                                                <div class="home-tab-title">
                                                    <h5 class="font-weight-bold">무료 셔틀 정보</h5>
                                                </div>
                                                <div>
                                                    <img src="${pageContext.request.contextPath}/resources/images/image-shuttle-jeju.svg" class="w-100 mb-3" alt="">
                                                    <ul class="list-unstyled">
                                                        <li><i class="fa fa-check"></i> ${car.companyVO.area}공항에서 업체
                                                            차고지까지 편리하게 이동할 수 있도록 <strong>셔틀버스를 무료로 제공</strong>하고
                                                            있습니다.
                                                        </li>
                                                        <li><i class="fa fa-check"></i> <strong>운행
                                                            시간</strong>&nbsp;&nbsp;&nbsp;&nbsp;오전 08:00 ~ 오후 08:00
                                                        </li>
                                                        <li><i class="fa fa-check"></i> <strong>운행
                                                            정보</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong>20분 ~ 30분
                                                            간격</strong>으로 운행되며 10분 소요됩니다.
                                                        </li>
                                                        <li><i class="fa fa-check"></i> <strong>셔틀
                                                            문의</strong>&nbsp;&nbsp;&nbsp;&nbsp;053-421-2460
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <!-- 업체정보 -->
                                            <div class="home-tab mb-4">
                                                <div class="home-tab-title">
                                                    <h5 class="font-weight-bold">업체 정보</h5>
                                                </div>
                                                <div>
                                                    <ul class="list-unstyled">
                                                        <li class="mb-1"><i class="icon-office pr-2"></i> ${car.companyVO.name}</li>
                                                        <li class="mb-1"><i class="icon-location4 pr-2"></i> (${car.companyVO.postal}) ${car.companyVO.addr1} ${car.companyVO.addr2}</li>
                                                        <li class="mb-1"><i class="icon-phone2 pr-2"></i> 053-421-2460</li>
                                                        <li class="mb-1"><div id="takePlaceMap" style="height: 300px;"></div></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="solid-rounded-tab2">
                                            <div class="home-tab">
                                                <div class="home-tab-title">
                                                    <h3 class="font-weight-bold">후기</h3>
                                                    <i class="fa fa-thumbs-up"></i>&nbsp;&nbsp;여행갈카를 이용해주신 고객님들의 소중한 후기입니다.
                                                </div>
                                            </div>
                                            <div class="mt-4">
                                                <c:forEach var="review" begin="0" end="4">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5 class="card-title">
                                                                {review.title}
                                                                <span class="float-right">
                                                                    <span class="main-score-bg"><span class="main-score" style="width:80%"></span></span> (4/5)
                                                                </span>
                                                            </h5>
                                                            <div class="text-muted mt-2">
                                                                <span>
                                                                    <i class="icon-calendar"></i> {startDate} ~ {endDate} <br>
                                                                    <i class="icon-car"></i> {car.model}
                                                                </span>
                                                                <span class="float-right">
                                                                    <i class="icon-person"></i>{김**}
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div>
                                                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
                                                            </div>
                                                            <button type="button" class="btn btn-primary mt-3">여행코스 보기</button>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <!-- End foreach -->
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="solid-rounded-tab3">
                                            <div class="home-tab-title">
                                                <h3>렌트카 예약 전, 꼭 확인해주세요!</h3>
                                            </div>
                                            <div>
                                                <ul class="list-unstyled">
                                                    <li><i class="fa fa-check-square"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;렌트카 업체 영업시간 외
                                                        대여/반납이 필요한 경우 여행갈카 문의를 통한 상담 후 예약 진행해주세요.</li>
                                                    <li><i class="fa fa-check-square"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;외국인 대여, 낚시용품
                                                        지참, 애견동물 동반 가능 여부와 주행거리 제한 규정은 업체별로 상이하므로 업체별 대여규정을
                                                        확인해주세요. 대여조건이 맞지 않을 경우 렌트카 이용이 불가합니다.</li>
                                                </ul>
                                            </div>

                                            <div class="home-tab-title">
                                                <h3>여행갈카 이용 안내</h3>
                                            </div>
                                            <div>
                                                <ul class="list-unstyled">
                                                    <li
                                                            style="padding-left: 0px; font-size: 17px; margin-bottom: 5px;"><strong>대여조건</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;운전자 나이 <strong>만
                                                        26세</strong> 이상</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;면허취득일 <strong>1년
                                                        이상</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;차량 대여 시 실물면허증
                                                        소지 (<strong>2종 보통</strong> 면허 이상 필요)</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;업체별 <strong>대여규정
                                                        준수</strong> (외국인 대여, 낚시용품/애견 동반, 주행거리제한 규정 등)</li>
                                                    <li><i class="fa fa-angle-right"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;대여조건 미달로 렌트가
                                                        불가한 경우, 추가 수수료가 발생합니다.</li>
                                                    <li><i class="fa fa-angle-right"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;제 2운전자도 대여조건에
                                                        충족해야 하며, 계약서 작성을 해야 보험 효력이 발생합니다.</li>
                                                </ul>
                                                <ul class="list-unstyled">
                                                    <li
                                                            style="padding-left: 0px; margin-top: 30px; font-size: 17px; margin-bottom: 5px;"><strong>자동차
                                                        보험</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>자동차
                                                        보험의 정확한 보장 범위는 대여 시 작성하는 계약서를 기준으로 결정됩니다.</strong> 차량 대여 시
                                                        작성하는 계약서 내용을 반드시 확인해주세요.</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;사고 발생 시, 대인
                                                        1·2, 대물, 자손, 자차에서 각각의 면책금과 휴차 보상료가 발생합니다.</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;단독 사고, 휠/타이어,
                                                        중과실 사고 시에는 자차에 대한 보상이 적용이 불가할 수 있습니다.</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;차량 반납 이후에는
                                                        보험이 적용되지 않으며 보험 계약이 자동 해지됩니다.</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;여행갈카는 사고 시
                                                        운전자 피해 최소화를 위해 <strong>자동차 보험(대인 1·2, 대물, 자손,
                                                            자차) 가입 차량만 취급</strong>합니다.</li>
                                                </ul>
                                                <ul class="list-unstyled">
                                                    <li
                                                            style="padding-left: 0px; margin-top: 30px; font-size: 17px; margin-bottom: 5px;"><strong>차량
                                                        정비 및 사고</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;차량 정비는 렌트카
                                                        업체의 규정에 따라야 하며 이를 이행하지 않았을 경우 서비스 이용이 제한됩니다.</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;사고가 발생했을 경우
                                                        사고 상황을 즉시 렌트카 업체로 통보해야 하며 사고 처리는 렌트카 업체와의 계약 약관에 따라
                                                        진행됩니다.</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;차량 대여 시 보험,
                                                        정비 등 렌트카 업체의 규정에 관한 내용 및 작성한 계약서의 내용을 반드시 숙지해야 합니다.</li>
                                                </ul>
                                                <ul class="list-unstyled">
                                                    <li
                                                            style="padding-left: 0px; margin-top: 30px; font-size: 17px; margin-bottom: 5px;"><strong>연료
                                                        규정</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;차량 반납 시, 대여
                                                        시의 연료량과 동일하도록 주유하여 반납해야 합니다. (차량 대여 직후 계기판 사진 촬영 권장)</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;연료량이 모자를 경우,
                                                        추가 비용이 발생할 수 있으며 기존 연료량보다 많을 경우, 환불이 불가능합니다.</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;반납 시 주유 불충분에
                                                        대해서는 주유소의 가격과 상이할 수 있으며, 주유서비스 비용이 함께 청구될 수 있습니다.</li>
                                                </ul>
                                                <ul class="list-unstyled">
                                                    <li
                                                            style="padding-left: 0px; margin-top: 30px; font-size: 17px; margin-bottom: 5px;"><strong>약정
                                                        주행거리</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>약정
                                                        주행거리는 렌트카 업체의 대여 규정을 확인해 주세요.</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;주행거리 초과 시,
                                                        km당 추가 요금이 발생하거나 이후 이용이 어려울 수 있습니다.</li>
                                                </ul>
                                                <ul class="list-unstyled">
                                                    <li
                                                            style="padding-left: 0px; margin-top: 30px; font-size: 17px; margin-bottom: 5px;"><strong>취소규정</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>예약
                                                        다음날 ~ 인수 1일 전까지 무료 취소가 가능합니다.</strong></li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;결제 후 1시간 이내에
                                                        취소할 경우 취소 수수료는 발생하지 않습니다. 단, 결제 후 1시간 이내에 취소를 하였더라도 대여
                                                        시간이 지났을 경우 예약 금액에 대한 환불이 불가능합니다.</li>
                                                    <li><i class="fa fa-check"
                                                           style="font-size: 12px;"></i>&nbsp;&nbsp;대여시간 이후 사전 협의
                                                        없이 대여 장소에 나타나지 않고, 연락이 두절되는 경우 환불이 불가합니다.</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
					</div>
				</div>
				<!-- End of row -->
			</div>
		</div>
	</div>
</div>

<script>

	$(function() {
		var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${car.companyVO.addr1}', function(result, status) {

            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });
	});

</script>
<!-- x car book sidebar section Wrapper End -->

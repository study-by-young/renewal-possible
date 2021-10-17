<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 일반 렌트: 렌터카 목록 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="${pageContext.request.contextPath}/resources/js/plugins/extensions/jquery_ui/interactions.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/ui/moment/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/pickers/daterangepicker.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/pickers/anytime.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/picker.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/picker.date.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/picker.time.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/legacy.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/notifications/jgrowl.min.js"></script>

<style>
.page_link ul {
	background: #e6e6e6;
	float: right;
	padding: 15px 30px 15px 30px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	margin-left: 10px;
}

.x_slider_select {
	float: left;
	width: 48%;
	margin-top: 0px;
	position: relative;
}

.x_slider_select2 {
	margin-left: 0px;
}

.row-wrapper {
	padding: 10px;
	background-color: white;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

.select_result_wrapper ul {
	float: left;
	margin-bottom: 15px;
	background-color: white;
	border-radius: 10px;
	/* box-shadow: 0px 0 8px rgb(0 0 0 / 10%); */
}

.first_li a {
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
}

.last_li a {
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
}

.select_result_wrapper ul li {
	float: left;
	width: 12.5%;
}

.select_result_wrapper ul li a {
	float: left;
	width: 100%;
	padding: 12px 0px;
	text-align: center;
	transition: all 0.2s;
}

.select_result_wrapper ul li a:hover {
	background-color: #6495ed;
	cursor: pointer;
	color: white;
}

.select_result_wrapper ul li a:focus {
	background-color: #6495ed;
	cursor: pointer;
	color: white;
}

.x_car_offer_starts_list_img {
	border-right: 0px none;
}

.x_car_offer_heading ul {
	width: 100%;
	float: left;
	border-top: 1px solid #eeeeee;
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: rgb(238, 238, 238);
	border-bottom: 1px solid #eeeeee;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: rgb(238, 238, 238);
	margin-top: 30px;
}

.cmpn_list {
	width: 100%;
}

.cmpn_list_tr {
	padding-top: 5px;
	padding-bottom: 5px;
	height: 40px;
}

.cmpn_list_tr td label {
	margin-bottom: 0;
}

.cmpn_list_tr td label input {
	vertical-align: middle;
}

.select_result_wrapper ul li label {
	display: block;
	margin-bottom: 0px;
}

.select2-container--default .select2-selection--single {
	height: calc(2.25rem + 0.7px);
	border: 1px solid #ced4da;
}

.label-font {
	padding-top: 15px;
	font-weight: 800;
	color: #111111;
	font-family: 'S-CoreDream', 'Raleway', sans-serif;
	font-size: 14px;
}

.home-tab {
	margin-bottom: 60px;
}

.home-tab:last-child {
	margin-bottom: 10px;
}

.home-tab-title {
	margin: 15px 0px;
}

.home-tab-title h3 {
	line-height: 23px;
	font-size: 18px;
	font-weight: 600;
}

.option-box {
	padding: 15px;
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

.option-box-text {
	padding-left: 10px;
}

.option-box-text li {
	padding-bottom: 5px;
	list-style-position: inside;
	text-indent: -10px;
	padding-left: 10px;
}

.review-head {
	padding: 15px;
}

.review-head ul {
	float: left;
	width: 100%;	
}

.review-head ul li {
	float: left;
}

.review-head ul li h5 {
	line-height: 23px;
	font-size: 14px;
	font-weight: 600;
}

.x_car_detail_descrip ul {
    margin-top: 0px;
    padding-bottom: 15px;
}

.review-button {
	width: 100%;
	font-size: 14px;
	margin-top: 15px;
}

.review-card-body {
	line-height: 23px;
}

.review-course {
	background-color: #6495ed;
    padding: 5px;
    border-radius: 5px;
    color: white;
}
</style>


<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="container">
		<!--
		<form>
			<div class="x_title_inner_num_wrapper float_left py-3 my-0">
				<div class="row align-items-center">
					
					<div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width">
						<div class="form-group">
							<label for="searchArea" class="label-font">지역</label><br> <select
								id="searchArea" name="searchArea" class="form-control select">
								<c:forEach var="area" items="${areaCodes}">
									<option value="${area.code}">${area.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width">
						<div class="form-group">
							<label class="label-font">렌트 시작 날짜</label> <input
								id="searchStart" name="searchStart" type="text"
								class="form-control datepicker" placeholder="날짜를 선택하세요.">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width">
						<div class="form-group">
							<label class="label-font">렌트 반납 날짜</label> <input id="searchEnd"
								name="searchEnd" type="text" class="form-control datepicker"
								placeholder="날짜를 선택하세요.">
						</div>
					</div>
					 
                    <div class="col-lg-2 col-md-6 col-12 full_width">
                        <div class="form-group">
                            <label>탑승 인원</label>
                            <div class="input-group">
                                <input id="searchPassenger" name="searchPassenger"  type="text" class="form-control" placeholder="2">
                                <span class="input-group-append">
                                    <span class="input-group-text">명</span>
                                </span>
                            </div>
                        </div>
                    </div>
                    
					<div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width"
						style="text-align: center;">
						<button type="button" class="btn bg-primary-400 btn-float"
							style="color: white;">
							검색 <i class="icon-search4 icon-2x"
								style="font-size: 1rem; color: white;"></i>
						</button>
						<button type="button"
							class="btn btn-lg bg-transparent text-primary border-primary ml-1 legitRipple"
							data-toggle="modal" data-target="#recommendCarModal"
							style="font-size: 1rem; font-weight: bold;">추천받기</button>
					</div>
				</div>
			</div>
		</form>
		-->
	</div>
</div>


${car}
<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left mt-5">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
				<div class="x_car_book_left_siderbar_wrapper float_left">
					<div class="row">

						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div>
								<!-- Filter Results -->
								<div class="car-filter accordion car_booking_onliy_side">

									<h3>결제정보</h3>
									<hr>

									<!-- 모델명 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>대여요금(자차보험 미포함)</h3>
												<div style="float: right;">${car.price}</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>자차보험</h3>
												<div style="float: right;">${insurance.price}</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>예상 결제액</h3>
												<div style="float: right;">${car.price + insurance.price}</div>
											</div>
										</div>
									</div>
									<hr>
									<div
										class="x_slider_checout_right x_slider_checout_right_carbooking x_slider_checout_right_carbooking_fiter">
										<ul style="padding-left: 32px;">
											<li><a href="view/book?seq=${car.seq}&cmpnSeq=${car.cmpnSeq}">예약하기<i class="fa fa-arrow-right"></i></a>
											</li>
										</ul>
									</div>
								</div>
							</div>

							<!-- 가격비교 // 클릭하면 해당 업체의 상세 페이지로 이동 
							<div>
								<div class="car-filter accordion car_booking_onliy_side">
									<h3>가격비교</h3>
									<hr>
									<div>
										<table class="compare_cmpn">
											<c:forEach var="list" items="${list}">
											<tr class="compare_cmpn_tr">
												<td style="width: 5%;"><i class="fa fa-check"></i></td>
												<td style="width: 60%;">${list.name}</td>
												<td style="width: 35%; text-align: right;">${list.price}원</td>
											</tr>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
							 End of 가격비교 -->

						</div>
					</div>
				</div>
			</div>


			<!-- 차량 상세조회 -->
			<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
				<div
					class="x_slider_form_main_wrapper x_slider_form_main_wrapper_ccb float_left pt-5 mt-5">
					<div class="container">

						<div class="row">
							<div class="col-md-12">
								<div class="x_car_detail_main_wrapper float_left">

									<!-- 이미지 -->
									<div class="lr_bc_slider_first_wrapper text-center">
										<img
											src="${pageContext.request.contextPath}/resources/images/cars/KIA/k8.png"
											alt="car_img">
										<p>
											<small>차량 이미지는 이해를 돕기 위한 예시로, 배차 차량과 다를 수 있습니다.</small>
										</p>
									</div>
									<div class="row">
										<div class="col-md-12 pb-4">
											<div class="x_car_detail_slider_bottom_cont float_left">
												<div class="x_car_detail_slider_bottom_cont_left">
													<h3>${car.model}</h3>
													<span style="padding-left: 0px;">${car.brand} /
														${car.year}년 / ${car.fuel} / ${car.passenger}인</span> <span
														class="small text-muted pt-2">${car.trim}</span>
												</div>
											</div>

											<div style="text-align: center;">
												<div class="col-md-5" style="display: inline-block;">
													<div class="form-sec-header text-center">
														<label class="h6">렌트 시작</label>
														<p
															class="form-control w-75 mx-auto bg-primary text-white h-auto"
															style="border-radius: 5rem;">{est.startDate}</p>
													</div>
												</div>
												<div class="col-md-1 mt-5" style="display: inline-block;">
													<div class="form-sec-header text-center">
														<label class="h6"></label>
														<p>
															<i class="icon-arrow-right8 icon-2x"></i>
														</p>
													</div>
												</div>
												<div class="col-md-5 mt-5" style="display: inline-block;">
													<div class="form-sec-header text-center">
														<label class="h6">렌트 종료</label>
														<p
															class="form-control w-75 mx-auto bg-primary text-white h-auto"
															style="border-radius: 5rem;">{est.endDate}</p>
													</div>
												</div>
												<div class="w-100 my-4 mt-5"></div>
											</div>
											<!-- End of rent date -->


											<!-- 상세조회 탭 -->
											<div class="x_css_tabs_wrapper float_left">
												<div class="x_css_tabs_main_wrapper float_left">
													<ul class="nav nav-tabs">
														<li class="nav-item"><a class="nav-link active"
															data-toggle="tab" href="#home">예약정보</a></li>
														<li class="nav-item" style="margin-left: 10px;"><a
															class="nav-link" data-toggle="tab" href="#menu1">이용후기</a>
														</li>
														<li class="nav-item"><a class="nav-link"
															data-toggle="tab" href="#menu2">유의사항</a></li>
													</ul>
												</div>
												<!-- 탭 상세 페이지 -->
												<div class="tab-content">
													<div id="home" class="tab-pane active">
														<!-- 차량정보 -->
														<div>
															<div>
																<h3></h3>
															</div>
															<div>
																<ul>
																	<li>&nbsp;</li>
																</ul>
															</div>
														</div>

														<!-- 차량 정보 및 옵션 통일성을 위해 토글형식으로 넣으려고 했는데, 
																탭 분리가 이미 토글식이라 안에 토글을 넣었더니 일방은 작동하지 않는 사태 발생으로 단순 출력으로 변경함 -->
														<!-- 차량정보 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>차량 정보</h3>
															</div>
															<div>
																<ul class="option-box">
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.year}년식</li>
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.fuel}</li>
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.segment}</li>
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.passenger}인</li>
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.color}</li>
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.mission}</li>
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.trunk}개</li>
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.door}개</li>
																	<li><i class="fa fa-snowflake-o"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;${car.kmpl}</li>
																</ul>
															</div>
														</div>

														<!-- 차량옵션 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>차량 옵션</h3>
															</div>
															<div>
																<ul class="option-box">
																	<!-- foreach -->
																	<li style="font-weight: 600; color: #6495ed;"><i
																		class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;foreach
																		반복</li>
																	<!--  -->
																</ul>
															</div>
														</div>

														<!-- 운전자 대여조건 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>운전자 대여조건</h3>
															</div>
															<div>
																<ul class="option-box-text">
																	<li><i class="fa fa-check-square"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;운전자 나이 <strong>만
																			26세</strong> 이상</li>
																	<li><i class="fa fa-check-square"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;면허취득일 <strong>1년
																			이상</strong></li>
																	<li><i class="fa fa-check-square"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;차량 대여 시 실물면허증
																		소지 (<strong>2종 보통</strong> 면허 이상 필요)</li>
																	<li><i class="fa fa-check-square"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;업체별 <strong>대여규정
																			준수</strong> (외국인 대여, 낚시용품/애견 동반, 주행거리제한 규정 등)</li>
																</ul>
															</div>
														</div>

														<!-- 셔틀운행 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>무료 셔틀 정보</h3>
															</div>
															<div>
																<img
																	src="${pageContext.request.contextPath}/resources/images/image-shuttle-jeju.svg"
																	style="width: 100%; margin-bottom: 20px;">
																<ul class="option-box-text">
																	<li><i class="fa fa-check"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;{area}공항에서 업체
																		차고지까지 편리하게 이동할 수 있도록 <strong>셔틀버스를 무료로 제공</strong>하고
																		있습니다.</li>
																	<li><i class="fa fa-check"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>운행
																			시간</strong>&nbsp;&nbsp;&nbsp;&nbsp;오전 08:00 ~ 오후 08:00</li>
																	<li><i class="fa fa-check"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>운행
																			정보</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong>20분 ~ 30분
																			간격</strong>으로 운행되며 10분 소요됩니다.</li>
																	<li><i class="fa fa-check"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>셔틀
																			문의</strong>&nbsp;&nbsp;&nbsp;&nbsp;053-421-2460</li>
																</ul>
															</div>
														</div>

														<!-- 업체정보 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>업체 정보</h3>
															</div>
															<div>
																<ul class="option-box-text">
																	<li style="font-weight: 700; font-size: 17px;">업체명
																		${company.name}</li>
																</ul>
																<!-- 업체 위치 지도에 찍었으면 좋겠음 -->
																<div class="col-md-12" style="margin-bottom: 20px;">
																	<div class="x_slider_form_input_wrapper">
																		<p class="h-auto">${est.takePlaceCode}
																			${est.takePlaceBasic} ${est.takePlaceDetail}</p>
																	</div>
																	<div class="w-100 my-2"></div>
																	<div id="takePlaceMap" style="height: 300px;"></div>
																</div>
																<ul class="option-box-text">
																	<li><i class="fa fa-check"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>주소</strong>&nbsp;&nbsp;&nbsp;&nbsp;${company.addr1}
																		${comapny.addr2}</li>
																	<li><i class="fa fa-check"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>전화</strong>&nbsp;&nbsp;&nbsp;&nbsp;053-421-2460</li>
																</ul>
															</div>
														</div>
													</div>
													<!-- End of Home -->


													<!-- meun1 -->
													<div id="menu1" class="tab-pane fade">
														<div class="x_car_detail_descrip" style="padding-top: 23px;">
															<div class="col-md-12">
																<div class="row">
																	<div class="home-tab" style="margin-bottom: 40px;">
																		<div class="home-tab-title">
																			<h3>후기</h3>
																		</div>
																		<div>
																			<ul class="option-box-text">
																				<li><i class="fa fa-thumbs-up" style="font-size: 12px;"></i>&nbsp;&nbsp;여행갈카를 이용해주신 고객님들의 소중한 후기입니다.</li>
																			</ul>
																		</div>
																	</div>
																	<div class="col-lg-12 col-md-12 blog_single_comment_wrapper">
																		<!-- forEach -->
																		<%! int i = 0; %>
																		<c:forEach var="review" items="${list}">
																		<div class="card" style="margin-bottom: 40px;">
																			<div class="card-head" style="overflow: hidden;">
																				<div class="review-head">
																					<ul class="on">
																						<li style="width: 85%;">
																							<h5> {김**} <i class="fa fa-angle-double-right"></i> <span>{car.model}</span> <span>{startDate} ~ {endDate}</span> &nbsp;&nbsp;
																							<i class="fa fa-star oo"></i>
																							<i class="fa fa-star oo"></i>
																							<i class="fa fa-star oo"></i>
																							<i class="fa fa-star-o oo"></i>
																							<i class="fa fa-star-o oo"></i><br>
																							<hr style="margin: 10px 0px">
																							{review.title}</h5>
																						</li>
																						<li style="width: 15%;"><span><button class="btn btn-primary review-button" style="background-color: #6495ed;" type="button"
																							data-toggle="collapse"
																							data-target="#reviewContent_<%= i %>" aria-expanded="false"
																							aria-controls="collapseExample" data-parent="#accordion">자세히</button></span>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<div id="accordion">
																				<div class="collapse panel" id="reviewContent_<%= i %>">
																					<div class="card-body review-card-body reviewContent" style="padding: 15px;">
																						${review.model}
																						cliche reprehenderit, enim eiusmod high life
																						accusamus terry richardson ad squid. Nihil anim
																						keffiyeh helvetica, craft beer labore wes anderson
																						cred nesciunt sapiente ea proident.</div>
																					<div class="card-body review-card-body reviewContent" style="padding: 15px; padding-top: 5px; font-size: 14px; float: right;"><a href="#" class="review-course">작성자의 여행코스 보러가기</a></div>
																				</div>
																			</div>
																		</div>
																		<p style="opacity: 0;"><%= i++ %></p>
																		</c:forEach>
																		<!-- End foreach -->
																		
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- End of menu1 -->

													<!-- meun2 -->
													<div id="menu2" class="tab-pane fade">
														<div>
															<div>
																<h3></h3>
															</div>
															<div>
																<ul>
																	<li>&nbsp;</li>
																</ul>
															</div>
														</div>

														<!-- 렌트카 예약 전, 꼭 확인해주세요! -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>렌트카 예약 전, 꼭 확인해주세요!</h3>
															</div>
															<div>
																<ul class="option-box-text">
																	<li><i class="fa fa-check-square"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;렌트카 업체 영업시간 외
																		대여/반납이 필요한 경우 여행갈카 문의를 통한 상담 후 예약 진행해주세요.</li>
																	<li><i class="fa fa-check-square"
																		style="font-size: 12px;"></i>&nbsp;&nbsp;외국인 대여, 낚시용품
																		지참, 애견동물 동반 가능 여부와 주행거리 제한 규정은 업체별로 상이하므로 업체별 대여규정을
																		확인해주세요. 대여조건이 맞지 않을 경우 렌트카 이용이 불가합니다.</li>
																</ul>
															</div>
														</div>

														<!-- 여행갈카 이용 안내 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>여행갈카 이용 안내</h3>
															</div>
															<div>
																<ul class="option-box-text">
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
																<ul class="option-box-text">
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
																<ul class="option-box-text">
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
																<ul class="option-box-text">
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
																<ul class="option-box-text">
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
																<ul class="option-box-text">
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
													<!-- End of menu2 -->
												</div>
											</div>
										</div>
									</div>
									<!-- End of 탭 상세페이지 -->


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
	var Select2Selects = function() {
		// Select2 examples
		var _componentSelect2 = function() {
			if (!$().select2) {
				console.warn('Warning - select2.min.js is not loaded.');
				return;
			}

			//
			// Basic examples
			//

			// Default initialization
			$('.select').select2({
				minimumResultsForSearch : Infinity
			});
		};

		//
		// Return objects assigned to module
		//

		return {
			init : function() {
				_componentSelect2();
			}
		}
	}();
	// Initialize module
	// ------------------------------

	document.addEventListener('DOMContentLoaded', function() {
		Select2Selects.init();
	});

	// Setup module
	// ------------------------------

	var DateTimePickers = function() {

		// Pickadate picker
		var _componentPickadate = function() {
			if (!$().pickadate) {
				console
						.warn('Warning - picker.js and/or picker.date.js is not loaded.');
				return;
			}

			var now = new Date();
			// Localization
			$('.pickadate-translated').pickadate(
					{
						monthsFull : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						weekdaysShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						today : '',
						clear : '',
						formatSubmit : 'yyyy/mm/dd',
						format : 'yyyy/mm/dd(ddd)',
						min : [ now.getFullYear(), now.getMonth(),
								now.getDate() + 1 ]
					});
		};

		// Pickatime picker
		var _componentPickatime = function() {
			if (!$().pickatime) {
				console
						.warn('Warning - picker.js and/or picker.time.js is not loaded.');
				return;
			}

			// Default functionality
			$('.pickatime').pickatime();

			// Clear button
			$('.pickatime-clear').pickatime({
				clear : ''
			});

			// Time formats
			$('.pickatime-format').pickatime({

				// Escape any “rule” characters with an exclamation mark (!).
				format : 'T!ime selected: h:i a',
				formatLabel : '<b>h</b>:i <!i>a</!i>',
				formatSubmit : 'HH:i',
				hiddenPrefix : 'prefix__',
				hiddenSuffix : '__suffix'
			});

			// Send hidden value
			$('.pickatime-hidden').pickatime({
				formatSubmit : 'HH:i',
				hiddenName : true
			});

			// Editable input
			var $input_time = $('.pickatime-editable').pickatime({
				editable : true,
				onClose : function() {
					$('.datepicker').focus();
				}
			});
			var picker_time = $input_time.pickatime('picker');
			$input_time.on('click', function(event) {
				if (picker_time.get('open')) {
					picker_time.close();
				} else {
					picker_time.open();
				}
				event.stopPropagation();
			});

			// Time intervals
			$('.pickatime-intervals').pickatime({
				interval : 150
			});

			// Time limits
			$('.pickatime-limits').pickatime({
				min : [ 7, 30 ],
				max : [ 14, 0 ]
			});

			// Using integers as hours
			$('.pickatime-limits-integers').pickatime({
				disable : [ 3, 5, 7 ]
			});

			// Disable times
			$('.pickatime-disabled').pickatime({
				disable : [ [ 0, 30 ], [ 2, 0 ], [ 8, 30 ], [ 9, 0 ] ]
			});

			// Disabling ranges
			$('.pickatime-range').pickatime({
				disable : [ 1, [ 1, 30, 'inverted' ], {
					from : [ 4, 30 ],
					to : [ 10, 30 ]
				}, [ 6, 30, 'inverted' ], {
					from : [ 8, 0 ],
					to : [ 9, 0 ],
					inverted : true
				} ]
			});

			// Disable all with exeption
			$('.pickatime-disableall').pickatime(
					{
						disable : [ true, 3, 5, 7, [ 0, 30 ], [ 2, 0 ],
								[ 8, 30 ], [ 9, 0 ] ]
					});

			// Events
			$('.pickatime-events').pickatime({
				onStart : function() {
					console.log('Hello there :)')
				},
				onRender : function() {
					console.log('Whoa.. rendered anew')
				},
				onOpen : function() {
					console.log('Opened up')
				},
				onClose : function() {
					console.log('Closed now')
				},
				onStop : function() {
					console.log('See ya.')
				},
				onSet : function(context) {
					console.log('Just set stuff:', context)
				}
			});
		};

		return {
			init : function() {
				_componentPickadate();
				_componentPickatime();
			}
		}
	}();

	// Initialize module
	// ------------------------------

	document.addEventListener('DOMContentLoaded', function() {
		DateTimePickers.init();
	});

	$(function() {
		var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	});
	
</script>
<!-- x car book sidebar section Wrapper End -->

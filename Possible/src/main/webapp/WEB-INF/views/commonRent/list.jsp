<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 일반 렌트: 렌터카 목록 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/resources/js/plugins/extensions/jquery_ui/interactions.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/ui/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/pickers/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/pickers/anytime.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/picker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/picker.date.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/picker.time.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/legacy.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/notifications/jgrowl.min.js"></script>
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
    padding:10px;
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
}

.select_result_wrapper ul li a {
	float: left;
	padding: 12px 30px;
	transition: all 0.2s;
}

.select_result_wrapper ul li a:hover {
	background-color: blue;
	cursor: pointer;
	color: white;
}

.select_result_wrapper ul li a:focus {
	background-color: blue;
	cursor: pointer;
	color: white;
}

.x_car_offer_starts_list_img {
    border-right: 0px none;
}

.cmpn_list {
	background-color: white;
	margin: 20px;
    width: 95%;
}

.cmpn_list_tr {
	padding: 10px;
}

.cmpn_list_tr td {
	padding: 10px;
}

.cmpn_list_tr:hover {
	background-color: skyblue;
	color: white;
}

.cmpn_list_tr:focus {
	background-color: skyblue;
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

span.chkBox {
    display: inline-block;
    zoom: 1;
    width: 16px;
    height: 16px;
    margin-top: 2px;
    background-color: #fff;
    color: #192028;
    border-radius: 1px;
    border: 1px solid #ebebeb;
}
</style>


<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="container">
        <form>
            <div class="x_title_inner_num_wrapper float_left py-3 my-0">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-md-6 col-12 full_width">
                        <div class="form-group">
                            <label for="searchArea">지역</label>
                            <select id="searchArea" name="searchArea" class="form-control select">
                                <c:forEach var="area" items="${areaCodes}">
                                    <option value="${area.code}">${area.name}</option>
                                </c:forEach>
                            </select>
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
                    <div class="col-lg-2 col-md-6 col-12 full_width">
                        <div class="form-group">
                            <label>렌트 시작 날짜</label>
                            <input id="searchStart" name="searchStart" type="text" class="form-control pickadate-translated" placeholder="날짜를 선택하세요.">
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-12 full_width">
                        <div class="form-group">
                            <label>렌트 반납 날짜</label>
                            <input id="searchEnd" name="searchEnd" type="text" class="form-control pickadate-translated" placeholder="날짜를 선택하세요.">
                        </div>
                    </div>
                    <div class="col-lg-4 col-12 full_width">
                        <button type="button" class="btn bg-primary-400 btn-float"><i class="icon-search4 icon-2x"></i></button>
                        <button type="button" class="btn btn-lg bg-transparent text-primary border-primary ml-1 legitRipple" style="font-size: 2rem;font-weight: bold;">추천 차량</button>
                    </div>
                </div>
            </div>
        </form>
	</div>
</div>

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
				<div class="x_car_book_left_siderbar_wrapper float_left">
					<div class="row">

						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div>
								<!-- Filter Results -->
								<div class="car-filter accordion car_booking_onliy_side">

									<h3>상세검색</h3>
									<hr>

									<!-- 모델명 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>차량모델</h3>
												<input type="text" placeholder="자동차 모델명으로 검색">
											</div>
										</div>
									</div>
									<hr>

									<!-- 세그먼트 -->
									<div class="x_car_book_fillter_select_box">
										<h5>차량등급</h5>
										<select class="myselect" id="segment" name="segment">
											<option value="">전체</option>
											<option value="">경형</option>
											<option value="">소형</option>
											<option value="">중형</option>
											<option value="">대형</option>
											<option value="">수입</option>
											<option value="">승합RV</option>
											<option value="">SUV</option>
											<option value="">캠핑카</option>
										</select>
									</div>
									<hr>

									<!-- 연료 -->
									<div class="x_car_book_fillter_select_box">
										<h5>연료</h5>
										<select class="myselect" id="fuel" name="fuel">
											<option value="">전체</option>
											<option value="">휘발유</option>
											<option value="">경유</option>
											<option value="">LPG</option>
											<option value="">하이브리드</option>
											<option value="">전기</option>
										</select>
									</div>
									<hr>

									<!-- 연식 -->
									<div class="x_car_book_fillter_select_box">
										<h5>차량연식</h5>
										<select class="myselect" id="year" name="year">
											<option value="">전체</option>
											<option value="">2022년</option>
											<option value="">2021년</option>
											<option value="">2020년</option>
											<option value="">2019년</option>
											<option value="">2018년</option>
											<option value="">2017년</option>
											<option value="">2016년</option>
										</select>
									</div>
									<hr>


									<!-- 차량제조사/브랜드 -->
									<div class="x_car_book_fillter_select_box">
										<h5>제조사</h5>
										<select class="myselect" id="brand" name="brand">
											<option value="">전체</option>
											<option value="">현대</option>
											<option value="">기아</option>
											<option value="">르노삼성</option>
											<option value="">수입</option>
											<option value="">기타</option>
										</select>
									</div>
									<hr>

									<!-- 인원 -->
									<div class="x_car_book_fillter_select_box">
										<h5>인원</h5>
										<select class="myselect" id="passenger2" name="passenger">
											<option value="">전체</option>
											<option value="">1인</option>
											<option value="">2인</option>
											<option value="">3인</option>
											<option value="">4인</option>
											<option value="">5인이상</option>
										</select>
									</div>
									<hr>

									<!-- 자차보험 -->
									<div class="x_car_book_fillter_select_box">
										<h5>자차보험</h5>
										<select class="myselect" id="insurance2" name="insurance">
											<option value="">전체</option>
											<option value="">일반자차</option>
											<option value="">완전자차</option>
										</select>
									</div>
									<hr>

									<div
										class="x_slider_checout_right x_slider_checout_right_carbooking x_slider_checout_right_carbooking_fiter">
										<ul>
											<li><a href="#">상세검색<i class="fa fa-arrow-right"></i></a>
											</li>
										</ul>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>


			<!-- 검색결과 -->
			<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
				<div class="x_carbooking_right_section_wrapper float_left">
					<div class="row">

						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
							<div class="form-sec-header">
								<h3>검색결과</h3>
							</div>
						</div>

						<!-- 전체/경차/준형차 등등등 -->
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="select_result_wrapper">
								<ul>
									<li class="first_li"><a href="#">전체</a></li>
									<li><a href="#">경소형</a></li>
									<li><a href="#">준중형</a></li>
									<li><a href="#">중대형</a></li>
									<li><a href="#">승합RV</a></li>
									<li><a href="#">SUV</a></li>
									<li><a href="#">수입</a></li>
									<li class="last_li"><a href="#">캠핑카</a></li>
								</ul>
							</div>
						</div>


						<!-- 차량 목록 파트 -->
						<div class="col-md-12">
							<div class="x_car_book_tabs_content_main_wrapper">
								<div class="">

									<div id="home">
										<div class="row">
											<div class="col-md-12">
												<div class="x_car_offer_main_boxes_wrapper float_left">
													<div class="x_car_offer_starts x_car_offer_starts_list_img float_left">

														<div
															class="x_car_offer_img x_car_offer_img_list float_left">
															<img src="${pageContext.request.contextPath}/resources/images/c1.png" alt="img">
														</div>
													</div>
													<div class="x_car_offer_starts_list_img_cont">
														<div
															class="x_car_offer_heading x_car_offer_heading_list float_left">
															<h2>
																<a href="#">{모델명}</a>
															</h2>
															<p>{인원/세그먼트/연료}</p>
														</div>
														<div
															class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
															<ul>
																<li><a href="#">바로예약</a></li>
																<li><a href="#">자세히</a></li>
															</ul>
														</div>
													</div>

													<!-- 업체를 선택하면 해당 업체가 보유하고 있는 옵션에 표시 (제주패스렌트카 참조) -->
													<div class="x_car_offer_heading x_car_offer_heading_listing float_left">
														<ul class="">
															<li><a href="#"><i class="fa fa-users"></i>&nbsp;{옵션/연식}</a></li>
															<li><a href="#"><i class="fa fa-clone"></i>&nbsp;{옵션/네비게이션}</a></li>
															<li><a href="#"><i class="fa fa-shield"></i>&nbsp;{옵션/블랙박스}</a></li>
															<li><a href="#"><i class="fa fa-briefcase"></i>&nbsp;{옵션/후방센서}</a></li>
															<li><a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;{옵션/후방카메라}</a></li>
															<li><a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;{옵션/금연차량}</a></li>
														</ul>
													</div>

													<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
														<div class="x_carbooking_right_section_wrapper float_left">
															<div class="row">

																<!-- 업체 정렬 -->
																<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
																	<div class="x_carbook_right_tabs_box_wrapper float_left">
																		<p>
																			<span><a href="#">최저가순</a></span>&nbsp;&nbsp;
																			<span><a href="#">인기순</a></span>&nbsp;&nbsp;
																		</p>
																	</div>
																</div>
																<!-- End 업체 정렬 -->

																<!-- 해당 차량 보유 업체 목록 -->
																<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
																	<div class="x_carbook_right_tabs_box_wrapper float_left">
																		<form>
																			<table class="cmpn_list">
																				<!-- 기본으로 첫번째 행이 선택되어 있도록 -->
																				<tr class="cmpn_list_tr">
																					<td style="width: 5%;"><span class="chkBox"></span></td>
																					<td style="width: 30%;">레인보우모빌리티</td>
																					<td style="width: 15%;">만 26세</td>
																					<td style="width: 20%;">완전자차</td>
																					<td style="width: 15%;">리뷰 94</td>
																					<td style="width: 15%;">25,000원</td>
																				</tr>
																				<tr class="cmpn_list_tr">
																					<td style="width: 5%;"><span class="chkBox"></span></td>
																					<td style="width: 30%;">{업체이름}</td>
																					<td style="width: 15%;">{보험나이}</td>
																					<td style="width: 20%;">{완전자차}</td>
																					<td style="width: 15%;">{리뷰개수}</td>
																					<td style="width: 15%;">{요금}</td>
																				</tr>
																				<tr class="cmpn_list_tr">
																					<td style="width: 5%;"><span class="chkBox"></span></td>
																					<td style="width: 30%;">{업체이름}</td>
																					<td style="width: 15%;">{보험나이}</td>
																					<td style="width: 20%;">{완전자차}</td>
																					<td style="width: 15%;">{리뷰개수}</td>
																					<td style="width: 15%;">{요금}</td>
																				</tr>
																			</table>
																		</form>
																	</div>
																</div>
																<!-- End 해당 차량 보유 업체 목록 -->
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="col-md-12">
												<div class="x_car_offer_main_boxes_wrapper float_left">
													<div
														class="x_car_offer_starts x_car_offer_starts_list_img float_left">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
														<div
															class="x_car_offer_img x_car_offer_img_list float_left">
															<img src="images/c2.png" alt="img">
														</div>
														<div
															class="x_car_offer_price x_car_offer_price_list float_left">
															<div
																class="x_car_offer_price_inner x_car_offer_price_inner_list">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
													</div>
													<div class="x_car_offer_starts_list_img_cont">
														<div
															class="x_car_offer_heading x_car_offer_heading_list float_left">
															<h2>
																<a href="#">Gumpert</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div
															class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
														<div
															class="x_car_offer_heading x_car_offer_heading_listing float_left">
															<ul class="">
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4 Seats</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;4 Doors</a></li>
																<li><a href="#"><i class="fa fa-shield"></i>
																		&nbsp;9 Manual</a></li>

																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;4 Bag Space</a></li>
																<li><a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2
																		Air: Yes</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i>
																			Others (2)</span>
																		<ul class="list">
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-snowflake-o"></i> Air Conditioning</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-code-fork"></i> Transmission</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-user-circle-o"></i> Minimum age</a></li>
																		</ul>
																	</div>
																</li>
															</ul>
														</div>

													</div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="x_car_offer_main_boxes_wrapper float_left">
													<div
														class="x_car_offer_starts x_car_offer_starts_list_img float_left">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
														<div
															class="x_car_offer_img x_car_offer_img_list float_left">
															<img src="images/c3.png" alt="img">
														</div>
														<div
															class="x_car_offer_price x_car_offer_price_list float_left">
															<div
																class="x_car_offer_price_inner x_car_offer_price_inner_list">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
													</div>
													<div class="x_car_offer_starts_list_img_cont">
														<div
															class="x_car_offer_heading x_car_offer_heading_list float_left">
															<h2>
																<a href="#">MEV</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div
															class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
														<div
															class="x_car_offer_heading x_car_offer_heading_listing float_left">
															<ul class="">
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4 Seats</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;4 Doors</a></li>
																<li><a href="#"><i class="fa fa-shield"></i>
																		&nbsp;9 Manual</a></li>

																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;4 Bag Space</a></li>
																<li><a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2
																		Air: Yes</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i>
																			Others (2)</span>
																		<ul class="list">
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-snowflake-o"></i> Air Conditioning</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-code-fork"></i> Transmission</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-user-circle-o"></i> Minimum age</a></li>
																		</ul>
																	</div>
																</li>
															</ul>
														</div>

													</div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="x_car_offer_main_boxes_wrapper float_left">
													<div
														class="x_car_offer_starts x_car_offer_starts_list_img float_left">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
														<div
															class="x_car_offer_img x_car_offer_img_list float_left">
															<img src="images/c4.png" alt="img">
														</div>
														<div
															class="x_car_offer_price x_car_offer_price_list float_left">
															<div
																class="x_car_offer_price_inner x_car_offer_price_inner_list">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
													</div>
													<div class="x_car_offer_starts_list_img_cont">
														<div
															class="x_car_offer_heading x_car_offer_heading_list float_left">
															<h2>
																<a href="#">Brabus</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div
															class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
														<div
															class="x_car_offer_heading x_car_offer_heading_listing float_left">
															<ul class="">
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4 Seats</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;4 Doors</a></li>
																<li><a href="#"><i class="fa fa-shield"></i>
																		&nbsp;9 Manual</a></li>

																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;4 Bag Space</a></li>
																<li><a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2
																		Air: Yes</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i>
																			Others (2)</span>
																		<ul class="list">
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-snowflake-o"></i> Air Conditioning</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-code-fork"></i> Transmission</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-user-circle-o"></i> Minimum age</a></li>
																		</ul>
																	</div>
																</li>
															</ul>
														</div>

													</div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="x_car_offer_main_boxes_wrapper float_left">
													<div
														class="x_car_offer_starts x_car_offer_starts_list_img float_left">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
														<div
															class="x_car_offer_img x_car_offer_img_list float_left">
															<img src="images/c5.png" alt="img">
														</div>
														<div
															class="x_car_offer_price x_car_offer_price_list float_left">
															<div
																class="x_car_offer_price_inner x_car_offer_price_inner_list">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
													</div>
													<div class="x_car_offer_starts_list_img_cont">
														<div
															class="x_car_offer_heading x_car_offer_heading_list float_left">
															<h2>
																<a href="#">Abbott-Detroit</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div
															class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
														<div
															class="x_car_offer_heading x_car_offer_heading_listing float_left">
															<ul class="">
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4 Seats</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;4 Doors</a></li>
																<li><a href="#"><i class="fa fa-shield"></i>
																		&nbsp;9 Manual</a></li>

																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;4 Bag Space</a></li>
																<li><a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2
																		Air: Yes</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i>
																			Others (2)</span>
																		<ul class="list">
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-snowflake-o"></i> Air Conditioning</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-code-fork"></i> Transmission</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-user-circle-o"></i> Minimum age</a></li>
																		</ul>
																	</div>
																</li>
															</ul>
														</div>

													</div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="x_car_offer_main_boxes_wrapper float_left">
													<div
														class="x_car_offer_starts x_car_offer_starts_list_img float_left">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
														<div
															class="x_car_offer_img x_car_offer_img_list float_left">
															<img src="images/c6.png" alt="img">
														</div>
														<div
															class="x_car_offer_price x_car_offer_price_list float_left">
															<div
																class="x_car_offer_price_inner x_car_offer_price_inner_list">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
													</div>
													<div class="x_car_offer_starts_list_img_cont">
														<div
															class="x_car_offer_heading x_car_offer_heading_list float_left">
															<h2>
																<a href="#">Dartz</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div
															class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
														<div
															class="x_car_offer_heading x_car_offer_heading_listing float_left">
															<ul class="">
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4 Seats</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;4 Doors</a></li>
																<li><a href="#"><i class="fa fa-shield"></i>
																		&nbsp;9 Manual</a></li>

																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;4 Bag Space</a></li>
																<li><a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2
																		Air: Yes</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i>
																			Others (2)</span>
																		<ul class="list">
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-snowflake-o"></i> Air Conditioning</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-code-fork"></i> Transmission</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-user-circle-o"></i> Minimum age</a></li>
																		</ul>
																	</div>
																</li>
															</ul>
														</div>

													</div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="x_car_offer_main_boxes_wrapper float_left">
													<div
														class="x_car_offer_starts x_car_offer_starts_list_img float_left">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
														<div
															class="x_car_offer_img x_car_offer_img_list float_left">
															<img src="images/c7.png" alt="img">
														</div>
														<div
															class="x_car_offer_price x_car_offer_price_list float_left">
															<div
																class="x_car_offer_price_inner x_car_offer_price_inner_list">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
													</div>
													<div class="x_car_offer_starts_list_img_cont">
														<div
															class="x_car_offer_heading x_car_offer_heading_list float_left">
															<h2>
																<a href="#">Ferrari</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div
															class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
														<div
															class="x_car_offer_heading x_car_offer_heading_listing float_left">
															<ul class="">
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4 Seats</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;4 Doors</a></li>
																<li><a href="#"><i class="fa fa-shield"></i>
																		&nbsp;9 Manual</a></li>

																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;4 Bag Space</a></li>
																<li><a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2
																		Air: Yes</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i>
																			Others (2)</span>
																		<ul class="list">
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-snowflake-o"></i> Air Conditioning</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-code-fork"></i> Transmission</a></li>
																			<li class="dpopy_li"><a href="#"><i
																					class="fa fa-user-circle-o"></i> Minimum age</a></li>
																		</ul>
																	</div>
																</li>
															</ul>
														</div>

													</div>
												</div>
											</div>

											<div class="col-md-12">
												<div class="pager_wrapper prs_blog_pagi_wrapper">
													<ul class="pagination">
														<li><a href="#"><i class="flaticon-left-arrow"></i></a>
														</li>
														<li class="btc_shop_pagi"><a href="#">01</a></li>
														<li class="btc_shop_pagi"><a href="#">02</a></li>
														<li class="btc_third_pegi btc_shop_pagi"><a href="#">03</a>
														</li>
														<li class="hidden-xs btc_shop_pagi"><a href="#">...</a>
														</li>
														<li><a href="#"><i class="flaticon-right-arrow"></i></a>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
                minimumResultsForSearch: Infinity
            });
        };

        //
        // Return objects assigned to module
        //

        return {
            init: function() {
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
                console.warn('Warning - picker.js and/or picker.date.js is not loaded.');
                return;
            }

            var now = new Date();
            // Localization
            $('.pickadate-translated').pickadate({
                monthsFull: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                weekdaysShort: ['일', '월', '화', '수', '목', '금', '토'],
                today: '',
                clear: '',
                formatSubmit: 'yyyy/mm/dd',
                format: 'yyyy/mm/dd(ddd)',
                min: [now.getFullYear(),now.getMonth(),now.getDate() + 1]
            });
        };

        // Pickatime picker
        var _componentPickatime = function() {
            if (!$().pickatime) {
                console.warn('Warning - picker.js and/or picker.time.js is not loaded.');
                return;
            }

            // Default functionality
            $('.pickatime').pickatime();

            // Clear button
            $('.pickatime-clear').pickatime({
                clear: ''
            });

            // Time formats
            $('.pickatime-format').pickatime({

                // Escape any “rule” characters with an exclamation mark (!).
                format: 'T!ime selected: h:i a',
                formatLabel: '<b>h</b>:i <!i>a</!i>',
                formatSubmit: 'HH:i',
                hiddenPrefix: 'prefix__',
                hiddenSuffix: '__suffix'
            });

            // Send hidden value
            $('.pickatime-hidden').pickatime({
                formatSubmit: 'HH:i',
                hiddenName: true
            });

            // Editable input
            var $input_time = $('.pickatime-editable').pickatime({
                editable: true,
                onClose: function() {
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
                interval: 150
            });


            // Time limits
            $('.pickatime-limits').pickatime({
                min: [7,30],
                max: [14,0]
            });

            // Using integers as hours
            $('.pickatime-limits-integers').pickatime({
                disable: [
                    3, 5, 7
                ]
            });

            // Disable times
            $('.pickatime-disabled').pickatime({
                disable: [
                    [0,30],
                    [2,0],
                    [8,30],
                    [9,0]
                ]
            });

            // Disabling ranges
            $('.pickatime-range').pickatime({
                disable: [
                    1,
                    [1, 30, 'inverted'],
                    { from: [4, 30], to: [10, 30] },
                    [6, 30, 'inverted'],
                    { from: [8, 0], to: [9, 0], inverted: true }
                ]
            });

            // Disable all with exeption
            $('.pickatime-disableall').pickatime({
                disable: [
                    true,
                    3, 5, 7,
                    [0,30],
                    [2,0],
                    [8,30],
                    [9,0]
                ]
            });

            // Events
            $('.pickatime-events').pickatime({
                onStart: function() {
                    console.log('Hello there :)')
                },
                onRender: function() {
                    console.log('Whoa.. rendered anew')
                },
                onOpen: function() {
                    console.log('Opened up')
                },
                onClose: function() {
                    console.log('Closed now')
                },
                onStop: function() {
                    console.log('See ya.')
                },
                onSet: function(context) {
                    console.log('Just set stuff:', context)
                }
            });
        };

        return {
            init: function () {
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

</script>
<!-- x car book sidebar section Wrapper End -->



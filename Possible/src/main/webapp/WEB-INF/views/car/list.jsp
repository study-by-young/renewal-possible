<!-- 일반 렌트: 렌터카 목록 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	background-color: white;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

.select_result_wrapper {
	float: center;
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
	<div class="btc_tittle_img_overlay"></div>
	<div class="container">
		<div class="col-lg-12"
			class="x_car_book_left_siderbar_wrapper float_left">
			<div class="row row-wrapper shadow">

				<div class="col-lg-2 col-md-2 col-sm-2 col-2 full_width"
					style="margin-bottom: 13px;">
					<div class="x_slider_form_input_wrapper float_left">
						<h3>지역</h3>
						<input type="text" placeholder="지역을 선택하세요">
					</div>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-2 col-2 full_width">
					<div class="form-sec-header">
						<h3>렌트 시작 날짜</h3>
						<label class="cal-icon"> <input type="text"
							placeholder="날짜를 선택하세요" class="form-control datepicker">
						</label>
					</div>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-2 col-2 full_width">
					<div class="form-sec-header">
						<h3>렌트 반납 날짜</h3>
						<label class="cal-icon"> <input type="text"
							placeholder="날짜를 선택하세요" class="form-control datepicker">
						</label>
					</div>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-2 col-2 full_width">
					<div class="form-sec-header">
						<h3>인원</h3>
					</div>
					<div class="x_slider_select x_slider_select2" style="width: 168px;">
						<select class="myselect">
							<option>1인</option>
							<option>2인</option>
							<option>3인</option>
							<option>4인</option>
							<option>5인이상</option>
						</select>
					</div>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-2 col-2 full_width">
					<div class="form-sec-header">
						<h3>자차보험</h3>
					</div>
					<div class="x_slider_select x_slider_select2" style="width: 168px;">
						<select class="myselect">
							<option>선택안함</option>
							<option>일반자차</option>
							<option>완전자차</option>
						</select>
					</div>
				</div>


				<div class="col-lg-2 col-md-2 col-sm-2 col-2 full_width">
					<div class="col-md-12">
						<div
							class="x_slider_checout_right x_slider_checout_right_carbooking">
							<ul>
								<li><a href="#">검색<i class="fa fa-arrow-right"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


<!-- btc tittle Wrapper End -->
<div class="float_left" style="margin-top: 3em; margin-bottom: 3em;">
	<div class="container">
		<div class="row">
			<div>
				<div class="page_link">
					<div class="btc_tittle_right_cont_wrapper">
						<ul>
							<li><a href="#">Home</a> <i class="fa fa-angle-right"></i></li>
							<li><a href="#">Cars</a> <i class="fa fa-angle-right"></i></li>
							<li>Best Offers</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
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
									<!-- 필터 추천 버튼, 클릭 시 modal -->
									<div class="x_slider_checout_right x_slider_checout_right_carbooking" style="padding-top: 0px; margin-bottom: 40px;">
										<ul>
											<li><a href="#" style="width: 100%;">차량 추천받기<i class="fa fa-arrow-right"></i></a>
											</li>
										</ul>
									</div>
									<!-- End 필터 추천 버튼 -->
								
									<h3>상세검색</h3>
									<hr>
									
									<!-- Category -->
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
									<div class="panel panel-default">
										<div class="panel-heading">
											<h5 class="panel-title">
												<a data-toggle="collapse" href="#collapse1"
													class="collapse">차량등급</a>
											</h5>
										</div>
										<div id="collapse1" class="collapse show">
											<div class="panel-body">
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code1" name="segment"> <label
														for="code1">전체</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code2" name="segment"> <label
														for="code2">경형</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code3" name="segment"> <label
														for="code3">소형</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code4" name="segment"> <label
														for="code4">준중형</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code5" name="segment"> <label
														for="code5">중형</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code6" name="segment"> <label
														for="code6">대형</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code7" name="segment"> <label
														for="code7">수입</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code8" name="segment"> <label
														for="code8">승합RV</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code9" name="segment"> <label
														for="code9">SUV</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code10" name="segment"> <label
														for="code10">캠핑카</label>
												</div>
											</div>
										</div>
									</div>
									<hr>
									
									<!-- 연료 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h5 class="panel-title">
												<a data-toggle="collapse" href="#collapse2"
													class="collapse">연료타입</a>
											</h5>
										</div>
										<div id="collapse2" class="collapse show">
											<div class="panel-body">
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code1" name="fuel"> <label
														for="code1">전체</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code2" name="fuel"> <label
														for="code2">휘발유</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code3" name="fuel"> <label
														for="code3">경유</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code4" name="fuel"> <label
														for="code4">LPG</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code5" name="fuel"> <label
														for="code5">하이브리드</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="code6" name="fuel"> <label
														for="code6">전기</label>
												</div>
											</div>
										</div>
									</div>
									<hr>
									
									
									<!-- 차량연식 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h5 class="panel-title">
												<a data-toggle="collapse" href="#collapseOne"
													class="collapse">차량연식</a>
											</h5>
										</div>
										<div id="collapseOne" class="collapse show">
											<div class="panel-body">
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="c3" name="cb"> <label
														for="c3">GPS Device</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="c4" name="cb"> <label
														for="c4">Babyseats</label>
												</div>
											</div>
										</div>
									</div>
									<hr>
									
									<!-- 차량제조사/브랜드 -->
									<div class="x_car_book_fillter_select_box">
										<h5>제조사</h5>
										<select class="myselect">
											<option>- Please Select -</option>
											<option>현대</option>
											<option>기아</option>
											<option>삼성</option>
											<option>수입</option>
											<option>기타</option>
										</select>
									</div>
									<hr>
									
									<!-- Company -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h5 class="panel-title">
												<a data-toggle="collapse" href="#collapseTwo"
													class="collapse"> Company</a>
											</h5>
										</div>
										<div id="collapseTwo" class="collapse show">
											<div class="panel-body">
												<div class="radio">
													<div class="fisrt">
														<input type="radio" name="radio1" id="radio1"
															value="option1" checked=""> <label for="radio1">Company
															Name</label>
													</div>
													<div class="fisrt">
														<input type="radio" name="radio1" id="radio2"
															value="option2"> <label for="radio2">Other
															One</label>
													</div>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<!-- Category -->
									<div class="x_car_book_fillter_select_box">
										<h5>Category</h5>
										<select class="myselect">
											<option>Please Select</option>
											<option>Seadan</option>
											<option>SUV</option>
											<option>Mini</option>
											<option>Bus</option>
										</select>
									</div>
									<hr>
									<div class="x_car_book_fillter_select_box">
										<h5>Car Brand</h5>
										<select class="myselect">
											<option>- Please Select -</option>
											<option>BMW</option>
											<option>Honda</option>
											<option>Toyato</option>
											<option>Audi</option>
											<option>Fort</option>
											<option>Nissan</option>
										</select>
									</div>
									<hr>
									<!-- Car Model -->
									<div class="x_car_book_fillter_select_box">
										<h5>Car Model</h5>
										<select class="myselect">
											<option>- Please Select -</option>
											<option>- 2010 -</option>
											<option>- 2011 -</option>
											<option>- 2012 -</option>
											<option>- 2013 -</option>
											<option>- 2014 -</option>
											<option>- 2015 -</option>
											<option>- 2016 -</option>
											<option>- 2017 -</option>
											<option>- 2018 -</option>
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
<!-- x car book sidebar section Wrapper End -->



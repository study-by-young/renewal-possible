<!-- 일반 렌트: 렌터카 목록 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<title>렌터카 목록 페이지</title>
<meta charset="utf-8" />

<!-- 
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta name="description" content="Xpedia" />
	<meta name="keywords" content="Xpedia" />
	<meta name="author" content="" />
	<meta name="MobileOptimized" content="320" />
	 -->

<!--Template style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/xpedia.css" />
<!--favicon-->
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/fevicon.png" />
</head>

<body>

	<!-- btc tittle Wrapper Start -->
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">

				<div class="col-md-4">
					<div class="x_slider_checkbox_bottom float_left">
						<div class="x_slider_checout_right">
							<ul>
								<li><a href="#">search <i class="fa fa-arrow-right"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- btc tittle Wrapper End -->


	<!-- x tittle num Wrapper Start -->
	<div class="x_title_num_mian_Wrapper float_left">
		<div class="container">
			<div class="x_title_inner_num_wrapper float_left">
				<div class="x_title_num_heading">
					<h3>Choose a car</h3>
					<p>Complete Your Step</p>
				</div>
				<div class="x_title_num_heading_cont">
					<div class="x_title_num_main_box_wrapper">
						<div class="x_icon_num">
							<p>1</p>
						</div>
						<h5>Time & place</h5>
					</div>
					<div
						class="x_title_num_main_box_wrapper x_title_num_main_box_wrapper2">
						<div class="x_icon_num x_icon_num2">
							<p>2</p>
						</div>
						<h5>Car</h5>
					</div>
					<div
						class="x_title_num_main_box_wrapper x_title_num_main_box_wrapper3">
						<div class="x_icon_num x_icon_num3">
							<p>3</p>
						</div>
						<h5>detail</h5>
					</div>
					<div
						class="x_title_num_main_box_wrapper x_title_num_main_box_wrapper3">
						<div class="x_icon_num x_icon_num3">
							<p>4</p>
						</div>
						<h5>checkout</h5>
					</div>
					<div
						class="x_title_num_main_box_wrapper x_title_num_main_box_wrapper3 x_title_num_main_box_wrapper_last">
						<div class="x_icon_num x_icon_num3">
							<p>5</p>
						</div>
						<h5>done!</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- x tittle num Wrapper End -->


	<!-- x car book sidebar section Wrapper Start -->
	<div class="x_car_book_sider_main_Wrapper float_left">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
					<div class="x_car_book_left_siderbar_wrapper float_left">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div
									class="x_slider_form_main_wrapper float_left x_slider_form_main_wrapper_ccb">
									<div
										class="x_slider_form_heading_wrapper x_slider_form_heading_wrapper_carbooking float_left">
										<h3>Let’s find your perfect car</h3>
									</div>
									<div class="row">


										<div class="col-md-12">
											<div class="js-search-container-filter-insu-type">
												<div class="text-14 font-weight-bold color-grey-5 mb-2">자차보험</div>
												<div class="text-center mb-3">
													<div class="btn-group w-100">
														<button
															class="js-tab-insu-type-pc btn py-2 w-25 btn-primary"
															type="button" data-t="all">
															<div
																class="d-flex justify-content-center align-items-center">
																<span class="text-11 ml-1">전체</span>
															</div>
														</button>
														<button
															class="js-tab-insu-type-pc btn btn-light py-2 w-25"
															type="button" data-t="1">
															<div
																class="d-flex justify-content-center align-items-center">
																<span class="text-11 ml-1">일반자차</span>
															</div>
														</button>
														<button
															class="js-tab-insu-type-pc btn btn-light py-2 w-25"
															type="button" data-t="2">
															<div
																class="d-flex justify-content-center align-items-center">
																<span class="text-11 ml-1">완전자차</span>
															</div>
														</button>
														<button
															class="js-tab-insu-type-pc btn btn-light py-2 w-25"
															type="button" data-t="3">
															<div
																class="d-flex justify-content-center align-items-center">
																<span class="text-11 ml-1">슈퍼자차</span>
															</div>
														</button>
													</div>
												</div>
												<hr>
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<div class="text-11 font-weight-bold color-grey-5 mb-2">인기
													키워드</div>
												<div class="wordbreak-breakword w-100 text-11 mb-2"
													id="vf_container_hashtag_pc">
													<button
														class="js-btn-vf-hashtag btn btn-category px-2 py-1 mr-1 mb-2 dc-inline-block"
														data-id="신차">#신차</button>
													<button
														class="js-btn-vf-hashtag btn btn-category px-2 py-1 mr-1 mb-2 dc-inline-block"
														data-id="오픈카">#오픈카</button>
													<button
														class="js-btn-vf-hashtag btn btn-category px-2 py-1 mr-1 mb-2 dc-inline-block"
														data-id="가족여행">#가족여행</button>
													<button
														class="js-btn-vf-hashtag btn btn-category px-2 py-1 mr-1 mb-2 dc-inline-block"
														data-id="커플/우정여행">#커플/우정여행</button>
												</div>
												<hr>
											</div>
										</div>


										<div class="col-md-12">
											<div class="js-vf-section-car-model">
												<div class="form-group mb-0">
													<div class="text-14 font-weight-bold color-grey-5 mb-2">자동차
														모델</div>

													<div class="dc-flex">
														<div class="dc-block w-100">
															<div class="position-relative">
																<input
																	class="js-input-deletable form-control form-control-sm"
																	id="vf_car_model_input_pc"
																	placeholder="자동차 모델명으로 검색할 수 있습니다" type="text"
																	maxlength="20" size="1" max="9" pattern=""
																	autocomplete="off"
																	data-auto-carmodel="vf_dropdown_car_models_auto_pc">
																<div
																	class="js-btn-delete-input btn-input-close-sm clickable"
																	data-input="vf_car_model_input_pc">
																	<div class="wrapper">
																		<img
																			src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNDNEM0QzQiIGQ9Ik04IDE1YzMuODY2IDAgNy0zLjEzNCA3LTdzLTMuMTM0LTctNy03LTcgMy4xMzQtNyA3IDMuMTM0IDcgNyA3eiIvPgogICAgPHBhdGggZmlsbD0iI2ZmZiIgZmlsbC1ydWxlPSJldmVub2RkIiBkPSJNNy4yOTMgOGwtMi4xMjEgMi4xMjIuNzA3LjcwN0w4IDguNzA3bDIuMTIyIDIuMTIyLjcwNy0uNzA3TDguNzA3IDggMTAuODMgNS44OGwtLjcwNy0uNzA3TDggNy4yOTMgNS44OCA1LjE3MmwtLjcwNy43MDdMNy4yOTMgOHoiIGNsaXAtcnVsZT0iZXZlbm9kZCIvPgo8L3N2Zz4K">
																	</div>
																</div>
																<div class="dropdown-menu"
																	id="vf_dropdown_car_models_auto_pc"
																	style="max-height: 190px; overflow-y: scroll;"></div>
															</div>
														</div>

														<button class="btn btn-primary btn-sm px-3 ml-1"
															id="js_vf_btn_car_model_apply_pc">검색</button>
													</div>
												</div>
												<hr>
											</div>
										</div>



										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="car-filter accordion car_booking_onliy_side">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h5 class="panel-title">
															<a data-toggle="collapse" href="#collapseOne"
																class="collapse">세그먼트</a>
														</h5>
													</div>
													<div id="collapseOne" class="collapse show">
														<div class="panel-body">
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="all" name="segment">
																<label for="all">전체</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s1" name="segment"> <label
																	for="s1">경형</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s2" name="segment"> <label
																	for="s2">소형</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s3" name="segment"> <label
																	for="s3">준중형</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s4" name="segment"> <label
																	for="s4">중형</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s5" name="segment"> <label
																	for="s5">대형</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s6" name="segment"> <label
																	for="s6">수입</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s7" name="segment"> <label
																	for="s7">승합RV</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s8" name="segment"> <label
																	for="s8">SUV</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s9" name="segment"> <label
																	for="s9">캠핑카</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s10" name="segment">
																<label for="s10">카라반</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="s11" name="segment">
																<label for="s11">차박</label>
															</div>
														</div>

													</div>
												</div>
												<hr>
											</div>
										</div>


										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="car-filter accordion car_booking_onliy_side">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h5 class="panel-title">
															<a data-toggle="collapse" href="#collapseOne"
																class="collapse">연료</a>
														</h5>
													</div>
													<div id="collapseOne" class="collapse show">
														<div class="panel-body">
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="all" name="fuel">
																<label for="all">전체</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="f1" name="fuel"> <label
																	for="f1">경형</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="f2" name="fuel"> <label
																	for="f2">소형</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="f3" name="fuel"> <label
																	for="f3">준중형</label>
															</div>
															<div
																class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
																<input type="checkbox" id="f4" name="fuel"> <label
																	for="f4">중형</label>
															</div>
														</div>

													</div>
												</div>
												<hr>
											</div>
										</div>



										<div class="col-md-12">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>Pick-up Location</h3>
												<input type="text"
													placeholder="City, Airport, Station, etc.">
											</div>
										</div>
										<div class="col-md-12">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>Drop-off Location</h3>
												<input type="text"
													placeholder="City, Airport, Station, etc.">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-sec-header">
												<h3>Pick-up Date</h3>
												<label class="cal-icon">Pick-up Date <input
													type="text" placeholder="Tue 16 Jan 2018"
													class="form-control datepicker">
												</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="x_slider_select">
												<select class="myselect">
													<option>09</option>
													<option>01</option>
													<option>02</option>
													<option>03</option>
												</select> <i class="fa fa-clock-o"></i>
											</div>
											<div class="x_slider_select x_slider_select2">
												<select class="myselect">
													<option>50</option>
													<option>40</option>
													<option>03</option>
													<option>02</option>
												</select>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-sec-header">
												<h3>Drop-Off Date</h3>
												<label class="cal-icon">Pick-up Date <input
													type="text" placeholder="Tue 16 Jan 2018"
													class="form-control datepicker">
												</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="x_slider_select">
												<select class="myselect">
													<option>09</option>
													<option>01</option>
													<option>02</option>
													<option>03</option>
												</select> <i class="fa fa-clock-o"></i>
											</div>
											<div class="x_slider_select x_slider_select2">
												<select class="myselect">
													<option>50</option>
													<option>40</option>
													<option>03</option>
													<option>02</option>
												</select>
											</div>
										</div>
										<div class="col-md-12">
											<div class="x_slider_checkbox float_left">
												<input type="checkbox" id="c2" name="cb"> <label
													for="c2">Driver age is between 30-65 &nbsp;<i
													class="fa fa-question-circle"></i>
												</label>
											</div>
										</div>
										<div class="col-md-12">
											<div
												class="x_slider_checout_right x_slider_checout_right_carbooking">
												<ul>
													<li><a href="#">search <i
															class="fa fa-arrow-right"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<!-- Filter Results -->
								<div class="car-filter accordion car_booking_onliy_side">
									<h3>Filter Results</h3>
									<hr>
									<!-- Resources -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h5 class="panel-title">
												<a data-toggle="collapse" href="#collapseOne"
													class="collapse"> Resources</a>
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
									<!-- Attributes -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h5 class="panel-title">
												<a data-toggle="collapse" href="#collapseThree"
													class="collapse"> Attributes</a>
											</h5>
										</div>
										<div id="collapseThree" class="collapse show">
											<div class="panel-body">
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="c10" name="cb"> <label
														for="c10">Diesel</label>
												</div>
												<div
													class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
													<input type="checkbox" id="c11" name="cb"> <label
														for="c11">Hybrid</label>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div
										class="x_slider_checout_right x_slider_checout_right_carbooking x_slider_checout_right_carbooking_fiter">
										<ul>
											<li><a href="#">filter <i class="fa fa-arrow-right"></i></a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>



				<!-- 자동차 목록 -->

				<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
					<div class="x_carbooking_right_section_wrapper float_left">
						<div class="row">
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="x_carbook_right_select_box_wrapper float_left">
									<select class="myselect">
										<option>Sort by Price</option>
										<option>12$</option>
										<option>13$</option>
										<option>14$</option>
									</select>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="x_carbook_right_tabs_box_wrapper float_left">
									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#home"> <i class="flaticon-menu"></i>
										</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#menu1"><i class="flaticon-list"></i></a>
										</li>
									</ul>
									<p>
										<span>Showing 1-12</span> of 256 results
									</p>
								</div>
							</div>
							<div class="col-md-12">
								<div class="x_car_book_tabs_content_main_wrapper">
									<div class="tab-content">
										<div id="home" class="tab-pane active">
											<div class="row">
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c1.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h6>
																	<i class="fa fa-tag"></i> &nbsp;15% off Deal
																</h6>
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Irizar</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c2.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Holden</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c3.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Elfin</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c4.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Bowler</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c5.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Diatto</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c6.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Lloyd</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c7.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Genesis</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c8.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Brammo</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="../resources/images/c1.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">AC Cars</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c2.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">BMW</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c3.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Austin</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div class="x_car_offer_starts float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
														</div>
														<div class="x_car_offer_img float_left">
															<img src="images/c4.png" alt="img">
														</div>
														<div class="x_car_offer_price float_left">
															<div class="x_car_offer_price_inner">
																<h3>$25</h3>
																<p>
																	<span>from</span> <br>/ day
																</p>
															</div>
														</div>
														<div class="x_car_offer_heading float_left">
															<h2>
																<a href="#">Eterniti</a>
															</h2>
															<p>Extra Small</p>
														</div>
														<div class="x_car_offer_heading float_left">
															<ul>
																<li><a href="#"><i class="fa fa-users"></i>
																		&nbsp;4</a></li>
																<li><a href="#"><i class="fa fa-clone"></i>
																		&nbsp;2</a></li>
																<li><a href="#"><i class="fa fa-briefcase"></i>
																		&nbsp;9</a></li>
																<li>
																	<div class="nice-select" tabindex="0">
																		<span class="current"><i class="fa fa-bars"></i></span>
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
														<div class="x_car_offer_bottom_btn float_left">
															<ul>
																<li><a href="#">Book now</a></li>
																<li><a href="#">Details</a></li>
															</ul>
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
															<li class="btc_four_pegi"><a href="#">...</a></li>
															<li><a href="#"><i class="flaticon-right-arrow"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div id="menu1" class="tab-pane fade">
											<div class="row">
												<div class="col-md-12">
													<div class="x_car_offer_main_boxes_wrapper float_left">
														<div
															class="x_car_offer_starts x_car_offer_starts_list_img float_left">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
																class="fa fa-star-o"></i>
															<div
																class="x_car_offer_img x_car_offer_img_list float_left">
																<img src="images/c1.png" alt="img">
															</div>
															<div
																class="x_car_offer_price x_car_offer_price_list float_left">
																<div
																	class="x_car_offer_price_inner x_car_offer_price_inner_list">
																	<h6>
																		<i class="fa fa-tag"></i> &nbsp;15% off Deal
																	</h6>
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
																	<a href="#">IKCO</a>
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

</body>

</html>
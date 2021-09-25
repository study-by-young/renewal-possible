<!-- 일반 렌트: 렌터카 목록 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<title>렌터카 목록 페이지</title>
<meta charset="utf-8" />

<style>

	ul li {
		list-style: none;
	}
	
	.select_tit {
		font-size: 14px;
	    font-weight: 800;
	    color: #111111;
	    text-transform: uppercase;
	    padding-top: 15px;
	    padding-bottom: 15px;
	}
	
	.rent_select {
	    cursor: pointer;
	    display: block;
	    padding: 5px;
	}
	
	.dropdown {
	    display: inline-block;
	    background-color: #fff;
	    transition: all .5s ease;
	    position: relative;
	    font-size: 16px;
	    color: #444;
	    height: 100%;
	    text-align: left;
	}	
	
	.rent_search {
		float: left;
	}
	
	.rent_search_li {
		padding-left: 15px;
		padding-right: 15px;
		padding-bottom: 10px;
	}
	
	.division {
		border-right: 1px solid #e6e6e6;
	}
	
	.rent_search_ul {
	    display: block;
	    list-style-type: disc;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 10px;
	    padding-inline-end: 10px;
	    
	    display: inline-block;
	    background-color: #fff;
	    transition: all .5s ease;
	    position: relative;
	    font-size: 16px;
	    color: #444;
	    height: 100%;
	    text-align: left;
	    
	    float: left;
	    background: #ffffff;
	    position: relative;
	    animation-delay: 2.6s;
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    border-radius: 10px;

	}
	
	li {
		float: left;
	}	

	.btn_check_wrapper {
		float: right;
		margin: 10px;
		display: block;
		position: relative;
	    list-style-type: disc;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 10px;
	    
	    position: relative;
	    font-size: 16px;
	    height: 100%;
	}
	
	.btn_check {
	    float: left;
	    width: 110px;
	    padding-top: 30px;
	}
	
	.btn_check li a {
	    float: left;
	    width: 100px;
	    height: 50px;
	    line-height: 45px;
	    text-align: center;
	    background: #4f5dec;
	    color: #ffffff;
	    border: 1px solid transparent;
	    text-transform: uppercase;
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    border-radius: 10px;	    
	}

	.btn_check li a:hover {
	    background: white;
	    border: 1px solid #4f5dec;
	    color: #4f5dec;
	}	
	
	.rent_date_ul {
	    display: block;
	    list-style-type: disc;

	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 10px;
	    padding-inline-end: 10px;
	    padding: 5px;
	    
	    display: inline-block;
	    background-color: #fff;
	    transition: all .5s ease;
	    position: relative;
	    font-size: 16px;
	    color: #444;
	    height: 100%;
	    text-align: left;
	    
	    float: left;
	    background: #ffffff;
	    position: relative;
	    animation-delay: 2.6s;
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    border-radius: 10px;

	}
	
	.selectStyle {
		float: left;
		width: 100px;
	    position: relative;
	    border: none;
	}
</style>

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


<!-- 차량검색 및 추천받기 -->
<div class="rent_search_wrapper">
	<!-- 차량검색 -->
	<div class="rent_search">
		<ul class="rent_search_ul">
			<!-- 지역: 클릭하면 modal창 뜨도록 -->
			<li id="placePick" class="rent_search_li division modal_placePick">
				<div class="select_tit">지역</div> 
				<span class="date rent_select">{선택한 지역}</span>
			</li> 
			<!-- 날짜선택: 클릭하면 modal창(same) -->
			<li id="datePick" class="rent_search_li division modal_datePick">
				<div class="select_tit">날짜</div> 
				<span class="date rent_select">{선택한 날짜}</span>
			</li>
			<!-- 인수시간: 클릭하면 modal창(same) -->
			<li class="rent_search_li division modal_datePick">
				<div class="dropdown takeover">
					<div class="select_tit">인수시간</div> 
					<div class="rent_select">
						<span class="date-t bz-stime">{선택한 시간}</span>
					</div>
				</div>
			</li>
			<!-- 반납시간: 클릭하면 modal창(same) -->
			<li class="rent_search_li division modal_datePick">
				<div class="dropdown return">
					<div class="select_tit">반납시간</div> 
					<div class="rent_select">
						<span class="date-t bz-etime">{선택한 시간}</span>
					</div>
				</div>
			</li>
			<!-- 인원수: drop down이 안 먹혀서 select option으로 수정 -->
			<li class="rent_search_li division people">
				<div class="select_tit">인원</div> 
				<div class="rent_select">
					<span class="selectStyle">
						<select>
							<option>선택</option>
							<option>1인</option>
							<option>2인</option>
							<option>3인</option>
							<option>4인</option>
							<option>5인이상</option>
						</select>
					</span>
				</div>
			</li>
			
			<!-- 인원수: drop down 
			<li class="dropdown rent_search_li division people" data-bs-toggle="dropdown">
				<div class="select_tit">인원</div> 
				<div class="rent_select"><span>{선택한 인원수}</span></div>
				<ul class="dropdown-menu">
						<li class="dropdown-item">
							<label for="selectPeople0">1인</label>
						</li>
						<li class="dropdown-item">
							<label for="selectPeople1">2인</label>
						</li>
						<li class="dropdown-item checked">
							<label for="selectPeople2">3인</label>
						</li>
						<li class="dropdown-item">
							<label for="selectPeople3">4인</label>
						</li>
						<li class="dropdown-item">
							<label for="selectPeople4">5인이상</label>
						</li>
					</ul>
			</li> -->	
			
			<!-- 자차보험: drop down이 안 먹혀서 select option으로 수정 -->
			<li class="rent_search_li division insure">
				<div class="select_tit">자차보험</div> 
				<div class="rent_select">
					<span class="selectStyle">
						<select>
							<option>선택</option>
							<option>선택안함</option>
							<option>일반자차</option>
							<option>완전자차</option>
						</select>
					</span>
				</div>
			</li>
			
			<!-- 자차보험: drop down
			<li>
				<div class="dropdown rent_search_li insure" data-bs-toggle="dropdown">
					<div class="select_tit">자차보험</div>
					<div class="rent_select"><span>{선택한 보험옵션}</span></div>
					<ul class="dropdown-menu">
						<li class="dropdown-item">
							<label for="selectInsure0">선택안함</label>
						</li>
						<li class="dropdown-item">
							<label for="selectInsure1">일반자차</label>
						</li>
						<li class="dropdown-item checked">
							<label for="selectInsure2">완전자차</label>
						</li>
					</ul>
				</div>
			</li> -->
		</ul>
	
			<div class="btn_check_wrapper">
				<div class="btn_check">
					<ul>
						<li><a href="#">검색</a></li>
					</ul>
				</div>
				<div class="btn_check">
					<ul>
						<li><a href="#">추천받기</a></li>
					</ul>
				</div>
			</div>	
	</div>
	
	
	<!-- 검색내용 
	<div class="rent_date">
		<ul class="rent_date_ul">
			<li>대여일 : <span>{선택한 날짜} + {인수시간}</span></li>
			<li><img src=""></li>
			<li>반납일 : <span>{선택한 날짜} + {반납시간}</span></li>
			<li>인원 : <span>{선택한 인원수}</span></li>
			<li>자차보험 : <span>{선택한 보험}</span></li>
		</ul>	
	</div>
	-->
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
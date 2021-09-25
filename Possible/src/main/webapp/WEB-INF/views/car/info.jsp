<!-- 일반 렌트: 렌터카 상세조회 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
	<title>렌터카 상세조회 페이지</title>
	<meta charset="utf-8" />

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
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Dakota Avant</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
								<li><a href="#">Home</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li><a href="#">Cars</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li>Dakota Avant</li>
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
					<div class="x_title_num_main_box_wrapper x_title_num_main_box_wrapper2">
						<div class="x_icon_num x_icon_num2">
							<p>2</p>
						</div>
						<h5>Car</h5>
					</div>
					<div class="x_title_num_main_box_wrapper x_title_num_main_box_wrapper3">
						<div class="x_icon_num x_icon_num3">
							<p>3</p>
						</div>
						<h5>detail</h5>
					</div>
					<div class="x_title_num_main_box_wrapper x_title_num_main_box_wrapper3">
						<div class="x_icon_num x_icon_num3">
							<p>4</p>
						</div>
						<h5>checkout</h5>
					</div>
					<div class="x_title_num_main_box_wrapper x_title_num_main_box_wrapper3 x_title_num_main_box_wrapper_last">
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
								<div class="x_slider_form_main_wrapper float_left x_slider_form_main_wrapper_ccb">
									<div class="x_slider_form_heading_wrapper x_slider_form_heading_wrapper_carbooking float_left">
										<h3>Let’s find your perfect car</h3>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>Pick-up Location</h3>
												<input type="text" placeholder="City, Airport, Station, etc.">
											</div>
										</div>
										<div class="col-md-12">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>Drop-off Location</h3>
												<input type="text" placeholder="City, Airport, Station, etc.">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-sec-header">
												<h3>Pick-up Date</h3>
												<label class="cal-icon">Pick-up Date
													<input type="text" placeholder="Tue 16 Jan 2018" class="form-control datepicker">
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
												</select>	<i class="fa fa-clock-o"></i>
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
												<label class="cal-icon">Pick-up Date
													<input type="text" placeholder="Tue 16 Jan 2018" class="form-control datepicker">
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
												</select>	<i class="fa fa-clock-o"></i>
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
												<input type="checkbox" id="c2" name="cb">
												<label for="c2">Driver age is between 30-65 &nbsp;<i class="fa fa-question-circle"></i>
												</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="x_slider_checout_right x_slider_checout_right_carbooking">
												<ul>
													<li><a href="#">search <i class="fa fa-arrow-right"></i></a>
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
				<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
					<div class="row">
						<div class="col-md-12">
							<div class="x_car_detail_main_wrapper float_left">
								<div class="lr_bc_slider_first_wrapper">
									<div class="owl-carousel owl-theme">
										<div class="item">
											<div class="lr_bc_slider_img_wrapper">
												<img src="images/bc2.jpg" alt="fresh_food_img">
											</div>
										</div>
										<div class="item">
											<div class="lr_bc_slider_img_wrapper">
												<img src="${pageContext.request.contextPath}/resources/images/bc3.jpg" alt="fresh_food_img">
											</div>
										</div>
										<div class="item">
											<div class="lr_bc_slider_img_wrapper">
												<img src="${pageContext.request.contextPath}/resources/images/bc4.jpg" alt="fresh_food_img">
											</div>
										</div>
									</div>
								</div>
								<div class="x_car_detail_slider_bottom_cont float_left">
									<div class="x_car_detail_slider_bottom_cont_left">
										<h3>Dakota zaris</h3>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<span>251 Reviews</span>
									</div>
									<div class="x_car_detail_slider_bottom_cont_right">
										<h3>$25</h3>
										<p><span>from</span> 
											<br>/ day</p>
									</div>
									<div class="x_car_detail_slider_bottom_cont_center float_left">
										<p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, rem a quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Dssed odio sit amet nibh vulputate cursus a sit amt mauris. Morbi accumsan ipsum velit.
											<br>
											<br>This is Photoshop's version of Lorem Ipsum. Proin gravida n vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum tor. This is Photoshop's version of Lorem Ipsum.</p>
									</div>
									<div class="x_car_offer_heading x_car_offer_heading_listing float_left x_car_offer_heading_inner_car_names x_car_offer_heading_inner_car_names2">
																<ul class="">
																	<li>	<a href="#"><i class="fa fa-users"></i> &nbsp;4 Seats</a>
																	</li>
																	<li>	<a href="#"><i class="fa fa-clone"></i> &nbsp;4 Doors</a>
																	</li>
																	<li>	<a href="#"><i class="fa fa-shield"></i> &nbsp;9 Manual</a>
																	</li>
																
																	<li>	<a href="#"><i class="fa fa-briefcase"></i> &nbsp;4 Bag Space</a>
																	</li>
																	<li>	<a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2 Air: Yes</a>
																	</li>
																	<li>
																		<div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> Others (2)</span>
																			<ul class="list">
																				<li class="dpopy_li"><a href="#"><i class="fa fa-snowflake-o"></i> Air Conditioning</a>
																				</li>
																				<li class="dpopy_li"><a href="#"><i class="fa fa-code-fork"></i> Transmission</a>
																				</li>
																				<li class="dpopy_li"><a href="#"><i class="fa fa-user-circle-o"></i> Minimum age</a>
																				</li>
																			</ul>
																		</div>
																	</li>
																</ul>
															</div>
									<div class="x_avanticar_btn float_left">
										<ul>
											<li><a href="#">Book Now <i class="fa fa-arrow-right"></i></a>
											</li>
										</ul>
									</div>
								</div>
								<div class="x_ln_car_heading_wrapper x_ln_car_heading_wrappercsss float_left">
									<h3>Latest cars</h3>
								</div>
								<div class="btc_ln_slider_wrapper btc_ln_slider_wrapper_cs">
									<div class="owl-carousel owl-theme">
										<div class="item">
											<div class="x_car_offer_main_boxes_wrapper float_left margintop_zero">
												<div class="x_car_offer_starts float_left">	<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="x_car_offer_img float_left">
													<img src="${pageContext.request.contextPath}/resources/images/c1.png" alt="img">
												</div>
												<div class="x_car_offer_price float_left">
													<div class="x_car_offer_price_inner">
														<h3>$25</h3>
														<p><span>from</span> 
															<br>/ day</p>
													</div>
												</div>
												<div class="x_car_offer_heading float_left">
													<h2><a href="#">Dakota zaris</a></h2>
													<p>Extra Small</p>
												</div>
												<div class="x_car_offer_heading x_car_offer_heading_avanti float_left">
													<ul>
														<li>	<a href="#"><i class="fa fa-users"></i> &nbsp;4</a>
														</li>
														<li>	<a href="#"><i class="fa fa-clone"></i> &nbsp;2</a>
														</li>
														<li>	<a href="#"><i class="fa fa-briefcase"></i> &nbsp;9</a>
														</li>
														<li>
															<div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i></span>
																<ul class="list">
																	<li class="dpopy_li"><a href="#"><i class="fa fa-snowflake-o"></i> Air Conditioning</a>
																	</li>
																	<li class="dpopy_li"><a href="#"><i class="fa fa-code-fork"></i> Transmission</a>
																	</li>
																	<li class="dpopy_li"><a href="#"><i class="fa fa-user-circle-o"></i> Minimum age</a>
																	</li>
																</ul>
															</div>
														</li>
													</ul>
												</div>
												<div class="x_car_offer_bottom_btn float_left">
													<ul>
														<li><a href="#">Book now</a>
														</li>
														<li><a href="#">Details</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="x_car_offer_main_boxes_wrapper float_left margintop_zero">
												<div class="x_car_offer_starts float_left">	<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="x_car_offer_img float_left">
													<img src="${pageContext.request.contextPath}/resources/images/c1.png" alt="img">
												</div>
												<div class="x_car_offer_price float_left">
													<div class="x_car_offer_price_inner">
														<h3>$25</h3>
														<p><span>from</span> 
															<br>/ day</p>
													</div>
												</div>
												<div class="x_car_offer_heading float_left">
													<h2><a href="#">Dakota zaris</a></h2>
													<p>Extra Small</p>
												</div>
												<div class="x_car_offer_heading x_car_offer_heading_avanti float_left">
													<ul>
														<li>	<a href="#"><i class="fa fa-users"></i> &nbsp;4</a>
														</li>
														<li>	<a href="#"><i class="fa fa-clone"></i> &nbsp;2</a>
														</li>
														<li>	<a href="#"><i class="fa fa-briefcase"></i> &nbsp;9</a>
														</li>
														<li>
															<div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i></span>
																<ul class="list">
																	<li class="dpopy_li"><a href="#"><i class="fa fa-snowflake-o"></i> Air Conditioning</a>
																	</li>
																	<li class="dpopy_li"><a href="#"><i class="fa fa-code-fork"></i> Transmission</a>
																	</li>
																	<li class="dpopy_li"><a href="#"><i class="fa fa-user-circle-o"></i> Minimum age</a>
																	</li>
																</ul>
															</div>
														</li>
													</ul>
												</div>
												<div class="x_car_offer_bottom_btn float_left">
													<ul>
														<li><a href="#">Book now</a>
														</li>
														<li><a href="#">Details</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="x_car_offer_main_boxes_wrapper float_left margintop_zero">
												<div class="x_car_offer_starts float_left">	<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="x_car_offer_img float_left">
													<img src="${pageContext.request.contextPath}/resources/images/c1.png" alt="img">
												</div>
												<div class="x_car_offer_price float_left">
													<div class="x_car_offer_price_inner">
														<h3>$25</h3>
														<p><span>from</span> 
															<br>/ day</p>
													</div>
												</div>
												<div class="x_car_offer_heading float_left">
													<h2><a href="#">Dakota zaris</a></h2>
													<p>Extra Small</p>
												</div>
												<div class="x_car_offer_heading x_car_offer_heading_avanti float_left">
													<ul>
														<li>	<a href="#"><i class="fa fa-users"></i> &nbsp;4</a>
														</li>
														<li>	<a href="#"><i class="fa fa-clone"></i> &nbsp;2</a>
														</li>
														<li>	<a href="#"><i class="fa fa-briefcase"></i> &nbsp;9</a>
														</li>
														<li>
															<div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i></span>
																<ul class="list">
																	<li class="dpopy_li"><a href="#"><i class="fa fa-snowflake-o"></i> Air Conditioning</a>
																	</li>
																	<li class="dpopy_li"><a href="#"><i class="fa fa-code-fork"></i> Transmission</a>
																	</li>
																	<li class="dpopy_li"><a href="#"><i class="fa fa-user-circle-o"></i> Minimum age</a>
																	</li>
																</ul>
															</div>
														</li>
													</ul>
												</div>
												<div class="x_car_offer_bottom_btn float_left">
													<ul>
														<li><a href="#">Book now</a>
														</li>
														<li><a href="#">Details</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="x_css_tabs_wrapper float_left">
									<div class="x_css_tabs_main_wrapper float_left">
										<ul class="nav nav-tabs">
										<li class="nav-item">
											<a class="nav-link active" data-toggle="tab" href="#home"> User ReView
											</a>
										</li>
										<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#menu1">Description</a>
										</li>
									</ul>
									</div>
									<div class="tab-content">
										<div id="home" class="tab-pane active">
											<div class="x_css_skills_wrapper">
												<div class="skills mt-50 x_c_s">
									<h3>Rating</h3>
									<div class="skill-item">
										<h6><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <span>90%</span></h6>
										<div class="skills-progress"><span data-value="90%"></span>
										</div>
									</div>
									<div class="skill-item">
										<h6><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><span>40%</span></h6>
										<div class="skills-progress"><span data-value="70%"></span>
										</div>
									</div>
									<div class="skill-item">
										<h6><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> <span>80%</span></h6>
										<div class="skills-progress"><span data-value="80%"></span>
										</div>
									</div>
									<div class="skill-item">
										<h6><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> <span>85%</span></h6>
										<div class="skills-progress"><span data-value="85%"></span>
										</div>
									</div>
									<div class="skill-item">
										<h6><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> <span>5%</span></h6>
										<div class="skills-progress"><span data-value="5%"></span>
										</div>
									</div>
								</div>
											</div>
											<div class="x_css_skills_form_wrapper">
												<div class="x_css_skill_form_heading float_left">
													<h3>Your Reviews</h3>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="row only_left">
													<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="contect_form1 xcontect_form1">
											<input type="text" placeholder="Full Name *">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="contect_form2 xcontect_form2">
											<input type="email" placeholder="Email *">
										</div>
									</div>
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="contect_form2 xcontect_form2">
											<input type="text" placeholder="Title *">
										</div>
									</div>
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="contect_form4 xcontect_form4">
											<textarea rows="4" placeholder="Write Comment"></textarea>
										</div>
									</div>
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="contect_btn x_css_form_btn">
											<ul>
												<li><a href="#">Submit <i class="fa fa-arrow-right"></i></a>
												</li>
											</ul>
										</div>
									</div>
												</div>
											</div>
										</div>
										<div id="menu1" class="tab-pane fade">
											<div class="x_car_detail_descrip">
												<p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, rem a quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Dssed odio sit amet nibh vulputate cursus a sit amt mauris. Morbi accumsan ipsum velit. 
												This is Photoshop's version of Lorem Ipsum. Proin gravida n vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum tor. This is Photoshop's version of Lorem Ipsum.</p>
												<ul>
													<li><a href="#">Read More <i class="fa fa-arrow-right"></i></a>
													</li>
												</ul>
											</div>
										</div>
									</div>	
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="blog_single_comment_wrapper">
										<div class="blog_comment3_wrapper">
											<div class="blog_comment1_img">
												<img src="images/comment_img3.jpg" alt="comment_img" class="img-responsive img-circle" />
											</div>
											<div class="blog_comment1_cont">
												<h3>Jhon Doe <i class="fa fa-circle"></i> <span>July 1, 2016</span> &nbsp;&nbsp;<i class="fa fa-star oo"></i>
													<i class="fa fa-star oo"></i>
													<i class="fa fa-star oo"></i>
													<i class="fa fa-star-o oo"></i>
													<i class="fa fa-star-o oo"></i></h3>
												<p>Integer porttitor fringilla vestibulum. Phasellus curs our tinnt nulla, ut mattis augue finibus ac. Vivamus elementum enim ac enim ultrices rhoncus.</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog_single_comment_wrapper">
										<div class="blog_comment3_wrapper">
											<div class="blog_comment1_img">
												<img src="images/comment_img4.jpg" alt="comment_img" class="img-responsive img-circle" />
											</div>
											<div class="blog_comment1_cont">
												<h3>Jhon Doe <i class="fa fa-circle"></i> <span>July 1, 2016 </span> &nbsp;&nbsp;<i class="fa fa-star oo"></i>
													<i class="fa fa-star oo"></i>
													<i class="fa fa-star oo"></i>
													<i class="fa fa-star-o oo"></i>
													<i class="fa fa-star-o oo"></i></h3>
												<p>Integer porttitor fringilla vestibulum. Phasellus curs our tinnt nulla, ut mattis augue finibus ac. Vivamus elementum enim ac enim ultrices rhoncus.</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog_single_comment_wrapper">
										<div class="blog_comment3_wrapper">
											<div class="blog_comment1_img">
												<img src="images/comment_img2.jpg" alt="comment_img" class="img-responsive img-circle" />
											</div>
											<div class="blog_comment1_cont">
												<h3>Jhon Doe <i class="fa fa-circle"></i> <span>July 1, 2016 </span> &nbsp;&nbsp;<i class="fa fa-star oo"></i>
													<i class="fa fa-star oo"></i>
													<i class="fa fa-star oo"></i>
													<i class="fa fa-star-o oo"></i>
													<i class="fa fa-star-o oo"></i></h3>
												<p>Integer porttitor fringilla vestibulum. Phasellus curs our tinnt nulla, ut mattis augue finibus ac. Vivamus elementum enim ac enim ultrices rhoncus.</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog_single_comment_wrapper">
										<div class="blog_comment3_wrapper">
											<div class="blog_comment1_img">
												<img src="images/comment_img1.jpg" alt="comment_img" class="img-responsive img-circle" />
											</div>
											<div class="blog_comment1_cont">
												<h3>Jhon Doe <i class="fa fa-circle"></i> <span>July 1, 2016 </span> &nbsp;&nbsp;<i class="fa fa-star oo"></i>
													<i class="fa fa-star oo"></i>
													<i class="fa fa-star oo"></i>
													<i class="fa fa-star-o oo"></i>
													<i class="fa fa-star-o oo"></i></h3>
												<p>Integer porttitor fringilla vestibulum. Phasellus curs our tinnt nulla, ut mattis augue finibus ac. Vivamus elementum enim ac enim ultrices rhoncus.</p>
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
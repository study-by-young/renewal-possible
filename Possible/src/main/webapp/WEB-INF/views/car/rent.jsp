<!-- 일반 렌트: 렌터카 예약(결제 진행) 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
	<title>렌터카 결제 진행 페이지</title>
	<meta charset="utf-8" />

	<!--Template style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/xpedia.css" />
	<!--favicon-->
	<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/fevicon.png" />
</head>

<body>

	<!-- btc tittle Wrapper Start -->
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Checkout</h1>
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
								<li>Checkout</li>
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
					<div class="x_title_num_main_box_wrapper">
						<div class="x_icon_num ">
							<p>2</p>
						</div>
						<h5>Car</h5>
					</div>
					<div class="x_title_num_main_box_wrapper">
						<div class="x_icon_num">
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
								<!-- Filter Results -->
								<div class="car-filter accordion x_inner_car_acc_accor">
									<h3>Order Details</h3>
									<hr>
									<!-- Resources -->
									<div class="x_car_access_filer_top_img">
										<img src="images/c2.png" alt="car_img">
										<h3>Dakota gtx</h3>
										<p>$69 (1 day)</p>
									</div>
									<hr>
									<!-- Company -->
									<!-- Attributes -->
									<div class="panel panel-default x_car_inner_acc_acordion_padding">
										<div class="collapse show">
											<div class="panel-body">
												<div class="x_car_acc_filter_date">
													<table class="table">
														<thead>
															<tr>
																<th scope="col">QTY</th>
																<th scope="col">Rate</th>
																<th scope="col">Subtotal</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>1 Day</td>
																<td>$69</td>
																<td>$69</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
										<div class="panel-heading car_checkout_caret">
											<h5 class="panel-title"> <a href="#"> Pick-up Date & place</a> </h5>
										</div>
										<div class="collapse show">
											<div class="panel-body">
												<div class="x_car_acc_filter_date">
													<ul>
														<li>Tue 16 Jan 2018 @ 10:00</li>
														<li>Barcelona, Airport</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
										<div class="panel-heading car_checkout_caret">
											<h5 class="panel-title"> <a href="#"> Drop-Off Date & place</a> </h5>
										</div>
										<div class="collapse show">
											<div class="panel-body">
												<div class="x_car_acc_filter_date">
													<ul>
														<li>Tue 17 Jan 2018 @ 10:00</li>
														<li>Barcelona, Airport</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
										<div class="panel-heading car_checkout_caret">
											<h5 class="panel-title"> <a href="#"> Accessories</a> </h5>
										</div>
										<div class="collapse show">
											<div class="panel-body">
												<div class="x_car_acc_filter_date">
													<ul>
														<li>1x GPS <span>$19</span>
														</li>
														<li>Insurance <span>$199</span>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
										<div class="panel-heading car_checkout_caret">
											<h5 class="panel-title"> <a href="#"> Taxes & Fees</a> </h5>
										</div>
										<div class="collapse show">
											<div class="panel-body">
												<div class="x_car_acc_filter_date">
													<ul>
														<li>Sales (1%) <span>$1</span>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
										<div class="collapse show">
											<div class="panel-body">
												<div class="x_car_acc_filter_date">
													<input type="text" placeholder="Coupon Code">
													<button type="submit"><i class="fa fa-arrow-right"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="x_car_acc_filter_bottom_total">
										<ul>
											<li>total <span>$287</span>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
					<div class="x_carbooking_right_section_wrapper float_left">
						<div class="row">
							<div class="col-md-12">
								<div class="x_car_checkout_right_main_box_wrapper float_left">
									<div class="car-filter order-billing margin-top-0">
										<div class="heading-block text-left margin-bottom-0">
											<h4>Billing Details</h4>
											<div class="pull-right checkout_login_btn">
												<ul>
													<li><a href="#">Login <i class="fa fa-arrow-right"></i></a>
													</li>
												</ul>
												<p class="retrn">Returning customer?</p>
											</div>
										</div>
										<hr>
										<form class="billing-form">
											<ul class="list-unstyled row">
												<li class="col-md-6">
													<label>First Name *
														<input type="text" placeholder="" class="form-control">
													</label>
												</li>
												<li class="col-md-6">
													<label>Last Name *
														<input type="text" placeholder="" class="form-control">
													</label>
												</li>
												<li class="col-md-6">
													<label>Driver's Lisence ID
														<input type="text" placeholder="" class="form-control">
													</label>
												</li>
												<li class="col-md-6">
													<label>Company
														<input type="text" placeholder="" class="form-control">
													</label>
												</li>
												<li class="col-md-6">
													<label>Country</label>
													<select class="myselect">
														<option>Select</option>
														<option>Afghanistan</option>
														<option>Albania</option>
														<option>Algeria</option>
														<option>Andorra</option>
														<option>Angola</option>
													</select>
												</li>
												<li class="col-md-6">
													<label>City/town</label>
													<select class="myselect">
														<option>Select</option>
														<option>Afghanistan</option>
														<option>Albania</option>
														<option>Algeria</option>
														<option>Andorra</option>
														<option>Angola</option>
													</select>
												</li>
												<li class="col-md-12">
													<label>Street Address
														<input type="text" placeholder="" class="form-control">
													</label>
												</li>
												<li class="col-md-6">
													<label>Phone
														<input type="text" placeholder="" class="form-control">
													</label>
												</li>
												<li class="col-md-6">
													<label>Email Address *
														<input type="email" placeholder="" class="form-control">
													</label>
												</li>
												<li class="col-md-12">
													<label>Additional information</label>
													<textarea placeholder="Notes about your order, e.g. special notes for car." class="form-control"></textarea>
												</li>
											</ul>
											<hr>
											<div class="payme-opton">
												<div class="heading-block text-left margin-bottom-30">
													<h4>Payment</h4>
												</div>
												<div class="radio">
													<input type="radio" name="ratio" id="poa" value="option1" checked="">
													<label for="poa">Payment on Arrival</label>
												</div>
												<div class="radio">
													<input type="radio" name="ratio" id="paypal" value="option1">
													<label for="paypal">Paypal</label>
												</div>
												<div class="radio">
													<input type="radio" name="ratio" id="stripe" value="option1">
													<label for="stripe">Stripe</label>
												</div>
											</div>
											<hr>
											<div class="checkbox car_checkout_chekbox car_checkout_chekbox1">
												<input type="checkbox" id="c2" name="cb">
												<label for="c2">Create an Account?</label>
											</div>
											<div class="checkbox car_checkout_chekbox">
												<input type="checkbox" id="c3" name="cb">
												<label for="c3">I have Read and Accept Terms & Conditions *</label>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="contect_btn contect_btn_contact">
									<ul>
										<li><a href="#">Place an Order <i class="fa fa-arrow-right"></i></a>
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
	<!-- x car book sidebar section Wrapper End -->

</body>

</html>
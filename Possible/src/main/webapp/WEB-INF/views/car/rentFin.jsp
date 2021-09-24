<!-- 일반 렌트: 렌터카 예약(결제 완료) 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<title>렌터카 결제 완료 페이지</title>
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
						<h1>Order Done</h1>
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
								<li>Done</li>
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
					<div class="x_title_num_main_box_wrapper">
						<div class="x_icon_num">
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
	<div class="x_car_donr_main_box_wrapper float_left">
		<div class="container">
			<div class="x_car_donr_main_box_wrapper_inner">
				<div class="order-done"> <i class="icon-checked"><img src="images/icon-checked.png" alt=""></i>
					<h4>thank you! Order has been received</h4>
					<h4>Order number: <span>#887768</span></h4>
					<hr>
					<h4>Summary</h4>
					<ul class="row list-unstyled">
						<li class="col-md-6">
							<h6>Date</h6>
							<p>From <span>16-01-2018 @ 10:00</span>
							</p>
							<p>To <span>16-01-2018 @ 10:00</span>
							</p>
							<p>From <span>1 Day</span>
							</p>
						</li>
						<li class="col-md-6">
							<h6>Location</h6>
							<p>Pick-Up <span>Barcelona, Airport</span>
							</p>
							<p>Drop-off <span>Barcelona, Airport</span>
							</p>
						</li>
						<li class="col-md-6">
							<h6>Car</h6>
							<p>Dakota GT86 <span>$69</span>
							</p>
							<p>Coupe</p>
						</li>
						<li class="col-md-6">
							<h6>Add-ons</h6>
							<p>1x GPS <span>$19</span>
							</p>
							<p>Extended Insurance <span>$199</span>
							</p>
						</li>
						<li class="col-md-6">
							<h6>Taxes & Fees</h6>
							<p>Sales Tax (1%) <span>$1</span>
							</p>
						</li>
						<li class="col-md-6">
							<h6>Total</h6>
							<p>Payment on Arrival <span>$288</span>
							</p>
						</li>
						<li class="col-md-12">
							<h6>Billing Information</h6>
							<p>John Smith
								<br>Driver’s License ID 1234567890
								<br>Envato Ltd.
								<br>Australia
								<br>Victoria
								<br>PO Box 16122 Collins Street West
								<br>+61 3 8376 6284
								<br>john@envato.com
								<br>
							</p>
						</li>
						<li class="col-md-12">
							<h6>Additional Information</h6>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus.</p>
						</li>
					</ul>
					<hr>
					<div class="contect_btn contect_btn_contact">
						<ul>
							<li><a href="#">Print Order <i class="fa fa-print"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>

</html>
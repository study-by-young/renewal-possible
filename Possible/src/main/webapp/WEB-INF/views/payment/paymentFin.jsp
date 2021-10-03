<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 렌트 예약완료(결제완료) 페이지 -->

<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="btc_tittle_img_overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
				<div class="btc_tittle_left_heading">
					<h1>결제완료</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- btc tittle Wrapper End -->

<div class="x_car_donr_main_box_wrapper float_left">
	<div class="container">
		<div class="x_car_donr_main_box_wrapper_inner">
			<div class="order-done">
				<i class="icon-checked"><img src="images/icon-checked.png"
					alt=""></i>
				<h4>이용해주셔서 감사합니다! 예약이 완료되었습니다.</h4>
				<h4>
					예약번호: <span>${rent.merchantUid}</span>
				</h4>
				<hr>
				<h4>예약정보</h4>
				<ul class="row list-unstyled">
					<li class="col-md-6">
						<h6>Date</h6>
						<p>
							From <span>${rent.startDate}</span>
						</p>
						<p>
							To <span>${rent.endDate}</span>
						</p>
					</li>
					<li class="col-md-6">
						<h6>Location</h6>
						<p>
							Pick-Up <span>${rent.takePlaceCode} ${rent.takePlaceBasic} ${rent.takePlaceDetail}</span>
						</p>
						<p>
							Drop-off <span>Barcelona, Airport</span>
						</p>
					</li>
					<li class="col-md-6">
						<h6>차량정보</h6>
						<p>
							Dakota GT86 <span>$69</span>
						</p>
						<p>Coupe</p>
					</li>
					<li class="col-md-6">
						<h6>옵션</h6>
						<p>
							1x GPS <span>$19</span>
						</p>
						<p>
							Extended Insurance <span>$199</span>
						</p>
					</li>
					<li class="col-md-6">
						<h6>보험</h6>
						<p>
							Sales Tax (1%) <span>$1</span>
						</p>
					</li>
					<li class="col-md-6">
						<h6>Total</h6>
						<p>
							총 금액 <span>${rent.price}</span>
						</p>
					</li>
					<li class="col-md-12">
						<h6>Billing Information</h6>
						<p>
							이름: ${rent.receiver} <br>
							결제방법: ${rent.payMethod}<br>
							PO Box 16122 Collins Street West <br>
							+61 3 8376 6284 <br>
							john@envato.com <br>
						</p>
					</li>
					<li class="col-md-12">
						<h6>Additional Information</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi.
							Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus
							pharetra nulla ac diam. Quisque semper justo at risus.</p>
					</li>
				</ul>
				<hr>
				<div class="contect_btn contect_btn_contact">
					<ul>
						<li><a href="#">Print Order <i class="fa fa-print"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 일반 렌트: 렌터카 예약(결제 진행) 페이지 -->
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

.car_detail {
	padding: 15px;
	background-color: white;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	margin-bottom: 15px;
}
</style>

<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="btc_tittle_img_overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
				<div class="btc_tittle_left_heading">
					<h1>결제진행</h1>
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
							<!-- Filter Results -->
							<div class="car-filter accordion x_inner_car_acc_accor">
								<h3>예약정보</h3>
								<hr>
								<!-- Resources -->
								<div class="x_car_access_filer_top_img">
									<img src="images/c2.png" alt="car_img">
									<h3 style="padding-left: 0px;">{모델명}</h3>
									<p>{가격}</p>
								</div>
								<hr>
								<!-- Company -->
								
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#"> 대여 일시 & 장소</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>2021.09.28(화) 09:00</li>
													<li>Barcelona, Airport</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#"> 반납 일시 & 장소</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>{일시}</li>
													<li>{장소}</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">업체/차량</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>대여업체 <span>{업체명}</span>
													</li>
													<li>차량 <span>{모델명}{연식}{연료}</span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="panel-heading car_checkout_caret">
										<h5 class="panel-title">
											<a href="#">보상/면제범위</a>
										</h5>
									</div>
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<ul>
													<li>보험 <span>{자차보험}</span></li>
													<li>면책금 <span>면제</span></li>
													<li>보상한도 <span>{보상한도}</span></li>
													<li>휴차보상료 <span>면제</span></li>
													<li>단독사고 <span>보장불가</span></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div
									class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
									<div class="collapse show">
										<div class="panel-body">
											<div class="x_car_acc_filter_date">
												<input type="text" placeholder="Coupon Code">
												<button type="submit">
													<i class="fa fa-arrow-right"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="x_car_acc_filter_bottom_total">
									<ul>
										<li>총 결제금액 <span>{300,000}원</span>
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
							
								<!-- 결제정보 -->
								<div class="car-filter order-billing margin-top-0">
									<div class="heading-block text-left margin-bottom-0">
										<h4>결제정보</h4>
									</div>
									<hr>
									
									<!-- 예약자 정보 -->
									<form class="billing-form">
										<ul class="list-unstyled row">
											<li class="col-md-6"><label>이름 * <input
													type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-6"><label>연락처 * <input
													type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-6"><label>Driver's Lisence ID
													<input type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-6"><label>Company <input
													type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-6"><label>Country</label> <select
												class="myselect">
													<option>Select</option>
													<option>Afghanistan</option>
													<option>Albania</option>
													<option>Algeria</option>
													<option>Andorra</option>
													<option>Angola</option>
											</select></li>
											<li class="col-md-6"><label>City/town</label> <select
												class="myselect">
													<option>Select</option>
													<option>Afghanistan</option>
													<option>Albania</option>
													<option>Algeria</option>
													<option>Andorra</option>
													<option>Angola</option>
											</select></li>
											<li class="col-md-12"><label>Street Address <input
													type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-6"><label>Phone <input
													type="text" placeholder="" class="form-control">
											</label></li>
											<li class="col-md-6"><label>Email Address * <input
													type="email" placeholder="" class="form-control">
											</label></li>
										</ul>
										<hr>
										
										
									<div class="x_car_detail_slider_bottom_cont float_left" style="padding-top: 40px; padding-bottom: 50px;">
										<!-- 차량정보 // 차량 상세 정보 화면 그대로 복붙 -->
										<div class="panel panel-default">
											<div class="panel-heading">
												<div class="x_slider_form_input_wrapper float_left">
													<h3>차량정보</h3>
													<div class="car_detail">
														{연식}{오토/수동}{문 개수}{배기량}{색상}{mission}{트렁크}
													</div>
												</div>
											</div>
										</div>
										
										<!-- 자차보험 -->
										<div class="panel panel-default">
											<div class="panel-heading">
												<div class="x_slider_form_input_wrapper float_left">
													<h3>자차보험</h3>
													<div class="car_detail">
														{옵션1}{옵션2}{옵션3}{옵션4}{옵션5}
													</div>
												</div>
											</div>
										</div>
										
										<!-- 차량 상세 옵션 -->
										<div class="panel panel-default">
											<div class="panel-heading">
												<div class="x_slider_form_input_wrapper float_left">
													<h3>차량 상세 옵션</h3>
													<div class="car_detail">
														자차보험 (클릭 시 모달창으로 보험정보) (제주패스)
														{완전자차포함, 면책금, 보상한도, 휴차보상료 등}
													</div>
												</div>
											</div>
										</div>
										
										<!-- 꼭 확인해주세요! -->
										<div class="panel panel-default">
											<div class="panel-heading">
												<div class="x_slider_form_input_wrapper float_left" style="margin-top: 30px;">
													<h3 style="color: red;">꼭 확인해주세요!</h3>
													<div class="car_detail">
														<p style="font-size: 13px;">
															1. 업체 및 차량마다 요구하는 운전경력 및 나이가 상이하니 반드시 대여규정을 확인해 주시기 바랍니다.<br>
															2. 운전자 정보는 렌터카 이용 시 긴급사항 발생에 대비하여 즉시 연락이 가능한 정보를 입력하셔야 합니다.<br>
															3. 잘못된 정보 또는 수신이 불가한 정보 입력으로 발생되는 불이익에 대해 당사는 책임지지 않으니 유의해 주시기 바랍니다.<br>
															4. 운전자 추가 등록은 차량 대여 시 현장에서 신청 가능합니다.<br>
															5. 대여규정 및 약관동의 미확인으로 인한 불이익에 대해 당사는 책임지지 않으니 유의해주시기 바랍니다.<br>
															6. 면허증 미지침시 인수 거절 될 수 있으므로 유의해주시기 바랍니다.<br>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div> <!-- End of 차량정보 -->
										
										
										
										<!-- 결제방법 -->
										<div class="payme-opton">
											<div class="heading-block text-left margin-bottom-30">
												<h4>결제방법</h4>
											</div>
											<div class="radio">
												<input type="radio" name="ratio" id="poa" value="option1"
													checked=""> <label for="poa">Payment on
													Arrival</label>
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
										
										<div
											class="checkbox car_checkout_chekbox car_checkout_chekbox1">
											<input type="checkbox" id="c2" name="cb"> <label
												for="c2">Create an Account?</label>
										</div>
										<div class="checkbox car_checkout_chekbox">
											<input type="checkbox" id="c3" name="cb"> <label
												for="c3">I have Read and Accept Terms & Conditions *</label>
										</div>
									</form> <!-- End of 예약자 정보 -->
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="contect_btn contect_btn_contact">
								<ul>
									<li><a href="#">결제하기 <i
											class="fa fa-arrow-right"></i></a></li>
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

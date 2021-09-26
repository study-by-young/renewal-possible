<!-- 일반 렌트: 렌터카 상세조회 페이지 -->
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

.compare_cmpn {
	width: 95%;
	font-size: 12px;
}

.compare_cmpn_tr td {
	padding-left: 5px;
	padding-right: 5px;
}

.compare_cmpn_tr:hover {
	background-color: skyblue;
	color: white;
	cursor: pointer;
}

.compare_cmpn_tr:focus {
	background-color: skyblue;
}

.blog_comment1_cont {
    width: calc(95% - 50px);
    margin-left: 50px;
}

.comment_box {
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
	margin-bottom: 20px;
	background-color: white;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

.blog_comment1_cont h5 {
    font-size: 16px;
    font-weight: bold;
    padding-top: 20px;
    padding-bottom: 10px;
}

.comment_box h5 span {
    font-size: 14px;
    color: #616161;
    font-style: normal;
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
					<div class="row"> <!-- start row -->
					
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div>
								<!-- Filter Results -->
								<div class="car-filter accordion car_booking_onliy_side">
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
							
							
							<!-- 가격비교 -->
							<div>
								<!-- Filter Results -->
								<div class="car-filter accordion car_booking_onliy_side">
									<h3>가격비교 ({업체수})</h3>
									<hr>
									
									<div>
										<table class="compare_cmpn">
											<tr class="compare_cmpn_tr">
												<td style="width: 5%;"><i class="fa fa-circle"></i></td>
												<td style="width: 62%;">제주제주차빌려</td>
												<td style="width: 37%;">25,600원</td>
											</tr>
											<tr class="compare_cmpn_tr">
												<td style="width: 5%;"><i class="fa fa-circle"></i></td>
												<td style="width: 62%;">{업체명}</td>
												<td style="width: 37%;">{가격}</td>
											</tr>
										</table>
									</div>
		
								</div>
							</div> <!-- End of 가격비교 -->
							
						</div>

					</div> <!-- End of row -->
				</div>
			</div>
			
			
			
			
			
			<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
				<div class="row">
					<div class="col-md-12">
						<div class="x_car_detail_main_wrapper float_left">
						
							<!-- 이미지 슬라이드;;; 근데 이미지가 왜 안 보임?ㅠㅠ -->
							<div class="lr_bc_slider_first_wrapper">
								사진이 왜 안 뜨냐...
								<div class="owl-carousel owl-theme">
									<div class="item">
										<div class="lr_bc_slider_img_wrapper">
											<img src="${pageContext.request.contextPath}/resources/images/bc2.jpg" alt="fresh_food_img">
										</div>
									</div>
									<div class="item">
										<div class="lr_bc_slider_img_wrapper">
											<img
												src="${pageContext.request.contextPath}/resources/images/bc3.jpg"
												alt="fresh_food_img">
										</div>
									</div>
									<div class="item">
										<div class="lr_bc_slider_img_wrapper">
											<img
												src="${pageContext.request.contextPath}/resources/images/bc4.jpg"
												alt="fresh_food_img">
										</div>
									</div>
								</div>
							</div>
							
							<div class="x_car_detail_slider_bottom_cont float_left">
								<div class="x_car_detail_slider_bottom_cont_left">
									<h3>{차량모델명}</h3>
									<span>{준중형} {인원} {경유}</span> &nbsp;&nbsp;
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
										class="fa fa-star-o"></i> <span>251 Reviews</span>
								</div>
								<div class="x_car_detail_slider_bottom_cont_right">
									<p>요금 &nbsp;&nbsp;{56,000원}</p>
									<!-- <h3>총 요금 {56,000원}</h3>  -->
								</div>
								<div class="x_car_detail_slider_bottom_cont_center float_left">
								
									<!-- 차량정보 -->
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
									
									<!-- 대여규정 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>대여규정</h3>
												<div class="car_detail">
													{나이}{운전경력}{면허종류}
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
								
								</div>
								<div
									class="x_car_offer_heading x_car_offer_heading_listing float_left x_car_offer_heading_inner_car_names x_car_offer_heading_inner_car_names2">
									<ul class="">
										<li><a href="#"><i class="fa fa-users"></i> &nbsp;4
												Seats</a></li>
										<li><a href="#"><i class="fa fa-clone"></i> &nbsp;4
												Doors</a></li>
										<li><a href="#"><i class="fa fa-shield"></i> &nbsp;9
												Manual</a></li>

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
								<div class="x_avanticar_btn float_left">
									<ul>
										<li><a href="#">예약하기<i class="fa fa-arrow-right"></i></a>
										</li>
									</ul>
								</div>
							</div>
							
							
							<div class="x_css_tabs_wrapper float_left">
								<div class="x_css_tabs_main_wrapper float_left">
									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#home">업체정보</a></li>
										<li class="nav-item" style="margin-left: 10px;"><a class="nav-link"
											data-toggle="tab" href="#menu1">이용후기</a></li>	
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#menu2">필독사항</a></li>	
									</ul>
								</div>
								<div class="tab-content">
								
									<!-- home -->
									<div id="home" class="tab-pane active">
										<div class="x_car_detail_descrip">
											<div style="margin-left: 50px; width: calc(95% - 50px);">
											
												<div>업체명</div>
												<div>지도</div>
												<div>업체주소</div>
												<div>업체번호</div>
												<div>제공 셔틀 정보</div>
												
											</div>
										</div>
									</div>
								
									<!-- menu1 -->
									<div id="menu1" class="tab-pane fade">
										<div class="x_car_detail_descrip">
											<div class="blog_single_comment_wrapper">
												<div class="blog_comment1_cont">
													<div class="comment_box">
														<h5>
															{홍*동} &nbsp;&nbsp;
															<i class="fa fa-star oo"></i> <i class="fa fa-star oo"></i>
															<i class="fa fa-star oo"></i> <i class="fa fa-star-o oo"></i> <i class="fa fa-star-o oo"></i>&nbsp;&nbsp;
															<span>2021/09/26 - 2021/10/01</span> &nbsp;&nbsp;<span>뉴 그렌져</span> &nbsp;&nbsp;<span>완전자차</span> &nbsp;&nbsp;
														</h5>
														<p>온라인으로 등록 가능해서 바로 차 받았고 셔틀도 공항에서 바로 대기중이였고 배차 시간도 빠른편입니다. 그리고 공항 돌아가는 길에 기프트샵 구경했는데 직원 분 너무너무 친절하셨어요~^^ 여러 업체 사용해봤는데 최고!</p>
													</div>
												</div>
												
												<div class="blog_comment1_cont">
													<div class="comment_box">
														<h5>
															{작성자이름} &nbsp;&nbsp;
															<i class="fa fa-star oo"></i> <i class="fa fa-star oo"></i>
															<i class="fa fa-star oo"></i> <i class="fa fa-star-o oo"></i> <i class="fa fa-star-o oo"></i>&nbsp;&nbsp;
															<span>{렌트기간}</span> &nbsp;&nbsp;<span>{차량모델}</span> &nbsp;&nbsp;<span>{자차보험}</span> &nbsp;&nbsp;
														</h5>
														<p>깨국하고 만족합니다</p>
													</div>
												</div>
												
											</div>
										</div>
														
									</div> <!-- End menu1 -->
									
									
									
									<!-- menu2 -->
									<div id="menu2" class="tab-pane fade">
										<div class="x_car_detail_descrip">
											<div style="margin-left: 50px; width: calc(95% - 50px);">
												<div>렌트 예약 전, 꼭 확인해주세요</div>
												<div>업체 대여 규정</div>
												<div>우리 사이트 이용 안내</div>
												<div>취소 환불 규정</div>
											</div>
										</div>
									</div> <!-- End menu2 -->
									
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

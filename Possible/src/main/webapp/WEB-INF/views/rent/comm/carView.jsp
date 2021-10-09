<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	width: 12.5%;
}

.select_result_wrapper ul li a {
	float: left;
	width: 100%;
	padding: 12px 0px;
	text-align: center;
	transition: all 0.2s;
}

.select_result_wrapper ul li a:hover {
	background-color: #6495ed;
	cursor: pointer;
	color: white;
}

.select_result_wrapper ul li a:focus {
	background-color: #6495ed;
	cursor: pointer;
	color: white;
}

.x_car_offer_starts_list_img {
    border-right: 0px none;
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

.cmpn_list {
	width: 100%;
}

.cmpn_list_tr {
	padding-top: 5px;
	padding-bottom: 5px;
	height: 40px;
}

.cmpn_list_tr td label {
	margin-bottom: 0;
}

.cmpn_list_tr td label input {
	vertical-align: middle;
}

.select_result_wrapper ul li label {
	display: block;
	margin-bottom: 0px;
}

.select2-container--default .select2-selection--single {
	height: calc(2.25rem + 0.7px);
	border: 1px solid #ced4da;
}

.label-font {
	padding-top: 15px;
	font-weight: 800;
	color: #111111;
	font-family: 'S-CoreDream', 'Raleway', sans-serif; 
	font-size: 14px;
}

.home-tab {
	margin-bottom: 60px;
}

.home-tab:last-child {
	margin-bottom: 10px;
}

.home-tab-title {
	margin: 15px 0px;
}

.home-tab-title h3 {
    line-height: 23px;
    font-size: 18px;
    font-weight: 600;
}

.option-box {
	padding: 15px;
	border-radius: 10px;
	border: 1px solid #ebebeb;
	min-height: 50px;
	font-weight: 400;
    overflow: hidden;
}

.option-box li {
	float: left;
	margin-right: 45px;
}

.option-box-text li {
	padding-bottom: 5px;
}
</style>


<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="container">
        <form>
            <div class="x_title_inner_num_wrapper float_left py-3 my-0">
                <div class="row align-items-center">
                
                	<div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width">
                        <div class="form-group">
                            <label for="searchArea" class="label-font">지역</label><br>
                            <select id="searchArea" name="searchArea" class="form-control select">
                                <c:forEach var="area" items="${areaCodes}">
                                    <option value="${area.code}">${area.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width">
                        <div class="form-group">
                            <label class="label-font">렌트 시작 날짜</label>
                            <input id="searchStart" name="searchStart" type="text" class="form-control datepicker" placeholder="날짜를 선택하세요.">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width">
                        <div class="form-group">
                            <label class="label-font">렌트 반납 날짜</label>
                            <input id="searchEnd" name="searchEnd" type="text" class="form-control datepicker" placeholder="날짜를 선택하세요.">
                        </div>
                    </div>
                    <!-- 
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
                    -->
                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width" style="text-align: center;">
                        <button type="button" class="btn bg-primary-400 btn-float" style="color: white;">검색 <i class="icon-search4 icon-2x" style="font-size: 1rem; color: white;"></i></button>
                        <button type="button" class="btn btn-lg bg-transparent text-primary border-primary ml-1 legitRipple" data-toggle="modal" data-target="#recommendCarModal" style="font-size: 1rem; font-weight: bold;">추천받기</button>
                    </div>
                </div>
            </div>
        </form>
	</div>
</div>


<!-- 차량 추천 Modal -->
<div id="recommendCarModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="recommendCarModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
	    <div class="modal-header">
	        <h5 class="modal-title">당신이 찾는 바로 그 차</h5>
	    </div>
      	<div class="modal-body">
        	<p>Modal body text goes here.</p>
      	</div>
      	<div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      	</div>
    </div>
  </div>
</div>
<!-- End of 차량 추천 Modal -->

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left mt-5">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
				<div class="x_car_book_left_siderbar_wrapper float_left">
					<div class="row">

						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div>
								<!-- Filter Results -->
								<div class="car-filter accordion car_booking_onliy_side">

									<h3>결제정보</h3>
									<hr>

									<!-- 모델명 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>대여요금(자차보험 미포함)</h3>
												<div style="float: right;">{car.price}</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>할인적용</h3>
												<div style="float: right;">{car.price}</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="x_slider_form_input_wrapper float_left">
												<h3>예상 결제액</h3>
												<div style="float: right;">{car.price}</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="x_slider_checout_right x_slider_checout_right_carbooking x_slider_checout_right_carbooking_fiter">
										<ul style="padding-left: 32px;">
											<li><a href="#">예약하기<i class="fa fa-arrow-right"></i></a>
											</li>
										</ul>
									</div>
								</div>
							</div>

							<!-- 가격비교 // 클릭하면 해당 업체의 상세 페이지로 이동 -->
							<div>
								<!-- Filter Results -->
								<div class="car-filter accordion car_booking_onliy_side">
									<h3>가격비교</h3>
									<hr>
									
									<div>
										<table class="compare_cmpn">
											<tr class="compare_cmpn_tr">
												<td style="width: 5%;"><i class="fa fa-check"></i></td>
												<td style="width: 62%;">제주제주차빌려</td>
												<td style="width: 37%;">25,600원</td>
											</tr>
											<tr class="compare_cmpn_tr">
												<td style="width: 5%;"><i class="fa fa-check"></i></td>
												<td style="width: 62%;">{업체명}</td>
												<td style="width: 37%;">{가격}</td>
											</tr>
										</table>
									</div>
		
								</div>
							</div> <!-- End of 가격비교 -->

						</div>
					</div>
				</div>
			</div>


			<!-- 차량 상세조회 -->
			<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
				<div class="x_slider_form_main_wrapper x_slider_form_main_wrapper_ccb float_left pt-5 mt-5">
    				<div class="container">
			
						<div class="row">
							<div class="col-md-12">
								<div class="x_car_detail_main_wrapper float_left">
								
									<!-- 이미지 -->
									<div class="lr_bc_slider_first_wrapper text-center">
                                        <img src="${pageContext.request.contextPath}/resources/images/cars/KIA/k8.png" alt="fresh_food_img">
                                        <p><small>차량 이미지는 이해를 돕기 위한 예시로, 배차 차량과 다를 수 있습니다.</small></p>
                                    </div>
									<div class="row">
                                    	<div class="col-md-12 pb-4">
											<div class="x_car_detail_slider_bottom_cont float_left">
												<div class="x_car_detail_slider_bottom_cont_left">
													<h3>{car.model}</h3>
													<span style="padding-left: 0px;">{car.brand} / {car.year}년 / {car.fuel} / {car.passenger}인</span>
													<span class="small text-muted pt-2">{car.trim}</span>
												</div>
											</div>
											
											<div style="text-align: center;">
												<div class="col-md-5" style="display: inline-block;">
			                                        <div class="form-sec-header text-center">
			                                            <label class="h6">렌트 시작</label>
			                                            <p class="form-control w-75 mx-auto bg-primary text-white h-auto" style="border-radius: 5rem;">{est.startDate}</p>
			                                        </div>
			                                    </div>
			                                    <div class="col-md-1 mt-5" style="display: inline-block;">
			                                        <div class="form-sec-header text-center">
			                                            <label class="h6"></label>
			                                            <p><i class="icon-arrow-right8 icon-2x"></i></p>
			                                        </div>
			                                    </div>
			                                    <div class="col-md-5 mt-5" style="display: inline-block;">
			                                        <div class="form-sec-header text-center">
			                                            <label class="h6">렌트 종료</label>
			                                            <p class="form-control w-75 mx-auto bg-primary text-white h-auto" style="border-radius: 5rem;">{est.endDate}</p>
			                                        </div>
			                                    </div>
			                                    <div class="w-100 my-4 mt-5"></div>
		                                    </div>
		                                    <!-- End of rent date -->
		                                    
		                                    
		                                    <!-- 상세조회 탭 -->
		                                    <div class="x_css_tabs_wrapper float_left">
												<div class="x_css_tabs_main_wrapper float_left">
													<ul class="nav nav-tabs">
														<li class="nav-item">
															<a class="nav-link" data-toggle="tab" href="#home">예약정보</a>
														</li>
														<li class="nav-item" style="margin-left: 10px;">
															<a class="nav-link" data-toggle="tab" href="#menu1">업체후기</a>
														</li>
														<li class="nav-item">
															<a class="nav-link active" data-toggle="tab" href="#menu2">유의사항</a>
														</li>
													</ul>
												</div>
												<!-- 탭 상세 페이지 -->
												<div class="tab-content">
													<div id="home" class="tab-pane fade">
														<!-- 차량정보 -->
														<div>
															<div>
																<h3></h3>
															</div>
															<div>
																<ul>
																	<li>&nbsp;</li>
																</ul>
															</div>
														</div>
														
														<!-- 차량 정보 및 옵션 통일성을 위해 토글형식으로 넣으려고 했는데, 
																탭 분리가 이미 토글식이라 안에 토글을 넣었더니 일방은 작동하지 않는 사태 발생으로 단순 출력으로 변경함 -->
														<!-- 차량정보 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>차량 정보</h3>
															</div>
															<div>
																<ul class="option-box">
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.year}년식</li>
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.fuel}</li>
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.segment}</li>
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.passenger}인</li>
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.color}</li>
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.mission}</li>
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.trunk}개</li>
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.door}개</li>
																	<li><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;{car.kmpl}</li>
																</ul>
															</div>
														</div>
														
														<!-- 차량옵션 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>차량 옵션</h3>
															</div>
															<div>
																<ul class="option-box">
																	<!-- foreach -->
	                                                                    <li style="font-weight: 600; color: #6495ed;"><i class="fa fa-snowflake-o" style="font-size: 12px;"></i>&nbsp;&nbsp;foreach 반복</li>
                                                                    <!--  -->
																</ul>
															</div>
														</div>
														
														<!-- 운전자 대여조건 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>운전자 대여조건</h3>
															</div>
															<div>
																<ul class="option-box-text">
																	<li><i class="fa fa-check-square" style="font-size: 12px;"></i>&nbsp;&nbsp;운전자 나이 <strong>만 26세</strong> 이상</li>
																	<li><i class="fa fa-check-square" style="font-size: 12px;"></i>&nbsp;&nbsp;면허취득일 <strong>1년 이상</strong></li>
																	<li><i class="fa fa-check-square" style="font-size: 12px;"></i>&nbsp;&nbsp;차량 대여 시 실물면허증 소지 (<strong>2종 보통</strong> 면허 이상 필요)</li>
																	<li><i class="fa fa-check-square" style="font-size: 12px;"></i>&nbsp;&nbsp;업체별 <strong>대여규정 준수</strong> (외국인 대여, 낚시용품/애견 동반, 주행거리제한 규정 등)</li>
																</ul>
															</div>
														</div>
														
														<!-- 셔틀운행 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>무료 셔틀 정보</h3>
															</div>
															<div>
																<img src="${pageContext.request.contextPath}/resources/images/image-shuttle-jeju.svg" style="width: 100%; margin-bottom: 20px;">
																<ul class="option-box-text">
																	<li><i class="fa fa-check" style="font-size: 12px;"></i>&nbsp;&nbsp;{area}공항에서 업체 차고지까지 편리하게 이동할 수 있도록 <strong>셔틀버스를 무료로 제공</strong>하고 있습니다.</li>
																	<li><i class="fa fa-check" style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>운행 시간</strong>&nbsp;&nbsp;&nbsp;&nbsp;오전 08:00 ~ 오후 08:00</li>
																	<li><i class="fa fa-check" style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>운행 정보</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong>20분 ~ 30분 간격</strong>으로 운행되며 10분 소요됩니다.</li>
																	<li><i class="fa fa-check" style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>셔틀 문의</strong>&nbsp;&nbsp;&nbsp;&nbsp;053-421-2460</li>
																</ul>
															</div>
														</div>
														
														<!-- 업체정보 -->
														<div class="home-tab">
															<div class="home-tab-title">
																<h3>업체정보</h3>
															</div>
															<div>
																<ul class="option-box-text">
																	<li style="font-weight: 700; font-size: 17px;">업체명 {company.name}</li>
																</ul>
																<!-- 업체 위치 지도에 찍었으면 좋겠음 -->
																<div class="col-md-12" style="margin-bottom: 20px;">
				                                                    <div class="x_slider_form_input_wrapper">
				                                                        <p class="h-auto">${est.takePlaceCode} ${est.takePlaceBasic} ${est.takePlaceDetail}</p>
				                                                    </div>
				                                                    <div class="w-100 my-2"></div>
				                                                    <div id="takePlaceMap" style="height:300px;"></div>
				                                                </div>
																<ul class="option-box-text">
																	<li><i class="fa fa-check" style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>주소</strong>&nbsp;&nbsp;&nbsp;&nbsp;{company.addrBasic} {comapny.addrDetail}</li>
																	<li><i class="fa fa-check" style="font-size: 12px;"></i>&nbsp;&nbsp;<strong>전화</strong>&nbsp;&nbsp;&nbsp;&nbsp;053-421-2460</li>
																</ul>
															</div>
														</div>
														
													</div>
													<!-- End of Home -->
													
													
													<!-- meun1 -->
													<div id="menu1" class="tab-pane fade">
														<div class="x_car_detail_descrip">
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
													<!-- End of menu1 -->
													<!-- meun2 -->
													<div id="menu2" class="tab-pane active">
														<div class="x_car_detail_descrip">
															<p>허 참나;;;; Proin gravida n vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum tor. This is Photoshop's version of Lorem Ipsum.</p>
														</div>
													</div>
													<!-- End of menu2 -->
												</div>	
											</div>
										</div>
									</div>
									<!-- End of 탭 상세페이지 -->
									
									
										</div>
									</div>
									
								</div>
							</div>
						</div> <!-- End of row -->
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


    $(function(){
        var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    });
</script>
<!-- x car book sidebar section Wrapper End -->

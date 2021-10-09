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

									<h3>상세검색</h3>
									<hr>

									<!-- 모델명 -->
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
									<div class="x_car_book_fillter_select_box">
										<h5>차량등급</h5>
										<select class="myselect" id="segment" name="segment">
											<option value="">전체</option>
											<option value="">경형</option>
											<option value="">소형</option>
											<option value="">중형</option>
											<option value="">대형</option>
											<option value="">수입</option>
											<option value="">승합RV</option>
											<option value="">SUV</option>
											<option value="">캠핑카</option>
										</select>
									</div>
									<hr>

									<!-- 연료 -->
									<div class="x_car_book_fillter_select_box">
										<h5>연료</h5>
										<select class="myselect" id="fuel" name="fuel">
											<option value="">전체</option>
											<option value="">휘발유</option>
											<option value="">경유</option>
											<option value="">LPG</option>
											<option value="">하이브리드</option>
											<option value="">전기</option>
										</select>
									</div>
									<hr>

									<!-- 연식 -->
									<div class="x_car_book_fillter_select_box">
										<h5>차량연식</h5>
										<select class="myselect" id="year" name="year">
											<option value="">전체</option>
											<option value="">2022년</option>
											<option value="">2021년</option>
											<option value="">2020년</option>
											<option value="">2019년</option>
											<option value="">2018년</option>
											<option value="">2017년</option>
											<option value="">2016년</option>
										</select>
									</div>
									<hr>


									<!-- 차량제조사/브랜드 -->
									<div class="x_car_book_fillter_select_box">
										<h5>제조사</h5>
										<select class="myselect" id="brand" name="brand">
											<option value="">전체</option>
											<option value="">현대</option>
											<option value="">기아</option>
											<option value="">르노삼성</option>
											<option value="">수입</option>
											<option value="">기타</option>
										</select>
									</div>
									<hr>

									<!-- 인원 -->
									<div class="x_car_book_fillter_select_box">
										<h5>인원</h5>
										<select class="myselect" id="passenger2" name="passenger">
											<option value="">전체</option>
											<option value="">1인</option>
											<option value="">2인</option>
											<option value="">3인</option>
											<option value="">4인</option>
											<option value="">5인이상</option>
										</select>
									</div>
									<hr>

									<!-- 자차보험 -->
									<div class="x_car_book_fillter_select_box">
										<h5>자차보험</h5>
										<select class="myselect" id="insurance2" name="insurance">
											<option value="">전체</option>
											<option value="">일반자차</option>
											<option value="">완전자차</option>
										</select>
									</div>
									<hr>

									<div class="x_slider_checout_right x_slider_checout_right_carbooking x_slider_checout_right_carbooking_fiter">
										<ul style="padding-left: 32px;">
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
								<ul style="width: 100%;">
									<li class="first_li"><label><a href="#">전체</a><input type="radio" id="" name="searchCategory" style="display: none;" checked></label></li>
									<li><label><a href="#">경소형</a><input type="radio" id="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">준중형</a><input type="radio" id="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">중대형</a><input type="radio" id="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">승합RV</a><input type="radio" id="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">SUV</a><input type="radio" id="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">수입</a><input type="radio" id="" name="searchCategory" style="display: none;"></label></li>
									<li class="last_li"><a href="#">캠핑카</a></li>
								</ul>
							</div>
						</div>


						<!-- 차량 목록 파트 -->
						<div class="col-md-12">
							<div class="x_car_book_tabs_content_main_wrapper">
								<div class="tab-content">
									<div id="home" class="tab-pane fade active show">
										<div class="row">
											<div class="col-md-12">
												
												<!-- 여기서부터 main-box-wrapper -->
												<c:forEach var="car" items="${list}">
												<div class="x_car_offer_main_boxes_wrapper float_left">
													<div class="x_car_offer_starts x_car_offer_starts_list_img float_left border-0">
														<div class="x_car_offer_img x_car_offer_img_list float_left">
															<img src="${pageContext.request.contextPath}/resources/images/cars/Genesis/genesis_g90.png" alt="img" class="img-fluid">
														</div>
														<div class="x_car_offer_price x_car_offer_price_list float_left">
                                                        </div>
													</div>
													<div class="x_car_offer_starts_list_img_cont border-left">
														<div class="x_car_offer_heading x_car_offer_heading_list float_left" style="width: 70%;">
															<h5 class="pt-3">${car.brand} ${car.model}</h5>
															<p>${car.trim}</p>
															<hr class="my-2">
															<p>${car.year}년 / ${car.fuel} / ${car.passenger}인</p>
														</div>
														<div class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left" style="width: 30%;">
															<ul>
																<li style="width: 100%;">
                                                                    <a href="#">상세보기</a>
                                                                </li>
															</ul>
														</div>
														<!-- 옵션 / 업체를 선택하면 해당 업체가 보유하고 있는 옵션 표시 -->
														<div class="x_car_offer_heading x_car_offer_heading_listing float_left">
                                                            <ul class="">
                                                                <li>
                                                                    <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 차량 정보</span>
                                                                        <ul class="list">
                                                                            <c:forEach var="itm" items="${items}">
                                                                                <li class="dpopy_li"><i class="fa fa-snowflake-o"></i> ${itm}</li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 차량 옵션</span>
                                                                        <ul class="list">
                                                                            <c:forEach var="opt" items="${options}">
                                                                                <li class="dpopy_li"><i class="fa fa-snowflake-o"></i> ${opt}</li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
														
													</div>
													
													<!-- 업체 정렬 -->
													<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
														<div class="x_carbooking_right_section_wrapper float_left">
															<div class="row">
																<!-- 업체 정렬 -->
																<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="margin-bottom: 15px;">
																	<div class="x_carbook_right_tabs_box_wrapper float_left">
																		<p style="margin-right: 5px;">
																			<span><a href="#">최저가순</a></span>&nbsp;&nbsp;
																			<span><a href="#">인기순</a></span>&nbsp;&nbsp;
																		</p>
																	</div>
																</div>
																<!-- End 업체 정렬 -->

																<!-- 해당 차량 보유 업체 목록 -->
																<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="padding-left: 25px; padding-right: 30px; margin-bottom: 20px;">
																	<div class="x_carbook_right_tabs_box_wrapper float_left">
																		<form>
																			<table class="cmpn_list">
																				<!-- 기본으로 첫번째 행이 선택되어 있도록 -->
																				<tbody>
																					<tr class="cmpn_list_tr">
																						<td style="width: 40%;"><label><input type="radio" id="" name="cmpn">&nbsp;&nbsp;${company.name}</label></td>
																						<td style="width: 15%;">{만26세}</td>
																						<td style="width: 15%;">{완전자차}</td>
																						<td style="width: 15%;">리뷰 {개수}</td>
																						<td style="width: 15%;">{차가격}</td>
																					</tr>
																				</tbody>
																			</table>
																			
																		</form>
																	</div>
																</div>
																<!-- End 해당 차량 보유 업체 목록 -->
															</div>
														</div>
													</div>
												</div>
												</c:forEach>
											</div>

											<!-- 페이징 -->
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


	
</script>
<!-- x car book sidebar section Wrapper End -->

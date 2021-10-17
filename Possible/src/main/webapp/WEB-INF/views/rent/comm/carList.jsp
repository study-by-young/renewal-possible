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
	width: 11.1%;
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
	<div class="x_title_inner_num_wrapper float_left py-3 my-0">
		<form name="searchCar" action="commonRent/list" onsubmit="">
               <div class="row p-3">
                   <div class="col-md-3">
                       <h6>지역</h6>
                       <div class="form-group">
                           <select id="searchArea" name="searchArea" class="form-control select">
                               <c:forEach var="area" items="${areaCodes}">
                                   <option value="${area.code}">${area.name}</option>
                               </c:forEach>
                           </select>
                       </div>
                   </div>

                   <div class="col-md-3">
                       <h6>대여 날짜</h6>
                       <div class="input-group mb-3">
                           <span class="input-group-prepend">
                               <span class="input-group-text"><i class="icon-calendar"></i></span>
                           </span>
                           <input type="text" id="start" name="start" class="form-control pickadate-format">
                       </div>
                   </div>
                   <div class="col-md-1 text-center align-self-center h5">
                       <p id="dateRange" class="badge badge-info ">7일</p>
                       <p><i class="icon-arrow-right8"></i></p>
                   </div>
                   <div class="col-md-3">
                       <h6>반납 날짜</h6>
                       <div class="input-group mb-3">
                           <span class="input-group-prepend">
                               <span class="input-group-text"><i class="icon-calendar"></i></span>
                           </span>
                           <input type="text" id="end" name="end" class="form-control pickadate-format">
                       </div>
                   </div>
                   <div class="col-md-2">
                       <button class="btn btn-primary h-100 w-100"><span class="h5 align-middle">렌트카 검색</span></button>
                   </div>
               </div>
           </form>
		</div>
	<!--
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
                            <label for="startDate" class="label-font">렌트 시작 날짜</label>
                            <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="날짜를 선택하세요.">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width">
                        <div class="form-group">
                            <label for="endDate" class="label-font">렌트 반납 날짜</label>
                            <input id="endDate" name="endDate" type="text" class="form-control datepicker" placeholder="날짜를 선택하세요.">
                        </div>
                    </div>
                    
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
                    
                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 full_width" style="text-align: center;">
                        <button onclick="location.href='list'" type="button" class="btn bg-primary-400 btn-float" style="color: white;">검색 <i class="icon-search4 icon-2x" style="font-size: 1rem; color: white;"></i></button>
                        <button type="button" class="btn btn-lg bg-transparent text-primary border-primary ml-1 legitRipple" data-toggle="modal" data-target="#recommendCarModal" style="font-size: 1rem; font-weight: bold;">추천받기</button>
                    </div>
                </div>
            </div>
        </form>
        -->
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
									
									<form id="searchForm" name="searchForm" action="${pageContext.request.contextPath}/commonRent" method="get">
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
										<input type="hidden" name="amount" value="${pageMaker.cri.amount}">&nbsp;
										<!-- 모델명 -->
										<div class="panel panel-default">
											<div class="panel-heading">
												<div class="x_slider_form_input_wrapper float_left">
													<h3>차량모델</h3>
													<input id="model" name="model" type="text" placeholder="자동차 모델명으로 검색" <c:out value="${pageMaker.cri.type eq 'M'}"/>>
												</div>
											</div>
										</div>
										<hr>
										<!-- 세그먼트 -->
										<div class="x_car_book_fillter_select_box">
											<h5>차량등급</h5>
											<select class="myselect" id="segment" name="segment">
												<option value="" selected>전체</option>
												<option value="SEG01">경형</option>
												<option value="SEG02">소형</option>
												<option value="SEG03">준중형</option>
												<option value="SEG04">중형</option>
												<option value="SEG05">대형</option>
												<option value="SEG06">스포츠카</option>
												<option value="SEG07">SUV</option>
												<option value="SEG08">기타</option>
											</select>
										</div>
										<hr>
	
										<!-- 연료 -->
										<div class="x_car_book_fillter_select_box">
											<h5>연료</h5>
											<select class="myselect" id="fuel" name="fuel">
												<option value="">전체</option>
												<option value="FUL01">가솔린</option>
												<option value="FUL02">디젤</option>
												<option value="FUL03">하이브리드</option>
												<option value="FUL04">전기</option>
											</select>
										</div>
										<hr>
	
										<!-- 차량제조사/브랜드 -->
										<div class="x_car_book_fillter_select_box">
											<h5>제조사</h5>
											<select class="myselect" id="brand" name="brand">
												<option value="">전체</option>
												<option value="HY">현대</option>
												<option value="GE">제네시스</option>
												<option value="KI">기아</option>
												<option value="CH">쉐보레</option>
												<option value="SA">르노삼성</option>
												<option value="SS">쌍용</option>
												<option value="BM">BMW</option>
												<option value="BZ">벤츠</option>
												<option value="AU">아우디</option>
												<option value="TE">테슬라</option>
												<option value="FX">폭스바겐</option>
												<option value="ET">기타</option>
											</select>
										</div>
										<hr>	
	
										<!-- 연식 -->
										<div class="x_car_book_fillter_select_box">
											<h5>차량연식</h5>
											<select class="myselect" id="year" name="year">
												<option value="">전체</option>
												<option value="2022">2022년</option>
												<option value="2021">2021년</option>
												<option value="2020">2020년</option>
												<option value="2019">2019년</option>
												<option value="2018">2018년</option>
												<option value="2017">2017년</option>
											</select>
										</div>
										<hr>
	
										<!-- 인원 -->
										<div class="x_car_book_fillter_select_box">
											<h5>인원</h5>
											<select class="myselect" id="passenger" name="passenger">
												<option value="">전체</option>
												<option value="2">2인</option>
												<option value="3">3인</option>
												<option value="4">4인</option>
												<option value="5">5인이상</option>
											</select>
										</div>
										<hr>
	

	
										<div class="x_slider_checout_right x_slider_checout_right_carbooking x_slider_checout_right_carbooking_fiter mt-3">
											<ul style="padding-left: 32px;">
												<li class="searchFilter"><a href="#">상세검색<i class="fa fa-arrow-right"></i></a>
												</li>
											</ul>
										</div>
									</form>
									
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
									<li class="first_li"><label><a href="#">전체</a><input type="radio" id="" value="" name="searchCategory" style="display: none;" checked></label></li>
									<li><label><a href="#">경형</a><input type="radio" id="" value="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">소형</a><input type="radio" id="" value="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">준중형</a><input type="radio" id="" value="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">중형</a><input type="radio" id="" value="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">대형</a><input type="radio" id="" value="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">스포츠카</a><input type="radio" id="" value="" name="searchCategory" style="display: none;"></label></li>
									<li><label><a href="#">SUV</a><input type="radio" id="" value="" name="searchCategory" style="display: none;"></label></li>
									<li class="last_li"><a href="#">기타</a></li>
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
															<h5 class="pt-3"> ${car.brand} ${car.model}</h5>
															<p>${car.trim}</p>
															<hr class="my-2">
															<p>${car.year}년 / ${car.fuel} / ${car.passenger}인</p>
														</div>
														<div class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left" style="width: 30%;">
															<ul>
																<li style="width: 100%;">
                                                                    <a href="#" id="viewCarBtn" class="viewCarBtn">상세보기</a>
                                                                </li>
															</ul>
														</div>
														<!-- 옵션 / 업체를 선택하면 해당 업체가 보유하고 있는 옵션 표시 -->
														<div class="x_car_offer_heading x_car_offer_heading_listing float_left">
                                                            <ul class="">
                                                                <li>
                                                                    <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 차량 정보</span>
                                                                        <ul class="list">
                                                                            <li class="dpopy_li"><i class="fa fa-snowflake-o"></i>등급: ${car.segment}</li>
                                                                            <li class="dpopy_li"><i class="fa fa-snowflake-o"></i>미션: ${car.mission}</li>
                                                                            <li class="dpopy_li"><i class="fa fa-snowflake-o"></i>트렁크: ${car.trunk}</li>
                                                                            <li class="dpopy_li"><i class="fa fa-snowflake-o"></i>문: ${car.door}</li>
                                                                            <li class="dpopy_li"><i class="fa fa-snowflake-o"></i>연비: ${car.kmpl}</li>
                                                                            <!-- model 반복 안에서 carSeq or cmpnSeq 받아와서 ajax로 OneSelect문 돌리고 결과물 ul 밑에 li 추가하는 걸로 하면 될 듯 -->
                                                                            <%-- <c:forEach var="itm" items="${items}">
                                                                            </c:forEach> --%>
                                                                        </ul>
                                                                    </div>
                                                                </li>
                                                                <!-- 
                                                                <li>
                                                                    <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 차량 옵션</span>
                                                                        <ul class="list">
                                                                            <c:forEach var="opt" items="${options}">
                                                                                <li class="dpopy_li"><i class="fa fa-snowflake-o"></i> ${opt}</li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </li>
                                                                 -->
                                                            </ul>
                                                        </div>
														
													</div>
													
													<!-- 업체 정렬 -->
													<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
														<div class="x_carbooking_right_section_wrapper float_left">
															<div class="row">
																<!-- 업체 정렬
																<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="margin-bottom: 15px;">
																	<div class="x_carbook_right_tabs_box_wrapper float_left">
																		<p style="margin-right: 5px;">
																			<span><a href="#">최저가순</a></span>&nbsp;&nbsp;
																			<span><a href="#">인기순</a></span>&nbsp;&nbsp;
																		</p>
																	</div>
																</div>
																End 업체 정렬 -->
																
																<!-- 해당 차량 보유 업체 목록 -->
																<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="padding-left: 25px; padding-right: 30px; margin-bottom: 20px; margin-top: 20px;">
																	<div class="x_carbook_right_tabs_box_wrapper float_left">
																		<form>
																			<table class="cmpn_list"> 
																				<!-- 기본으로 첫번째 행이 선택되어 있도록 -->
																				<tbody>
																				<c:forEach var="model" items="${car.modelList}">
																				<c:forEach var="insurance" items="${model.insuranceList}">
																				<c:forEach var="review" items="${model.reviewList}">
																					<tr class="cmpn_list_tr">
																						<td style="width: 40%;">
																							<label><input type="radio" id="cmpn" name="cmpn">&nbsp;&nbsp;${model.name}</label>
																							<input type="hidden" id="cmpnSeq" name="cmpnSeq" value="${model.cmpnSeq}">
																							<input type="hidden" id="seq" name="seq" value="${model.seq}">
																						</td>
																						<td style="width: 15%;">
																							<c:if test="${insurance.optCode eq 'IOP01'}">
																								만 22세
																							</c:if>
																							<c:if test="${insurance.optCode eq 'IOP02'}">
																								만 25세
																							</c:if>
																						</td>
																						<td style="width: 15%;">
																							<c:if test="${insurance.optCode eq 'IOP01'}">
																								일반자차
																							</c:if>
																							<c:if test="${insurance.optCode eq 'IOP02'}">
																								완전자차
																							</c:if>
																						</td>
																						<td style="width: 15%;">
																							<!-- 리뷰리스트가 null일 경우 해당 차량모델을 보유하고 있더라도 업체가 출력되지 않음 수정 필요 -->
																							<c:if test="${empty model.reviewList}">
																								리뷰 0 개
																							</c:if>
																							리뷰 ${review.cnt} 개
																						</td>
																						<td style="width: 15%; text-align: right;">${model.price}</td>
																					</tr>
																				</c:forEach>
																				</c:forEach>
																				</c:forEach>	
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
														<c:if test="${pageMaker.prev}">
															<li><a href="${pageMaker.startPage-1}"><i class="flaticon-left-arrow"></i></a></li>
														</c:if>
														<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
															<li class="btc_shop_pagi"><a href="${num}">${num}</a></li>
														</c:forEach>
														<c:if test="${pageMaker.next}">
															<li><a href="${pageMaker.endPage+1}"><i class="flaticon-right-arrow"></i></a></li>
														</c:if>
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
    let now = new Date();
    let defaultReturnDate = new Date();
    defaultReturnDate = defaultReturnDate.setDate((now.getDate() + 7))

    $(function(){
        initPickadate();
    })

    function initPickadate(){
        let startPicker = $("#start").pickadate('picker');
        let endPicker = $("#end").pickadate('picker');

        startPicker.set('select', now);
        endPicker.set({
            min : 1,
            select : defaultReturnDate
        });

        startPicker.on('close', function(){
            let minDate = new Date(startPicker.get('select','yyyy,mm,dd'));
            minDate.setDate(minDate.getDate()+1);
            endPicker.set('min', minDate).set('clear');
            $('#dateRange').text('');
        });

        endPicker.on('close', function(){
            let minDate = startPicker.get('select','dd');
            let maxDate = endPicker.get('select','dd');
            let range = parseInt(maxDate) - parseInt(minDate);
            $('#dateRange').text(range + "일");
        })
    }

    
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
    
    

   var cmpnSeq_val;
   var seq_val;
    $('.cmpn_list_tr').on('click', function(){
    	$(this).find('input[type="radio"]').prop('checked', 'true');

    	cmpnSeq_val = $(this).children('td').children('input[name="cmpnSeq"]').val();
    	seq_val = $(this).children('td').children('input[name="seq"]').val();
  
    	console.log("업체" + cmpnSeq_val, seq_val);
    	
    });
    
    $('.select_result_wrapper ul li').on('click', function(){
    	$(this).find('input[type="radio"]').prop('checked', 'true');
    	
    	var chk = $(this).find('input[type="radio"]').is(':checked');
    	
    	if(chk == true){
    		$(this).css('background-color', 'yellow');
    	}
    });
   

    // 상세조회 버튼
    $('.viewCarBtn').on('click', function(){
		location.href="commonRent/view?cmpnSeq=" + cmpnSeq_val + "&seq=" + seq_val;// + "&startDate=" + startDate + "&endDate=" + endDate;    	
    });
    
    $(function() {
    	var searchForm = $("#searchForm");

     	$(".pagination a").on("click", function(e) {
    		e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
    		var p = $(this).attr("href");
    		$('[name="pageNum"]').val(p);
    		searchForm.submit();
    	});
    	
    	$(".searchFilter a").on("click", function(e) {
    		e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
    		var p = $(".pagination a").attr("href");
    		$('[name="pageNum"]').val(p);
    		searchForm.submit();
    	});
    });
	
</script>

<!-- x car book sidebar section Wrapper End -->

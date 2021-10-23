<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 일반 렌트: 렌터카 목록 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.nav li:last-child {
	margin-right: 0px;
}
</style>

<c:set var="during" value="${endDate.date - startDate.date}" />
<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
	<div class="mb-3">
		<div class="page-header page-header-dark bg-primary-600 text-dark">
			<div class="container py-2">
				<div class="page-header-content header-elements-inline">
					<div class="page-title text-white">
						<h1 class="font-weight-bold">렌트</h1>
						<h6>실시간으로 예약이 가능합니다!</h6>
					</div>
					<div class="x_title_inner_num_wrapper float_left py-3 my-0">
						<form name="searchCar" action="commonRent" onsubmit=""
							class="bg-white rounded-lg">
							<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}" default="1"/>">
							<input type="hidden" name="amount" value="<c:out value="${cri.amount}" default="5"/>">
							<div class="row p-3">
								<div class="col-md-3">
									<h6 class="text-dark">지역</h6>
									<div class="form-group">
										<select id="searchArea" name="searchArea"
											class="form-control select">
											<option value="">전체</option>
											<c:forEach var="area" items="${areaCodes}">
												<option value="${area.code}">${area.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="col-md-3">
									<h6>대여 날짜</h6>
									<div class="input-group mb-3">
										<span class="input-group-prepend"> <span
											class="input-group-text"><i class="icon-calendar"></i></span>
										</span> <input type="text" id="start" name="start"
											class="form-control pickadate-format">
									</div>
								</div>
								<div class="col-md-1 text-center align-self-end h5">
									<p class="mb-3">
										<i class="icon-arrow-right8"></i>
									</p>
								</div>
								<div class="col-md-3">
									<h6>반납 날짜</h6>
									<div class="input-group mb-3">
										<span class="input-group-prepend"> <span
											class="input-group-text"><i class="icon-calendar"></i></span>
										</span> <input type="text" id="end" name="end"
											class="form-control pickadate-format">
									</div>
								</div>
								<div class="col-md-2">
									<button class="btn btn-primary h-100 w-100">
										<span class="h5 align-middle">렌트카 검색</span>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 차량 추천 Modal -->
<div id="recommendCarModal" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-labelledby="recommendCarModalLabel"
	aria-hidden="true">
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
			<div class="col-xl-3 col-lg-4">
				<div class="x_car_book_left_siderbar_wrapper card">
					<!-- Filter Results -->
					<div class="card-header bg-white">
						<h5 class="card-title">상세검색</h5>
					</div>
					<form id="filterForm" name="filterForm" action="commonRent" method="get">
						<div class="card-body">
							<!-- 모델명 -->
							<div class="x_slider_form_input_wrapper form-group">
								<label class="h6">차량모델</label> <input id="model" name="model"
									type="text" <c:out value="${pageMaker.cri.type eq 'M'}"/>
									class="form-control">
							</div>
							<!-- 세그먼트 -->
							<div class="x_car_book_fillter_select_box form-group">
								<label class="h6">차량등급</label> <select class="select"
									id="segment" name="segment">
									<option value="" selected>전체</option>
									<c:forEach var="seg" items="${segments}">
										<option value="${seg.code}">${seg.name}</option>
									</c:forEach>
								</select>
							</div>
							<!-- 연료 -->
							<div class="x_car_book_fillter_select_box form-group">
								<label class="h6">연료</label> <select class="select" id="fuel"
									name="fuel">
									<option value="">전체</option>
									<c:forEach var="fuel" items="${fuels}">
										<option value="${fuel.code}">${fuel.name}</option>
									</c:forEach>
								</select>
							</div>
							<!-- 차량제조사/브랜드 -->
							<div class="x_car_book_fillter_select_box form-group">
								<label class="h6">제조사</label> <select class="select" id="brand"
									name="brand">
									<option value="">전체</option>
									<c:forEach var="brand" items="${brands}">
										<option value="${brand.code}">${brand.name}</option>
									</c:forEach>
								</select>
							</div>
							<!-- 연식 -->
							<div class="x_car_book_fillter_select_box form-group">
								<h6>차량연식</h6>
								<select class="select" id="year" name="year">
									<option value="">전체</option>
									<option value="2022">2022년</option>
									<option value="2021">2021년</option>
									<option value="2020">2020년</option>
									<option value="2019">2019년</option>
									<option value="2018">2018년</option>
									<option value="2017">2017년</option>
								</select>
							</div>
							<!-- 인원 -->
							<div class="x_car_book_fillter_select_box form-group">
								<h6>인원</h6>
								<select class="select" id="passenger" name="passenger">
									<option value="">전체</option>
									<option value="2">2인</option>
									<option value="3">3인</option>
									<option value="4">4인</option>
									<option value="5">5인이상</option>
								</select>
							</div>
						</div>
						<div class="card-footer">
							<button type="button" class="h5 btn btn-block btn-lg btn-primary"
								onclick="searchCars(${cri.pageNum}, ${cri.amount})">
								<i class="icon-search4"></i> 상세검색
							</button>
						</div>
					</form>
				</div>
			</div>
			<!-- 검색결과 -->
			<div class="col-xl-9 col-lg-8">
				<div class="x_carbooking_right_section_wrapper">
					<div class="row">
						<!-- 전체/경차/준형차 등등등 -->
						<div class="col-12">
							<div class="select_result_wrapper card">
								<div class="card-body" style="margin: 0px auto;">
									<form id="filterForm2" name="filterForm2" action="commonRent" method="get">
										<ul class="nav">
											<li class="nav-item px-1" style="margin-right: 7px;"><label class="mb-0"> <input
													type="checkbox" value="" name="filter_seg${status.index}" class="d-none">
													<button type="button" class="btn btn-outline-primary rounded-pill" onclick="location.href='${pageContext.request.contextPath}/commonRent'">전체</button>
											</label></li>
											<c:forEach var="seg" items="${segments}" varStatus="status">
												<li class="nav-item px-1" style="margin-right: 7px;"><label class="mb-0"> <input
														type="checkbox" value="${seg.code}" id="filter_seg" name="filter_seg${status.index}"
														class="d-none">
														<button type="button" id="filter2" class="btn btn-outline-primary rounded-pill">${seg.name}</button>
												</label></li>
											</c:forEach>
										</ul>
									</form>
								</div>
							</div>
						</div>
						<!-- 차량 목록 파트 -->
						<div class="col-12">
							<c:forEach var="model" items="${modelList}">
								<c:if test="${carList.get(model.model).size() != 0}">
									<div class="x_car_offer_main_boxes_wrapper card">
										<div class="row">
											<div class="col-lg-5">
												<div class="card-img-actions p-3">
													<img class="card-img-top img-fluid"
														src="${pageContext.request.contextPath}${model.modelCodeVO.img}"
														alt="">
													<div
														class="x_car_offer_heading x_car_offer_heading_list float_left pt-3">
														<h5 class="font-weight-bold">
															${model.brandCodeVO.name} ${model.modelCodeVO.name}</h5>
														<p class="text-muted small">
															<span class="d-inline-block pr-2"><i class="fas fa-car"></i> ${model.passenger}인</span>
															<span class="d-inline-block pr-2"><i class="fas fa-car"></i> ${model.missionCodeVO.name}</span>
															<span class="d-inline-block pr-2"><i class="fas fa-car"></i> ${model.trunk}L</span>
															<span class="d-inline-block pr-2"><i class="fas fa-car"></i> ${model.door}개</span>
															<span class="d-inline-block pr-2"><i class="fas fa-car"></i> 에어컨</span>
														</p>
													</div>
												</div>
											</div>
											<div class="col-lg-7">
												<div class="card-body">
													<div class="row">
														<c:forEach var="car" items="${carList.get(model.model)}">
															<div class="col-12">
																<div
																	class="card border-primary-300 border-1 rounded  mb-1">
																	<div class="card-body">
																		<div class="row">
																			<div class="col-12">
																				<div>
																					<span class="h5">${car.companyVO.name}</span>
																					<div class="float-right">
																						<div style="width: 70px;">
																							<span class="rentList-score-bg"> <span
																								class="rentList-score" style="width: 80%"></span>
																							</span>
																						</div>
																					</div>
																				</div>
																				<hr class="my-2">
																				<div>
																					<span>${car.trimCodeVO.name} / ${car.year} /
																						${car.colorCodeVO.name}</span>
																					<div class="float-right text-right">
																						<c:forEach var="insurance"
																							items="${car.insuranceList}">
																							<div class="py-1">
																								<a href="#"
																									onclick="moveToView(${car.seq}, '${insurance.optCode}')"
																									class="text-dark"> <span
																									class="pr-2 text-warning-400 font-weight-bold">${insurance.optName}</span>
																									<span class="h5 text-primary font-weight-bold">
																										<fmt:formatNumber value="${(car.price * during) + (insurance.price * during)}" pattern="#,###"/>원 </span>
																								</a>
																							</div>
																						</c:forEach>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!-- 페이징 -->
						<jsp:include page="/pagination" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
    $(function(){
        initPickadate();
    })

    function moveToView(seq, insCode){
        let searchForm = $('[name="searchCar"]');
        let filterForm = $('[name="filterForm"]');

        searchForm.find('#start').val('');
        searchForm.find('#end').val('');
        searchForm.append($('<input/>').attr('name','seq').attr('value',seq).attr('type','hidden'));
        searchForm.append($('<input/>').attr('name','insCode').attr('value',insCode).attr('type','hidden'));
        let data = $(searchForm[0], filterForm[0]).serialize();
        location.href = "commonRent/view?" + data;
    }

    
    function searchCars(pageNum, amount) {
        let searchForm = $('[name="searchCar"]');
        let filterForm = $('[name="filterForm"]');

        searchForm.find('#searchArea').val();
        searchForm.find('#start').val();
        searchForm.find('#end').val();
        filterForm.append($('<input/>').attr('name','pageNum').attr('value', pageNum).attr('type','hidden'));
        filterForm.append($('<input/>').attr('name','amount').attr('value', amount).attr('type','hidden'));
        filterForm.find('#model').val();
        filterForm.find('#segment').val();
        filterForm.find('#fuel').val();
        filterForm.find('#brand').val();
        filterForm.find('#year').val(0);
        filterForm.find('#passenger').val()*1;
        let data = $(filterForm[0], searchForm[0]).serialize();
        location.href = "commonRent?" + data;
    }
    
/*     function searchCars2(pageNum, amount, seg) {
    	console.log(seg);
        let searchForm = $('[name="searchCar"]');
        let filterForm2 = $('[name="filterForm2"]');
		var segment = $(this).prev('#filter_seg').val();
		console.log("============================" + segment);
		
        searchForm.find('#searchArea').val();
        searchForm.find('#start').val();
        searchForm.find('#end').val();
        filterForm2.append($('<input/>').attr('name','pageNum').attr('value', pageNum).attr('type','hidden'));
        filterForm2.append($('<input/>').attr('name','amount').attr('value', amount).attr('type','hidden'));
        filterForm2.append($('<input/>').attr('name','segment').attr('value', segment).attr('type','hidden'));
        let data = $(filterForm2[0], searchForm[0]).serialize();
        location.href = "commonRent?" + data;
    }     */
    
    
    
    $(document).on('click', '#filter2', function(){
        let searchForm = $('[name="searchCar"]');
        let filterForm2 = $('[name="filterForm2"]');
		var segment = $(this).prev('#filter_seg').val();
		console.log("============================" + segment);
		
        searchForm.find('#searchArea').val();
        searchForm.find('#start').val();
        searchForm.find('#end').val();
        let pageNum = $('[name="pageNum"]').val();
        let amount = $('[name="amount"]').val();
        filterForm2.append($('<input/>').attr('name','pageNum').attr('value', pageNum).attr('type','hidden'));
        filterForm2.append($('<input/>').attr('name','amount').attr('value', amount).attr('type','hidden'));
        filterForm2.append($('<input/>').attr('name','segment').attr('value', segment).attr('type','hidden'));
        let data = $(filterForm2[0], searchForm[0]).serialize();
        location.href = "commonRent?" + data;    	
    });

    
    function initPickadate(){
        let startPicker = $("#start").pickadate('picker');
        let endPicker = $("#end").pickadate('picker');

        startPicker.set('select', new Date('<fmt:formatDate value="${startDate}" pattern="yyyy/MM/dd" />'));
        endPicker.set({
            min : 1,
            select : new Date('<fmt:formatDate value="${endDate}" pattern="yyyy/MM/dd" />')
        });

        startPicker.on('close', function(){
            let minDate = new Date(startPicker.get('select','yyyy,mm,dd'));
            minDate.setDate(minDate.getDate()+1);
            endPicker.set('min', minDate).set('clear');
        });
    }

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

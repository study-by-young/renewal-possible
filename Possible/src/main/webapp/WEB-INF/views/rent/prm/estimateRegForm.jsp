<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-28
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title">
                        <h1 class="font-weight-bold">렌트 견적 요청</h1>
                        <h6>나만의 렌트카를 요청해보세요!</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- btc tittle Wrapper End -->
<div class="x_car_book_sider_main_Wrapper my-4">
    <div class="container">
        <form id="estimateForm" name="estimateForm" method="post">
            <input type="hidden" name="memberVO.Seq" id="memberVO.Seq" value="<sec:authentication property="principal.seq" />" >
            <div class="row">
                <div class="col-lg-10 col-12 offset-lg-1 ">
                    <div class="x_carbooking_right_section_wrapper card">
                        <div class="card-header bg-white">
                            <h4 class="mb-0">견적 작성</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div id="carSelection" class="mb-5">
                                        <ul class="nav nav-tabs nav-tabs-highlight nav-justified mb-0">
                                            <li class="nav-item"><a class="nav-link active">차종 선택</a></li>
                                        </ul>

                                        <div class="tab-content card card-body border border-top-0 rounded-top-0 shadow-0 mb-0">
                                            <div class="tab-pane fade show active">
                                                <div class="row">
                                                    <div class="col-4 form-group">
                                                        <label class="w-100">브랜드</label>
                                                        <select name="brand" id="brand" class="select form-control" onchange="searchModelByBrand()">
                                                            <option disabled selected>브랜드를 선택하세요</option>
                                                            <c:forEach var="brand" items="${brands}">
                                                                <option value="${brand.code}">${brand.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-4 form-group">
                                                        <label  class="w-100">모델</label>
                                                        <select name="model" id="model" class="select form-control" onchange="searchTrimByModel()">
                                                            <option disabled selected>브랜드를 선택하세요</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-4 form-group">
                                                        <label class="w-100">트림</label>
                                                        <input type="hidden" name="segment" id="segment" value="">
                                                        <select name="trim" id="trim" class="select form-control" onchange="selectTrim(this)">
                                                            <option disabled selected>모델을 선택하세요</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="x_car_book_left_siderbar_wrapper col-lg-3 pl-lg-3 mb-5">
                                    <div class="card-img text-center text-lg-left">
                                        <div class="card-img-top">
                                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/w1.png" alt="car_img">
                                        </div>
                                        <div class="x_car_access_filer_top_img my-2">
                                            <h5></h5>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-md-5 mb-3">
                                    <div class="form-group">
                                        <h5 for="start">대여 날짜</h5>
                                        <input type="text" id="start" name="start" class="form-control pickadate-format">
                                    </div>
                                </div>
                                <div class="col-md-2 align-self-center d-none d-md-block text-center">
                                    <p><i class="fas fa-angle-double-right fa-2x text-grey-800"></i></p>
                                </div>
                                <div class="col-md-5 mb-3">
                                    <div class="form-group">
                                        <h5 for="end">반납 날짜</h5>
                                        <input type="text" id="end" name="end" class="form-control pickadate-format">
                                    </div>
                                </div>
                                <div class="col-12 mb-4">
                                    <h5>차량 옵션</h5>
                                    <div class="row">
                                        <c:forEach var="option" items="${carOpt}" varStatus="status">
                                            <div class="mb-2 col-lg-3 col-md-4 col-6">
                                                <div class="custom-control custom-checkbox custom-control-inline">
                                                    <input type="checkbox" name="options" id="options${status.index}" class="custom-control-input" value="${option.name}">
                                                    <label class="custom-control-label" for="options${status.index}">${option.name}</label>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-12 mb-4">
                                    <h5>캠핑 옵션</h5>
                                    <div class="row">
                                        <c:forEach var="option" items="${carOpt}" varStatus="status">
                                            <div class="mb-2 col-lg-3 col-md-4 col-6">
                                                <div class="custom-control custom-checkbox custom-control-inline">
                                                    <input type="checkbox" name="items" id="items${status.index}" class="custom-control-input" value="${option.name}">
                                                    <label class="custom-control-label" for="items${status.index}">${option.name}</label>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <h5>수령 장소</h5>
                                    <hr class="my-2">
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <h5 class="mb-0">우편번호</h5>
                                        <div class="input-group">
                                            <input type="text" id="takePlaceCode" name="takePlaceCode" class="form-control" required>
                                            <span class="input-group-append">
												<button type="button" class="btn btn-outline-primary" onclick="daumPostcode($('#postalWrapper')[0],takePlaceCode,takePlaceBasic,takePlaceDetail)">주소 검색</button>
											</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <h5 class="mb-0">기본 주소</h5>
                                        <input type="text" id="takePlaceBasic" name="takePlaceBasic" placeholder="기본 주소" class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <h5 class="mb-0">상세 주소</h5>
                                        <input type="text" id="takePlaceDetail" name="takePlaceDetail" placeholder="상세 주소" class="form-control">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div id="postalWrapper" class=""></div>
                                </div>
                                <div class="col-12 mb-3">
                                    <h5>참고 사항</h5>
                                    <div class="border">
                                        <textarea name="memo" id="memo" class="form-control border-bottom-0 px-2"></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-block btn-primary"><span class="h4 mb-0">견적 제출</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- x car book sidebar section Wrapper End -->
<script>
    let brand = $('#brand');
    let model = $('#model');
    let trim = $('#trim');

    $(function(){
        initPickadate();

    })

    function searchModelByBrand(){
        model.html('<option disabled selected>브랜드를 선택하세요</option>');
        trim.html('<option disabled selected>모델을 선택하세요</option>');

        $.ajax({
            url : '../../findModels',
            data : {brand : brand.val()},
            dataType : 'json',
            success : function(result){
                result.forEach(function (item) {
                    let opt = $('<option>').attr('value', item['code'])
                        .attr('data-img-src', item['img'])
                        .attr('data-seg',item['segCode'])
                        .text(item['name']);

                    model.append(opt);
                });

                model.select2({
                    minimumResultsForSearch: Infinity
                });
            }
        });
    }

    function selectSegment(input){
        console.log($(input).val());
    }

    function searchTrimByModel(){
        $.ajax({
            url : '../../findTrims',
            data : {model : model.val()},
            dataType : 'json',
            success : function(result){
                trim.html('<option disabled selected>트림을 선택하세요</option>');

                result.forEach(function (item) {
                    trim.append(
                        $('<option>').attr('value', item['code'])
                            .text(item['name'])
                    );
                });
                trim.select2({
                    minimumResultsForSearch: Infinity
                });
                trim.parent().children('#segment').val(model.find('option:selected').data('seg'));

                let carInfo = $('.x_car_book_left_siderbar_wrapper .card-img');
                carInfo.find('img').attr('src', '${pageContext.request.contextPath}' + model.find('option:selected').data('img-src'));
                carInfo.find('h5').text(brand.find('option:selected').text() + " " +model.find('option:selected').text());

            }
        });
    }

    function selectTrim(input){
        let carInfo = $('.x_car_book_left_siderbar_wrapper .card-img');
        carInfo.find('p').text($(input).find('option:selected').text());
    }

    function initPickadate(){
        let startPicker = $("#start").pickadate('picker');
        let endPicker = $("#end").pickadate('picker');

        startPicker.set('select', new Date());
        endPicker.set({
            min : 1
        });

        startPicker.on('close', function(){
            let minDate = new Date(startPicker.get('select','yyyy,mm,dd'));
            minDate.setDate(minDate.getDate()+1);
            endPicker.set('min', minDate).set('clear');
        });
    }

</script>

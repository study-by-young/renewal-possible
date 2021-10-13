<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-28
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- btc tittle Wrapper Start -->
<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title">
                        <h1 class="font-weight-bold">렌트 견적 작성</h1>
                        <h6>고객이 견적을 기다리고 있어요!</h6>
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
            <input type="hidden" name="memSeq" id="memSeq" value="1">
            <div class="row">
                <div class="col-xl-9">
                    <div class="card">
                        <div class="card-header bg-white">
                            <h4 class="mb-0">견적 작성</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group col-12">
                                <label for="selectCar">렌트카</label>
                                <select name="selectCar" id="selectCar" class="select" onchange="selectCarFunc()" required>
                                    <option disabled selected>렌트카를 선택하세요. 선택된 렌트카는 견적 제출 이후 예약불가 상태로 변경됩니다.</option>
                                    <optgroup label="예약 가능 렌트카">
                                        <c:forEach var="car" items="${carList}">
                                            <option value="${car.seq}">${car.brand} ${car.model} ${car.trim} / ${car.segment} / ${car.carNum}</option>
                                        </c:forEach>
                                    </optgroup>
                                </select>
                            </div>
                            <div class="col-12">
                                <div id="selectCarInfo" class="card border-primary-300 border-1">
                                    <div class="card-body">
                                        <div class="text-center p-5">
                                            차량을 선택해주세요.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <ul class="list-unstyled row">
                                <li class="col-md-12">

                                </li>
                                <li class="col-md-12 my-3">
                                    <label>차량 옵션</label>
                                    <hr class="my-2">
                                    <div class="x_slider_checkbox_bottom_filter_use">
                                        <c:forEach var="option" items="${carOptions}" varStatus="status">
                                            <label class="pr-3">
                                                <input name="options" id="options" type="checkbox" value="${option.code}" disabled>
                                                    ${option.name}</label>
                                        </c:forEach>
                                    </div>
                                </li>
                                <li class="col-md-12 my-3">
                                    <label>캠핑 옵션</label>
                                    <hr class="my-2">
                                    <div class="x_slider_checkbox_bottom_filter_use">
                                        <c:forEach var="option" items="${carOpt}" varStatus="status">
                                            <label class="pr-3">
                                                <input name="items" id="items" type="checkbox" value="${option.name}">
                                                    ${option.name}</label>
                                        </c:forEach>
                                    </div>

                                </li>
                                <li class="col-md-6 mb-3">
                                </li>
                                <li class="col-md-6 mb-3">
                                </li>
                                <li class="col-md-12">
                                    <label>렌트카 수령 장소</label>
                                    <hr class="my-2">
                                </li>
                                <li class="col-md-6 mb-3">
                                    <label for="takePlaceCode">우편번호</label>
                                    <input type="text" id="takePlaceCode" name="takePlaceCode" class="form-control" required>
                                </li>
                                <li class="col-md-6 mb-3 align-self-end">
                                    <button type="button" class="btn " onclick="daumPostcode($('#postalWrapper')[0],takePlaceCode,takePlaceBasic,takePlaceDetail)">주소 검색</button>
                                </li>
                                <li class="col-md-6 mb-3">
                                    <label for="takePlaceBasic">기본 주소</label>
                                    <input type="text" id="takePlaceBasic" name="takePlaceBasic" placeholder="기본 주소" class="form-control" required>
                                </li>
                                <li class="col-md-6 mb-3 ">
                                    <label for="takePlaceDetail">상세 주소</label>
                                    <input type="text" id="takePlaceDetail" name="takePlaceDetail" placeholder="상세 주소" class="form-control">
                                </li>
                                <li class="col-md-12 mb-3">
                                    <div id="postalWrapper" class="border"></div>
                                </li>
                                <li class="col-md-12 mb-3">
                                    <label for="memo">참고 사항</label>
                                    <textarea name="memo" id="memo" class="form-control"></textarea>
                                </li>
                            </ul>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-lg btn-primary w-100">작성 완료<i class="fa fa-arrow-right"></i></button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3">
                    <div class="card">
                        <div class="card-header bg-white">
                            <h4 class="mb-0">견적 상세</h4>
                        </div>
                        <div class="card-body">
                            <div class="x_car_access_filer_top_img">
                                <img class="img-fluid" src="images/c2.png" alt="car_img">
                                <h3></h3>
                            </div>
                            <div class="panel panel-default x_car_inner_acc_acordion_padding">
                                <div class="panel-heading car_checkout_caret">
                                    <h5 class="panel-title"> <a href="#"> 렌트 시작 날짜</a> </h5>
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
                            <div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
                                <div class="panel-heading car_checkout_caret">
                                    <h5 class="panel-title"> <a href="#"> 렌트 종료 날짜</a> </h5>
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
                            <div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
                                <div class="panel-heading car_checkout_caret">
                                    <h5 class="panel-title"> <a href="#"> 렌트카 수령 장소</a> </h5>
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
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- x car book sidebar section Wrapper End -->
<script>
    $(function(){

    })
    function selectCarFunc() {
        let carSeq = $('#selectCar').val();
        console.log(carSeq);
        $.ajax({
            url: "${pageContext.request.contextPath}/car/" + carSeq,
            dataType: 'json',
            success: function(result){
                let carInfoWrapper = $('<div/>')
                    .append('<div class="row">' +
                        '<div class="col-lg-3">' +
                        '<div class="card-img">' +
                        <%--'<img src="${pageContext.request.contextPath}' + result.+ '" alt="" class="img-fluid"/>' +--%>
                        '</div>' +
                        '</div>' +
                        '<div class="col-lg-9">' +
                        '<div class="row">' +
                        '<div class="col-12">' +
                        '<div class="card border-primary-300 border-1 shadow-0">' +
                        '<div class="card-body">' +
                        '<div class="row align-items-center">' +
                        '<div class="col-12">' +
                        '<ul class="list-unstyled mb-0">' +
                        <%--'<c:forEach var="item" items="${items}">' +--%>
                        '<li class="d-inline-block pr-3 mb-1">' +
                        <%--'<i class="icon-checkbox-checked2 text-primary"></i> ${item}' +--%>
                        '</li>' +
                        <%--'</c:forEach>' +--%>
                        '</ul>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>');
                console.log(result);
            }
        })
    }
</script>

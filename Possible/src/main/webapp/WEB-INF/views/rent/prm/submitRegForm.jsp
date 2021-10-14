<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                            <option value="${car.seq}">${car.brandName} ${car.modelCodeVO.name} ${car.trimCodeVO.name} / ${car.segmentName} / ${car.carNum}</option>
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
                                        <c:forEach var="option" items="${carOpt}" varStatus="status">
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

                                <li class="col-md-12 mb-3 ">
                                    <label for="memo">참고 사항</label>
                                    <div class="border">
                                        <textarea name="memo" id="memo" class="form-control border-bottom-0 px-2"></textarea>
                                    </div>
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
                            <h4 class="mb-0">견적 요청서 요약</h4>
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
    let resultJson;
    $(function(){

    })
    function selectCarFunc() {
        let carSeq = $('#selectCar').val();
        console.log(carSeq);
        $.ajax({
            url: "${pageContext.request.contextPath}/car/" + carSeq,
            dataType: 'json',
            success: function(result){
                resultJson = result;
                genDate = new Date(result.genDate);
                let htmlStr = '<div class="row">' +
                    '<div class="col-lg-3 align-self-center">' +
                    '<div class="card-img">' +
                    '<img src="${pageContext.request.contextPath}' + result.modelCodeVO.img + '" alt="" class="img-fluid"/>' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-lg-9 pl-4">' +
                    '<ul class="row list-unstyled mb-0">' +
                    '<li class="col-12 pr-3 mb-1">' +
                    '<i class="fas fa-car"></i> 차종 : ' + result.brandName + ' ' + result.modelName + ' ' + result.trimName +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-car"></i> 번호 : ' + result.carNum +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-pen-fancy"></i> 색상 : ' + result.colorName +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-calendar-alt"></i> 연식 : ' + result.year +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-oil-can"></i> 연료 : ' + result.fuelName +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-cogs"></i> 변속 : ' + result.missionName +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-user-friends"></i> 탑승인원 : ' + result.passenger +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-inbox"></i> 트렁크 : ' + result.trunk +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-door-open"></i> 문갯수 : ' + result.door +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-road"></i> 연비 : ' + result.kmpl + 'km/l' +
                    '</li>' +
                    '<li class="col-lg-6 pr-3 mb-1">' +
                    '<i class="fas fa-calendar-alt"></i> 등록일 : ' + genDate.getFullYear() + '년 ' + (genDate.getMonth() + 1) + '월 ' + genDate.getDate() + '일' +
                    '</li>' +
                    '</ul>' +
                    '</div>' +
                    '<hr>' +
                    '<div class="col-12 border-top mt-2 pt-2">' +
                    '<div class="row justify-content-center">';
                if(result.img1 !=null){
                    htmlStr += '<div class="col-lg-4"><img src="${pageContext.request.contextPath}' + result.img1 + '" alt="" class="img-fluid"></div>';
                }
                if(result.img2 !=null){
                    htmlStr += '<div class="col-lg-4"><img src="${pageContext.request.contextPath}' + result.img2 + '" alt="" class="img-fluid"></div>';
                }
                if(result.img3 !=null){
                    htmlStr += '<div class="col-lg-4"><img src="${pageContext.request.contextPath}' + result.img3 + '" alt="" class="img-fluid"></div>';
                }
                htmlStr += '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';

                let carInfoWrapper = $('<div/>').append(htmlStr);


                $('#selectCarInfo .card-body').html(carInfoWrapper);
            }
        })
    }
</script>

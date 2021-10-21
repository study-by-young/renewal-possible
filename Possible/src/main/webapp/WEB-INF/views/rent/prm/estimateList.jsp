<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-27
  Time: 오후 5:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title">
                        <h1 class="font-weight-bold">렌트 견적 요청 목록</h1>
                        <h6>나만의 렌트카를 요청해보세요!</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left mt-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="x_carbooking_right_section_wrapper float_left">
                    <div class="card">
                        <div class="card-body row">
                            <div class="col-6 align-self-center">
                                <span>총 ${pagination.total}건</span>
                                <%--                            <div class="d-inline-block">--%>
                                <%--                                <select class="select">--%>
                                <%--                                    <option>Sort by Price</option>--%>
                                <%--                                    <option>12$</option>--%>
                                <%--                                    <option>13$</option>--%>
                                <%--                                    <option>14$</option>--%>
                                <%--                                </select>--%>
                                <%--                            </div>--%>
                            </div>
                            <div class="col-6">
                                <div class="text-right">
                                    <button type="button" class="btn btn-primary" onclick="loginCheck()">견적 요청</button>
<%--                                    <a class="btn btn-primary" href="estimate/register"><i class="icon-pencil7 align-baseline"></i> 견적 요청</a>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="x_car_book_tabs_content_main_wrapper my-4">
                                <div class="row">
                                    <c:forEach var="estimate" items="${estList}" varStatus="status">
                                        <div class="premium_rent_list_item col-12">
                                            <div class="card">
                                                <div class="row">
                                                    <div class="col-lg-3 align-self-center">
                                                        <div class="card-img-actions p-3">
                                                            <img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/resources/images/cars/Genesis/genesis_g90.png" alt="">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-9 border-left">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-lg-9">
                                                                    <div class="x_car_offer_heading x_car_offer_heading_list float_left">
                                                                        <h5 class="font-weight-bold">
                                                                                ${estimate.brandCodeVO.name} ${estimate.modelCodeVO.name}<br><small>${estimate.trimCodeVO.name}</small>
                                                                        </h5>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <button type="button" class="btn btn-block btn-primary" onclick="viewCheck()">상세보기</button>
<%--                                                                    <a class="btn btn-block btn-primary"--%>
<%--                                                                       href="estimate/view?seq=${estimate.seq}&pageNum=${param.getOrDefault("pageNum",1)}&amount=${param.getOrDefault("amount", pagination.cri.amount)}">--%>
<%--                                                                        상세보기--%>
<%--                                                                    </a>--%>
                                                                </div>
                                                                <div class="col-12">
                                                                    <hr class="my-2">
                                                                    <p class="text-grey-600">
                                                                        <i class="h3 icon-calendar pr-2 mb-0"></i>
                                                                        <fmt:formatDate value="${estimate.startDate}" pattern="yy년 MM월 dd일" /> ~ <fmt:formatDate value="${estimate.endDate}" pattern="yy년 MM월 dd일" />
                                                                    </p>
                                                                    <p class="text-grey-600">
                                                                        <i class="h3 icon-location4 pr-2 mb-0"></i> ${estimate.takePlaceBasic} ${estimate.takePlaceDetail}
                                                                    </p>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="card border-primary-300 border-1">
                                                                        <div class="card-body">
                                                                            <div class="row align-items-center">
                                                                                <div class="col-2">
                                                                                    <i class="icon-checkmark4"></i> 차량 옵션
                                                                                </div>
                                                                                <div class="col-10">
                                                                                    <ul class="list-unstyled mb-0">
                                                                                        <c:forEach var="opt" items="${estimate.optionList}">
                                                                                            <li class="d-inline-block pr-3 mb-1"><i class="icon-checkbox-checked2 text-primary"></i> ${opt}
                                                                                            </li>
                                                                                        </c:forEach>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="card border-primary-300 border-1">
                                                                        <div class="card-body">
                                                                            <div class="row align-items-center">
                                                                                <div class="col-2">
                                                                                    <i class="icon-checkmark4"></i> 여행 옵션
                                                                                </div>
                                                                                <div class="col-10">
                                                                                    <ul class="list-unstyled mb-0">
                                                                                        <c:forEach var="itm" items="${estimate.itemList}">
                                                                                            <li class="d-inline-block pr-3 mb-1"><i class="icon-checkbox-checked2 text-primary"></i> ${itm}
                                                                                            </li>
                                                                                        </c:forEach>
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
                                    </c:forEach>
                                    <jsp:include page="/pagination"/>
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
<script>
    function viewCheck() {
        $.ajax({
            url:'estimate/viewCheck',
            success: function(result){
                window['customAlert']('test','testest');
            }
        })
    }

    function loginCheck() {
        $.ajax({
            url:'estimate/registerCheck',
            success: function(result){
                if(result === 0) {
                    customAlert("알림", "로그인 후 이용 가능합니다.");
                } else if(result === 1){
                    location.href="estimate/register";
                } else {
                    customAlert("알림", "일반회원만 이용 가능합니다.");
                }
            }
        })
    }

$(function () {
        $('.page-arrow').on('click', function(e){
            if(this.value == null){
                e.preventDefault();
                this.blur();
            }
        });
    });
</script>

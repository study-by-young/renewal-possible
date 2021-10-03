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
    <div class="btc_tittle_img_overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
                <div class="btc_tittle_left_heading">
                    <h1>렌트 견적 요청 목록</h1>
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
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
<%--                            <div class="x_carbook_right_select_box_wrapper float_left">--%>
<%--                                <select class="myselect">--%>
<%--                                    <option>Sort by Price</option>--%>
<%--                                    <option>12$</option>--%>
<%--                                    <option>13$</option>--%>
<%--                                    <option>14$</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
                            <p>총 ${pagination.total}건</p>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="x_carbook_right_tabs_box_wrapper float_left">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="btn btn-primary" href="insert"><i class="icon-pencil7 align-baseline"></i> 견적 요청</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="x_car_book_tabs_content_main_wrapper">
                                <div class="tab-content">
                                    <div id="menu1" class="tab-pane fade active show">
                                        <div class="row">
                                            <c:forEach var="est" items="${estList}" varStatus="status">
                                                <c:set var="estimate" value="${est.get('estimate')}" />
                                                <c:set var="options" value="${est.get('options')}" />
                                                <c:set var="items" value="${est.get('items')}" />
                                                <div class="col-md-12">
                                                    <div class="x_car_offer_main_boxes_wrapper float_left">
                                                        <div class="x_car_offer_starts x_car_offer_starts_list_img float_left border-0">
                                                            <div class="x_car_offer_img x_car_offer_img_list float_left">
                                                                <img src="${pageContext.request.contextPath}/resources/images/cars/Genesis/genesis_g90.png" alt="img" class="img-fluid">
                                                            </div>
                                                            <div class="x_car_offer_price x_car_offer_price_list float_left">
                                                            </div>
                                                        </div>
                                                        <div class="x_car_offer_starts_list_img_cont border-left">
                                                            <div class="x_car_offer_heading x_car_offer_heading_list float_left">
                                                                <h5 class="pt-3">${estimate.brand} ${estimate.model}</h5>
                                                                <p>${estimate.trim}</p>
                                                                <hr class="my-2">
                                                                <p> 기간 : <fmt:formatDate value="${estimate.startDate}" pattern="yy년 MM월 dd일" /> ~ <fmt:formatDate value="${estimate.endDate}" pattern="yy년 MM월 dd일" /></p>
                                                                <p> 장소 : ${estimate.takePlaceBasic} ${estimate.takePlaceDetail}</p>
                                                            </div>
                                                            <div class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
                                                                <ul>
                                                                    <li>
                                                                        <sec:authorize access="hasRole('USER')">
                                                                            <a href="view?seq=${estimate.seq}&pageNum=${param.getOrDefault("pageNum",1)}&amount=${param.getOrDefault("amount", pagination.cri.amount)}">상세보기</a>
                                                                        </sec:authorize>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="x_car_offer_heading x_car_offer_heading_listing float_left">
                                                                <ul class="">
                                                                    <li>
                                                                        <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 차량 옵션</span>
                                                                            <ul class="list">
                                                                                <c:forEach var="opt" items="${options}">
                                                                                    <li class="dpopy_li"><i class="fa fa-snowflake-o"></i> ${opt}
                                                                                    </li>
                                                                                </c:forEach>
                                                                            </ul>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 여행 옵션</span>
                                                                            <ul class="list">
                                                                                <c:forEach var="itm" items="${items}">
                                                                                    <li class="dpopy_li"><i class="fa fa-snowflake-o"></i> ${itm}
                                                                                    </li>
                                                                                </c:forEach>
                                                                            </ul>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <div class="col-md-12">
                                                <div class="pager_wrapper prs_blog_pagi_wrapper">
                                                    <ul class="pagination">
                                                        <li>
                                                            <a class="page-arrow" href="?pageNum=${pagination.startPage-1}&amount=${pagination.cri.amount}" <c:if test="${!pagination.prev }">style="display: none"</c:if>><i class="flaticon-left-arrow"></i></a>
                                                        </li>
                                                        <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="num">
                                                            <li class="btc_shop_pagi">
                                                                <a href="?pageNum=${num }&amount=${pagination.cri.amount}"
                                                                   <c:if test="${param.getOrDefault('pageNum',1) == num}">class="active"</c:if>
                                                                >${num }</a>
                                                            </li>
                                                        </c:forEach>
                                                        <li>
                                                            <a class="page-arrow" href="?pageNum=${pagination.endPage+1}&amount=${pagination.cri.amount}" <c:if test="${!pagination.next }">style="display: none"</c:if>><i class="flaticon-right-arrow"></i></a>
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
<!-- x car book sidebar section Wrapper End -->
<script>
    <c:if test="${resultMsg != null}">
        $(function(){
            alert("${resultMsg}");
        });
    </c:if>

    $(function () {
        $('.page-arrow').on('click', function(e){
            if(this.value == null){
                e.preventDefault();
                this.blur();
            }
        });
    });
</script>

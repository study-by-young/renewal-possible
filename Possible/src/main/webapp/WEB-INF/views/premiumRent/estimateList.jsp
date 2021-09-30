<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1>렌트 견적 요청</h1>
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
                                        <a class="btn btn-primary" href="insert"><i class="icon-pencil7 align-baseline"></i> 견적 작성</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="x_car_book_tabs_content_main_wrapper">
                                <div class="tab-content">
                                    <div id="menu1" class="tab-pane fade active show">
                                        <div class="row">
                                            <c:forEach var="est" items="${estList}">
                                                <div class="col-md-12">
                                                    <div class="x_car_offer_main_boxes_wrapper float_left">
                                                        <div class="x_car_offer_starts x_car_offer_starts_list_img float_left">
                                                            <div class="x_car_offer_img x_car_offer_img_list float_left">
                                                                <img src="${pageContext.request.contextPath}/resources/images/cars/Genesis/genesis_g90.png" alt="img" class="img-fluid">
                                                            </div>
                                                            <div class="x_car_offer_price x_car_offer_price_list float_left">
                                                            </div>
                                                        </div>
                                                        <div class="x_car_offer_starts_list_img_cont">
                                                            <div class="x_car_offer_heading x_car_offer_heading_list float_left">
                                                                <h5 class="pt-3">${est.brand} ${est.model}</h5>
                                                                <p>${est.trim}</p>
                                                                <hr class="my-2">
                                                                <p>${est.startDate} ~ ${est.endDate}</p>
                                                            </div>
                                                            <div class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
                                                                <ul>
                                                                    <li><a href="#">Book now</a>
                                                                    </li>
                                                                    <li><a href="#">Details</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="x_car_offer_heading x_car_offer_heading_listing float_left">
                                                                <ul class="">
                                                                    <li>	<a href="#"><i class="fa fa-users"></i> &nbsp;4 Seats</a>
                                                                    </li>
                                                                    <li>	<a href="#"><i class="fa fa-clone"></i> &nbsp;4 Doors</a>
                                                                    </li>
                                                                    <li>	<a href="#"><i class="fa fa-shield"></i> &nbsp;9 Manual</a>
                                                                    </li>

                                                                    <li>	<a href="#"><i class="fa fa-briefcase"></i> &nbsp;4 Bag Space</a>
                                                                    </li>
                                                                    <li>	<a href="#"><i class="fa fa-snowflake-o"></i>&nbsp;2 Air: Yes</a>
                                                                    </li>
                                                                    <li>
                                                                        <div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> Others (2)</span>
                                                                            <ul class="list">
                                                                                <li class="dpopy_li"><a href="#"><i class="fa fa-snowflake-o"></i> Air Conditioning</a>
                                                                                </li>
                                                                                <li class="dpopy_li"><a href="#"><i class="fa fa-code-fork"></i> Transmission</a>
                                                                                </li>
                                                                                <li class="dpopy_li"><a href="#"><i class="fa fa-user-circle-o"></i> Minimum age</a>
                                                                                </li>
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
                                                            <a class="page-arrow" href="<c:if test="${pagination.prev }">${pagination.startPage-1}</c:if>"><i class="flaticon-left-arrow"></i></a>
                                                        </li>
                                                        <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="num">
                                                            <li class="btc_shop_pagi">
                                                                <a href="${num }">${num }</a>
                                                            </li>
                                                        </c:forEach>
                                                        <li>
                                                            <a class="page-arrow" href="<c:if test="${pagination.next }">${pagination.endPage+1}</c:if>"><i class="flaticon-right-arrow"></i></a>
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

<c:forEach var="est" items="${estList}">
    ${est.brand}
</c:forEach>

<a href="insert" class="btn">insert</a>
<a href="update" class="btn">update</a>
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

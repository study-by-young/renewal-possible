<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
    .in {
        display: inline-block;
        color:#4f5dec;
        border: 1px solid;
    }
</style>


<!-- x blog main and sidebar Wrapper Start -->
<div class="x_blog_sidebar_main_wrapper float_left padding_tb_100">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="x_blog_left_side_wrapper float_left">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="lr_bc_first_box_main_wrapper">
                                <!-- 메뉴 -->
                                <div class="lr_bc_first_box_img_cont_wrapper">
                                    <ul>
		                              <li><a href="${pageContext.request.contextPath}/mypage/dashboard">홈</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/editProfile">회원정보수정</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/estimate">견적관리</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/rent">렌트관리</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/community">커뮤니티관리</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/qna">나의문의</a></li>
                                    </ul>
                                </div>
                                <br> <br> <br>
                                <!-- 견적관리 -->
                                <div class="col-md-12">
                                    <div class="blog_single_comment_heading">
                                        <h4>프리미엄 견적 신청 관리</h4>
                                    </div>
                                </div>
								<div class="col-md-12">
									<div class="x_car_book_tabs_content_main_wrapper">
										<div class="tab-content">
											<div id="home" class="tab-pane fade active show">
												<div class="row">
													<div class="col-md-12">
													<!-- 여기서부터 main-box-wrapper -->
														<c:forEach var="estimate" items="${estList}">
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
																<h5 class="pt-3">${estimate.brand} ${estimate.model} </h5>
																<p class="p6">대여/반납일</p>
																<p><fmt:formatDate value="${estimate.startDate}" pattern="yyyy/MM/dd"/> ~ <fmt:formatDate value="${estimate.endDate}" pattern="yyyy/MM/dd" /> </p>
																<hr class="my-2">
																<p>신청일자 : <span class="h6"><fmt:formatDate value="${estimate.genDate}" pattern="yyyy/MM/dd"/></span></p>
																<p><i class="fa fa-map-marker-alt"></i>수령장소: ${estimate.takePlaceBasic}
																<p>수령장소 상세정보 : ${estimate.takePlaceDetail}
																
															</div>
															<div class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left" style="width: 30%;">
																<ul>
																	<li style="width: 100%;">
	                                                                    <a href="estimate/view?seq=${estimate.seq}">견적상세보기</a>
	                                                                </li>
																</ul>
															</div>
													
															<!-- 옵션 / 업체를 선택하면 해당 업체가 보유하고 있는 옵션 표시 -->
															<div class="x_car_offer_heading x_car_offer_heading_listing float_left">
                                                            	<ul class="">
                                                                	<li>
                                                                    	<div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 차량 옵션</span>
                                                                        	<ul class="list">
	                                                                            <c:forEach var="opt" items="${estimate.options}">
	                                                                                <li class="dpopy_li"><i class="fa fa-snowflake-o"></i> ${opt}</li>
	                                                                            </c:forEach>
                                                                        </ul>
                                                                   	 	</div>
                                                                	</li>
                                                                	<li>
                                                                   		<div class="nice-select" tabindex="0">	<span class="current"><i class="fa fa-bars"></i> 여행 옵션</span>
                                                                        	<ul class="list">
	                                                                            <c:forEach var="itm" items="${estimate.items}">
	                                                                                <li class="dpopy_li"><i class="fa fa-snowflake-o"></i> ${itm}</li>
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
																<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" >
																	<div class="x_carbook_right_tabs_box_wrapper float_left">
																		
																	</div>
																</div>
																<!-- End 업체 정렬 -->

																<!-- 해당 차량 보유 업체 목록 -->
																<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="padding-left: 25px; padding-right: 30px; margin-bottom: 20px;">
																	<div class="x_carbook_right_tabs_box_wrapper float_left">
																		<hr class="my-2">
																		 <div class="row justify-content-end">
																		    <div class="col-2 x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left" style="width: 30%; padding-right: 15px">
																				<ul>
																					<li style="width: 100%; "><a href="#">견적제출하기</a>
																					</li>
																				</ul>
																			</div>
																		 </div>
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
											<!-- <div class="col-md-12">
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
											</div>  --> 
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

            <!-- 사이드바 -->
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="x_blog_right_side_wrapper float_left">
                    <div class="row">

                        <div class="col-md-12">
                            <div
                                    class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">

                                <div>
                                    <br>
                                    <br>
                                    <div align="center">
                                        <img style="border-radius: 50%;"
                                             src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                             alt="comment_img" class="img-responsive img-circle" />
                                    </div>
                                    <br>
                                    <div align="center">
                                        <h3>
                                            <sec:authorize access="isAuthenticated()">
                                                <a class="menu-button" href="#"><sec:authentication
                                                        property="principal.username" />님</a>
                                                <input type="hidden" name="${_csrf.parameterName }"
                                                       value="${_csrf.token }">
                                            </sec:authorize>

                                        </h3>
                                    </div>

                                </div>
                                <div class="jp_rightside_job_categories_content">
                                    <ul >
                                        <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                                href="#">예약완료 </a></li>
                                        <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                                href="#">쿠폰함 </a></li>
                                        <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                                href="#">포인트 </a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div
                                    class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">
                                <div>
                                    <br>
                                    <br>
                                    <div align="center">
                                        <h4>고객센터</h4>
                                        <br>
                                        <div>
                                            <img style="border-radius: 50%;"
                                                 src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                                 alt="comment_img" class="img-responsive img-circle" />
                                        </div>
                                        <br>
                                        <div align="center">
                                            <h3>1544-1544</h3>
                                        </div>
                                        <hr>
                                    </div>
                                </div>
                                <br>
                                <div align="center">
                                    <h4>카카오톡 1:1 상담</h4>
                                    <br>
                                    <div>
                                        <img style="border-radius: 50%;"
                                             src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                             alt="comment_img" class="img-responsive img-circle" />
                                    </div>
                                </div>

                                <br>
                                <div class="jp_rightside_career_main_content"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- x blog main and sidebar Wrapper End -->

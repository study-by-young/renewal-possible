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
                                        <h4>나의 프리미엄 견적 신청 내역</h4>
                                    </div>
                                </div>
                                <c:if test="${!empty estimate}">
                              
                                <div class="col-md-12">
                                	<div class="x_car_book_tabs_content_main_wrapper my-4">
						            	<div class="row">  
						            			<div class="premium_rent_list_item col-12" >
						            				<div class="card">
						            					<div class="row">
						            						<div class="col-lg-4 aling-self-center" style="margin-top: 110px;">
						            							<div class="card-img-actions p-3">
                                                            		<img class="card-img-top img-fluid" src="${pageContext.request.contextPath}${estimate.modelCodeVO.img}" alt="">
                                                        		</div>
						            						</div>
						            						<div class="col-lg-8 border-left">
						            							<div class="card-body">
						            								<div class="row">
						            									<div class="col-lg-9">
                                                                    		<div class="x_car_offer_heading x_car_offer_heading_list float_left">
                                                                        		<h5 class="font-weight-bold">
                                                                                ${estimate.brand} ${estimate.modelCodeVO.name}<br><small>${estimate.trimCodeVO.name}</small>
                                                                        		</h5>
                                                                    		</div>
                                                                		</div>
                                                                		<div class="col-lg-3">
                                                                    		<a class="btn btn-block btn-primary"
                                                                      		   href="estimate/view?seq=${estimate.seq}&pageNum=${param.getOrDefault("pageNum",1)}&amount=${param.getOrDefault("amount", pagination.cri.amount)}">
                                                                        	 	상세보기
                                                                   			 </a>
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
                                                                         				<div class="col-3">
                                                                                    		<i class="icon-checkmark4"></i> 차량 옵션
                                                                                		</div>
                                                                                		<div class="col-9">
                                                                                    		<ul class="list-unstyled mb-0">
                                                                                        		<c:forEach var="opt" items="${estimate.options}">
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
                                                                                		<div class="col-3">
                                                                                    		<i class="icon-checkmark4"></i> 여행 옵션
                                                                                		</div>
                                                                                		<div class="col-9">
                                                                                    		<ul class="list-unstyled mb-0">
                                                                                        		<c:forEach var="itm" items="${estimate.items}">
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
						            		</div>             	
                                		</div>
                                	</div><!--  -->
                                	</c:if>
                                	<div class="col-md-12">
                                		 <jsp:include page="/premiumRent/submit?seq=${estimate.seq}&sPageNum=1"/>
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

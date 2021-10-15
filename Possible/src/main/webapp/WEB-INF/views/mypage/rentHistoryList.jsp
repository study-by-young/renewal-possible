<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
    .dash{
        background: #ffffff;
        box-shadow: 0px 0 8px rgb(0 0 0 / 10%);
        float: left;
        width: 100%;
        padding-top: 20px;
        padding-bottom: 20px;
        margin-top: 0px;
        margin-bottom: 70px;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
    }
    .x_car_offer_starts_list_img {
        float: left;
        width: 250px;
        padding-top: 90px;
        /*  border-right: 1px solid #eeeeee; */
    }
    .x_car_offer_heading ul {
        width: 100%;
        float: left;
        border-top: 0px solid #eeeeee;
        border-bottom: 1px solid #eeeeee;
        margin-top: 30px;
        border-left : 0px solid #eeeeee;
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
								
								
								 <div class="col-12">
								  <div class="blog_single_comment_heading">
                                        <h4>렌트내역</h4>
                                    </div>
									 <div class="x_car_book_tabs_content_main_wrapper my-4">
									 	 <div class="row">
									 	 	 <c:forEach var="est" items="${historyList}" varStatus="status">
												<div class="premium_rent_list_item col-12">
													<div class="card">
														<div class="row">
															  <div class="col-lg-3 align-self-center">
                                                        		<div class="card-img-actions p-3">
                                                        			<img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/resources/images/cars/Hyundai/santafe.png" alt="img" >
                                                        		</div>
                                                    		</div>
                                                    		<div class="col-lg-9 border-left">
                                                    			<div class="card-body">
                                                    				 <div class="row">
                                                    				 	 <div class="col-lg-6">
                                                                       		<p class="text-grey-600">
                                                                       			<i class="h3 icon-calendar pr-2 mb-0"> 대여/반납일</i>
                                                                  			</p>
                                                                       		<p class="font-weight-bold text-grey-600">
                                                                              	<fmt:formatDate value="${est.startDate}" pattern="yy년 MM월 dd일" /> ~ <fmt:formatDate value="${est.endDate}" pattern="yy년 MM월 dd일" /><br>
                                                                      		</p> 
                                                    				 	 </div>
                                                    				 	 <div class="col-lg-3">
                                                    				 	 <c:if test="${est.status eq '예약중' }">
                                                    				 		<button class="refundBtn" id="refundBtn" type="button" value="${est.merchantUid}">취소하기</button>
                                                                		 </c:if>
                                                                		 </div>
                                                    				 	 <div class="col-lg-3" style="padding-left: 40px;">
	                                                                		<c:if test="${est.review eq '2' }">
		                                                    					<button type="button" class="btn btn-sm" onclick="location.href='rent/view/writeReview'"
		                                                            					style="background: #4f5dec; color: #ffffff;  ">
		                                                        						후기수정
		                                                    					</button>
		                                                    			    </c:if>
		                                                    
		                                                    				<c:if test="${est.review ne '2' }">
		                                                    					<button type="button" class="btn btn-sm" onclick="location.href='rent/view/writeReview'"
		                                                            					style="background: #4f5dec; color: #ffffff;"<c:if test="${est.review eq '0' }"> disabled="disabled"</c:if>>
		                                                        						후기작성
		                                                    					</button>
	                                                    					</c:if>
                                                                		 </div>
                                                                		
                                                                		 <div class="col-12">
                                                                		 	<div class="card border-primary-300 border-1"  style="margin-bottom: 15px;">
                                                                		 		<div class="card-body">
                                                                		 			<div class="row align-items-center">
                                                                                		<div class="col-4">
                                                                                    		<i class="h3 icon-location4 pr-2 mb-0"></i> 수령장소 :
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0">  ${est.takePlaceBasic} ${est.takePlaceDetail}</span>
                                                                                		</div>
                                                                                		
                                                                		 				<div class="col-4">
                                                                                    		<i class="fa fa-car pr-2 mb-0"></i> 차량 :
                                                                               			</div>
                                                                               			<div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.carBrand } ${est.carModel }</span>
                                                                                		</div>
                                                                                		
                                                                                		<div class="col-4">
                                                                                    		<i class="fa fa-building pr-2 mb-0" ></i> 대여업체:
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.cmpnName }</span>
                                                                                		</div>
                                                                                		<div class="col-4">
                                                                                    		<i class="fa fa-phone pr-2 mb-0" ></i> 업체번호
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.cmpnTel }</span>
                                                                                		</div>
                                                                		 			</div>
                                                                		 		</div>
                                                                		 	</div>
                                                                		 	<div class="card border-primary-300 border-1">
                                                                		 		<div class="card-body">
                                                                		 			<div class="row align-items-center">
                                                                                		<div class="col-4">
                                                                                    		<i class="h3 icon-location4 pr-2 mb-0"></i> 결제금액 
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.price }원</span>
                                                                                		</div>
                                                                                		
                                                                		 				<div class="col-4">
                                                                                    		<i class="fa fa-credit-card pr-2 mb-0"></i> 결제방법 
                                                                               			</div>
                                                                               			<div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.payMethod }</span>
                                                                                		</div>
                                                                                		<div class="col-4">
                                                                                    		<i class="icon-checkmark4 pr-2 mb-0" ></i> 예약상태
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.status }</span>
                                                                                		</div>
                                                                                		<div class="col-4">
                                                                                    		<i class="icon-checkmark4 pr-2 mb-0" ></i> 예약번호
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.merchantUid }</span>
                                                                                		</div>
                                                                                		
                                                                		 			</div>
                                                                		 		</div>
                                                                		 	</div>
                                                                		 </div>
                                                    				 </div><!-- row -->
                                                    			</div>
                                                    		</div>
														</div>
													</div>
												</div>									 	 	 
									 	 	 </c:forEach>
									 	 </div>
									 </div>
								 </div>
                                <!-- 렌트내역상세 -->
                                <div class="col-md-12">	
                           	      	<div class="card-body">
					           			<div class="row">
						                    <c:if test="${empty historyList}">
						                        <div class="col-12 text-center">
						                            <h6 class="py-5">아직 랜트 내역이 없습니다!<br>여행갈카 렌트 서비스를 이용해 여행을 떠나보세요! </h6>
						                        </div>
						                    </c:if>
						                </div>
					            	</div>
                                    <div class="pager_wrapper prs_blog_pagi_wrapper">
                                        <ul class="pagination">
                                         <c:if test="${not empty historyList}">
                                            <li>
                                                <a class="page-arrow" href="?pageNum=${page.startPage-1}&amount=${page.cri.amount}" <c:if test="${!page.prev }">style="display: none"</c:if>><i class="flaticon-left-arrow"></i></a>
                                            </li>
                                            <c:forEach begin="${page.startPage }" end="${page.endPage }" var="num">
                                                <li class="btc_shop_pagi">
                                                    <a href="?pageNum=${num }&amount=${page.cri.amount}"
                                                       <c:if test="${param.getOrDefault('pageNum',1) == num}">class="active"</c:if>
                                                    >${num }</a>
                                                </li>
                                            </c:forEach>
                                            <li>
                                                <a class="page-arrow" href="?pageNum=${page.endPage+1}&amount=${page.cri.amount}" <c:if test="${!page.next }">style="display: none"</c:if>><i class="flaticon-right-arrow"></i></a>
                                            </li>
                                        </c:if>
                                        </ul>
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
                            <div class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">
                                <div>
                                    <br><br>
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
                                                        property="principal.name" />님</a>
                                                <input type="hidden" name="${_csrf.parameterName }"
                                                       value="${_csrf.token }">
                                            </sec:authorize>
                                        </h3>
                                    </div>
                                </div>
                                <div class="jp_rightside_job_categories_content">
                                    <ul>
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
                                <div >
                                    <br><br>
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
            </div> <!-- side_bar -->
        </div>
    </div>
</div>
 			

<!-- x blog main and sidebar Wrapper End -->
<script>
//forEach 돌리고 id로 불러오면 첫번째 버튼만 활성화 되기 때문에 class로 불러온다.
$('.refundBtn').on('click', function(e){
	e.preventDefault();
	if(confirm('예약을 취소하시겠습니까?')){
		let uid = $(this).val();
		
		$.ajax({
			url: '../refund/' + uid,
			type: 'post',
			data: { uid : uid },
			dataType: 'text',
			success: function(){
				alert('예약이 취소되었습니다.');
			}
		}).done(function(data, textStatus, xhr) { // 결제취소 성공 시 db에 update 처리
			// console.log(xhr);
			$.ajax({
				url: 'paymentCancel/' + uid,
				type: 'put',
				dataType: 'text',
				success: function(){},
				error: function(){}
			});				
		}).fail(function(xhr, status, message) {
			alert('status: ' + status + ' er: ' + message);
		});
	} else {
		return false;
	}
});
$
</script>
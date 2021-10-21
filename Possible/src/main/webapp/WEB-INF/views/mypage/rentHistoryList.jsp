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
<style>
.nav-tabs-bottom .nav-link::after {
		position: absolute; content:""; 
		display: block; 
		border-bottom: 2px solid #1E88E5; 
		transition: width 350ms ease-in-out; 
		left: auto; width: auto;} 
.nav-tabs-bottom .nav-link:hover::after {width: 100%;  left: 0; } 

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
</style>
<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title">
                        <h1 class="font-weight-bold">마이페이지</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- x blog main and sidebar Wrapper Start -->
<div class="x_blog_sidebar_main_wrapper float_left padding_tb_100">
    <div class="container">
        <div class="row">
         <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
            <div class="x_blog_right_side_wrapper float_left">
               <div class="row">
				<%-- <sec:authentication property=""/> --%>
                  <div class="col-md-12">
					<div class="card card-body text-center">
						<a href="#" class="d-inline-block mb-3" style="margin-top: 20px;">
							<img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="rounded-round" width="150" height="150" alt="">
						</a>
						<div class="card-header bg-transparent h2">
							<sec:authorize access="isAuthenticated()">
								<a class="menu-button" href="${pageContext.request.contextPath}/mypage/dashboard"><sec:authentication
								   property="principal.name" />님</a>
								<input type="hidden" name="${_csrf.parameterName }"
									   value="${_csrf.token }">
							</sec:authorize>
						</div>
						<div class="card-header h5" style="padding-top: 10px;padding-bottom: 10px;padding-right: 10px;padding-left: 10px;">
							<ul class="nav nav-sidebar" data-nav-type="accordion">
                            	<c:if test="${member.author eq 'ROLE_USER'}">
                              		<li class="nav-item"><i class="fa fa-building pr-2 mb-0" ></i><a
                                 		href="${pageContext.request.contextPath}/mypage/chngRole">업체 전환 신청하기 </a></li>
							  	</c:if>
							  	<c:if test="${member.author eq 'ROLE_COMPANY'}">
                              		<li class="nav-item"><i class="fa fa-building pr-2 mb-0" ></i><a
                                 		href="${pageContext.request.contextPath}/company/dashboard">업체페이지로 이동 </a></li>
							  	</c:if>
                           	</ul>
                       </div>
					</div>
                  </div>
                  <div class="col-md-12">
				  	<div class="card mb-2">
						<div class="card-header bg-transparent header-elements-inline">
							<span class="text-uppercase font-size-sm font-weight-semibold">메뉴</span>
							<div class="header-elements">
								<div class="list-icons">
			                		<a class="list-icons-item" data-action="collapse"></a>
		                		</div>
	                		</div>
						</div>
						<div class="card-body p-0">
							<ul class="nav nav-sidebar nav-tabs-vertical" data-nav-type="accordion">
								<li class="nav-item h5">
									<a href="${pageContext.request.contextPath}/mypage/editProfile" class="nav-link text-grey-700 h6"><i class="icon-googleplus5"></i>회원정보 수정</a>
								</li>
								<li class="nav-item">
									<a href="${pageContext.request.contextPath}/mypage/estimate" class="nav-link text-grey-700 h6"><i class="icon-portfolio"></i>견적관리</a>
								</li>
								<li class="nav-item">
									<a href="${pageContext.request.contextPath}/mypage/rent" class="nav-link text-grey-700 h6"><i class="icon-compose"></i>렌트관리</a>
								</li>
								<li class="nav-item">
									<a href="${pageContext.request.contextPath}/mypage/community" class="nav-link text-grey-700 h6"><i class="icon-collaboration"></i>커뮤니티 관리</a>
								</li>
								<li class="nav-item">
									<a href="${pageContext.request.contextPath}/mypage/qna" class="nav-link text-grey-700 h6"><i class="icon-files-empty"></i>나의 문의</a>
								</li>
							</ul>
						</div>
					</div>
                  </div>
                  <div class="col-md-12">
                  	<div class="card card-body text-center">
						<div class="mb-3">
							<h3 class="font-weight-semibold mb-0 mt-1">고객센터</h3>
						</div>
						<a class="d-inline-block mb-3" >
							<img src="${pageContext.request.contextPath}/resources/images/cs_icon_b2.png" class="rounded-round" width="150" height="150" alt="">
						</a>
						<div class="mb-3">
							<h4 class="font-weight-semibold mb-0 mt-1">고객센터 이용안내</h4>
							<h2 class="d-block text-muted"><strong>1544-2460</strong></h2>
							<span class="d-block text-muted">평일 09:00~17:50</span>
							<span class="d-block text-muted">(점심 12:30~13:40)</span>
						</div>	
						<button class="btn btn-block btn-primary"type="button" id="custom-button">1:1 상담하러 가기</button>
					</div>
                  </div>
                  <div class="col-md-12">
                  </div>
               </div>
            </div>
         </div> <!-- 사이드바 종료 -->
        
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="x_blog_left_side_wrapper float_left">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="lr_bc_first_box_main_wrapper">
                               <!-- 메뉴 -->
		                       
								<div class="col-md-12">
									<div class="dash" style="margin-bottom: 20px; padding-bottom: 10px;">
										<div class="blog_single_comment_heading">
											<h4 style="font-weight: 600; padding-left: 20px;">나의 렌트내역</h4>
										</div>
									</div>
								</div>
								
								 <div class="col-12">
									 <div class="x_car_book_tabs_content_main_wrapper my-4" style="margin-top: 0px !important">
									 	<div class="row">
									 	 	 <c:forEach var="est" items="${historyList}" varStatus="status">
												<div class="premium_rent_list_item col-12">
													<div class="card">
														<div class="row">
															  <div class="col-lg-3 align-self-center">
                                                        		<div class="card-img-actions p-3">
                                                        			<img class="card-img-top img-fluid" src="${pageContext.request.contextPath}${est.carVO.modelCodeVO.img}" alt="img" >
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
	                                                                		<c:if test="${est.review eq '2' }"><!-- /rent/view/updateReview -->
                                                                		 <c:forEach var="review" items="${reviewList}" varStatus="status">
		                                                    					<a  class="btn btn-sm" 
		                                                    						href="rent/view/updateReview?seq=${review.seq}"
		                                                            					style="background: #4f5dec; color: #ffffff; ">
		                                                        						후기수정
		                                                    					</a>
		                                                    					
		                                                    				</c:forEach>
		                                                    			    </c:if>
		                                                    				
		                                                    				
		                                                    				<c:if test="${est.review ne '2' }">
		                                                    					<a class="btn btn-sm" 
		                                                    					   href="rent/view/writeReview?seq=${est.seq}"
		                                                            					style="background: #4f5dec; color: #ffffff;"<c:if test="${est.review eq '0' }"> disabled="disabled"</c:if>>
		                                                        						후기작성
		                                                    					</a>
	                                                    					</c:if>
		                    
                                                                		 </div>
                                                                		
                                                                		 <div class="col-12">
                                                                		 	<div class="card border-primary-300 border-1"  style="margin-bottom: 15px;">
                                                                		 		<div class="card-body">
                                                                		 			<div class="row align-items-center">
                                                                                		<div class="col-4">
                                                                                    		<i class="icon-location4 pr-2 mb-0"></i> 수령장소 :
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0">  ${est.takePlaceBasic} ${est.takePlaceDetail}</span>
                                                                                		</div>
                                                                                		
                                                                		 				<div class="col-4">
                                                                                    		<i class="fa fa-car pr-2 mb-0"></i> 차량 :
                                                                               			</div>
                                                                               			<div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0">  ${est.carVO.brandCodeVO.name } ${est.carVO.modelCodeVO.name }</span>
                                                                                		</div>
                                                                                		
                                                                                		<div class="col-4">
                                                                                    		<i class="fa fa-building pr-2 mb-0" ></i> 대여업체:
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.companyVO.name} </span>
                                                                                		</div>
                                                                                		<div class="col-4">
                                                                                    		<i class="fa fa-phone pr-2 mb-0" ></i> 업체전화번호
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> ${est.companyVO.tel }</span>
                                                                                		</div>
                                                                		 			</div>
                                                                		 		</div>
                                                                		 	</div>
                                                                		 	<div class="card border-primary-300 border-1">
                                                                		 		<div class="card-body">
                                                                		 			<div class="row align-items-center">
                                                                                		<div class="col-4">
                                                                                    		<i class="icon-location4 pr-2 mb-0"></i> 결제금액 
                                                                               			</div>
                                                                               			 <div class="col-8" style="padding-left: 0px">
                                                                                    		<span class="list-unstyled mb-0"> <fmt:formatNumber value="${est.price }" pattern="#,###"/>원</span>
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
                                            <c:if test="${historyList.size() > 5}">
				    							<jsp:include page="/pagination"/>
				   							</c:if>
									 	 </div>
									 </div>
								 </div>
                                <!-- 렌트내역상세 -->
                                <div class="col-md-12">
									<div class="card">
							    	<c:if test="${empty historyList}">
							    		<div class="card-header border-bottom mb-3">
							        		<div class="x_slider_form_input_wrapper float_left">
							            		<h3 class="font-weight-bold mb-0">렌트 내역</h3>
							        		</div>
							    		</div>
								        <div class="card-body">
								            <div class="row">
								               <div class="col-12 text-center">
							                   	<h6 class="py-5">아직 랜트 내역이 없습니다!<br>여행갈카 렌트 서비스를 이용해 여행을 떠나보세요! </h6>
							                   </div>
								            </div>
								        </div>
							    	</c:if>
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
<!-- Channel Plugin Scripts -->
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "cca89d8e-722c-46c6-a330-10097ad5cd70",
    "customLauncherSelector": "#custom-button"
  });


</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
.nav-tabs-bottom .nav-link::after {
		position: absolute; content:""; 
		display: block; 
		border-bottom: 2px solid #1E88E5; 
		transition: width 350ms ease-in-out; 
		left: auto; width: auto;} 
.nav-tabs-bottom .nav-link:hover::after {width: 100%;  left: 0; } 

}

.btc_team_bot_cont_main_wrapper {
    box-shadow: 0px 0 8px rgba(0, 0, 0, 0.1);
    float: left;
    width: 100%;
    margin-top: 30px;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
}
.btc_team_img_bot_wrapper {
    float: left;
    width: 100%;
    position: relative;

}
.btc_team_img_bot_wrapper img {
    width: 100%;
    -webkit-border-top-left-radius: 5px;
    -moz-border-top-left-radius: 5px;
    border-top-left-radius: 5px;
    -webkit-border-top-right-radius: 5px;
    -moz-border-top-right-radius: 5px;
    border-top-right-radius: 5px;
}
.btc_team_img_bot_cont_wrapper {
    float: left;
    width: 100%;
    background: #ffffff;
    text-align: center;
    padding-top: 30px;
    padding-bottom: 30px;
    z-index: 1;
    position: relative;
    -webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
    -webkit-border-bottom-left-radius: 10px;
    -moz-border-bottom-left-radius: 10px;
    border-bottom-left-radius: 10px;
    -webkit-border-bottom-right-radius: 10px;
    -moz-border-bottom-right-radius: 10px;
    border-bottom-right-radius: 10px;
}
.btc_team_img_bot_cont_wrapper h4 {
    font-size: 16px;
    font-weight: 800;
    padding-bottom: 5px;
    text-transform: uppercase;
}
.btc_team_img_bot_cont_wrapper p {
    color: #4f5dec;
    -webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
}
.btc_team_img_bot_cont_wrapper h4 a {
    color: #000000;
    -webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
}
.btc_team_social_tb_wrapper {
    float: left;
    width: 80%;
    left: 0;
    right: 0;
    margin: 0px auto;
    background: #4f5dec;
    position: absolute;
    bottom: -50px;
    padding-top: 15px;
    -webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
    text-align: center;
    -webkit-border-top-left-radius: 5px;
    -moz-border-top-left-radius: 5px;
    border-top-left-radius: 5px;
    -webkit-border-top-right-radius: 5px;
    -moz-border-top-right-radius: 5px;
    border-top-right-radius: 5px;
}
.btc_team_social_tb_wrapper h5 {
    font-size: 10px;
    text-transform: uppercase;
    color: #ffffff;
    font-weight: 800;
}
.btc_team_bot_cont_main_wrapper:hover .btc_team_social_tb_wrapper {
    bottom: 0;
    -webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
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
								<div class="col-md-12">
									<div class="dash"style="margin-bottom: 20px; padding-bottom: 10px;">
										<div class="blog_single_comment_heading">
											<h4 style="font-weight: 600; padding-left: 20px;">
												나의 이용후기
											</h4>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="x_car_book_tabs_content_main_wrapper my-2"
										style="margin-top: 0px !important">
										<div class="row">
											<c:forEach var="reviewList" items="${reviewList}" end="0"
												varStatus="status">
												<div class="premium_rent_list_item col-12">
													<div class="card">
														<div class="row">
															
															<div class="col-lg-12">
																<div class="card-body">
																	<div class="row">
																		<div class="col-lg-6">
																			<p class="text-grey-600">
																				제목:${reviewList.title }
																			</p>
																		</div>
																		<div class="col-lg-3">
																		</div>
																		<div class="col-lg-3" style="padding-left: 40px;">
																			<c:if test="${reviewList.score eq '5'}">
																				<span class="float-right main-score-bg"><span class="main-score" style="width:100%"></span></span>
																			</c:if>
																			
																			<c:if test="${reviewList.score eq '4'}">
																				<span class="float-right main-score-bg"><span class="main-score" style="width:80%"></span></span>
																			</c:if>
																			
																			<c:if test="${reviewList.score eq '3'}">
																				<span class="float-right main-score-bg"><span class="main-score" style="width:60%"></span></span>
																			</c:if>
																			<c:if test="${reviewList.score eq '2'}">
																				<span class="float-right main-score-bg"><span class="main-score" style="width:40%"></span></span>
																			</c:if>
																			<c:if test="${reviewList.score eq '1'}">
																				<span class="float-right main-score-bg"><span class="main-score" style="width:20%"></span></span>
																			</c:if>
																			<p class="text-grey-600">
																				별점:
																			</p>
																		</div>
																		
																		<div class="col-12">
																			<div class="card border-primary-300 border-1"
																				style="margin-bottom: 15px;">
																				<div class="card-body">
																					<div class="row align-items-center">
																						<div class="col-4">
																							<i class="icon-checkmark4 pr-2 mb-0"></i> 내용 :
																						</div>
																						<div class="col-8" style="padding-left: 0px">
																							<span class="list-unstyled mb-0">
																								${reviewList.content }
																								</span>
																						</div>
																					</div>
																				</div>
																			</div>
																			
																		</div>
																	</div>
																	<!-- row -->
																</div>
															</div>

														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								
								<div class="col-md-12">
									<div class="card">
										<c:if test="${empty reviewList}">
										<!-- <div class="card-header border-bottom mb-3">
							        		<div class="x_slider_form_input_wrapper float_left">
							            		<h3 class="font-weight-bold mb-0">여행 리스트</h3>
							        		</div>
							    		</div> -->
											<div class="card-body">
												<div class="row">
													<div class="col-12 text-center">
														<h6 class="py-5">아직 등록한 리뷰가 없습니다!</h6>
													</div>
												</div>
											</div>
										</c:if>
									</div>
								</div>
								<div class="col-md-12">
									<div class="dash" style="margin-bottom: 20px; padding-bottom: 10px;">
										<div class="blog_single_comment_heading">
											<h4 style="font-weight: 600; padding-left: 20px;">나의 여행코스</h4>
										</div>
									</div>
									<%-- <div class="blog_single_comment_heading">
										<h4>
											<a href="${pageContext.request.contextPath}/mypage/community">나의 여행코스</a>
										</h4>
									</div> --%>
									<div class="row">
										<c:forEach var="myCourse" items="${myCourse}">
											<div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12" style="margin-bottom: 15px;">
												<div class="btc_team_bot_cont_main_wrapper">
													<div class="btc_team_img_bot_wrapper">
														<c:if test="${myCourse.firstImage ne null }">
															<img src="${myCourse.firstImage}" style="height: 120px;"
																alt="Course">
															</c:if>
															<c:if test="${myCourse.firstImage eq null }">
															<img src="${pageContext.request.contextPath}/resources/images/no_image.jpg" style="height: 120px;" alt="Course">
															</c:if>
														<div class="btc_team_social_tb_wrapper">
															<h5>
																<fmt:formatDate value="${myCourse.startDate }"
																	pattern="yyyy-MM-dd" />
																~
																<fmt:formatDate value="${myCourse.endDate }"
																	pattern="yyyy-MM-dd" />
															</h5>
														</div>
													</div>
													<div class="btc_team_img_bot_cont_wrapper" style="height :100px" >
														<h4>
															<a
																href="${pageContext.request.contextPath}/community/course/view?seq=${myCourse.seq}">${myCourse.title }</a>
														</h4>
													</div>
												</div>
											</div>
										</c:forEach>
										
										<div class="col-md-12">
											<div class="card">
												<c:if test="${empty myCourse}">
												<!-- <div class="card-header border-bottom mb-3">
									        		<div class="x_slider_form_input_wrapper float_left">
									            		<h3 class="font-weight-bold mb-0">여행 리스트</h3>
									        		</div>
									    		</div> -->
													<div class="card-body">
														<div class="row">
															<div class="col-12 text-center">
																<h6 class="py-5">아직 등록한 여행코스가 없습니다!</h6>
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
	</div>
</div>
<script>
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
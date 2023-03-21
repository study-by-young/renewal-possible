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
												나의 1:1 문의
											</h4>
										</div>
									</div>
								</div>
								
								<!-- 나의문의 -->
								<div class="col-md-12">
									<div class="dash">
										<!-- <div class="blog_single_comment_heading">
											<h4 style="font-weight: 600; padding-left: 20px;">나의 1:1 문의 </h4>
										</div> -->
										<table class="table table-hover">
											<thead>
												<tr>
													<th class="col-8" style="text-align: center;">제목</th>
													<th class="col-2" style="text-align: center;">작성일</th>
													<th class="col-2" style="text-align: center;">답변상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="myQna" items="${myQna}">
													<tr>
														<td><a href="${pageContext.request.contextPath}/qna/get?seq=${myQna.seq }">${myQna.title}</a></td>
														<td style="text-align: center;"><fmt:formatDate pattern="yy-MM-dd" value="${myQna.genDate }" /></td>
														<c:choose>
															<c:when test="${myQna.answerCnt>='1'}">
																<td style="color: blue; text-align: center;">답변완료</td>
															</c:when>
															<c:otherwise>
																<td style="color: red; text-align: center;">답변대기</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</tbody>
										</table>
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
  
<!-- x blog main and sidebar Wrapper End -->
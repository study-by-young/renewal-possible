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

								<!-- 나의문의 -->
								<div class="col-md-12">
									<div class="blog_single_comment_heading">
										<h4>
											나의 문의
										</h4>
									</div>
									<div class="dash">
										<table class="table table-hover">
											<thead>
												<tr>
													<th align="center">제목</th>
													<th>작성일</th>
													<th>답변상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="myQna" items="${myQna}">
													<tr>
														<td><a href="${pageContext.request.contextPath}/qna/get?seq=${myQna.seq }">${myQna.title}</a></td>
														<td><fmt:formatDate pattern="yyyy/MM/dd"
																value="${myQna.genDate }" /></td>
														<c:choose>
															<c:when test="${myQna.answerCnt>='1'}">
																<td style="color: blue">답변완료</td>
															</c:when>
															<c:otherwise>
																<td style="color: red">답변대기</td>
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

			<!-- 사이드바 -->
			<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
				<div class="x_blog_right_side_wrapper float_left">
					<div class="row">

						<div class="col-md-12">
							<div
								class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">
								
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
			</div>
		</div>
	</div>
</div>
  
<!-- x blog main and sidebar Wrapper End -->
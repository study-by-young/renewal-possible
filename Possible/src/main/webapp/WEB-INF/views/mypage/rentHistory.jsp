<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
		                              <li><a href="${pageContext.request.contextPath}/mypage/editInfo">회원정보수정</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/eslist">견적관리</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/rentHistory">렌트관리</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/community">커뮤니티관리</a></li>
		                              <li><a href="${pageContext.request.contextPath}/mypage/qna">나의문의</a></li>
 									</ul>
								</div>
								<br> <br> <br>

								<!-- 렌트내역 -->
								<div class="col-md-12">
									<div class="blog_single_comment_heading">
										<h4>렌트내역</h4>
									</div>
									<div class="dash">
										<div class="row no-gutters">
											<div class="col-4">
												<img
													src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
													width="210px" height="160" alt="" class="card-img" />
											</div>
											<!-- 버튼 (일단 취소, 후기 둘다 보임)-->
											<div class="col-8">
												<div class="col-12" style="border-bottom: none solid black">
													<div class="card-body">
														<div style="float: right;">
															<div style="float: right;">
																<button type="button" class="btn" onClick="alert('취소하시겠습니까?')"
																	style="text-align: center; background: #4f5dec; color: #ffffff; border: 1px solid transparent;">
																	취소
																</button>
																<button type="button" class="btn" onclick="location.href='review'"
																	style="text-align: center; background: #4f5dec; color: #ffffff; border: 1px solid transparent;">
																	후기작성
																</button>
															</div>
															
														</div>
													</div>
													<br>
													<!-- 렌트내역 누르면 모달창 -->
														<div class="container mt-3">
													<!-- Button to Open the Modal -->
													<a data-toggle="modal" href="#myModal">렌트내역</a>


													<!-- The Modal -->
													<div class="modal fade" id="myModal">
														<div class="modal-dialog">
															<div class="modal-content">

																<!-- Modal Header -->
																<div class="modal-header">
																	<h4 class="modal-title">렌트내역조회</h4>
																	<button type="button" class="close"
																		data-dismiss="modal">×</button>
																</div>

																<!-- Modal body -->
																<div class="modal-body">
																		<table class="table">
																				<tr>
																					<td>모델</td>
																					<td>Doe</td>
																				</tr>
																				<tr>
																					<td>기간</td>
																					<td>Moe</td>
																				</tr>
																				<tr>
																					<td>지역</td>
																					<td>등등</td>
																				</tr>
																		</table>
																	</div>

																<!-- Modal footer -->
																<div class="modal-footer">
																	<button type="button" class="btn btn-danger"
																		data-dismiss="modal">Close</button>
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
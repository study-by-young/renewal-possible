<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Xpedia</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="description" content="Xpedia" />
<meta name="keywords" content="Xpedia" />
<meta name="author" content="" />
<meta name="MobileOptimized" content="320" />
<!--Template style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/xpedia.css" />
<!--favicon-->
<link rel="shortcut icon" type="image/png" href="images/fevicon.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
	integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

	<div class="x_inner_team_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div
						class="x_offer_car_heading_wrapper x_offer_car_tb_heading_wrapper float_left">
						<h3>
							<span class="badge badge-pill badge-primary">코스 갯수</span> 글 제목
						</h3>
						<p>위치&nbsp;&nbsp; | &nbsp;&nbsp;코스 총 거리 : 000km</p>
					</div>
					<div>
						<span style="margin-right: 30px"><i class="far fa-heart">&nbsp;10개</i></span><span
							style="margin-right: 30px"><i class="fas fa-share-alt">&nbsp;10회</i></span>
						<span style="float: right;"><i class="far fa-eye">&nbsp;100회</i></span>
					</div>
					<hr>
					<div>
						안면도여행 당일 코스로 즐기기<br>
						해안가로 드라이브 여행<br>
						낙조와 힐링을 느껴보세요<br>
					</div>
					<div
						style="margin-top: 30px; padding: 20px; background-color: lightgray;">
						<!-- xs offer car tabs Start -->
						<div class="row">
							<div class="col-md-12">
								<div class="x_ln_car_heading_wrapper float_left">
									<h3>Tour Course</h3>
								</div>
							</div>
							<div class="col-md-12">
								<div class="btc_ln_slider_wrapper">
									<div class="owl-carousel owl-theme">
										<div class="item">
											<div class="btc_team_slider_cont_main_wrapper">
												<div class="btc_team_img_wrapper">
													<img
														src="${pageContext.request.contextPath}/resources/images/team1.jpg"
														alt="team_img1">
													<div class="btc_team_social_wrapper">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a>
															</li>
														</ul>
													</div>
												</div>
												<div class="btc_team_img_cont_wrapper">
													<h4>
														<a href="#">Ajay Suryavanshi</a>
													</h4>
													<p>(Consultant)</p>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="btc_team_slider_cont_main_wrapper">
												<div class="btc_team_img_wrapper">
													<img
														src="${pageContext.request.contextPath}/resources/images/team2.jpg"
														alt="team_img1">
													<div class="btc_team_social_wrapper">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a>
															</li>
														</ul>
													</div>
												</div>
												<div class="btc_team_img_cont_wrapper">
													<h4>
														<a href="#">Ajay Suryavanshi</a>
													</h4>
													<p>(Consultant)</p>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="btc_team_slider_cont_main_wrapper">
												<div class="btc_team_img_wrapper">
													<img
														src="${pageContext.request.contextPath}/resources/images/team3.jpg"
														alt="team_img1">
													<div class="btc_team_social_wrapper">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"></i></a></li>
															<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
															<li><a href="#"><i class="fa fa-google-plus"></i></a>
															</li>
														</ul>
													</div>
												</div>
												<div class="btc_team_img_cont_wrapper">
													<h4>
														<a href="#">Ajay Suryavanshi</a>
													</h4>
													<p>(Consultant)</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--js Start-->
						<!-- x booking Wrapper Start -->
						<div
							style="margin-top: 30px; padding: 20px; background-color: white; border: 1px solid blue; border-radius: 10px;">
							<div class="row">
								<div class="col-md-12">
									<div>
										<h4>장소 이름</h4>
										<p>주소 어쩌구 저쩌구</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12"></div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/modernizr.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.menu-aim.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/own-menu.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countTo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.inview.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/xpedia.js"></script>
	<!-- custom js-->
</body>

</html>
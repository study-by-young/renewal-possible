<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
Template Name: Xpedia
Version: 1.0.0

-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zxx">
<!--[endif]-->

<head>
<meta charset="utf-8" />
<title>공지사항 등록</title>
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
</head>

<body>
	<div class="x_contact_title_main_wrapper float_left padding_tb_100">
		<div class="container">
			<form id="insertForm" role="form" action="${pageContext.request.contextPath}/notice/insert" method="post">
				<div class="row">
					<div class="col-md-12">
						<div
							class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
							<h3>공지사항 등록</h3>
						</div>
					</div>

					<div
						class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="contect_form1">
							<input type="text" name="title" placeholder="Title *">
						</div>
					</div>
					<div
						class="col-xl-5 offset-xl-1 col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="contect_form2">
							<input type="text" name="writer" placeholder="Writer" value="admin" readonly="readonly">
						</div>
					</div>
					<div
						class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="contect_form4">
							<textarea rows="5" name="content" placeholder="내용을 입력해주세요."></textarea>
						</div>
					</div>
					<div class="lr_bc_first_box_img_cont_wrapper" align="right">
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="reset" class="btn btn-dark">취소</button>
						<button type="button" class="btn btn-dark"
							onclick="location.href='list'">목록</button>
					</div>
				</div>
			</form>
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

</body>

</html>
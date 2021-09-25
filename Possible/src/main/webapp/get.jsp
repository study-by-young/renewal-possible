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
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/fevicon.png" />
</head>

<body>
<div class="container">
	<div class="lr_bc_first_box_img_cont_wrapper">
		<h2>공지사항항항</h2>
		<ul>
			<li><i class="fa fa-calendar"></i>&nbsp; <a>관리자</a></li>
			<li><i class="fa fa-user-o"></i>&nbsp; <a>15.10.20</a></li>
			<li><i class="fa fa-comments-o"></i>&nbsp; <a>222</a></li>
		</ul>
		<p>
			What's your favorite game? Nam a diam tincidunt, condimentum nisi et,
			fringilla lectus. Nullam nec lectus eu erat temus pulvinar. Lorem
			ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
			tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
			veniam, quis nostrud exercitation. Lorem ipsum dolor sit amet,
			consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
			labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			citation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br>
			<br>What's your favorite game? Nam a diam tincidunt, condimentum
			nisi et, fringilla lectus. Nullam nec lectus eu erat temus pulvinar.
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
			eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
			ad minim veniam, quis nostrud exercitation. Lorem ipsum dolor sit
			amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
			ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
			nostrud citation ullamco laboris nisi ut aliquip ex ea commodo
			consequat.
		</p>
	</div>
	<div class="lr_bc_first_box_img_cont_wrapper" align="right">
		<button type="button" class="btn btn-primary" onclick="location.href='list'">목록</button>
		<button type="button" class="btn btn-dark" onclick="location.href='update?bno=${board.bno}'">수정</button>
		<button type="button" class="btn btn-dark" onclick="location.href='delete?bno=${board.bno}'">삭제</button>
	</div>
</div>
</body>
</html>
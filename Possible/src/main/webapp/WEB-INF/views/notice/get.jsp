<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<h2>${notice.title}</h2>
		<ul>
			<li><i class="fa fa-calendar"></i>&nbsp; <a>${notice.writer}</a></li>
			<li><i class="fa fa-user-o"></i>&nbsp; <a>${notice.genDate}</a></li>
			<li><i class="fa fa-comments-o"></i>&nbsp; <a>${notice.views}</a></li>
		</ul>
		<p>
			${notice.content}
		</p>
	</div>
	<div class="lr_bc_first_box_img_cont_wrapper" align="right">
		<button type="button" class="btn btn-primary" onclick="location.href='list'">목록</button>
		<button type="button" class="btn btn-dark" onclick="location.href='update?bno=${notice.seq}'">수정</button>
		<button type="button" class="btn btn-dark" onclick="location.href='delete?bno=${notice.seq}'">삭제</button>
	</div>
</div>
<br>
</body>
</html>
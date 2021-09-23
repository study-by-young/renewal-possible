<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:insertAttribute name="header"></tiles:insertAttribute>
<tiles:insertAttribute name="content"></tiles:insertAttribute>

<head>
<title>layout.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="description" content="Xpedia" />
<meta name="keywords" content="Xpedia" />
<meta name="author" content="" />
<meta name="MobileOptimized" content="320" />
<!--Template style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/xpedia.css" />
<!--favicon-->
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/resources/images/fevicon.png" />


</head>
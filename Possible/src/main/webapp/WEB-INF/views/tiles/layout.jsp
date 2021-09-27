<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>여행갈카</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.menu-aim.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>

    <!-- common -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.inview.min.js"></script>

    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap_limitless.min.css" >
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

    <!-- fonts -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fonts.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/flaticon.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Material+Icons"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/icons/icomoon/styles.min.css"/>

    <!-- select 2 js -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/select2.min.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>

    <!-- nice-select js -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/nice-select.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>

    <!-- owl carousel js -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>

    <!-- magnific-popup js -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.js"></script>

    <!-- bxslider -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>

    <!-- custom css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/responsive.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/colors.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/components.min.css">

    <!-- custom js -->
<%--    <script src="${pageContext.request.contextPath}/resources/js/own-menu.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/js/xpedia.js"></script>
</head>
<body>
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
    <tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
    <tiles:insertAttribute name="content"></tiles:insertAttribute>
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>

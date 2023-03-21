<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-24
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>여행갈카 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- common -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css"/>

    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap_limitless.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/colors.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/components.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.min.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

    <!-- custom css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/icons/icomoon/styles.min.css"/>

    <!-- custom js -->
    <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

    <!-- plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/ui/headroom.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fonts.css"/>
	
</head>
<body>

<tiles:insertAttribute name="header"></tiles:insertAttribute>
<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
<tiles:insertAttribute name="content"></tiles:insertAttribute>
<tiles:insertAttribute name="footer"></tiles:insertAttribute>

</body>
</html>

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


    <link href="${pageContext.request.contextPath}/resources/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/admin.bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/layout.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/components.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/colors.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/fonts.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/owl.carousel.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/owl.theme.default.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/app.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet" type="text/css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f27bcc6bda802ee242aa34341608b2c6&libraries=services,clusterer,drawing"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/loaders/blockui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/ui/ripple.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/editors/ckeditor/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/ui/headroom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/forms/selects/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/ui/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/picker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/pickers/pickadate/picker.date.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/forms/styling/uniform.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/forms/styling/switchery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/forms/styling/switch.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/notifications/bootbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/forms/validation/validate.min.js"></script>

    <!-- Modules Load -->
    <script src="${pageContext.request.contextPath}/resources/js/modules/fix_hidable_navbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modules/form_select2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modules/date_picker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modules/form_checkbox.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modules/components_modal.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modules/form_vaildation.js"></script>
</head>
<body class="navbar-top " style="padding-top: 7.60003rem;overflow-x:hidden">

<tiles:insertAttribute name="header"></tiles:insertAttribute>
<tiles:insertAttribute name="content"></tiles:insertAttribute>
<tiles:insertAttribute name="footer"></tiles:insertAttribute>

</body>
</html>

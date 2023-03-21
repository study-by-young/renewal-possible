<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Global stylesheets -->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/fonts.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/admin.bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/layout.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/components.min.css" rel="stylesheet" type="text/css">
<link href="assets/css/colors.min.css" rel="stylesheet" type="text/css">
<!-- /global stylesheets -->

<!-- Content area -->
<div class="content d-flex justify-content-center align-items-center">
    <!-- Container -->
    <div class="container flex-fill">
        <!-- Error title -->
        <div class="text-center mb-3">
            <h1 class="error-title">500</h1>
            <h5>내부 서버에 오류가 발생했습니다. 시스템 관리자에게 문의하시기 바랍니다.</h5>
        </div>
        <!-- /error title -->


        <!-- Error content -->
        <div class="row">
            <div class="col-xl-4 offset-xl-4 col-md-8 offset-md-2">
                <!-- Buttons -->
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-block"><i class="icon-home4 mr-2"></i> 메인으로</a>
                    </div>
                    <div class="col-sm-6">
                        <a href="#" class="btn btn-primary btn-block" onclick="history.back();"><i class="icon-home4 mr-2"></i> 뒤로</a>
                    </div>
                </div>
                <!-- /buttons -->
            </div>
        </div>
        <!-- /error wrapper -->
    </div>
    <!-- /container -->
</div>
<!-- /content area -->

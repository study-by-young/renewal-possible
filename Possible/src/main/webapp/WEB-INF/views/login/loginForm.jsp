<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용</title>
<style>

</style>
</head>
<body>
	<div class="x_partner_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="x_offer_car_heading_wrapper float_left">
						<h2><c:out value="${error }"/></h2>
						<h2><c:out value="${logout }"/></h2>
						
						<h3>여행갈카 로그인</h3>
					</div>
				</div>
			</div>
			<div class="row">
                    <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-12 col-sm-12 col-12">
                        <!-- login_wrapper -->

                        <div class="login_wrapper">
                          <form id="frm" name="frm" action="login" method="post">
                            <div class="formsix-pos">
                                <div class="form-group i-email">
                                    <input type="text" class="form-control"  id="username" name="username" placeholder="Username*" required="">
                                </div>
                            </div>
                            <div class="formsix-e">
                                <div class="form-group i-password">
                                    <input type="password" class="form-control"  id="password" name="password" placeholder="Password *" required="">
                                </div>
                            </div>
                            <div class="login_remember_box">
                                <label class="control control--checkbox">Remember me
                                    <input type="checkbox">
                                    <span class="control__indicator"></span>
                                </label>
                                <a href="#" class="forget_password">
									Forgot Password
								</a>
                            </div>
                            <div class="login_btn_wrapper">
                                <button type="button" class="btn btn-primary btn-lg btn-block" id="loginBtn" name="loginBtn">로그인</button>
                            </div>
                            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
                            </form>	
                            <h2>SNS</h2>
                              <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                                    <a href="#" class="btn btn-primary" id="fb_btn"> <span>Login with Facebook</span><i class="fa fa-facebook-f"></i> </a>
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                                    <a href="#" class="btn btn-primary google-plus"> Login  with Google <i class="fa fa-google"></i> </a>
                                </div>
                            </div>
                            
                            <div class="login_message">
                                <p>아이디가 아직 없으신가요? <a href="register"> Register Now </a> </p>
                            </div>
                        </div>
                        <p>In case you are using a public/shared computer we recommend that you logout to prevent any un-authorized access to your account</p>
                        <!-- /.login_wrapper-->
                    </div>
                </div>
		</div>
	</div>
<script>
$(function(){
	$('#loginBtn').on("click",function(){
		frm.submit();
	});
});
</script>	
</body>
</html>
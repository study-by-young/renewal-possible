<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.x_partner_main_wrapper h3{
	font-size : 30px;
	font-weight: 800;
	text-transform: uppercase;
	padding-top : 20px;
	position: relative;
}
.card {
	float : left;
	width: 100%;
	background: #ffffff;
	box-shadow: 0 4px 10px rgb(0 0 0 / 10%);
	padding: 50px;
	margin-bottom: 20px;
	border-radius: 5px;
}

 .hr-SNS {
    height: 1px;
    margin-top: 0px !important;
    margin-bottom: 0px !important;
}
 .span-or {
    display: block;
    position: absolute;
    left: 50%;
    top: -10px;
    margin-left: -25px;
    background-color: #fff;
    width: 50px;
    text-align: center;
}
.login_remember_box {
    margin-top: 30px;
    margin-bottom: 30px;
    color: #999;
}
.login_remember_box .forget_password {
    float: right;
    color: #db4c3e;
    font-size: 14px;
    text-decoration: underline;
}
.login_message p {
    text-align: center;
    font-size: 16px !important;
    margin: 0;
}
.login_message a {
    color: #4f5dec;
    font-weight: 500;
}
</style>
	<div class="x_partner_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="x_offer_car_heading_wrapper float_left">
						<h2><c:out value="${error }"/></h2>
						<h2><c:out value="${logout }"/></h2>
					</div>
				</div>
			</div>
			<div class="row">
                    <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-12 col-sm-12 col-12">
                        <!-- login_wrapper -->

                        <div class="card">
                        	<h3 class="card-title text-center mb-5 fw-light fs-5">여행갈카 로그인</h3>
                        	<div class="card-body">
	                          <form id="frm" name="frm" action="login" method="post">
	                          	<input type="text" name="${_csrf.parameterName }" value="${_csrf.token }" >
	                            <div class="formsix-pos">
	                                <div class="form-group i-email">
	                                    <input type="text" class="form-control"  id="id" name="id" placeholder="Id*" required="">
	                                </div>
	                            </div>
	                            <div class="formsix-e">
	                                <div class="form-group i-password">
	                                    <input type="password" class="form-control"  id="password" name="password" placeholder="Password*" required="">
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
	                            <div class="col-md-12 ">
	                              <div class="login-or">
	                                 <hr class="hr-or">
	                                 <span class="span-or">SNS</span>
                             	  </div>
                           		</div>
	                               <div class="row">
	                                 <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
	                                	<button class="btn btn-link"><img class="" src="${pageContext.request.contextPath}/resources/images/kakaoBtn.png"/></button>
	                                </div>
	                                 <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
	                                	<button class="btn btn-link"><img class="" src="${pageContext.request.contextPath}/resources/images/googleBtn.png"/></button>
	                                </div>
	                             
	                            	</div>
	                            <div class="login_message my-3">
	                                <p>아이디가 아직 없으신가요? <a href="register"> 회원가입 하러 가기 </a> </p>
	                            </div>
	                        </div>
	                        <!-- /.login_wrapper-->
                    	</div>
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
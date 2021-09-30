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
	                          	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
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
		                            <a href="#" class="forget_password" data-toggle="modal" data-target="#exampleModal">비밀번호 찾기</a>
		                            <a href="#" class="forget_password mr-2" data-toggle="modal" data-target="#exampleModal">아이디 찾기</a>
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
	<!-- 로그인 종료 -->
	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container">
		 <div class="sub_title font-weight-bold ">
			<h3>아이디/비밀번호 찾기</h3>
			<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
		</div>
		<div class="custom-control custom-radio custom-control-inline" style="margin-bottom: 10px;" >
			<input type="radio" class="form-check-input" id="search_1" name="search_total" onclick="searchCheck(1)" checked="checked">
			<label class="form-check-label"	for="findId">아이디 찾기</label>
		</div>
		<div class="custom-control custom-radio custom-control-inline">
			<input type="radio" class="form-check-input" id="search_2" name="search_total" onclick="searchCheck(2)"> 
			<label class="form-check-label" for="findPass">비밀번호 찾기</label>
		</div>
		<!-- 아이디 찾기 -->
		<div id="searchI">
			<div class="form-group">
				<label for="InputEmail">이름</label>
	           			<input type="text" class="form-control" name="name" id="name" placeholder="이름입력" style="width: 60%;">
			</div>
			
			<div class="form-group">
	      				<label for="InputEmail">생년월일</label>
	          			<input type="text" class="form-control" name="birth" id="birth" placeholder="생년월일 입력" style="width: 60%;">
			</div>
			
			<div class="form-group" id="idFindBtn">
				<button id="searchBtn" type="button" onclick="idFind()" class="btn btn-primary btn-block">아이디 검색</button>
				<button type="button" class="btn btn-danger btn-block" data-dismiss="modal">취소</button>
			</div>
		</div>
			<!-- 비밀번호 찾기 -->
			<div id="searchP" style="display: none;">
				
				<div class="row">
					<div class="form-group col-md-12 col-sm-6 col-xs-12">
			      		<label for="InputEmail">아이디</label>
			          	<input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력*" style="width: 60%;">
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-12 col-sm-6 col-xs-12">
						<label for="InputEmail">이름</label>
			           	<input type="text" class="form-control" name="name" id="name" placeholder="이름입력" style="width: 60%;">
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-6 col-sm-6 col-xs-12">
						<label for="InputEmail">인증번호</label>
			           	<input type="text" class="form-control" name="" id="name" placeholder="인증번호 입력" >
					</div>
			        <div class="form-group col-md-4 col-sm-6 col-xs-12 my-4">
			           	<button class="btn btn-primary">인증하기</button>
			        </div>
				</div>
				
				<div class="form-group">
					<button id="searchBtn2" type="button" class="btn btn-primary btn-block">비밀번호 재설정</button>
					<button type="button" class="btn btn-danger btn-block" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
      <!-- 모달 BodyEnd -->
    </div>
  </div>
	</div>
</div>
<!-- Modal End -->
 
<script>


$(function(){
	
	//로그인
	$('#loginBtn').on("click",function(){
		frm.submit();
	});
});	
	

//아이디/비밀번호 내용 변경 폼 
function searchCheck(num) {
		if (num == '1') {
			$("#searchP").css('display','none');
			$("#searchI").css('display', 'block');	
		} else {
			$("#searchI").css('display', 'none');
			$("#searchP").css('display', "block");
		}
	} 
//아이디 찾기
function idFind() {
	 var csrfHeaderName = "${_csrf.headerName}";
	 var csrfTokenValue ="${_csrf.token}";
	 
	if(!$("#name").val()) {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	
	if(!$("#birth").val()) {
		alert("생년월일을 입력해주세요.");
		$("#birth").focus();
		return false;
	}
	
	$.ajax({
		url : 'idFind',
		type : 'POST',
		//contentType: 'application/json',
		beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
		data :({
			 "name"  : $("#name").val(),
			 "birth" : $("#birth").val()
		}),
		success : function(data){
			console.log(data);
			var contents = "";
			
			if(data == 0 ){
				alert("입력하신 정보와 일치하는 회원정보가 없습니다.");
				location.reload();
			} else {
				$('#findIdBtn').hide();
			
				contents += '<div style = "text-align: center;">';
				contents += '	<h3> 회원님의 아이디는</h3>';
				contents += '<h4>' + data +'</h4>';
				contents += '입니다.</div>';
				contents += '<div class="form-group" id="idFindBtn">';
				contents += '	<button type="button" class="btn btn-primary btn-block" data-dismiss="modal" aria-label="Close" id="closeLoginId"><span>확인</span></button>';
				contents += '</div>';
			}
			$('#searchI').html(contents);	
			
			$('#closeLoginId').click(function(){
					
			    });
		}
	});
	
} // end of idFind()

</script>	
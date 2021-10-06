<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style type="text/css">
.dash{
	background: #ffffff;
    box-shadow: 0px 0 8px rgb(0 0 0 / 10%);
    float: left;
    width: 100%;
    padding-top: 20px;
    padding-bottom: 20px;
    margin-top: 0px;
    margin-bottom: 70px;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
}

.register_wrapper_box {
    float: left;
    width: 100%;
    background: #ffffff;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 50px;
    margin-bottom: 20px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
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
.info {
	justify-content: center;
	align-items: center;
	text-align: center;
}
.correct{
    color : green;
}
.incorrect{
    color : red;
}
</style>

<!-- x blog main and sidebar Wrapper Start -->
<div class="x_blog_sidebar_main_wrapper float_left padding_tb_100">
   <div class="container">
      <div class="row">
         <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
            <div class="x_blog_left_side_wrapper float_left">
               <div class="row">
                  <div class="col-md-12">
                     <div class="lr_bc_first_box_main_wrapper">

                        <!-- 메뉴 -->
                        <div class="lr_bc_first_box_img_cont_wrapper">
                          <ul>
				                 <li><a href="${pageContext.request.contextPath}/mypage/dashboard">홈</a></li>
		                         <li><a href="${pageContext.request.contextPath}/mypage/editInfo">회원정보수정</a></li>
		                         <li><a href="${pageContext.request.contextPath}/mypage/eslist">견적관리</a></li>
		                         <li><a href="${pageContext.request.contextPath}/mypage/rentHistory">렌트관리</a></li>
		                         <li><a href="${pageContext.request.contextPath}/mypage/community">커뮤니티관리</a></li>
		                         <li><a href="${pageContext.request.contextPath}/mypage/qna">나의문의</a></li>
 							</ul>
                        </div>
                        <br> <br> <br>

                        <!-- 회원정보수정 -->
                        <div class="blog_single_comment_heading">
                              <h4><a href="${pageContext.request.contextPath}/editInfo">회원정보수정</a></h4>
                           </div>
                   		 <div class="card">
                        	<div class="card-body">
                        		<form id="frm" name="frm" action="memberInsert" method="post">
                        			<div class="row">
	                        			<div class="form-group col-md-6 col-sm-6" >
	                                	<label for="InputEmail" >아이디</label>
	                                    	<input type="text" class="form-control" id="id" name="id" disabled="disabled" value="<sec:authentication property="principal.id"/>" >
	                               		</div>
                        			</div>
                        			
  									<div class="row">
  										<div class="form-group col-md-6 col-sm-3">
  											<label for="Inputname" >이름</label>
	                                    	<input type="text" class="form-control"  id="name" name="name" disabled="disabled" value="<sec:authentication property="principal.name"/>" >
	                                	</div>
	                                </div>
	                                
  									<div class="row">
  										<div class="form-group col-md-6 col-sm-3">
  											 <label for="Inputname" >비밀번호</label>
  											 <div class="form-group"> 
	                                    	 	<button type="button" class="btn btn-primary" id="passUpdateBtn" data-toggle="modal" data-target="#passChange">비밀번호 변경</button>
	                                		 </div>
	                                	</div>
	                                </div>
	                               
	                           		<!-- 번호 Start-->
  	                      			<div class="row">
                      					<div class="form-group col-md-12 col-sm-6 col-xs-12">
                      				 		<label for="InputAddr">휴대전화*</label>
	                      				 	<div class="form-group"> 
                       							<input type="text" class="form-control" id="phone" name="phone" value="<sec:authentication property="principal.phone"/>" style="width: 60%; display: inline;">
										 		                      
                      						</div>
                     					</div>
  	                      			</div>
  	                      				<!-- 번호 end -->
	                                <div class="row">
  										<div class="form-group col-md-6 col-sm-3">
  										<label for="Inputname">생년월일</label>
	                                    	<input type="text" class="form-control"  id="birth" name="birth" disabled="disabled" value="<sec:authentication property="principal.birth"/>" >
	                                	</div>
	                                </div>
	                                
	                                <div class="row">
  										<div class="form-group col-md-6 col-sm-3">
  											<label for="Inputname" >이메일</label>
	                                    	<input type="text" class="form-control"  id="email" name="email"  value="<sec:authentication property="principal.email"/>" >
	                                	</div>
	                                </div>
                      				<!-- 우편번호 Start -->
                      			    <div class="form-group"> 
                    			  		<label for="InputAddr">주소*</label>	
										<input type="text" class="form-control" id="addrBasic" name="addrBasic" placeholder="주소" value="<sec:authentication property="principal.addrBasic"/>">
								    </div>
								  	<div class="form-group"> 
									  	<input type="text" class="form-control" id="addrDetail" name="addrDetail" placeholder="상세주소"  value="<sec:authentication property="principal.addrDetail"/>" style="width: 50%; display: inline;">
	                      		  	</div>
	                      				<!-- 주소 종료 -->
                   				<!-- csrf토큰 -->
                   					  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                   				  	<div class="row justify-content-end">
                       				   	<button class="btn btn-primary" id="registerBtn" >수정하기</button>
                         			   	<button class="btn btn-danger">취소</button>
                      			  	</div> 	
  	                      		</form>
	                        </div>
                        </div>
                        <!-- CARD END -->
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- 사이드바 -->
         <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
            <div class="x_blog_right_side_wrapper float_left">
               <div class="row">

                  <div class="col-md-12">
                     <div
                        class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">
                        
                        <div>
                        <br><br>
                           <div align="center">
                              <img style="border-radius: 50%;"   
                                 src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                 alt="comment_img" class="img-responsive img-circle" />
                           </div>
                           <br>
                           <div align="center">
                           <h3>
											<sec:authorize access="isAuthenticated()">
												<a class="menu-button" href="#"><sec:authentication
														property="principal.name" />님</a>
												<input type="hidden" name="${_csrf.parameterName }"
													value="${_csrf.token }">
											</sec:authorize>
							</h3>
                           </div>
                           
                        </div>
                        <div class="jp_rightside_job_categories_content">
                           <ul>
                              <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                 href="#">예약완료 </a></li>
                              <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                 href="#">쿠폰함 </a></li>
                              <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                 href="#">업체전환 </a></li>

                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <div
                        class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">
                        <div >
                        <br><br>
                        <div align="center">
                           <h4>고객센터</h4>
                           <br>
                           <div>
                              <img style="border-radius: 50%;"
                                 src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                 alt="comment_img" class="img-responsive img-circle" />
                           </div>
                           <br>
                           <div align="center">
                              <h3>1544-1544</h3>
                           </div>
                           <hr>
                        </div>
                        </div>
                        <br>
                        <div align="center">
                        <h4>카카오톡 1:1 상담</h4>
                        <br>
                           <div>
                              <img style="border-radius: 50%;"
                                 src="${pageContext.request.contextPath}/resources/images/comment_img1.jpg"
                                 alt="comment_img" class="img-responsive img-circle" />
                           </div>
                        </div>
                        
                        <br>
                        <div class="jp_rightside_career_main_content"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- 사이드 바 종료 -->

<!-- 비밀번호 변경 모달 -->
<div class="modal fade" id="passChange" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"  id="PassCloseClick" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container">
		 <div class="sub_title font-weight-bold my-2">
			<h3>비밀번호 변경</h3>
		</div>
		
			<div id="passwordChange" >
				<div class="row">
					<div class="form-group col-md-12 col-sm-6 col-xs-12">
			      		<label for="InputEmail">현재 비밀번호</label>
			          	<input type="password" class="form-control passChk" name="originalPass" id="originalPass" placeholder="현재 비밀번호 입력*" style="width: 60%;">
						<span id="orignalPassCheckMassage"></span>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12 col-sm-6 col-xs-12">
			      		<label for="InputEmail">변경할 비밀번호</label>
			          	<input type="password" class="form-control passChk" name="password" id="password" placeholder="변경 비밀번호 입력*" style="width: 60%;">
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12 col-sm-6 col-xs-12">
			      		<label for="InputEmail">변경할 비밀번호 확인</label>
			          	<input type="password" class="form-control passChk" name="passwordChk" id="passwordChk" placeholder="변경 비밀번호 입력 확인*" style="width: 60%;">
							<span id="passCheckMassage"></span>
					</div>
				</div>
				<div class="form-group">
					<button id="PassBtn" name="PassBtn" type="button" class="btn btn-primary btn-block">비밀번호 변경</button>
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
	
	var id = $('input[name=id]').val();
	//현재 비밀번호 체크
	$('#originalPass').blur(function(){
		var checkResult = $("#orignalPassCheckMassage");
		var originalPass = $("#originalPass").val();
		 
		$.ajax({
			type : 'POST',
			url : '../passCheck',
			data : {password : originalPass, id : id },
			success : function(data){
				if(data == 1) {
					checkResult.html("비밀번호가 일치합니다.");
			        checkResult.attr("class", "correct");	
				} else {
					checkResult.html("비밀번호가 일치하지 않습니다.");
			 	    checkResult.attr("class", "incorrect");
				}
			}
			
		});
	});
	
	//비밀번호 비밀번호 재확인란
	$('#passwordChk').blur(function(){
	 	var checkResult = $("#passCheckMassage"); // 비교 결과 
	 	var inputPass = $('#password').val(); //변경 비밀번호 입력란
		var inputPassChk = $('#passwordChk').val(); //변경 비밀번호 확입 입력란
		
		if(inputPass == inputPassChk){
	 		checkResult.html("비밀번호가 일치합니다.");
	        checkResult.attr("class", "correct");
	 	} else {
	 		checkResult.html("비밀번호가 일치하지 않습니다.");
	 	    checkResult.attr("class", "incorrect");
	 	}
	})
	//비밀번호 변경 버튼 누를시
	$('#PassBtn').on("click",function(){
		var password = $('input[name=password]').val();	
		var PassChk = $('input[name=passwordChk]').val(); //변경 비밀번호 확입 입력란
		
		if(!$("#originalPass").val()) {
			alert("현재 비밀번호를 입력해주세요.");
			$("#originalPass").focus();
			return false;
		}
		if(!$("#password").val()) {
			alert("바꾸실 비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
		if(!$("#passwordChk").val()){
			alert("비밀번호 확인을 입력해주세요.");
			$("#passwordChk").focus();
			return false;
		}
		if(password != PassChk){
			alert("비밀번호가 일치하지 않습니다. 다시 한번 확인해 주세요.");
			return false;
		}
		$.ajax({
			type : 'POST',
			url : '../memberPassUpdate',
			data : {id : id , password : password},
			success : function(data){
		          if(data == true){
	            	console.log(data);
	            	alert("비밀번호 변경 성공.");
	            		$('#PassCloseClick').trigger('click');
		        }
		    },
		});
	});
	
	
});
</script>
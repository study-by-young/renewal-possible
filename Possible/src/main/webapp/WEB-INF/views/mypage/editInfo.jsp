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
                        <div class="col-md-12">
                           <div class="blog_single_comment_heading">
                              <h4>회원정보수정</h4>
                           </div>
                              <div class="dash">
                        	<div class="card-body">
                        		<form id="frm" name="frm">
                        			
                        			<div class="row">
	                        			<div class="form-group col-md-12 col-sm-6 col-xs-12">
	                                		<label for="InputEmail">아이디 입력*</label>
	                                    	<input type="text" class="form-control" name="id" value="" placeholder="아이디입력">
	                               		</div>
                        			</div>
  									<div class="row">
  										<div class="form-group col-md-6 col-sm-3">
  											<label for="InputId">비밀번호</label>
	                                    	<input type="password" class="form-control"  name="field-name" value="" placeholder="password*">
  										</div>
  										<div class="form-group col-md-6 col-sm-3">
  											<label for="InputId">비밀번호 확인</label>
	                                    	<input type="password" class="form-control" name="field-name" value="" placeholder="re-enter password*">
	                                	</div>
	                                </div>
	                                <!-- 이름 Start -->
  									<div class="row">
  										<div class="form-group col-md-6 col-sm-3">
  											<label for="Inputname">이름</label>
	                                    	<input type="text" class="form-control"  id="name" name="name"  placeholder="이름 입력">
	                                	</div>
	                                </div>
	                                <!-- 이름 END -->
	                                <!-- 생년월일 Start -->
	                                <div class="row">
	                                	<div class="form-group col-md-8 col-sm-6 col-xs-12">
	                                		<label for="birth">생년월일</label>
	                                		<div class="bir_yy">
													<input type="text" class="form-control" id="birth" name="birth" placeholder="YY/MM/DD(입력)" aria-label="년(4자)" class="int" >
                            				</div>
                            			</div>	
	                                </div>
	                                	<!-- 생년월일 end -->
	                                	
	                                	<!-- 이메일 Start -->
	                                <div class="row">
	                        			<div class="form-group col-md-12 col-sm-6 col-xs-12">
	                                		<label for="InputEmail">이메일*</label>
	                                    	<input type="text" class="form-control" id="email" name="email" value="" placeholder="이메일입력*">
	                               		</div>
                        			</div>
                        				<!-- 이메일 end -->
                        					
                        				<!-- 우편번호 Start -->
                      						<label for="InputAddr">주소*</label>	
                        				<div class="form-group"> 
                        					<input type="text" class="form-control" id="addrCode" name="addrCode" placeholder="우편번호" style="width: 60%; display: inline;">
											 <button type="button" class="btn btn-default" onclick="DaumPostcode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                      
                        				</div>
                        				<div class="form-group"> 
											<input type="text" class="form-control" id="addrBasic" name="addrBasic" placeholder="주소">
										</div>
										<div class="form-group"> 
											<input type="text" class="form-control" id="addrDetail" name="addrDetail" placeholder="상세주소" style="width: 50%; display: inline;">
											<input type="text" class="form-control" id="extraAddress" placeholder="참고항목" style="width: 40%; display: inline;">
  	                      				</div>
  	                      				<!-- 주소 종료 -->
  	                      				
  	                      				<!-- 번호 Start-->
  	                      				 <div class="row">
  	                      				 	<div class="form-group col-md-12 col-sm-6 col-xs-12">
  	                      				 	<label for="InputAddr">휴대전화*</label>
	  	                      				 	<div class="form-group"> 
		                        					<input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호 입력" style="width: 60%; display: inline;">
													 <button type="button" class="btn btn-primary" onclick="">인증번호 받기</button>                      
	                        					</div>
                        					</div>
  	                      				 </div>
  	                      				<!-- 번호 end -->
	                                
  	                      		</form>
                        	</div>
                   		</div>
                        </div>

                      

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
														property="principal.username" />님</a>
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
  
<!-- x blog main and sidebar Wrapper End -->
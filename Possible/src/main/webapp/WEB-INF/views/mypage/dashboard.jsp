<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                              <li><a href="${pageContext.request.contextPath}/dashboard">홈</a></li>
                              <li><a href="#">회원정보수정</a></li>
                              <li><a href="${pageContext.request.contextPath}/eslist">견적관리</a></li>
                              <li><a href="${pageContext.request.contextPath}/rentHistory">렌트관리</a></li>
                              <li><a href="${pageContext.request.contextPath}/community">커뮤니티관리</a></li>
                              <li><a href="#">나의문의</a></li>
                           </ul>
                        </div>
                        <br> <br> <br>

                        <!-- 렌트현황,후기,여행코스 제목 누르면 관련 페이지로 이동 -->
                        <div class="col-md-12">
                           <div class="blog_single_comment_heading">
                              <h4><a href="${pageContext.request.contextPath}/rentHistory">렌트내역</a></h4>
                           </div>
                              <div class="dash">
                                 <table class="table">
                                       <tr>
                                          <td>지역</td>
                                          <td>날짜</td>
                                          <td>모델명</td>
                                       </tr>
                                 </table>
                              </div>
                        </div>

                       <div class="col-md-12">
                           <div class="blog_single_comment_heading">
                              <h4><a href="${pageContext.request.contextPath}/review">나의 후기</a></h4>
                           </div>
                              <div class="dash">
	                              <table class="table">
	                                       <tr>
	                                          <td>후기테이블</td>
	                                       </tr>
	                                 </table>
                              </div>
                        </div>

                        <div class="col-md-12">
                           <div class="blog_single_comment_heading">
                              <h4><a href="${pageContext.request.contextPath}/community">나의 여행코스</a></h4>
                           </div>
                           <div class="row">
                           <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12">
                              <div class="btc_team_bot_cont_main_wrapper">
                                 <div class="btc_team_img_bot_wrapper">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/tb1.jpg"
                                       alt="team_img1">
                                    <div class="btc_team_social_tb_wrapper">
                                       <h3>14 Year Experience</h3>
                                    </div>
                                 </div>
                                 <div class="btc_team_img_bot_cont_wrapper">
                                    <h4>
                                       <a href="#">Jhon Doe</a>
                                    </h4>
                                    <p>Age - 30 Year</p>
                                 </div>
                              </div>
                           </div>
                           <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12">
                              <div class="btc_team_bot_cont_main_wrapper">
                                 <div class="btc_team_img_bot_wrapper">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/tb1.jpg"
                                       alt="team_img1">
                                    <div class="btc_team_social_tb_wrapper">
                                       <h3>14 Year Experience</h3>
                                    </div>
                                 </div>
                                 <div class="btc_team_img_bot_cont_wrapper">
                                    <h4>
                                       <a href="#">Jhon Doe</a>
                                    </h4>
                                    <p>Age - 30 Year</p>
                                 </div>
                              </div>
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
                           <h3>ㅇㅇㅇ님</h3>
                           </div>
                           
                        </div>
                        <div class="jp_rightside_job_categories_content">
                           <ul>
                              <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                 href="#">예약완료 </a></li>
                              <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                 href="#">쿠폰함 </a></li>
                              <li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
                                 href="#">포인트 </a></li>

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
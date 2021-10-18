<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        margin-bottom: 10px;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
    }
.contect_form4 {
    width: 100%;
    margin-top: 30px;
    padding-left: 20px;
    padding-top: 20px;
    background: #ffffff;
    box-shadow: 0px 0 8px rgba(0, 0, 0, 0.1);
    -webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
    resize: none;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 0;
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
                                <ul class="nav nav-tabs nav-tabs-solid bg-light">
									<li class="nav-item"><a href="${pageContext.request.contextPath}/mypage/dashboard"  data-toggle=""class="nav-link " >홈</a></li>
									<li class="nav-item"><a href="${pageContext.request.contextPath}/mypage/editProfile"  data-toggle="tab ${pageContext.request.contextPath}/mypage/editProfile" class="nav-link " >회원정보수정</a></li>
									<li class="nav-item"><a href="${pageContext.request.contextPath}/mypage/estimate" class="nav-link" >견적관리</a></li>
									<li class="nav-item"><a href="${pageContext.request.contextPath}/mypage/rent" class="nav-link" >렌트관리</a></li>
									<li class="nav-item"><a href="${pageContext.request.contextPath}/mypage/community" class="nav-link" >커뮤니티관리</a></li>
									<li class="nav-item"><a href="${pageContext.request.contextPath}/mypage/qna" class="nav-link" >나의문의</a></li>
								 </ul>
                                <div class="col-md-12">
                                    <div class="blog_single_comment_heading">
                                        <h4>후기 작성</h4>
                                    </div>
                                    <!-- 내역 -->
                                   	<div class="col-md-12">
                                		<div class="x_car_book_tabs_content_main_wrapper my-4">
						            		<div class="row">  
						            			<div class="premium_rent_list_item col-12" >
						            				<div class="card">
						            					<div class="row">
						            						<div class="col-lg-4 aling-self-center" style="margin-top: 65px;">
						            							<div class="card-img-actions p-3">
                                                            		<img class="card-img-top img-fluid" src="${pageContext.request.contextPath}${getRentReview.rentHistoryVO.carVO.modelCodeVO.img}" alt="">
                                                        		</div>
						            						</div>
						            						<div class="col-lg-8 border-left">
						            							<div class="card-body">
						            								<div class="row">
						            									<div class="col-lg-12">
                                                                    		<div class="x_car_offer_heading x_car_offer_heading_list float_left">
                                                                        		<h5 class="font-weight-bold">
                                                                                ${getRentReview.rentHistoryVO.carVO.brandCodeVO.name } ${getRentReview.rentHistoryVO.carVO.modelCodeVO.name}(${getRentReview.rentHistoryVO.carVO.segmentCodeVO.name })<br><small>${historyList.carVO.trimCodeVO.name}</small>
                                                                        		</h5>
                                                                    		</div>
                                                                		</div>
                                                                		<div class="col-12">
                                                                    		<hr class="my-2">
                                                                    		<p class="text-grey-600">
                                                                        		<i class="h3 icon-calendar pr-2 mb-0"></i>
                                                                        		<fmt:formatDate value="${getRentReview.rentHistoryVO.startDate}" pattern="yy년 MM월 dd일" /> ~ <fmt:formatDate value="${getRentReview.rentHistoryVO.endDate}" pattern="yy년 MM월 dd일" />
                                                                    		</p>
                                                                   			<p class="text-grey-600">
                                                                        		<i class="h3 icon-location4 pr-2 mb-0"></i> ${getRentReview.rentHistoryVO.takePlaceBasic} ${getRentReview.rentHistoryVO.takePlaceDetail}
                                                                    		</p>
                                                                		</div>
                                                                		<div class="col-12">
                                                                    		<div class="card border-primary-300 border-1">
                                                                        		<div class="card-body">
                                                                            		<div class="row align-items-center">
                                                                         				<div class="col-4">
                                                                                    		<i class="icon-checkmark4"></i> 대여 업체
                                                                                		</div>
                                                                                		<div class="col-8">
                                                                                    		${getRentReview.rentHistoryVO.carVO.companyVO.name}
                                                                                		</div>
                                                                                		<div class="col-4">
                                                                                    		<i class="icon-checkmark4"></i> 업체 번호
                                                                                		</div>
                                                                                		<div class="col-8">
                                                                                    		${getRentReview.rentHistoryVO.carVO.companyVO.tel }
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
						            			</div>
						            		</div>             	
                                		</div>
                                	</div>
                                       ${getRentReview.rentHistoryVO.seq }
                                    <!-- 후기작성 -->
                                    <div class="col-md-12">
                                	<div class="x_car_book_tabs_content_main_wrapper my-4">
						            	<div class="row">  
						            			<div class="premium_rent_list_item col-12" >
						            				<div class="card">
						            					<div class="row">
						            						<div class="col-lg-12">
						            							<div class="card-body" style="padding-bottom: 15px;">
						            								<form id="writeReviewForm" name="writeReviewForm" action="updateReview" method="post">
						            								<div class="row">
						            									<div class="col-lg-12">
                                                                			<div class="row align-items-center">
                                                                				<textarea id="title" name="title" rows="1" placeholder="제목을 입력해주세요!" class="contect_form4" style="margin-top: 0px;margin-bottom: 20px;">${getRentReview.title }</textarea>
                                                                			</div>
                                                                		</div>
                                                               			<div class="col-lg-12" style="margin-top: 0px;padding-left: 0px; margin-bottom: 15px;">
					            											<div class="row align-items-center">
						            											<div class="col-3">
	                                                                    		 	<select id="course" name="course" class="selectpicker">
									                                                    <option value="${course.title}" selected>내가 작성한 여행코스</option>
									                                                		<c:if test="${user.id eq course.writer}">
									                                                		<c:forEach var="course" items="${courseList}">
											                                                    <option value="">${course.title}</option>
											                                                    <input type="hidden" id="courseSeq" name="courseSeq" value="${course.seq}">
										                                                    </c:forEach>
									                                                    </c:if>
									                                                    	<c:if test="${user.id ne course.writer}">
									                                                    	<option value="">작성한 여행코스가 없습니다.</option>
									                                                    </c:if>
				                                                					</select>
		                                                						</div>
		                                                						<div class="col-3">
				                                                					 <select id="score" name="score" class="selectpicker">
									                                                    <option value="" selected>${getRentReview.score }</option>
									                                                    <option value="5">5</option>
									                                                    <option value="4">4</option>
									                                                    <option value="3">3</option>
									                                                    <option value="2">2</option>
									                                                    <option value="1">1</option>
									                                                </select>
							                                                	</div>
                                                               				</div>
                                                               			</div>
                                                                		<!--  -->
						            								
                                                                		<div class="col-lg-12">
                                                                			<div class="row align-items-center">
                                                                				<textarea id="content" name="content" rows="4" placeholder="후기 내용을 적어주세요!" class="ckeditor" >${getRentReview.content }</textarea>
                                                                			</div>
                                                                		</div>
                                                                	</div>
		                                                                	<input type="hidden" name="memSeq" id="memSeq"value="${getRentReview.memberVO.seq }">
		                                									<input type="hidden" name="historySeq" id="historySeq"value="${getRentReview.rentHistoryVO.seq }">
		                                									<input type="hidden" name="cmpnSeq" id="cmpnSeq" value="${getRentReview.companyVO.seq }"> 	
		                                									<input type="hidden" name="seq" id="seq" value="${getRentReview.seq }"> 	
                                                                		<div class="col-lg-12" style="margin-top: 20px;">
								            								<div class="text-center">
					                        									<button type="button" class="btn btn-primary" id="updateBtn"
					                        											style="background: #4f5dec; color: #ffffff;">수정하기 <i class="icon-paperplane ml-2"></i></button>
					                        								</div>
			                        									</div>
						            								</form>
						            							</div>
						            						</div>
						            					</div>
						            				</div>
						            			</div>
						            		</div>             	
                                		</div>
                                	</div><!--  -->
                                    
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
                                                        property="principal.name"/>님</a>
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
<script>
	// 데이터 가져오기
	
	
	 $(function() {
		$("#updateBtn").on("click",function(){
			var result = confirm("정말로 수정 하시겠습니까?");
			if (result){
				writeReviewForm.submit();
				alert("수정이 완료되었습니다.");
			}else{
				
			}
		});
	 });
	
	 CKEDITOR.instances.content.getData();
	/* $("#updateBtn").on("click",function(){
		var title = $("#title").val();
		var score = $("#score").val();
		var content = $("#content").val();
		var seq = $("seq").val();
		
		$.ajax({
			type : "POST",
			url : '../rent/view/updateReview',
			data : {seq : seq,
				    title : title,
				    score: score,
				    content: content
				    },
			success : function(data){
				var result = confirm("정말로 수정 하시겠습니까?");
				if(result && data == 1){
					alert("수정이 완료되었습니다.");
					console.log(data);
				}else{
					
				}
			}	    
		});
		
	}); */
</script>
<!-- x blog main and sidebar Wrapper End -->


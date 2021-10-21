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
.nav-tabs-bottom .nav-link::after {
		position: absolute; content:""; 
		display: block; 
		border-bottom: 2px solid #1E88E5; 
		transition: width 350ms ease-in-out; 
		left: auto; width: auto;} 
.nav-tabs-bottom .nav-link:hover::after {width: 100%;  left: 0; } 

.input_title {
	width: 100%;
	border: 1px solid lightgray;
	padding: 10px 8px;
	border-radius: 5px;
}

</style>

<div class="btc_tittle_main_wrapper">
	<div class="mb-3">
		<div class="page-header page-header-dark bg-primary-600">
			<div class="container py-2">
				<div class="page-header-content header-elements-inline">
					<div class="page-title">
						<h1 class="font-weight-bold">마이페이지</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- x blog main and sidebar Wrapper Start -->
<div class="x_blog_sidebar_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="row">
			<!-- 사이드바 -->
			<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
				<div class="x_blog_left_side_wrapper float_left">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-body text-center">
								<a href="#" class="d-inline-block mb-3"
									style="margin-top: 20px;"> <img
									src="${pageContext.request.contextPath}/resources/images/avatar.jpg"
									class="rounded-round" width="150" height="150" alt="">
								</a>
								<div class="card-header bg-transparent h2">
									<sec:authorize access="isAuthenticated()">
										<a class="menu-button"
											href="${pageContext.request.contextPath}/mypage/dashboard"><sec:authentication
												property="principal.name" />님</a>
										<input type="hidden" name="${_csrf.parameterName }"
											value="${_csrf.token }">
									</sec:authorize>
								</div>
								<div class="card-header h5"
									style="padding-top: 10px; padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
									<ul class="nav nav-sidebar" data-nav-type="accordion">
										<c:if test="${member.author eq 'ROLE_USER'}">
											<li class="nav-item"><i class="fa fa-building pr-2 mb-0"></i><a
												href="${pageContext.request.contextPath}/mypage/chngRole">업체
													전환 신청하기 </a></li>
										</c:if>
										<c:if test="${member.author eq 'ROLE_COMPANY'}">
											<li class="nav-item"><i class="fa fa-building pr-2 mb-0"></i><a
												href="${pageContext.request.contextPath}/company/dashboard">업체페이지로
													이동 </a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card mb-2">
								<div class="card-header bg-transparent header-elements-inline">
									<span class="text-uppercase font-size-sm font-weight-semibold">메뉴</span>
									<div class="header-elements">
										<div class="list-icons">
											<a class="list-icons-item" data-action="collapse"></a>
										</div>
									</div>
								</div>
								<div class="card-body p-0">
									<ul class="nav nav-sidebar nav-tabs-vertical"
										data-nav-type="accordion">
										<li class="nav-item h5"><a
											href="${pageContext.request.contextPath}/mypage/editProfile"
											class="nav-link text-grey-700 h6"><i
												class="icon-googleplus5"></i>회원정보 수정</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/mypage/estimate"
											class="nav-link text-grey-700 h6"><i
												class="icon-portfolio"></i>견적관리</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/mypage/rent"
											class="nav-link text-grey-700 h6"><i class="icon-compose"></i>렌트관리</a>
										</li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/mypage/community"
											class="nav-link text-grey-700 h6"><i
												class="icon-collaboration"></i>커뮤니티 관리</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/mypage/qna"
											class="nav-link text-grey-700 h6"><i
												class="icon-files-empty"></i>나의 문의</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card card-body text-center">
								<div class="mb-3">
									<h3 class="font-weight-semibold mb-0 mt-1">고객센터</h3>
								</div>
								<a class="d-inline-block mb-3"> <img
									src="${pageContext.request.contextPath}/resources/images/cs_icon_b2.png"
									class="rounded-round" width="150" height="150" alt="">
								</a>
								<div class="mb-3">
									<h4 class="font-weight-semibold mb-0 mt-1">고객센터 이용안내</h4>
									<h2 class="d-block text-muted">
										<strong>1544-2460</strong>
									</h2>
									<span class="d-block text-muted">평일 09:00~17:50</span> <span
										class="d-block text-muted">(점심 12:30~13:40)</span>
								</div>
								<button class="btn btn-block btn-primary" type="button"
									id="custom-button">1:1 상담하러 가기</button>
							</div>
						</div>
						<div class="col-md-12"></div>
					</div>
				</div>
			</div> 
			<!-- 사이드바 종료 -->
			
			
			<!-- 후기작성 -->
			<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
				<div class="x_blog_left_side_wrapper float_left">
					<div class="row">
					
						<input type="hidden" id="" name="" value="${historyList.carVO.brandCodeVO.name}">
						<input type="hidden" id="" name="" value="${historyList.carVO.modelCodeVO.name}">
						<input type="hidden" id="" name="" value="${historyList.carVO.segmentCodeVO.name}">
						<input type="hidden" id="" name="" value="${historyList.startDate}">${historyList.startDate}
						<input type="hidden" id="" name="" value="${historyList.endDate}">${historyList.endDate}
						<input type="hidden" id="" name="" value="${historyList.takePlaceBasic}">
						<input type="hidden" id="" name="" value="${historyList.takePlaceDetail}">
						<input type="hidden" id="" name="" value="${historyList.companyVO.name}">
						<input type="hidden" id="" name="" value="${historyList.companyVO.tel}">
					
						<div class="col-lg-12 col-md-12">
							<div class="lr_bc_first_box_main_wrapper">
								<div class="col-md-12">
									<div class="dash" style="margin-bottom: 20px; padding-bottom: 10px;">
										<div class="blog_single_comment_heading">
											<h4 style="font-weight: 600; padding-left: 20px;">이용후기 수정</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-md-12">
							<div class="lr_bc_first_box_main_wrapper">
								<div class="col-md-12">
									<div class="card dash" style="margin-bottom: 20px; padding-bottom: 10px;">
									
										<div class="card-body" style="padding-bottom: 15px; margin-left: 15px; margin-right: 15px;">
											<form id="writeReviewForm" action="writeReview" method="post">
												<div class="row">
													<div class="col-lg-12" style="margin-bottom: 15px;">
														<div class="row align-items-center">
															<input class="input_title" type="text" id="title" name="title" value="${getRentReview.title}" placeholder="제목을 입력해주세요. *" required="required">
														</div>
													</div>
													<div class="col-lg-12" style="margin-top: 0px; padding-left: 0px; margin-bottom: 15px;">
														<div class="row align-items-center">
															<div class="col-3">
																<select id="course" name="course" class="selectpicker input_title">
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
															<div class="col-2">
																<select id="score" name="score" class="selectpicker input_title">
																	<option value="" selected>${getRentReview.score}</option>
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
															<textarea id="content" name="content" rows="4" placeholder="내용을 입력해주세요. *" class="ckeditor">${getRentReview.content}</textarea>
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
         													style="background: #4f5dec; color: #ffffff; float: right;">수정 <i class="icon-paperplane ml-2"></i></button>
         											</div>
       											</div>
											</form>
										</div>
									</div>
								</div><!-- row -->
							</div>
						</div>						
						
					</div><!-- row -->
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

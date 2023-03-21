<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<style>
.ChangeRole {
	float : left;
	width: 100%;
	background: #ffffff;
	box-shadow: 0 4px 10px rgb(0 0 0 / 10%);
	padding: 50px;
	margin-bottom: 20px;
	border-radius: 5px;
}
.nav-tabs-bottom .nav-link::after {
		position: absolute; content:""; 
		display: block; 
		border-bottom: 2px solid #1E88E5; 
		transition: width 350ms ease-in-out; 
		left: auto; width: auto;} */
		 
.nav-tabs-bottom .nav-link:hover::after {width: 100%;  left: 0; } 
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편주소 api -->
<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title">
                        <h1 class="font-weight-bold">업체 전환 신청</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
            <div class="x_blog_right_side_wrapper float_left">
               <div class="row">
				<%-- <sec:authentication property=""/> --%>
                  <div class="col-md-12">
					<div class="card card-body text-center">
						<a href="#" class="d-inline-block mb-3" style="margin-top: 20px;">
							<img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="rounded-round" width="150" height="150" alt="">
						</a>
						<div class="card-header bg-transparent h2">
							<sec:authorize access="isAuthenticated()">
								<a class="menu-button" href="${pageContext.request.contextPath}/mypage/dashboard"><sec:authentication
								   property="principal.name" />님</a>
								<input type="hidden" name="${_csrf.parameterName }"
									   value="${_csrf.token }">
							</sec:authorize>
						</div>
						<div class="card-header h5" style="padding-top: 10px;padding-bottom: 10px;padding-right: 10px;padding-left: 10px;">
							<ul class="nav nav-sidebar" data-nav-type="accordion">
                            	<c:if test="${member.author eq 'ROLE_USER'}">
                              		<li class="nav-item"><i class="fa fa-building pr-2 mb-0" ></i><a
                                 		href="${pageContext.request.contextPath}/mypage/chngRole">업체 전환 신청하기 </a></li>
							  	</c:if>
							  	<c:if test="${member.author eq 'ROLE_COMPANY'}">
                              		<li class="nav-item"><i class="fa fa-building pr-2 mb-0" ></i><a
                                 		href="${pageContext.request.contextPath}/company/dashboard">업체페이지로 이동 </a></li>
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
							<ul class="nav nav-sidebar nav-tabs-vertical" data-nav-type="accordion">
								<li class="nav-item h5">
									<a href="${pageContext.request.contextPath}/mypage/editProfile" class="nav-link text-grey-700 h6"><i class="icon-googleplus5"></i>회원정보 수정</a>
								</li>
								<li class="nav-item">
									<a href="${pageContext.request.contextPath}/mypage/estimate" class="nav-link text-grey-700 h6"><i class="icon-portfolio"></i>견적관리</a>
								</li>
								<li class="nav-item">
									<a href="${pageContext.request.contextPath}/mypage/rent" class="nav-link text-grey-700 h6"><i class="icon-compose"></i>렌트관리</a>
								</li>
								<li class="nav-item">
									<a href="${pageContext.request.contextPath}/mypage/community" class="nav-link text-grey-700 h6"><i class="icon-collaboration"></i>커뮤니티 관리</a>
								</li>
								<li class="nav-item">
									<a href="${pageContext.request.contextPath}/mypage/qna" class="nav-link text-grey-700 h6"><i class="icon-files-empty"></i>나의 문의</a>
								</li>
							</ul>
						</div>
					</div>
                  </div>
                  <div class="col-md-12">
                  	<div class="card card-body text-center">
						<div class="mb-3">
							<h3 class="font-weight-semibold mb-0 mt-1">고객센터</h3>
						</div>
						<a class="d-inline-block mb-3" >
							<img src="${pageContext.request.contextPath}/resources/images/cs_icon_b2.png" class="rounded-round" width="150" height="150" alt="">
						</a>
						<div class="mb-3">
							<h4 class="font-weight-semibold mb-0 mt-1">고객센터 이용안내</h4>
							<h2 class="d-block text-muted"><strong>1544-2460</strong></h2>
							<span class="d-block text-muted">평일 09:00~17:50</span>
							<span class="d-block text-muted">(점심 12:30~13:40)</span>
						</div>	
						<button class="btn btn-block btn-primary"type="button" id="custom-button">1:1 상담하러 가기</button>
					</div>
                  </div>
                 
               </div>
            </div>
         </div> <!-- 사이드바 종료 -->
		
			<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
				<div class="x_blog_left_side_wrapper float_left">
					<div class="row">
						<div class="col-md-12">
							<div class="lr_bc_first_box_main_wrapper">
								<!-- 업체등록 START -->
									<form id="frm" name="frm" action="chngRole" method="post">
								<div class="col-md-12">
									<div class="card ChangeRole">
										<div class="row">
											<input type="hidden" name='memSeq' value='${member.seq}'>
										   	
										   	<div class="form-group col-md-6 col-sm-3">
											   	<label for="InputId">업체명*</label>
											    <input type="text" class="form-control"  id="name" name="name" placeholder="업체명">
											</div>   
										</div>
										<div class="row">
											<div class="form-group col-md-6 col-sm-3">
												<label for="InputId">사업자번호*</label>
												<input type="text" class="form-control"  id="cmpnNum" name="cmpnNum" placeholder="사업자번호 입력*">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6 col-sm-3">
												<label for="InputId">업체전화번호*</label>
												<input type="text" class="form-control"  id="tel" name="tel" placeholder="'-'없이 전화번호만 입력해주세요.">
											</div>
										</div>
										
										<!-- 우편번호 Start -->
                      						<label for="InputAddr">주소*</label>	
                        				<div class="form-group"> 
                        					<input type="text" class="form-control" id="postal" name="postal" placeholder="우편번호" style="width: 30%; display: inline;">
											 <button type="button" class="btn btn-default" onclick="DaumPostcode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                      
                        				</div>
                        				<div class="form-group"> 
											<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" style="width: 70%; display: inline;">
										</div>
										<div class="form-group"> 
											<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소" style="width: 50%; display: inline;">
											<input type="text" class="form-control" id="extraAddress" placeholder="참고항목" style="width: 40%; display: inline;">
  	                      				</div>
  	                      				<div class="form-group"> 
											<input type="text" class="form-control" id="area" name="area" placeholder="시도" style="width: 50%; display: inline;">
  	                      				</div>
  	                      				<!-- 주소 종료 -->
  	                      				 <div class="row justify-content-end">
										      <button type="submit" class="btn btn-primary mr-2">요청</button>
										      <button class="btn btn-danger">취소 </button>
										 </div>
									</div>
									<!-- card BODY END -->
								</div>
								<!-- 업체등록 END -->	
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>


<script>
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            		
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("[name=postal]").val(data.zonecode);
            $("[name=addr1]").val(addr);
            $("[name=area]").val(data.sido);
            // 커서를 상세주소 필드로 이동한다.
          	$('#addr2').focus();
        }
    }).open();
}

<!-- Channel Plugin Scripts -->

  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "cca89d8e-722c-46c6-a330-10097ad5cd70",
    "customLauncherSelector": "#custom-button"
  });
</script>	

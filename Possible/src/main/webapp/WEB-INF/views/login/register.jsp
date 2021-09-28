<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
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
.bir_dd, .bir_mm, .bir_yy {
    display: table-cell;
    table-layout: fixed;
    width: 147px;
    vertical-align: middle;

.bir_wrap, .name_wrap {
    display: table;
    width: 100%;
}
.ps_box, .ps_box_disable {
    display: block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;

.bir_wrap {
    display: table;
    width: 100%;
}
.register_wrap {
    margin-top: 15px;
}

</style>

<div class="x_partner_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="x_offer_car_heading_wrapper float_left">
						<h4>Register Got Your Account</h4>
						<h3 class="py-2 my-2">여행갈카 회원가입</h3>
					</div>
				</div>
			</div>
			<div class="row">
               <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-12 col-sm-12 col-12">
                   <div class="row">
                   		 <div class="card">
                        	<div class="x_offer_car_heading_wrapper float_left">
								<div class=" d-none d-sm-none d-xs-none d-md-block text-center">
                        			<img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive my-4" alt="logo" title="Logo" style="width: 120px;" />
                				</div>
							</div>
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
	                                    	<input type="password" class="form-control"  id="password" name="password" placeholder="비밀번호입력*">
  										</div>
  										<div class="form-group col-md-6 col-sm-3">
  											<label for="InputId">비밀번호 확인</label>
	                                    	<input type="password" class="form-control"  id="passcheck" name="passcheck"  placeholder="비밀번호 확인">
	                                	</div>
	                                </div>
	                                <!-- 생년월일 Start -->
	                                <div class="row">
	                                	<div class="form-group col-md-4 col-sm-6 col-xs-12">
	                                		<label for="yy">생년월일</label>
	                                		<!-- 년 입력 Start -->
	                                		<div class="bir_yy">
												<span class="ps_box">
													<input type="text" class="form-control" id="yy" name="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
												</span>
                            				</div>
                            				<!-- 년 입력 End -->
                            			</div>
                            				<!-- 월 입력 Start -->
                            			<div class="form-group col-md-2 col-sm-6 col-xs-12 my-4">
                            				<div class="bir_mm">
												<span class="ps_box">
													<select id="mm" class="sel" aria-label="월">
														<option value="">월</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</select>
												</span>
                            				</div>
                            			</div>
                            			<!-- 월 입력 end -->

	                                	<!-- 일 입력 start -->
	                                	<div class="form-group col-md-4 col-sm-6 col-xs-12 my-4">
				                            <div class=" bir_dd">
												<span class="ps_box">
													<input type="text" id="dd" class="form-control" placeholder="일" aria-label="일" class="int" maxlength="2">
													<label for="dd" class="lbl"></label>
												</span>
				                            </div>
				                       </div>
				                        <!-- 일 입력 end -->
				                        <span class="error_next_box" id="birthdayMsg" style="display:none" aria-live="assertive"></span>
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
											 <button type="button" class="btn btn-default" onclick="daumPostcode($('#daumPostCodeWrapper')[0], $('#addrCode')[0], $('#addrBasic')[0], $('#addrDetail')[0]);"><i class="fa fa-search"></i> 우편번호 찾기</button>
                        				</div>
                        				<div class="form-group">
											<input type="text" class="form-control" id="addrBasic" name="addrBasic" placeholder="주소">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="addrDetail" placeholder="상세주소" style="width: 50%; display: inline;">
  	                      				</div>
  	                      				<!-- 주소 종료 -->
                                        <div id="daumPostCodeWrapper" style="display:none;width:500px;height:300px;position:relative">
                                            <button type="button" class="btn" id="btnFoldWrap" onclick="foldDaumPostcode($('#daumPostCodeWrapper')[0])"  style="position:absolute;right:-50px;top:-1px;z-index:1">
                                                <i class="icon-close2"></i>
                                            </button>
                                        </div>

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
  	                      				  <div class="login_btn_wrapper register_wrap register_wrapper_btn">
                                			<a href="#" class="btn btn-primary btn-lg btn-block login_btn">회원가입 </a>
                            			  </div>
  	                      			</form>
	                            		  <div><hr class="hr-or"></div>

		                                  <div class="login_message">
                                			<p>이미 회원이신가요? <a href="loginForm"> 로그인 하러 가기 </a> </p>
                           				  </div>


	                                </div>
                        	</div>
                   		</div>
                 </div>
            </div>
      </div>
  </div>




<script>
function checkBirthday() {
	var submitFlag = false;
    var birthday;
    var yy = $("#yy").val();
    var mm = $("#mm option:selected").val();
    var dd = $("#dd").val();
    var oMsg = $("#birthdayMsg");
    var lang = "ko_KR";

    var oyy = $("#yy");
    var omm = $("#mm");
    var odd = $("#dd");

    if (yy == "" && mm == "" && dd == "") {
        showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
        setFocusToInputObject(oyy);
        return false;
    }

    if (mm.length == 1) {
        mm = "0" + mm;
    }
    if (dd.length == 1) {
        dd = "0" + dd;
    }

    if(yy == "") {
        showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
        setFocusToInputObject(oyy);
        return false;
    }
    if(yy.length != 4 || yy.indexOf('e') != -1 || yy.indexOf('E') != -1) {
        showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
        setFocusToInputObject(oyy);
        return false;
    }
    if(mm == "") {
        showErrorMsg(oMsg,"태어난 월을 선택하세요.");
        setFocusToInputObject(omm);
        return false;
    }
    if(dd == "") {
        showErrorMsg(oMsg,"태어난 일(날짜) 2자리를 정확하게 입력하세요.");
        setFocusToInputObject(odd);
        return false;
    }
    if(dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
        showErrorMsg(oMsg,"태어난 일(날짜) 2자리를 정확하게 입력하세요.");
        setFocusToInputObject(odd);
        return false;
    }

    birthday = yy + mm + dd;
    if (!isValidDate(birthday)) {
        showErrorMsg(oMsg,"생년월일을 다시 확인해주세요.");
        setFocusToInputObject(oyy);
        return false;
    }
}
function showErrorMsg(obj, msg) {
    obj.attr("class", "error_next_box");
    obj.html(msg);
    obj.show();
}
function setFocusToInputObject(obj) {
    if(submitFlag) {
        submitFlag = false;
        obj.focus();
    }
}
//지도 api
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
               $("[name=addrCode]").val(data.zonecode);
               $("[name=addrBasic]").val(addr)
               // 커서를 상세주소 필드로 이동한다.
             	$('#addrDetail').focus();
           }
       }).open();
   }
</script>

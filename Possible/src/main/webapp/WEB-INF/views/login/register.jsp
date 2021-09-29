<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    width: 200px;
    vertical-align: middle;
.bir_wrap, .name_wrap {
    display: table;
    width: 100%;
}
.ps_box, .ps_box_disable {
    display: block;
    position: relative;
    width: 100%;
    
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
                        		<form id="frm" name="frm" action="memberInsert" method="post">
                        			
                        			<div class="row">
	                        			<div class="form-group col-md-12 col-sm-6 col-xs-12">
	                                		<label for="InputEmail">아이디 입력*</label>
	                                    	<input type="text" class="form-control" name="id" id="id" placeholder="아이디입력" style="width: 60%;">
	                                    	<button type="button" class="btn btn-primary" id="idChk" name="idChk" onclick="fn_idChk();" >중복체크</button>   
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
  	                      				
  	                      				<!-- csrf토큰 -->
  	                      				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
  	                      				  
  	                      				  <div class="login_btn_wrapper register_wrap register_wrapper_btn">
                                			<button class="btn btn-primary btn-lg btn-block login_btn" id="registerBtn" >회원가입 </button>
                            			  </div> 
  	                      			</form>
	                            		  <div><hr class="hr-or"></div>
		                                  
		                                  <div class="login_message">
                                			<p>이미 회원이신가요? <a href="login"> 로그인 하러 가기 </a> </p>
                           				  </div>	
		                                
	                             	  	  
	                                </div>
                        	</div>
                   		</div>
                 </div>
            </div>
      </div>
  </div>    




<script>
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
 //아이디 중복체크
  
   function fn_idChk(){
	 var csrfHeaderName = "${_csrf.headerName}";
	 var csrfTokenValue ="${_csrf.token}";
	 
   		$.ajax({
   			url : "idChk",
   			type: "post",
   			dataType: "json",
   			beforeSend : function(xhr){
   				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
   			},
   			data : {"id" : $('#id').val()},
   			success : function(data){
   				if(data == 1){
   					alert("중복된 아이디입니다.");	
   				}else if(data == 0) {
   					alert("사용가능한 아이디입니다.")
   				}
   			}
   		});
   		
   	}
 
//회원가입이 빈틈
   
//회원 등록
$('#registerBtn').on("click", function(){
	alert("회원가입이 완료되었습니다.") 
	frm.submit();		
	});
  
</script>
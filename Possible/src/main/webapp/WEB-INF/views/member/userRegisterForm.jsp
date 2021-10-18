<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title">
                        <h1 class="font-weight-bold">회원가입</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="x_partner_main_wrapper my-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-12">
                <div class="card">
                    <form id="registerForm" name="registerForm" method="post" class="form-validate-jquery">
                        <div class="x_offer_car_heading_wrapper card-header bg-white">
                            <div class="text-center">
                                <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive my-4" alt="logo" title="Logo" style="width: 120px;" />
                            </div>
                        </div>
                        <div class="card-body">
                                <sec:csrfInput/>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <label for="id" class="col-form-label col-lg-2">아이디 <span class="text-danger">*</span></label>
                                            <div class="col-lg-10">
                                                <div class="input-group">
                                                    <input name="id" id="id" type="text" class="form-control no-empty" required>
                                                    <div class="input-group-append">
                                                        <button type="button" class="btn btn-primary" onclick="fn_idChk();" >중복체크</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <label for="password" class="col-form-label col-lg-2">비밀번호 <span class="text-danger">*</span></label>
                                            <div class="col-lg-10">
                                                <input name="password" id="password" type="password" class="form-control password no-empty">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <label for="repeat_password" class="col-form-label col-lg-2">비밀번호 확인 <span class="text-danger">*</span></label>
                                            <div class="col-lg-10">
                                                <input name="repeat_password" id="repeat_password" type="password" class="form-control no-empty repeat-password" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group row">
                                            <label for="name" class="col-form-label col-lg-4">이름 <span class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <input name="name" id="name" type="text" class="form-control no-empty" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group row">
                                            <label for="birth" class="col-form-label col-lg-4">생년월일 <span class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <input name="birth" id="birth" type="text" class="form-control pickadate" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <label for="name" class="col-form-label col-lg-2">이메일 <span class="text-danger">*</span></label>
                                            <div class="col-lg-10">
                                                <input name="email" id="email" type="text" class="form-control no-empty" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <label for="phone" class="col-form-label col-lg-2">휴대전화 <span class="text-danger">*</span></label>
                                            <div class="col-lg-10">
                                                <div class="input-group">
                                                    <input name="phone" id="phone" type="text" class="form-control no-empty" required>
                                                    <div class="input-group-append">
                                                        <button type="button" class="btn btn-primary" onclick="" >인증번호 받기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label>주소 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <input name="addrCode" id="addrCode" type="text" class="form-control no-empty" placeholder="우편번호" required>
                                                    <div class="input-group-append">
                                                        <button type="button" class="btn btn-primary" onclick="" >주소 검색</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <input name="addrBasic" id="addrBasic" type="text" class="form-control no-empty" placeholder="기본주소" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <input name="addrDetail" id="addrDetail" type="text" class="form-control" placeholder="상세주소">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <div class="login_btn_wrapper register_wrap register_wrapper_btn text-center">
                                <button class="btn btn-primary btn-lg w-25 login_btn" id="registerBtn" >회원가입 </button>
                            </div>
                            <div class="login_message mt-3">
                                <p>이미 회원이신가요? <a href="${pageContext.request.contextPath}/login"> 로그인 하러 가기 </a> </p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




<script>
    $(function(){

    })
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
            url : "../idChk",
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

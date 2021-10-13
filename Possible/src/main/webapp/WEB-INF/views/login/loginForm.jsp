<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-12">
                <c:if test="${error != null}">
                    <div class="alert alert-danger border-0 alert-dismissible">
                            ${error }
                    </div>
                </c:if>
                <c:if test="${logout != null}">
                    <div class="alert alert-info border-0 alert-dismissible">
                            ${logout }
                    </div>
                </c:if>
            </div>
            <div class="col-lg-6 offset-lg-3 col-12">
                <!-- login_wrapper -->
                <div class="card">
                    <h3 class="card-title text-center my-4 font-weight-bold">여행갈카 로그인</h3>
                    <div class="card-body">
                        <form id="loginForm" name="loginForm" action="login" method="post">
                            <sec:csrfInput/>
                            <div class="row">
                                <label for="loginId" class="col-form-label col-2">
                                    아이디
                                </label>
                                <div class="col-10">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="loginId" name="loginId" required>
                                    </div>
                                </div>
                                <label for="loginPassword" class="col-form-label col-2">
                                    비밀번호
                                </label>
                                <div class="col-10">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="loginPassword" name="loginPassword" required>
                                    </div>
                                </div>
                            </div>
                            <div class="login_remember_box">
                                <div class="form-check form-check-switchery form-check-inline">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input-switchery" data-fouc>
                                        로그인 유지
                                    </label>
                                </div>
                                <a href="login/findId" class="float-right text-success">아이디 찾기 / 비밀번호 재설정</a>
                            </div>
                            <div class="login_btn_wrapper my-3">
                                <button type="submit" class="btn btn-primary btn-lg btn-block" id="loginBtn" name="loginBtn">로그인</button>
                            </div>
                        </form>
                        <hr class="hr-or">
                        <div class="col-12 ">
                            <h4 class="text-center">SNS</h4>
                        </div>
                        <div class="row">
                            <!-- 카카오 로그인 APi -->
                            <div class="col-md-6 text-center">
                                <a href="https://kauth.kakao.com/oauth/authorize?client_id=584286fe9e832f708f4badd91da18b46&redirect_uri=http://localhost/app/oauth&response_type=code">
                                    <img class="" src="${pageContext.request.contextPath}/resources/images/kakaoBtn.png" alt=""/>
                                </a>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="#">
                                    <img class="" src="${pageContext.request.contextPath}/resources/images/googleBtn.png" alt=""/>
                                </a>
                            </div>
                        </div>
                        <div class="login_message my-3 text-center">
                            <p>아이디가 아직 없으신가요? <a href="register/user"> 회원가입 하러 가기 </a></p>
                        </div>
                    </div>
                    <!-- /.login_wrapper-->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 로그인 종료 -->
<script>


    function returnSearchId() {

        var contents = '';

        contents += '<div class="form-group">';
        contents += '	<label for="InputEmail">이름</label>';
        contents += '	<input type="text" class="form-control" name="name" id="name" placeholder="이름입력" style="width: 60%;">';
        contents += '</div>';
        contents += '<div class="form-group">';
        contents += '	<label for="InputEmail">생년월일</label>';
        contents += '	<input type="text" class="form-control" name="birth" id="birth" placeholder="생년월일 입력" style="width: 60%;">';
        contents += '</div>';
        contents += '<div class="form-group" id="idFindBtn">';
        contents += '	<button id="searchBtn" type="button" onclick="idFind()" class="btn btn-primary btn-block">아이디 검색</button>';
        contents += '	<button type="button" class="btn btn-danger btn-block" data-dismiss="modal">취소</button>';
        contents += '</div>';

        $('#searchI').html(contents);
        $('#findIdBtn').show();
    }

    var code = "";
    var inputCode = $('#numberInput').val();
    //인증번호 이메일 전송
    $("#mailCheck").on("click", function () {
        var email = $("#email").val();
        var id = $("#id").val();
        var numberInput = $("#numberInput");
        var boxWrap = $(".mail_check_input_box");
        $.ajax({

            type: 'GET',
            url: 'mailCheck?email=' + email + id,

            success: function (data) {
                alert("인증메일이 발송 되었습니다.");
                console.log("값은?" + data);
                numberInput.attr("disabled", false);
                boxWrap.attr("id", "mail_check_input_box_true");
                code = data;
            }
        });
    });
    //인증코드 결과
    $("#numberInput").blur(function () {

        var inputCode = $('#numberInput').val(); //인증번호 입력란
        var checkResult = $("#mail_check_input_box_warn");    // 비교 결과

        if (inputCode == code) {
            checkResult.html("인증번호가 일치합니다.");
            checkResult.attr("class", "correct");
        } else {
            checkResult.html("인증번호를 다시 확인해주세요.");
            checkResult.attr("class", "incorrect");
        }
    });

    //인증 성공시 비밀번호 변경 폼으로
    $("#newPassBtn").on("click", function () {
        var getId = $(".idChk").val();
        console.log(getId);
        var email = $("#email").val();

        if (!$(".idChk").val()) {
            alert("아이디를 입력해주세요.");
            $(".idChk").focus();
            return false;
        }

        if (!$("#email").val()) {
            alert("이메일을 입력해주세요.");
            $("#email").focus();
            return false;
        }
        if ($('#numberInput').val() == "") {
            alert("인증번호를 입력해주세요.");
            $('#numberInput').focus();
        }

        isInputCode = $('#numberInput').val();
        console.log($('#numberInput').val());

        if (code == isInputCode) {
            alert("메일이 인증되었습니다.");
            $("#passChange").modal();
            $('#closeClick').trigger('click');

        } else {
            alert("메일인증을 거쳐야 비밀번호 변경이 가능합니다.");

            return false;
        }

        //비밀번호 변경
        $("#PassBtn").on("click", function () {
            var password = $('.passChk').val();
            console.log(getId);
            console.log(password);
            $.ajax({
                type: "post",
                url: "/passFindUpdate",
                data: {password: password, id: getId},
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
                success: function (data) {
                    if (data == true) {
                        console.log(data);
                        alert("비밀번호 변경 성공.");
                        $('#PassCloseClick').trigger('click');
                    }
                },
                error: function () {
                    alert("실패");
                }
            });
        });
    });
</script>

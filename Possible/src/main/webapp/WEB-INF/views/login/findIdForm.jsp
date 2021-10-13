<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container my-5">
    <div class="row">
        <div class="col-lg-8 offset-lg-2">
            <div class="card">
                <div class="card-header header-elements-inline justify-content-center">
                    <h2 class="card-title">회원 정보 찾기</h2>
                </div>

                <div class="card-body">
                    <ul class="nav nav-tabs nav-justified nav-tabs-highlight mb-0">
                        <li class="nav-item">
                            <a href="#findId-tab1" class="nav-link <c:if test="${param.get('type') != 'pw'}">active</c:if>" data-toggle="tab">
                                <h5>아이디 찾기</h5>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#findId-tab2" class="nav-link <c:if test="${param.get('type') == 'pw'}">active</c:if>" data-toggle="tab">
                                <h5>비밀번호 재설정</h5>
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane fade <c:if test="${param.get('type') != 'pw'}">active show</c:if>" id="findId-tab1">
                            <form id="findIdForm" name="findIdForm" action="findId/findResult" method="post">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label class="col-form-label">이름</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="findIdname" name="findIdname" type="text" placeholder="홍길동" class="form-control" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label class="col-form-label">생년월일</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="findIdbirth" name="findIdbirth" type="text" placeholder="예) 210101" class="form-control" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-block bg-primary" onclick="idFind()">아이디 찾기</button>
                                    <button type="button" class="btn btn-block btn-link text-dark" onclick="history.back()">취소</button>
                                </div>
                            </form>
                        </div>

                        <div class="tab-pane fade <c:if test="${param.get('type') == 'pw'}"> active show</c:if>" id="findId-tab2">
                            <form action="#">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label class="col-form-label">아이디</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="resetPwId" name="resetPwId" type="text" placeholder="아이디를 입력하세요" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label class="col-form-label">이메일</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="resetPwEmail" name="resetPwEmail" type="text" placeholder="이메일을 입력하세요" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label class="col-form-label">인증번호</label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="input-group">
                                                    <input id="validNumber" name="validNumber" type="text" placeholder="인증번호를 입력하세요" class="form-control">
                                                    <span class="input-group-append">
												<button id="checkVaild" class="btn btn-light" type="button">인증번호 받기</button>
											</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-block bg-primary">비밀번호 재설정</button>
                                    <button type="button" class="btn btn-block btn-link text-dark" onclick="history.back()">취소</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //아이디 찾기
    function idFind() {
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        let name = $('#findIdname');
        let birth = $('#findIdbirth');

        $.ajax({
            url: 'findId',
            type: 'POST',
            dataType: 'text',
            // beforeSend: function (xhr) {
            //     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            // },
            data: {
                "name": name.val(),
                "birth": birth.val()
            },
            success: function (data) {
                console.log(data);
                if (data === '') {
                    alert("입력하신 정보와 일치하는 회원정보가 없습니다.");
                    return;
                }
                $('#findIdForm').submit();
            }
        });
    } // end of idFind()
</script>

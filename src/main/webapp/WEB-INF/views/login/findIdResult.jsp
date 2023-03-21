<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container my-5">
    <div class="row">
        <div class="col-lg-8 offset-lg-2">
            <div class="card">
                <div class="card-header header-elements-inline justify-content-center">
                    <h2 class="card-title">아이디 찾기</h2>
                </div>

                <div class="card-body">
                    <div class="text-center">
                        <h5 class="mb-4">요청하신 아이디 찾기 결과입니다.</h5>
                        입력하신 정보로 조회된 아이디는 <span class="text-primary">${id}</span> 입니다.
                    </div>
                </div>
                <div class="card-footer bg-white d-flex justify-content-between">
                    <a href="${pageContext.request.contextPath}/login/findId?type=pw" class="btn w-50 bg-primary">비밀번호 찾기</a>
                    <a href="${pageContext.request.contextPath}/login" class="btn w-50 btn-link text-dark" >로그인</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function passwordReset(){

    }
</script>

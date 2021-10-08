<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<style>
    .card {
        float : left;
        width: 100%;
        background: #ffffff;
        box-shadow: 0 4px 10px rgb(0 0 0 / 10%);
        padding: 50px;
        margin-bottom: 20px;
        border-radius: 5px;
    }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편주소 api -->

<div class="x_contact_title_main_wrapper float_left padding_tb_100">
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
                                        <li><a href="${pageContext.request.contextPath}/mypage/dashboard">홈</a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/editInfo">회원정보수정</a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/eslist">견적관리</a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/rentHistory">렌트관리</a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/community">커뮤니티관리</a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/qna">나의문의</a></li>
                                    </ul>
                                </div>
                                <br> <br> <br>

                                <!-- 업체등록 START -->
                                <form id="frm" name="frm" action="chngRole" method="post">
                                    <div class="col-md-12">
                                        <div class="blog_single_comment_heading">
                                            <h4>업체등록</h4>
                                        </div>
                                        <div class="card">
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
            <!-- 사이드바 -->
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="x_blog_right_side_wrapper float_left">
                    <div class="row">

                        <div class="col-md-12">
                            <div
                                    class="jp_rightside_job_categories_wrapper jp_rightside_job_categories_wrapper2">

                                <div>
                                    <br>
                                    <br>
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
                                                        property="principal.name" />님</a>
                                                <input type="hidden" name="${_csrf.parameterName }"
                                                       value="${_csrf.token }">
                                            </sec:authorize>

                                        </h3>
                                    </div>

                                </div>
                                <div class="jp_rightside_job_categories_content">
                                    <ul >
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
                                <div>
                                    <br>
                                    <br>
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
            <!-- 사이드바 종료 -->
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
</script>

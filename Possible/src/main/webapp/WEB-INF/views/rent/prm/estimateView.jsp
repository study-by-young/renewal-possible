<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-01
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="est" value="${estimate.get('estimate')}" />
<c:set var="options" value="${estimate.get('options')}" />
<c:set var="items" value="${estimate.get('items')}" />
<div class="btc_tittle_main_wrapper">
    <div class="mb-3">
        <div class="page-header page-header-dark bg-primary-600">
            <div class="container py-2">
                <div class="page-header-content header-elements-inline">
                    <div class="page-title">
                        <h1 class="font-weight-bold">렌트 견적 상세</h1>
                        <h6>나만의 렌트카를 요청해보세요!</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- x car book sidebar section Wrapper Start -->
<div class="x_car_book_sider_main_Wrapper float_left  mt-5">
    <div class="container">
        <div class="card">
            <div class="card-img">
                <div class="text-center mt-3">
                    <img src="${pageContext.request.contextPath}${est.modelCodeVO.img}" alt="fresh_food_img">
                </div>
            </div>
            <div class="card-header border-bottom">
                <div class="x_slider_form_input_wrapper float_left">
                    <h2 class="text-center font-weight-bold">
                        ${est.brandName} ${est.modelCodeVO.name}
                        <p class="small text-muted">${est.trimCodeVO.name}</p>
                    </h2>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <div class="x_car_detail_main_wrapper my-4">
                            <div class="row">
                                <div class="col-md-3 offset-md-2 col-6 p-0">
                                    <div class="form-sec-header text-center">
                                        <label class="h5 font-weight-bold">대여 날짜</label>
                                        <div class="form-control w-75 mx-auto bg-primary text-white h-auto rounded-pill">
                                            <span class="h6">
                                                <fmt:formatDate value="${est.startDate}" pattern="yy/MM/dd (EE)"/>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 align-self-end d-none d-md-block p-0">
                                    <div class="form-sec-header text-center">
                                        <p><i class="fas fa-angle-double-right fa-2x text-grey-800"></i></p>
                                    </div>
                                </div>
                                <div class="col-md-3 col-6 p-0">
                                    <div class="form-sec-header text-center">
                                        <label class="h5 font-weight-bold">반납 날짜</label>
                                        <div class="form-control w-75 mx-auto bg-primary text-white h-auto rounded-pill">
                                            <span class="h6">
                                                <fmt:formatDate value="${est.endDate}" pattern="yy/MM/dd (EE)"/>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100 my-4"></div>
                                <div class="col-md-6">
                                    <div class="x_slider_form_input_wrapper">
                                        <label class="h5 font-weight-bold"><i class="icon-location4"></i> 수령 장소</label>
                                    </div>
                                    <div id="takePlaceMap" class="mb-3" style="height:300px;"></div>
                                    <h6>주소</h6>
                                    <p class="h-auto">${est.takePlaceCode} ${est.takePlaceBasic} ${est.takePlaceDetail}</p>
                                </div>
                                <div class="col-md-6">
                                    <label class="h5 font-weight-bold"><i class="icon-checkmark4"></i> 차량 옵션</label>
                                    <div class="card border-primary-300 border-1 shadow-0">
                                        <div class="card-body">
                                            <div class="row align-items-center">
                                                <div class="col-12">
                                                    <ul class="list-unstyled mb-0">
                                                        <c:forEach var="opt" items="${options}">
                                                            <li class="d-inline-block pr-3 mb-1">
                                                                <i class="icon-checkbox-checked2 text-primary"></i> ${opt}
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w-100 py-2"></div>
                                    <label class="h5 font-weight-bold"><i class="icon-checkmark4"></i> 여행 용품</label>
                                    <div class="card border-primary-300 border-1 shadow-0">
                                        <div class="card-body">
                                            <div class="row align-items-center">
                                                <div class="col-12">
                                                    <ul class="list-unstyled mb-0">
                                                        <c:forEach var="item" items="${items}">
                                                            <li class="d-inline-block pr-3 mb-1">
                                                                <i class="icon-checkbox-checked2 text-primary"></i> ${item}
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w-100 py-2"></div>
                                    <label class="h5 font-weight-bold"><i class="icon-checkmark4"></i> 참고 사항</label>
                                    <div class="card border-primary-300 border-1 shadow-0">
                                        <div class="card-body">
                                            <p>${est.memo}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/premiumRent/submit/register?seq=${est.seq}" class="btn btn-primary btn-lg w-25">
                        <h5 class="mb-0">견적 작성</h5>
                    </a>
                    <a href="${pageContext.request.contextPath}/premiumRent/estimate/view/update?seq=${est.seq}" class="btn btn-primary btn-lg w-25">
                        <h5 class="mb-0">수정하기</h5>
                    </a>
                    <button onclick = "confirmDelete()" class="btn btn-outline-danger btn-lg w-25">
                        <span class="h5 mb-0">삭제하기</span>
                    </button>
<%--                    <sec:authorize access="hasAnyRole('COMPANY','ADMIN')">--%>
<%--                        <a href="${pageContext.request.contextPath}/premiumRent/submit/register?seq=${est.seq}" class="btn btn-primary btn-lg w-25">--%>
<%--                            <h5 class="mb-0">견적 작성</h5>--%>
<%--                        </a>--%>
<%--                    </sec:authorize>--%>
<%--                    <sec:authentication property="principal.seq" var="loginUserSeq" />--%>
<%--                    <sec:authorize access="hasRole('USER')">--%>

<%--                        <c:if test="${est.memSeq == loginUserSeq}">--%>
<%--                            <a href="${pageContext.request.contextPath}/premiumRent/estimate/view/update?seq=${est.seq}" class="btn btn-primary btn-lg w-25">--%>
<%--                                <h5 class="mb-0">수정하기</h5>--%>
<%--                            </a>--%>
<%--                            <button onclick = "confirmDelete()" class="btn btn-outline-danger btn-lg w-25">--%>
<%--                                <span class="h5 mb-0">삭제하기</span>--%>
<%--                            </button>--%>
<%--                        </c:if>--%>
<%--                    </sec:authorize>--%>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header border-bottom">
                <div class="x_slider_form_input_wrapper float_left">
                    <h3 class="font-weight-bold mb-0">견적 리스트</h3>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <c:if test="${empty submitList}">
                        <div class="col-12 text-center">
                            <h6 class="py-5">아직 제출된 견적이 없습니다!</h6>
                        </div>
                    </c:if>
                    <c:forEach var="submit" items="${submitList}">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="card-img">
                                        <img src="${pageContext.request.contextPath}/resources/images/cars/KIA/k8.png" alt="" class="img-fluid"/>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card border-primary-300 border-1 shadow-0">
                                                <div class="card-body">
                                                    <div class="row align-items-center">
                                                        <div class="col-12">
                                                            <ul class="list-unstyled mb-0">
                                                                <c:forEach var="item" items="${items}">
                                                                    <li class="d-inline-block pr-3 mb-1">
                                                                        <i class="icon-checkbox-checked2 text-primary"></i> ${item}
                                                                    </li>
                                                                </c:forEach>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <c:if test="${not empty submitList}">
                <div class="card-footer bg-white">
                    <jsp:include page="/pagination"/>
                </div>
            </c:if>
        </div>
    </div>
</div>
<!-- x car book sidebar section Wrapper End -->
<script>
    $(function(){
        var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${est.takePlaceBasic}', function(result, status) {

            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });
    });

    function confirmDelete(){
        customConfirm('삭제 요청',
            '정말 삭제하시겠습니까?',
            function(result){
                if(result){
                    location.href = "${pageContext.request.contextPath}/premiumRent/estimate/view/delete?seq=${est.seq}";
                }
            })
    }
</script>

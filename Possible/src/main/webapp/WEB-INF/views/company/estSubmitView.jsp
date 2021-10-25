<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
.down_margin {
margin-bottom: 30px;
}
ul{
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    list-style: none;
    padding-left: 0px;
}
.list-unstyled {
    padding-left: 0;
    list-style: none;
    display: inline-block;
  height: 100%;
  vertical-align: middle;
}
.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
</style>
<c:set var="est" value="${estimate.get('estimate')}" />
<c:set var="options" value="${estimate.get('options')}" />
<c:set var="items" value="${estimate.get('items')}" />
<div class="content-wrapper">
	<div class="container">
		<div class="content">
				<div class="row">
					<div class="col-md-12">
						<!-- Basic layout-->
						<div class="card">
							<div class="card-header header-elements-inline">
								<h5 class="card-title">견적 한건 상세보기 </h5>
								<div class="header-elements">
									<div class="list-icons">
				                		<a class="list-icons-item" data-action="collapse"></a>
				                	</div>
			                	</div>
							</div>
							
							<div class="card-body">
								<form id="estimatefrm" name="estimatefrm" method="post" action="../estSubmit/update">
									<div class="row down_margin">
									<input type="hidden" name="seq" value="${est.seq }">
									
										<div class="col-4">
											<label class="font-weight-bold">외형 </label>
											<input type="text" class="form-control" id="segment" name="segment" value="${est.segmentCodeVO.name}" disabled>
										</div>
										<div class="col-4">
											<label class="font-weight-bold">브랜드 </label>
											<input type="text" class="form-control" id="brand" name="brand" value="${est.brandCodeVO.name }" disabled>
										</div>
										<div class="col-4">
											<label class="font-weight-bold">모델명 </label>
											<input type="text" class="form-control" id="model" name="model" value="${est.modelCodeVO.name }" disabled>
										</div>
									</div>
									
									<div class="row down_margin">
										<div class="col-3">
											<h5 class="font-weight-bold">연료 </h5>
											<input type="text" class="form-control" id="model" name="model" value="${est.carVO.fuelCodeVO.name }" >
										</div>
										<div class="col-3">
											<h5 class="font-weight-bold">차량색상 </h5>
											<input type="text" class="form-control" id="color" name="color" value="${est.carVO.colorCodeVO.name }" >
										</div>
										<div class="col-3">
											<h5 class="font-weight-bold">변속기 </h5>
											<input type="text" class="form-control" id="mission" name="mission" value="${est.carVO.missionCodeVO.name }" >
										</div>
										<div class="col-3">
											<h5 class="font-weight-bold">승차인원 </h5>
											<input type="text" class="form-control" id="passenger" name="passenger" value="${est.passenger }명" disabled>
										</div>
									</div>
									<div class="row down_margin">
										<div class="col-4">
											<h5 class="font-weight-bold">연비 </h5>
											<input type="text" class="form-control" id="kmpl" name="kmpl" value="${est.kmpl }" disabled>
										</div>
										<div class="col-4">
											<label class="font-weight-bold">문 갯수 </label>
											<input type="text" class="form-control" id="door" name="door" value="${est.door }" disabled>
										</div>
										<div class="col-4">
											<label class="font-weight-bold">차량 가격 </label>
											<input type="text" class="form-control" id="price" name="price" value="${est.price }원" disabled>
										</div>
									</div>
									${est}
									<div class="col-12 mb-4">
                                    <h5 class="font-weight-bold">차량 옵션</h5>
                                    <div class="row">
                                         <c:forEach var="option" items="${carOpt}" varStatus="status">
                                            <div class="mb-2 col-lg-3 col-md-4 col-6">
                                                <div class="custom-control custom-checkbox custom-control-inline">
                                                    <input type="checkbox"
                                                           name="options"
                                                           id="options${status.index}"
                                                           class="custom-control-input"
                                                           value="${option.code}"
                                                           <c:if test="${est.estimateHistoryVO.options.contains(option.name)}">checked</c:if>>
                                                    <label class="custom-control-label" for="options${status.index}">${option.name}</label>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
									<div class="row down_margin">
										<div class="col-4">
											<label class="font-weight-bold">신청자 성명 :</label>
											<input type="text" class="form-control" id="memName" name="memName" value="${est.memName }" disabled>
										</div>
										<div class="col-4">
											<label class="font-weight-bold">신청자 휴대폰번호 :</label>
											<input type="text" class="form-control" id="phone" name="phone" value="${est.phone }" disabled>
										</div>
									</div>
									<div class="row down_margin">
										<div class="col-6">
											<label>요청 메모</label>
											<textarea rows="5" cols="5" class="form-control" >${est.memo }</textarea>
										</div>
									</div>
									<div class="text-right">
										<button type="button" class="btn btn-primary" id="updateBtn">수정하기<i class="icon-paperplane ml-2"></i></button>
										<button type="button" class="btn btn-danger">삭제하기<i class="icon-paperplane ml-2"></i></button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- 컨테이너  -->
	</div>
<script>

$("#updateBtn").on("click",function(){
	var text = confirm("정말 수정하시겠습니까?");
	var message = '${message}';
	if(text){
		estimatefrm.submit();
		alert("수정이 완료 되었습니다.");
	}else{
		
	}
});
</script>

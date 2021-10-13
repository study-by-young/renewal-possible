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
</style>
<div class="content-wrapper">
	<div class="container">
		<div class="content">
${estimate }
				<!-- Vertical form options -->
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
								<form action="#">
									<div class="row down_margin">
										<div class="col-4">
											<label class="font-weight-bold">외형 :</label>
											<input type="text" class="form-control" id="segment" name="segment" value="${estimate.segment }">
										</div>
										<div class="col-4">
											<label class="font-weight-bold">브랜드 :</label>
											<input type="text" class="form-control" id="brand" name="brand" value="${estimate.brand }">
										</div>
										<div class="col-4">
											<label class="font-weight-bold">모델명 :</label>
											<input type="text" class="form-control" id="model" name="model" value="${estimate.model }">
										</div>
									</div>
									
									<div class="row down_margin">
										<div class="col-3">
											<label class="font-weight-bold">연료 :</label>
											<input type="text" class="form-control" id="model" name="model" value="${estimate.fuel }">
										</div>
										<div class="col-3">
											<label class="font-weight-bold">차량색상 :</label>
											<input type="text" class="form-control" id="color" name="color" value="${estimate.color }">
										</div>
										<div class="col-3">
											<label class="font-weight-bold">변속기 :</label>
											<input type="text" class="form-control" id="mission" name="mission" value="${estimate.mission }">
										</div>
										<div class="col-3">
											<label class="font-weight-bold">승차인원 :</label>
											<input type="text" class="form-control" id="passenger" name="passenger" value="${estimate.passenger }명">
										</div>
									</div>
									<div class="row down_margin">
										<div class="col-4">
											<label class="font-weight-bold">연비 :</label>
											<input type="text" class="form-control" id="kmpl" name="kmpl" value="${estimate.kmpl }">
										</div>
										<div class="col-4">
											<label class="font-weight-bold">문 갯수 :</label>
											<input type="text" class="form-control" id="door" name="door" value="${estimate.door }">
										</div>
									</div>
									<div class="row down_margin">
										<div class="col-6">
											<label class="font-weight-bold">차량 가격</label>
											<input type="text" class="form-control" id="price" name="price" value="${estimate.price }원">
										</div>
									</div>
									<div class="row down_margin">
										<div class="col-6">
											<label class="font-weight-bold">차량 옵션</label>
											
												<ul>
													<li>${estimate.items }</li>
												</ul>
											
										</div>
										<div class="col-6">
											<label class="font-weight-bold">여행 옵션</label>
											<c:forEach var="item" items="${estimate.items}" begin="0" end="4">
                                                                <li>	<a href="#"><i class="fa fa-users"></i> &nbsp;${item}</a>
                                                                </li>
                                            </c:forEach>
											<input type="text" class="form-control" id="price" name="price" value="${estimate.price }원">
										</div>
									</div>
									
									<div class="form-group">
										<label>요청 메모</label>
										<textarea rows="5" cols="5" class="form-control" >${estimate.memo }</textarea>
									</div>

									<div class="text-right">
										<button type="submit" class="btn btn-primary">Submit form <i class="icon-paperplane ml-2"></i></button>
									</div>
								</form>
							</div>
						</div>
						<!-- /basic layout -->
						</div>
					</div>
				</div>
			</div>
		</div>

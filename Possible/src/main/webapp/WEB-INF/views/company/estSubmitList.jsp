<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <div class="content-wrapper">
			<!-- Content area -->
			<div class="content">
			<c:forEach var="est" items="${estimate}">
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="card-title">업체 견적서 제출 리스트</h5>
						<div class="header-elements">
							<div class="list-icons">
		                		<a class="list-icons-item" data-action="collapse"></a>
		                	</div>
	                	</div>
					</div>

					<div class="card-body">
					
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>차량</th>
									<th>차종</th>
									<th>색상</th>
									<th>가격</th>
									<th>연료</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${est.brand }${est.model }</td>
									<td>${est.segment }</td>
									<td>${est.color }</td>
									<td>${est.price }원</td>
									<td>${est.fuel}</td>
									<td><a class="btn btn-primary" id="estView"  href="${pageContext.request.contextPath}/company/estSubmit/view?seq=${est.seq}">상세보기</a></td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
<script>
$("#estView").on("click", function(){
	
})
</script>
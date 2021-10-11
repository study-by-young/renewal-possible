<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-24
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Main content -->
		<div class="content-wrapper">

			<!-- Content area -->
			<div class="content">

<%-- <a href="${pageContext.request.contextPath}/admin/maintenance/member">회원관리</a>

<a href="${pageContext.request.contextPath}/admin/maintenance/company">업체등록관리</a>

<a href="${pageContext.request.contextPath}/admin/maintenance/confirmCompany">업체정보관리</a>

<a href="${pageContext.request.contextPath}/admin/maintenance/report">신고글관리</a>
 --%>

	<!-- Striped rows -->
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="card-title"><a href="${pageContext.request.contextPath}/admin/maintenance/company">미승인 업체(최신 3개)</a></h5>
						<div class="header-elements">
							<div class="list-icons">
		                		<a class="list-icons-item" data-action="collapse"></a>
		                		<a class="list-icons-item" data-action="reload"></a>
		                		<a class="list-icons-item" data-action="remove"></a>
		                	</div>
	                	</div>
					</div>

					<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="comRegList" end="2" items="${comRegList }">
								<tr>
									<td>${comRegList.seq}</td>
									<td><a href="${pageContext.request.contextPath}/admin/maintenance/company/view?seq=${comRegList.seq}">${comRegList.name}</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					</div>

					
				</div>
<!-- /striped rows -->


	<!-- Striped rows -->
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="card-title"><a href="${pageContext.request.contextPath}/notice/list">공지사항(최신 3개)</a></h5>
						<div class="header-elements">
							<div class="list-icons">
		                		<a class="list-icons-item" data-action="collapse"></a>
		                		<a class="list-icons-item" data-action="reload"></a>
		                		<a class="list-icons-item" data-action="remove"></a>
		                	</div>
	                	</div>
					</div>

					<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="notice" end="2" items="${notice }">
								<tr>
									<td>${notice.seq}</td>
									<td><a href="${pageContext.request.contextPath}/notice/get?seq=${notice.seq }">${notice.title }</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					</div>

					
				</div>
<!-- /striped rows -->
</div>
</div>

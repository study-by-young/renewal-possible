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
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">


</style>

<!-- Main content -->
		<div class="content-wrapper">

			<!-- Content area -->
			<div class="content">
	<!-- Striped rows -->
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="card-title"><a href="${pageContext.request.contextPath}/admin/maintenance/company">미승인 업체(최신 3개)</a>&nbsp;<span class="badge bg-pink badge-pill">New</span></h5>
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
						<table class="table table-striped" >
							<thead>
								<tr>
									<th width="80">번호</th>
									<th width="400" style="text-align:center">업체명</th>
									<th>등록일자</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="comRegList" end="2" items="${comRegList }">
								<tr>
									<td width="80">${comRegList.seq}</td>
									<td width="400" style="text-align:center"><a href="${pageContext.request.contextPath}/admin/maintenance/company/view?seq=${comRegList.seq}">${comRegList.name}</a></td>
									<td><fmt:formatDate pattern = "yyyy/MM/dd" value= "${comRegList.genDate }"/></td>
									<td style="text-align:right"><button type="button" class="btn bg-pink-300 rounded-round" onclick="location.href='${pageContext.request.contextPath}/admin/maintenance/company/view?seq=${comRegList.seq}' ">상세보기</button></td>
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
									<th width="80">번호</th>
									<th width="400" style="text-align:center">제목</th>
									<th>작성일자</th>
									<th>수정일자</th>							
								</tr>
							</thead>
							<tbody>
								<c:forEach var="notice" end="2" items="${notice }">
								<tr>
									<td width="80">${notice.seq}</td>
									<td width="400"><a href="${pageContext.request.contextPath}/notice/get?seq=${notice.seq }">${notice.title }</a></td>
									<td><fmt:formatDate pattern = "yyyy/MM/dd" value= "${notice.genDate }"/></td>
									<td><fmt:formatDate pattern = "yyyy/MM/dd" value= "${notice.uptDate }"/></td>
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

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
								<tr align="center">
									<th class="col-1">번호</th>
									<th class="col-3" style="text-align:center">업체명</th>
									<th class="col-3">대표번호</th>
									<th class="col-1">등록일자</th>
									<th class="col-1"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="comRegList" end="2" items="${comRegList }">
								<tr>
									<td style="text-align:center">${comRegList.seq}</td>
									<td style="text-align:center"><a href="${pageContext.request.contextPath}/admin/maintenance/company/view?seq=${comRegList.seq}">${comRegList.name}</a></td>
									<td style="text-align:center">${comRegList.tel}</td>
									<td style="text-align:center"><fmt:formatDate pattern = "yyyy/MM/dd" value= "${comRegList.genDate }"/></td>
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
						<h5 class="card-title"><a href="${pageContext.request.contextPath}/qna/list">1:1문의(5개)</a></h5>
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
						<tr align="center">
							<th class="col-1">번호</th>
							<th class="col-6">제목</th>
							<th class="col-1">작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th class="col-1">답변상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach end="4" items="${qnaList}" var="qna">
						<c:if test="${qna.answerCnt<'1'}">
							<tr align="center" onclick="readBoard(${qna.seq})">
								<td>${qna.seq}</td>
								<td align="left">${qna.title}</td>
								<td>${qna.writer}</td>
								<td><fmt:formatDate value="${qna.genDate}"
										pattern="yy-MM-dd" /></td>
								<td><fmt:formatDate value="${qna.uptDate}"
										pattern="yy-MM-dd" /></td>
										<td><a style="color: red" href="${pageContext.request.contextPath}/qna/get?seq=${qna.seq}">답변대기</a></td>
							</tr>
						</c:if>
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
								<tr align="center">
									<th class="col-1">번호</th>
									<th class="col-6" style="text-align:center">제목</th>
									<th class="col-1">작성일자</th>
									<th class="col-1">수정일자</th>							
								</tr>
							</thead>
							<tbody>
								<c:forEach var="notice" end="2" items="${notice }">
								<tr>
									<td style="text-align:center">${notice.seq}</td>
									<td><a href="${pageContext.request.contextPath}/notice/get?seq=${notice.seq }">${notice.title }</a></td>
									<td style="text-align:center"><fmt:formatDate pattern = "yyyy/MM/dd" value= "${notice.genDate }"/></td>
									<td style="text-align:center"><fmt:formatDate pattern = "yyyy/MM/dd" value= "${notice.uptDate }"/></td>
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

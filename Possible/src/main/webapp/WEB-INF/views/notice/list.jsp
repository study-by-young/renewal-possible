<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>

<!-- Global stylesheets -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/admin/global_assets/css/icons/icomoon/styles.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/admin/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/admin/css/bootstrap_limitless.min.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/admin/css/layout.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/admin/css/components.min.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/admin/css/colors.min.css" rel="stylesheet" type="text/css">
<!-- /global stylesheets -->

<!-- Core JS files -->
<script src="${pageContext.request.contextPath}/resources/css/admin/global_assets/js/main/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/admin/global_assets/js/main/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/admin/global_assets/js/plugins/loaders/blockui.min.js"></script>
<!-- /core JS files -->

<!-- Theme JS files -->
<script src="${pageContext.request.contextPath}/resources/css/admin/js/app.js"></script>
<!-- /theme JS files -->

<style>
tr:hover {color:blue;
		  cursor:pointer;}
</style>
</head>

<body>
<div class= "container">
	<div style="margin-top: 50px;">
		<!-- Striped rows -->
		<div class="card">
			<div class="card-header header-elements-inline">
				<h3 class="card-title">공지사항</h3>
				<div class="header-elements">
					<div class="list-icons">
						<a class="list-icons-item" data-action="collapse"></a> <a
							class="list-icons-item" data-action="reload"></a> <a
							class="list-icons-item" data-action="remove"></a>
					</div>
				</div>
			</div>
	
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr align="center">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>공지사항</td>
							<td>관리자</td>
							<td>97.01.01</td>
							<td>200</td>
						</tr>
						<tr>
							<td>2</td>
							<td>공지사항항</td>
							<td>관리자</td>
							<td>94.12.16</td>
							<td>548</td>
						</tr>
						<tr>
							<td>3</td>
							<td>공지사항항항</td>
							<td>관리자</td>
							<td>15.10.20</td>
							<td>222</td>
						</tr>
						<tr>
							<td>4</td>
							<td>공지사항항항항</td>
							<td>관리자</td>
							<td>97.02.05</td>
							<td>11</td>
						</tr>
						<tr>
							<td>5</td>
							<td>공지사항항항항항</td>
							<td>관리자</td>
							<td>30.01.02</td>
							<td>176</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /striped rows -->
	</div>
	
	<div align="center">
		<button type="button" class="btn btn-primary" onclick="location.href='insert'">등록</button>
	</div>
	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-laballedby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
	</div>	
</div>
<script>
$(document).ready(function() {
	var insertResult = '<c:out value="${insertResult}"/>';
	var updateResult = '<c:out value="${updateResult}"/>';
	var deleteResult = '<c:out value="${deleteResult}"/>';
	checkModal(insertResult, updateResult, deleteResult);
	
 	function checkModal(insertResult, updateResult, deleteResult) {
		if (insertResult === '' && updateResult === '' && deleteResult === '') {
			return;
		}
		if (parseInt(insertResult) > 0) {
			$('.modal-body').html(parseInt(insertResult) + " 번 게시글이 등록되었습니다.");
		}
		if (parseInt(updateResult) > 0) {
			$('.modal-body').html(parseInt(updateResult) + " 번 게시글의 수정이 완료되었습니다.");
		}
		if (parseInt(deleteResult) > 0) {
			$('.modal-body').html(parseInt(deleteResult) + " 번 게시글의 삭제가 완료되었습니다.");
		}
		$('#myModal').modal('show');
	} 
})
</script>
</body>
</html>
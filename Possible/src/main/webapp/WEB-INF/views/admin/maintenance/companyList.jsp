<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">

.pagination {
	justify-content: center;
}

.select {
	width: 70px; /* 원하는 너비설정 */
	padding: .5em .4em; /* 여백으로 높이 설정 */
	border: 1px solid #999;
	font-family: inherit; /* 폰트 상속 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	border-radius: .5em;
	-moz-appearance: none;
	appearance: none;
}

.input {
	width: 200px; /* 원하는 너비설정 */
	padding: .5em .4em; /* 여백으로 높이 설정 */
	border: 1px solid #999;
	font-family: inherit; /* 폰트 상속 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	border-radius: .5em;
	-moz-appearance: none;
	appearance: none;
}
</style>
		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Content area -->
			<div class="content">

				<div class="card">
					<div class="card-header header-elements-inline">
						<h6 class="card-title">업체미승인리스트</h6>
						<div class="header-elements">
							
						</div>
					</div>

					<div class="card-body py-0">
						<div class="row">
							<div class="col-sm-12">
								<div class="d-flex align-items-center justify-content-center mb-2">
									<form id="actionForm" action="companyOneSelect" method="get">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>업체명</th>
					<th>사업자번호</th>
					<th>사업자주소</th>
					<th>대표번호</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="comRegList" items="${comRegList }">
				<tr>
					<td>${comRegList.seq }</td>
					<td>${comRegList.name}</td>
					<td>${comRegList.cmpnNum }</td>
					<td>${comRegList.addr1 } ${comRegList.addr2 } ${comRegList.area }</td>
					<td>${comRegList.tel }</td>
					<td>
					 <a class="move" href="${comRegList.seq }">상세보기</a>

					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		</form>
									</div>
								</div>
							</div>

							
							
	</div>
							
						</div>
					</div>

				</div>
<script>
	$(function() {
		var actionForm = $("#actionForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							var seq = $(this).attr("href"); //클릭한 게시글의 번호를 읽어와서 
							actionForm
									.append('<input type="hidden" name="seq" value="'+ seq +'">') //여기넣어주고
							actionForm.attr("action", "company/view") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
							actionForm.submit(); //실행
						});
	});
</script>
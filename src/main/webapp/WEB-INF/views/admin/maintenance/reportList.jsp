<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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
				<h5 class="card-title">
					<a
						href="${pageContext.request.contextPath}/admin/maintenance/report"
						class="nav-link">신고글리스트</a>
				</h5>
				<div class="header-elements">
					<div class="list-icons">
						<a class="list-icons-item" data-action="collapse"></a>
					</div>
				</div>
			</div>
			<div class="col-sm-12" style="padding-left: 2.5rem">
				<div class="d-flex">
					<div align="center">
						<form id="actionForm" action="report" method="get">
							<select name="type" class="select" style="cursor:pointer">
								<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
								<option value="T" ${pageMaker.cri.type =='T'? 'selected' : "" }>게시글 번호</option>
								<option value="R" ${pageMaker.cri.type =='R'? 'selected' : "" }>신고자</option>
							</select> <input class="input" name="keyword"
								value="${pageMaker.cri.keyword }"> <input type="hidden"
								name="pageNum" value="1"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount }">
							<button class="btn btn-primary"
								onclick="$('[name=pageNum]').val(1)">Search</button>
						</form>

					</div>
				</div>
			</div>
			<br>
			<hr style="margin: 0px">
			<div class="card-body" style="padding: 0px">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="40">번호</th>
								<th width="100">게시글 번호</th>
								<th width="100">신고일자</th>
								<th width="100">신고자</th>
								<th width="40"></th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="reportList" items="${reportList }">
								<tr>
									<td>${reportList.seq }</td>
									<c:if test="${empty reportList.target}"><td style="color:red">삭제된 게시글</td></c:if>
									<c:if test="${not empty reportList.target}"><td>${reportList.target}</td></c:if>
									<td><fmt:formatDate pattern = "yyyy/MM/dd" value= "${reportList.genDate}"/></td>
									<td>${reportList.reporter }</td>
									<td><a class="move" href="${reportList.seq }">상세보기</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
			<hr style="margin: 0px">
			<br>
			<div class="col-sm-12">
				<div class="d-flex align-items-center justify-content-center mb-2">
					<div id="pageButton">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage-1}">이전</a></li>
								<span aria-hidden="true">&laquo;</span>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<li class="page-item"><a class="page-link" href="${num }">${num }</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage+1}">다음</a></li>
								<span aria-hidden="true">&laquo;</span>
							</c:if>
						</ul>
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
							actionForm.attr("action", "report/view") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
							actionForm.submit(); //실행
						});

		$("#pageButton a").on("click", function(e) {
			e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
			var p = $(this).attr("href");
			$('[name="pageNum"]').val(p);
			actionForm.submit();
		});
	});
</script>
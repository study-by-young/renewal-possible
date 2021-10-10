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
						<h6 class="card-title">업체리스트</h6>
						<div class="header-elements">
							
						</div>
					</div>

					<div class="card-body py-0">
						<div class="row">
							<div class="col-sm-12">
								<div class="d-flex align-items-center justify-content-center mb-2">
									<div align="center">
										<form id="actionForm" action="company" method="get">
			<select name="type" class="select" >
				<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
				<option value="N" ${pageMaker.cri.type =='N'? 'selected' : "" }>업체명</option>
				<option value="A" ${pageMaker.cri.type =='A'? 'selected' : "" }>도시명</option>
				<option value="C" ${pageMaker.cri.type =='C'? 'selected' : "" }>사업자번호</option>
				<option value="T" ${pageMaker.cri.type =='T'? 'selected' : "" }>대표번호</option>
				<option value="S" ${pageMaker.cri.type =='S'? 'selected' : "" }>상태</option>
			</select> <input class="input" name="keyword" value="${pageMaker.cri.keyword }">
			 <input
				type="hidden" name="pageNum" value="1"> <input type="hidden"
				name="amount" value="${pageMaker.cri.amount }">
			<button class="btn btn-primary" onclick="$('[name=pageNum]').val(1)">Search</button>
		</form>
									</div>
								</div>
							</div>

							<div class="col-sm-12">
								<div class="d-flex align-items-center justify-content-center mb-2">
									<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>업체명</th>
					<th>사업자번호</th>
					<th>사업자주소</th>
					<th>대표번호</th>
					<th>상태</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="company" items="${companyList }">
				<c:set var="cmpn" value="${company.get('companyVO')}" />
				<tr>
					<td>${cmpn.seq }</td>
					<td>${cmpn.name}</td>
					<td>${cmpn.cmpnNum }</td>
					<td>${cmpn.addr1 } ${cmpn.addr2 } ${cmpn.area }</td>
					<td>${cmpn.tel }</td>
					<td>${company.get('status')}</td>

					<td>
					 <a class="move" href="${cmpn.seq }">상세보기</a>
					</td>

				</tr>
			</c:forEach>
		</tbody>
		</table>
								</div>
							</div>
							

							<div class="col-sm-12">
								<div class="d-flex align-items-center justify-content-center mb-2">
							<div id="pageButton">
  	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
			<li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">이전</a></li>
			<span aria-hidden="true">&laquo;</span>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
			var="num">
				<li class="page-item"><a class="page-link" href="${num }">${num }</a></li>
		</c:forEach>
		<c:if test="${pageMaker.next }">
			<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">다음</a></li>
			<span aria-hidden="true">&laquo;</span>
		</c:if>
	</ul>
	</div>
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

		$("#pageButton a").on("click", function(e) {
			e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
			var p = $(this).attr("href");
			$('[name="pageNum"]').val(p);
			actionForm.submit();
		});
	});






</script>

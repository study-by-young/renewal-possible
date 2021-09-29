<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
.dash {
	background: #ffffff;
	box-shadow: 0px 0 8px rgb(0 0 0/ 10%);
	float: left;
	width: 100%;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-top: 0px;
	margin-bottom: 70px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

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
<div class="content">
<div class="col-md-8">
	<div class="blog_single_comment_heading">
		<h4>업체정보관리</h4>
	</div>
	<div class="dash">
	
	    <input type="checkbox" name="area" value='서울특별시'> 서울
        <input type="checkbox" name="area" value='경기도'> 경기
        <input type="checkbox" name="area" value='인천광역시'> 인천
        <input type="checkbox" name="area" value='강원도'> 강원
        <input type="checkbox" name="area" value='충청북도'> 충북
        <input type="checkbox" name="area" value='충청남도'> 충남
        <input type="checkbox" name="area" value='대전광역시'> 대전
        <input type="checkbox" name="area" value='세종특별자치시'> 세종
        <input type="checkbox" name="area" value='광주광역시'> 광주
        <input type="checkbox" name="area" value='전라북도'> 전북
        <input type="checkbox" name="area" value='전라남도'> 전남
        <input type="checkbox" name="area" value='경상북도'> 경북
        <input type="checkbox" name="area" value='경상남도'> 경남
        <input type="checkbox" name="area" value='대구광역시'> 대구
        <input type="checkbox" name="area" value='부산광역시'> 부산
        <input type="checkbox" name="area" value='울산광역시'> 울산
        <input type="checkbox" name="area" value='제주특별자치도'> 제주
		
	<div>
		<form id="actionForm" action="companyList" method="get">
			<select name="type" class="select" >
				<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
				<option value="N" ${pageMaker.cri.type =='N'? 'selected' : "" }>업체명</option>
				<option value="C" ${pageMaker.cri.type =='C'? 'selected' : "" }>사업자번호</option>
				<option value="T" ${pageMaker.cri.type =='T'? 'selected' : "" }>대표번호</option>
			</select> <input class="input" name="keyword" value="${pageMaker.cri.keyword }"> <input
				type="hidden" name="pageNum" value="1"> <input type="hidden"
				name="amount" value="${pageMaker.cri.amount }">
			<button class="btn btn-primary">Search</button>
		</form>
	</div>
	
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>업체명</th>
					<th>대표자</th>
					<th>사업자번호</th>
					<th>사업자주소</th>
					<th>대표번호</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="companyList" items="${companyList }">
				<tr>
					<td>${companyList.seq }</td>
					<td>${companyList.name}</td>
					<td>${companyList.postal}</td>
					<td>${companyList.cmpnNum }</td>
					<td>${companyList.addr1 }</td>
					<td>${companyList.addr2 }</td>
					<td>${companyList.area }</td>
					<td>${companyList.tel }</td>
					<td>
					<a class="move" href="${companyList.seq }">상세보기</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	<br>
	<!-- 페이징 -->
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
							actionForm.attr("action", "companyOneSelect") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
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
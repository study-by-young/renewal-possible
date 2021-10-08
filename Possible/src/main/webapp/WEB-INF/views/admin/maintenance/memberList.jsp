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
<div align="center">
<div class="col-md-8">
	<div class="blog_single_comment_heading">
		<h4>회원 관리</h4>
	</div>
	<div class="dash">
	<div align="center">
		<form id="actionForm" action="member" method="get">
			<select name="type" class="select" >
				<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
				<option value="I" ${pageMaker.cri.type =='I'? 'selected' : "" }>아이디</option>
				<option value="N" ${pageMaker.cri.type =='N'? 'selected' : "" }>이름</option>
				<option value="P" ${pageMaker.cri.type =='P'? 'selected' : "" }>전화번호</option>
				<option value="A" ${pageMaker.cri.type =='P'? 'selected' : "" }>권한</option>
			</select> <input class="input" name="keyword" value="${pageMaker.cri.keyword }"> <input
				type="hidden" name="pageNum" value="1"> <input type="hidden"
				name="amount" value="${pageMaker.cri.amount }">
			<button class="btn btn-primary" onclick="$('[name=pageNum]').val(1)">Search</button>
		</form>
	</div>
	<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>전화번호</th>
					<th>이름</th>
					<th>권한</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="memberList" items="${memberList }">
				<tr>
					<td>${memberList.seq }</td>
					<td>${memberList.id}</td>
					<td>${memberList.phone }</td>
					<td>${memberList.name }</td>
					<td>${memberList.author }</td>
					<td><a class="move" href="${memberList.seq }">상세보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	<br>
	
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
							actionForm.attr("action", "member/view") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
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
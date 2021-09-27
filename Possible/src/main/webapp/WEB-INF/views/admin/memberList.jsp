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
</style>

<!-- 관리자 - 회원관리 -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원관리</h1>
	</div>

	<table class="table">
		<thead>
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="memberList" items="${memberList }">
				<tr>
					<td>${memberList.seq }</td>
					<td><a class="move" href="${memberList.id }">${memberList.id}</a></td>
					<td>${memberList.phone }</td>
					<td>${memberList.name }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="actionForm" action="memberList" method="get">
		<select name="type">
			<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
			<option value="I" ${pageMaker.cri.type =='I'? 'selected' : "" }>아이디</option>
			<option value="N" ${pageMaker.cri.type =='N'? 'selected' : "" }>이름</option>
			<option value="P" ${pageMaker.cri.type =='P'? 'selected' : "" }>전화번호</option>
			<option value="IN" ${pageMaker.cri.type =='IN'? 'selected' : "" }>아이디
				OR 이름</option>
			<option value="IP" ${pageMaker.cri.type =='IP'? 'selected' : "" }>아이디
				OR 전화번호</option>
			<option value="INP" ${pageMaker.cri.type =='INP'? 'selected' : "" }>아이디
				OR 이름 OR 전화번호</option>
		</select> <input name="keyword" value="${pageMaker.cri.keyword }"> <input
			type="hidden" name="pageNum" value="1"> <input type="hidden"
			name="amount" value="${pageMaker.cri.amount }">
		<button class="btn btn-default">Search</button>
	</form>
	<div id="pageButton">
		<c:if test="${pageMaker.prev }">
			<a href="${pageMaker.startPage-1}">이전</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
			var="num">
			<a href="${num }">${num }</a>
		</c:forEach>
		<c:if test="${pageMaker.next }">
			<a href="${pageMaker.endPage+1}">다음</a>
		</c:if>
	</div>
</div>
<div>
	<button type="button" class="btn btn-defult"
		onclick="location.href='register'">등록페이지</button>
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
							actionForm.attr("action", "modify") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
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
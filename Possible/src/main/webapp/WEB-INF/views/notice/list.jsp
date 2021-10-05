<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
tr:hover {
	color: blue;
	cursor: pointer;
}
.custom-input input {
    /* width: 100%; */
    height: 42px;
    padding-left: 10px;
    border: 1px solid #e8e8e8;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 5px;
}
.custom-btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.custom-pagination>li>a {
    color: #111111;
    float: left;
    background: #ffffff;
    font-size: 16px;
    box-shadow: 0px 0 8px rgb(0 0 0 / 10%);
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    text-transform: uppercase;
    -webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
    width: 50px;
    height: 50px;
    line-height: 50px;
    text-align: center;
    margin-right: 2px;
}
.custom-pagination>li>a:hover {
	color: white;
	background: #007bff;
}

</style>


<div class="container">
	<div style="margin-top: 50px;">
		<!-- Striped rows -->
		<div class="card">
			<div class="card-header header-elements-inline">
				<h2 class="card-title">공지사항</h2>
				<div class="header-elements">
					<div class="list-icons">
						<a class="list-icons-item" data-action="collapse"></a> <a
							class="list-icons-item" data-action="reload"></a> <a
							class="list-icons-item" data-action="remove"></a>
					</div>
				</div>

				<div class="custom-input">
					<form id="actionForm"
						action="${pageContext.request.contextPath}/notice/list"
						method="get">
						<select name="type" class="select">
							<option
								<c:out value="${empty pageMaker.cri.type ? 'selected':''}"/>>선택</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
							<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목
								or 내용</option>
						</select> &nbsp; 
						<input class="input" name="keyword" value="${pageMaker.cri.keyword}"> 
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">&nbsp;
						<button class="custom-btn btn-primary" onclick="$('[name=pageNum]').val(1)">검색</button>
					</form>
				</div>

			</div>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr align="center">
							<th class="col-1">글번호</th>
							<th class="col-6">제목</th>
							<th class="col-1">작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th class="col-1">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="notice">
							<tr align="center" onclick="readBoard(${notice.seq})">
								<td>${notice.seq}</td>
								<td align="left">${notice.title}</td>
								<td>${notice.writer}</td>
								<td><fmt:formatDate value="${notice.genDate}"
										pattern="yy-MM-dd" /></td>
								<td><fmt:formatDate value="${notice.uptDate}"
										pattern="yy-MM-dd" /></td>
								<td>${notice.views}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /striped rows -->
	</div>

	<!-- 페이징 -->
	<div id="pageButton" style="margin-top: 20px">
		<ul class="custom-pagination">
			<c:if test="${pageMaker.prev }">
				<li class="page-item"><a
					href="${pageMaker.startPage-1}">이전</a></li>
				<!-- <span aria-hidden="true">&laquo;</span> -->
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="num">
				<li class="page-item"><a href="${num }">${num }</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class="page-item"><a
					href="${pageMaker.endPage+1}">다음</a></li>
				<!-- <span aria-hidden="true">&laquo;</span> -->
			</c:if>
		</ul>
	</div>

	<div align="right">
		<button type="button" class="btn btn-primary"
			onclick="location.href='insert'">등록</button>
	</div>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-laballedby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<br>
</div>
<script>
$(document).ready(function() {
	var insertResult = '<c:out value="${insertResult}"/>';
	var deleteResult = '<c:out value="${deleteResult}"/>';
	checkModal(insertResult, deleteResult);
	
 	function checkModal(insertResult, deleteResult) {
		if (insertResult === '' && deleteResult === '') {
			return;
		}
		if (parseInt(insertResult) > 0) {
			$('.modal-body').html(parseInt(insertResult) + " 번 게시글이 등록되었습니다.");
		}
		if (parseInt(deleteResult) > 0) {
			$('.modal-body').html(parseInt(deleteResult) + " 번 게시글의 삭제가 완료되었습니다.");
		}
		$('#myModal').modal('show');
	} 	
})

$(function() {
	var actionForm = $("#actionForm");

	$(".move").on("click", function(e) {
						e.preventDefault();
						
						var seq = $(this).attr("href"); //클릭한 게시글의 번호를 읽어와서 
						actionForm.append('<input type="hidden" name="seq" value="'+ seq +'">') //여기넣어주고
						actionForm.attr("action", "${pageContext.request.contextPath}/notice/get") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
						actionForm.submit(); //실행
	});

	$("#pageButton a").on("click", function(e) {
		e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
		var p = $(this).attr("href");
		$('[name="pageNum"]').val(p);
		actionForm.submit();
	});
});

function readBoard(seq){
	location.href = 'get?seq='+seq+'&pageNum='+$('input[name="pageNum"]').val()+'&amount='+$('input[name="amount"]').val();
}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="lr_bc_first_box_img_cont_wrapper">
		<h2>${notice.title}</h2>
		<ul>
			<li><i class="fa fa-calendar"></i>&nbsp; <a>${notice.writer}</a></li>
			<li><i class="fa fa-user-o"></i>&nbsp; <a>${notice.genDate}</a></li>
			<li><i class="fa fa-comments-o"></i>&nbsp; <a>${notice.views}</a></li>
		</ul>
		<p>${notice.content}</p>
	</div>
	<div class="lr_bc_first_box_img_cont_wrapper" align="right">
		<button class="btn btn-primary" type="button" id="list_btn">목록</button>
		<button class="btn btn-dark" type="button" id="update_btn">수정</button>
		<button id="deleteBtn" type="button" class="btn btn-dark">삭제</button>
	</div>
	<form id="intoForm"
		action="${pageContext.request.contextPath}/notice/update" method="get">
		<input type="hidden" id="seq" name="seq"
			value='<c:out value="${notice.seq}"/>'> <input type="hidden"
			id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" id="amount" name="amount"
			value='<c:out value="${cri.amount}"/>'>
	</form>
	ddd  ${notice.attachList}
	<div class="form-group"><br>
	    <!-- 첨부파일 -->
	    <c:forEach var="attach" items="${notice.attachList}">
	       <p><a href="download?name=${attach.name}">${attach.orgName}</a></p>
	    </c:forEach>
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
	
</div>
<br>
<br>
<script>
	$('#deleteBtn').on('click', function() {

		var result = confirm('삭제 하시겠습니까?');

		if (result == true) {
			location.href = 'delete?seq=${notice.seq}';
			form.find("#seq").remove();
			form.attr("action",
					"${pageContext.request.contextPath}/notice/list?pageNum="
							+ $('#pageNum').val() + "&amount="
							+ $('#amount').val());
			form.submit();
		} else {
			return;
		}
	})

	let form = $("#intoForm");

	$("#list_btn").on(
			"click",
			function(e) {
				form.find("#seq").remove();
				form.attr("action",
						"${pageContext.request.contextPath}/notice/list?pageNum="
								+ $('#pageNum').val() + "&amount="
								+ $('#amount').val());
				form.submit();
			})

	$("#update_btn").on("click", function(e) {
		form.attr("action", "${pageContext.request.contextPath}/notice/update")
		form.submit();
	})
	
	$(document).ready(function(){
		var updateResult = '<c:out value="${updateResult}"/>';
		checkModal(updateResult);
		
		function checkModal(updateResult) {
			if (updateResult === '') {
				return;
			}
			if (parseInt(updateResult) > 0) {
				$('.modal-body').html(parseInt(updateResult) + " 번 게시글의 수정이 완료되었습니다.");
			}
			$('#myModal').modal('show');
		}
	})
</script>
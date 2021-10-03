<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<table>
<c:forEach var="rent" items="${list}">
		<tr>
			<td>하: ${rent.merchantUid}</td>
			<td><button id="refundBtn" type="button" value="${rent.merchantUid}">취소하기</button></td>
		</tr>
</c:forEach>
	</table>

<script>
	// 문제1. 첫번째 버튼만 눌린다.
	// 문제2. 결제취소 성공시 db처리 작업 ajax가 안 먹는다.
	$('#refundBtn').on('click', function(){
		let uid = $(this).val();
		
		$.ajax({
			url: '../refund/' + uid,
			type: 'post',
			success: function(){
				alert('결제가 취소되었습니다.');
				// location.href = 'paymentCancel?uid=' + uid;
			},
			error: function(xhr, status, message){
				alert('status: ' + status + ' er: ' + message);
			}
		}).done(function(result) {
			if(result.success){
				$.ajax({
					url: 'paymentCancel',
					type: 'put',
					data: { uid : uid },
					dataType: 'text',
					contentType: 'application/json',
					success: function(){
					},
					error: function(xhr, status, message){
						alert('status: ' + status + ' er: ' + message);
					}
				});				
			}
		}).fail(function(xhr, status, message) {
			alert('status: ' + status + ' er: ' + message);
		});
	});

</script>
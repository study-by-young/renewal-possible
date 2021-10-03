<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<table>
<c:forEach var="rent" items="${list}">
		<tr>
			<td>하: ${rent.merchantUid}</td>
			<td><button class="refundBtn" id="refundBtn" type="button" value="${rent.merchantUid}">취소하기</button></td>
		</tr>
</c:forEach>
	</table>

<script>
	// forEach 돌리고 id로 불러오면 첫번째 버튼만 활성화 되기 때문에 class로 불러온다.
	$('.refundBtn').on('click', function(e){
		e.preventDefault();
		if(confirm('예약을 취소하시겠습니까?')){
			let uid = $(this).val();
			
			$.ajax({
				url: '../refund/' + uid,
				type: 'post',
				data: { uid : uid },
				dataType: 'text',
				success: function(){
					alert('예약이 취소되었습니다.');
				}
			}).done(function(data, textStatus, xhr) { // 결제취소 성공 시 db에 update 처리
				// console.log(xhr);
				$.ajax({
					url: 'paymentCancel/' + uid,
					type: 'put',
					dataType: 'text',
					success: function(){},
					error: function(){}
				});				
			}).fail(function(xhr, status, message) {
				alert('status: ' + status + ' er: ' + message);
			});
		} else {
			return false;
		}
	});

	
	
	
/*	
	$('#refundBtn').on('click', function(){
		let uid = $(this).val();
		
		$.ajax({
			url: '../refund/' + uid,
			type: 'post',
			data: { uid : uid },
			dataType: 'text',
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
	
*/	
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<form id="updateForm" name="updateForm" role="form" action="update" method="post">
			<div class="row">
				<div class="col-md-12">
					<div
						class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
						<h3>공지사항 수정</h3>
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form1">
						<input type="text" name="title" placeholder="제목 무조끈 *"
							value="${notice.title }">
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input type="text" name="writer" placeholder="Writer"
							value="${notice.writer }" readonly="readonly">
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form4">
						<textarea name="content" id="content" class="ckeditor" required="required">${notice.content}</textarea>			
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
					align="right">
					<input type="hidden" name="seq" value="${notice.seq }"> <input
						type="hidden" name="pageNum" value="${cri.pageNum }"> <input
						type="hidden" name="amount" value="${cri.amount }">
					<button id="updateBtn" type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-dark" onclick="location.href='get?seq=${notice.seq}&pageNum=${cri.pageNum}&amount=${cri.amount}'">취소</button>
					<button type="button" class="btn btn-dark"
						onclick="location.href='list?pageNum=${cri.pageNum}&amount=${cri.amount}'">목록</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	CKEDITOR.instances.content.getData()
	
	$('#updateBtn').on('click', function(){
		if(updateForm.content.value == ""){
			updateForm.content.focus();
			alert("내용을 입력해 주십시오.");
		}
	});
</script>
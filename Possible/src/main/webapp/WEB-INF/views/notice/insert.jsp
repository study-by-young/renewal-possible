<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<form id="insertForm" name="insertForm" role="form"
			action="${pageContext.request.contextPath}/notice/insert"
			method="post">
			<div class="row">
				<div class="col-md-12">
					<div
						class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
						<h3>공지사항 등록</h3>
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form1">
						<input type="text" name="title" placeholder="제목 무조끈 *"
							required="required">
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input type="text" name="writer" placeholder="Writer"
							value="admin" readonly="readonly">
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form4">
						<textarea name="content" id="content" class="ckeditor" required="required"></textarea>
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
					align="right">
					<button id="insertBtn" type="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-dark"
						onclick="location.href='list'">목록</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	CKEDITOR.instances.content.getData()
	
	
	$(document).ready(function(){
		
		$('#insertBtn').on('click', function(){
			check();
		});

		function check(){
			if(CKEDITOR.instances.content.getData() == "" || CKEDITOR.instances.content.getData().length == 0) {
			    alert('내용을 입력해주세요.');
			    CKEDITOR.instances.content.focus();
			    return false;
			} else {
				$('#insertForm').submit();
			}
		}
	});
	
	

</script>
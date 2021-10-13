<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<form id="updateForm" role="form"
			action="update"
			method="post">
			<div class="row">
				<div class="col-md-12">
					<div
						class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
						<h3>자주 묻는 질문&답변 수정</h3>
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form1">
						<input type="text" name="title" placeholder="질문내용 *"
							value="${faq.title}">
					</div>
				</div>
				<div
					class="col-xl-5 offset-xl-1 col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input type="text" name="writer" placeholder="Writer"
							value="${faq.writer}" readonly="readonly">
					</div>
					<br>
				</div>
				<div class="col-xl-5 offset-xl-1 col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<select name="category" class="select">
							<option value="">카테고리선택</option>
							<option value="대여안내">대여안내</option>
							<option value="인수/반납">인수/반납</option>
							<option value="자차보험">자차보험</option>
							<option value="취소/환불">취소/환불</option>
						</select>
					</div>
				</div>	
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form4">
						<textarea name="content" id="content" class="ckeditor" required="required">${faq.content}</textarea>
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
					align="right">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-dark"
						onclick="location.href='list'">목록</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	CKEDITOR.instances.content.getData()
	$('#content').attr("required", true)
</script>
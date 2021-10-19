<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<form id="insertForm" role="form"
			action="${pageContext.request.contextPath}/qna/insert"
			method="post">
			<div class="row">
				<div class="col-md-12">
					<div
						class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
						<h3>1:1 문의 등록</h3>
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form1">
						<input type="text" name="title" placeholder="제목 *"
							required="required">
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input type="text" name="writer" placeholder="Writer"
							value="user" readonly="readonly">
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form4">
						<textarea name="content" id="content" class="ckeditor" required></textarea>
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
					align="right">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-dark"
						onclick="location.href='list?pageNum=${param.getOrDefault("pageNum",1)}&amount=${param.getOrDefault("amount", pagination.cri.amount)}'">목록</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	CKEDITOR.instances.content.getData()
	$('#content').attr("required", true)
</script>
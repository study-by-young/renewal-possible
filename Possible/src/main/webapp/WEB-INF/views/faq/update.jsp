<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.card-header+.card-footer {
	border-bottom: 0px;
}

.card-footer {
	background-color: white;
	border-top: 0px;
}

input[type=file] {
	display: inline;
	width: 20%;
}

.btn {
	padding: .4rem .65rem;
}

.input_title {
	width: 108.5%;
	height: 50px;
	border: 1px solid lightgray;
	padding: 10px 8px;
	border-radius: 5px;
}

.card {
	margin-bottom: 3rem;
}
</style>

<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="card" style="margin-top: 50px; padding: 20px;">
			<form id="updateForm" name="updateForm" role="form" action="update"
				method="post">
				<div class="row">

					<div class="col-lg-12 col-md-12">
						<div class="card-header">
							<div
								class="card-header col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12"
								style="padding-top: 0px; padding-left: 0px;">
								<div class="contect_form1">
									<h2 style="font-weight: 600;">자주 묻는 질문 & 답변 수정</h2>
								</div>
							</div>

							<div class="row">

								<div class="col-2"
									style="padding: 18px 0px; padding-left: 10px;">
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
								&nbsp; &nbsp;
								<div class="col-9"
									style="padding: 10px 0px; padding-right: 0px;">
									<div class="contect_form1">
										<input class="input_title" type="text" name="title"
											value="${faq.title}">
									</div>

								</div>
								<%-- <div
						class="col-xl-5 offset-xl-1 col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="contect_form2">
							<input type="text" name="writer" placeholder="Writer"
								value="${faq.writer}" readonly="readonly">
						</div>
						<br>
					</div> --%>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12"
								style="padding: 10px 0px;">
								<div class="contect_form4">
									<textarea name="content" id="content" class="ckeditor"
										required="required">${faq.content}</textarea>
								</div>
								<br>
							</div>
							<div
								class="card-footer col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12"
								align="right" style="padding-right:0px;">
								<input type="hidden" name="seq" value="${faq.seq }">
								<button id="updateBtn" type="submit" class="btn btn-primary">수정</button>
								<button type="button" class="btn btn-dark"
									onclick="location.href='list'">목록</button>
							</div>
							
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	CKEDITOR.instances.content.getData();
	$('#content').attr("required", true);
</script>
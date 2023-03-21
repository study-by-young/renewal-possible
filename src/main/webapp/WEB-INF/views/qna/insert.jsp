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
		width: 100%;
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
			<form id="insertForm" role="form" action="${pageContext.request.contextPath}/qna/insert" method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card-header">
							<div class="card-header col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 0px; padding-left: 0px;">
								<div class="contect_form1">
									<h2 style="font-weight: 600;">1:1 문의 등록</h2>
								</div>
							</div>
							<div class="card-header col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 10px 0px;">
								<div class="contect_form1">
									<input class="input_title" type="text" name="title" id="title" placeholder=" 제목을 입력해주세요. *">
								</div>
							</div>
							<div class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="contect_form2">
									<input type="hidden" name="writer" placeholder="writer" value="${user.id}" readonly="readonly">
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
								<div class="contect_form4">
									<textarea name="content" id="content" class="ckeditor"></textarea>
								</div>
								<br>
							</div>
							<input type="hidden" id="memSeq" name="memSeq" value="${user.seq}">
						</div>
						<div class="card-footer col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12"
							align="right">
							<button id="insertBtn" type="button" class="btn btn-primary">등록</button>
							<%-- <button type="button" class="btn btn-dark"
								onclick="location.href='list?pageNum=${cri.pageNum}&amount=${cri.amount}'">목록</button> --%>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
/* 	$("#insertBtn").on("click", function() {
		check();
	});
	
	function check() {
		if (CKEDITOR.instances.content.getData() == "" || CKEDITOR.instances.content.getData().length == 0) {
			alert("내용을 입력해주세요.");
			CKEDITOR.instances.content.focus();
			return false;
		} else {
			$("#insertForm").submit();
		}
	} */
	
	$("#insertBtn").on("click", function() {
		//입력값 검증
		if ($("#title").val().length == 0) {
			alert("제목을 입력해주세요.")
			$("#title").focus();
			return false;
		} else if (CKEDITOR.instances.content.getData().length == 0) {
			alert("내용을 입력해주세요.")
			CKEDITOR.instances.content.focus();
			return false;
		} else {
			$("#insertForm").submit();
		}

	});
</script>
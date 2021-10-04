<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div
					class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
					<h3>코스 등록</h3>
				</div>
			</div>
			<div
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="contect_form1">
					<input type="text" placeholder="Title *">
				</div>
			</div>
			<div
				class="col-xl-5 offset-xl-1 col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="contect_form2">
					<input type="text" placeholder="Writer" readonly="readonly">
				</div>
			</div>
			<div class="col-xl-5 col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="contect_form2">
					<input type="email" placeholder="Date" readonly="readonly">
				</div>
				<br>
			</div>
			<div
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
				style="background-color: white; border: 1px solid lightgray; border-radius: 10px;">
				<hr style="border: 0; height: 3px; background: #ccc;">
				<h3>코스</h3>
				<hr>
				<ul>
					<li><i class="fa fa-long-arrow-right"></i> &nbsp;&nbsp;<a
						href="#">고남패총박물관 </a></li>
					<hr>
					<li><i class="fa fa-long-arrow-right"></i> <a href="#">
							&nbsp;&nbsp;보령방조제</a></li>
					<hr>
					<li><i class="fa fa-long-arrow-right"></i> <a href="#">
							&nbsp;&nbsp;궁리포구 </a></li>
					<hr>
					<li><i class="fa fa-long-arrow-right"></i> <a href="#">
							&nbsp;&nbsp;보령 충청수영성</a></li>
					<hr>
				</ul>
				<hr style="border: 0; height: 3px; background: #ccc;">
			</div>
			<div
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
				style="background-color: white; border: 1px solid lightgray; border-radius: 10px; margin-top: 30px;">
				<div class="input-group mb-3" style="margin-top: 15px;">
						<select name="type" class="select">
							<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
							<option value="A" ${pageMaker.cri.type =='A'? 'selected' : "" }>관광지</option>
							<option value="C" ${pageMaker.cri.type =='C'? 'selected' : "" }>문화시설</option>
						</select> <input type="text" name="loc" value="${pageMaker.cri.keyword }"
							class="form-control" placeholder="떠나고 싶은 장소를 검색해보세요."
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button id="tourSearch" class="btn btn-outline-secondary"
								type="button">검색</button>
							<ul id="tourList">

							</ul>
						</div>
				</div>
			</div>
			<div
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="contect_form4">
					<textarea rows="5" placeholder="코스에 대한 간략한 설명을 기재할 수 있습니다."></textarea>
				</div>
			</div>
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="contect_btn contect_btn_contact">
					<ul>
						<li><a href="#">등록 <i class="fa fa-arrow-right"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$("#tourSearch").on("click", function() {
		$.ajax({
			type : 'GET',
			url : '/tourSearch/A/경주',
			/* data : {
				type : "A",
				keyword : "경주"
			},
			dataType : "json",
			contentType : "application/json;charset='utf-8'", */
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$('#tourList').append($("<li />").text(data.title[i]));
				}
			}
		})
	})
</script>

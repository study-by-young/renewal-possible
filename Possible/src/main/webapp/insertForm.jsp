<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.custom_submit {
	float: left;
	width: 150px;
	height: 50px;
	line-height: 45px;
	text-align: center;
	background: #4f5dec;
	color: #FFFFFF;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

.custom_reset {
	float: left;
	width: 150px;
	height: 50px;
	line-height: 45px;
	text-align: center;
	background: #E4E4E4;
	color: #FFFFFF;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}
</style>

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
					<input type="text" placeholder="Date" readonly="readonly">
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
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="contect_form2">
					<input type="text"><button type="button">검색</button>
				</div>
			</div>
			<div
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="contect_form4">
					<textarea rows="5" placeholder="코스에 대한 간략한 설명을 기재할 수 있습니다."></textarea>
				</div>
			</div>
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div style="margin-top: 30px;">
					<ul>
						<li><button class="custom_reset" type="reset"
								style="float: right;">취소</button></li>
						<li><button class="custom_submit" type="submit"
								style="float: right;">등록</button></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
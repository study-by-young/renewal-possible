<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<style>
	.custom-div {
		margin-top: 10px;
		text-align:center;
		height: 150px;
		overflow: auto;
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
					<input type="email" placeholder="Date" readonly="readonly">
				</div>
				<br>
			</div>
			<div
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
				style="background-color: white; border: 1px solid lightgray; border-radius: 10px;">
				<hr style="border: 0; height: 3px; background: #ccc;">
				<h3>코스</h3>
				<div id="takePlaceMap" style="height:300px;"></div>
				<hr>
				<ul id="selectList">
				</ul>
				<hr style="border: 0; height: 3px; background: #ccc;">
			</div>
			<div
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
				style="background-color: white; border: 1px solid lightgray; border-radius: 10px; margin-top: 30px;">
				<div class="input-group mb-3" style="margin-top: 15px;">
						<select id="type" name="type" class="select">
							<option value="T" ${pageMaker.cri.type =='T'? 'selected' : "" }>선택</option>
							<option value="A" ${pageMaker.cri.type =='A'? 'selected' : "" }>관광지</option>
							<option value="C" ${pageMaker.cri.type =='C'? 'selected' : "" }>문화시설</option>
						</select> <input type="text" id="loc" name="loc" value="${pageMaker.cri.keyword }"
							class="form-control" placeholder="떠나고 싶은 장소를 검색해보세요."
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button id="tourSearch" class="btn btn-outline-secondary"
								type="button">검색</button>
						</div>
						<div class="col-12 custom-div">
						<ul id="tourList" style="display:inline-block; *display:inline; zoom:1;">
							<li style="float:left; margin-left:-1px; margin-top:70px; z-index:1; pointer-events: none;"><i class="fa fa-map-marker"></i> 여행지를 검색 후 나의 코스에 추가해보세요!</li>
						</ul>
						</div>
				</div>
			</div>
			<div
				class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
				style="margin: 10px">
				<div class="contect_form4 col-12" align="center">
					<textarea name="content" id="content" class="ckeditor"> </textarea>
				<!-- 	<textarea rows="5" placeholder="코스에 대한 간략한 설명을 기재할 수 있습니다. 쒸익"></textarea> -->
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
			url : '../courseBoard/tourSearch/'+$("#type option:selected").val()+'/'+$('#loc').val(),
			/* data : {
				type : "A",
				keyword : "경주"
			},
			dataType : "json", */
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				console.log(data);
				$('#tourList li').empty();
				for (var i = 0; i < data.length; i++) {
					$('#tourList').append($('<li style="cursor: pointer;" />').text(data[i].title+' | '+ data[i].addr1));
				}
			}
		})
	});
	
 	$("#tourList").on("click","li", function() {
		$("#selectList").append('<li><i class="fa fa-long-arrow-right"></i>&nbsp;&nbsp;'+$(this).text()+'</i>').append('<hr>');
	});
 	
 	 $(function(){
         var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
         var options = { //지도를 생성할 때 필요한 기본 옵션
             center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
             level: 3 //지도의 레벨(확대, 축소 정도)
         };

         var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
     });

	CKEDITOR.instances.content.getData()
</script>

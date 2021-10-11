<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
response.setContentType("text/html; charset=utf-8");
%>
<style>
.custom-div {
	margin-top: 10px;
	text-align: center;
	height: 150px;
	overflow: auto;
}
</style>
<form id="frm" name="frm" role="form">	
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
						<input id="title" name="title" type="text" placeholder="Title *">
					</div>
				</div>
				<div
					class="col-xl-5 offset-xl-1 col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input id="writer" name="writer" value="토비" type="text"
							placeholder="Writer" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-5 col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input type="text" id="genDate" name="genDate" value="2021-10-07"
							placeholder="Date" readonly="readonly">
					</div>
				</div>
				<div
					class="col-xl-5 offset-xl-1 col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input id="startDate" name="startDate" type="text"
							placeholder="원하는 시작 날짜를 선택하세요" class="form-control datepicker">
					</div>
				</div>
				<div class="col-xl-5 col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input id="endDate" name="endDate" type="text"
							placeholder="원하는 종료 날짜를 선택하세요" class="form-control datepicker">
						<br>
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
					style="background-color: white; border: 1px solid lightgray; border-radius: 10px;">
					<hr style="border: 0; height: 3px; background: #ccc;">
					<h3>코스</h3>
					<div id="takePlaceMap"
						style="margin-top: 10px; margin-bottom: 10px; height: 400px;"></div>
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
						</select> <input type="text" id="loc" name="loc"
							value="${pageMaker.cri.keyword }" class="form-control"
							placeholder="떠나고 싶은 장소를 검색해보세요."
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button id="tourSearch" class="btn btn-outline-secondary"
								type="button">검색</button>
						</div>
						<div class="col-12 custom-div">
							<ul id="tourList"
								style="display: inline-block; *display: inline; zoom: 1;">
								<li
									style="float: left; margin-left: -1px; margin-top: 70px; z-index: 1; pointer-events: none;"><i
									class="fa fa-map-marker"></i> 여행지를 검색 후 나의 코스에 추가해보세요!</li>
							</ul>
						</div>
					</div>
				</div>
				<div
					class="col-xl-12 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
					style="margin: 10px">
					<div class="contect_form4 col-12" align="center"
						style="margin-up: 10px">
						<textarea id="content" name="content" class="ckeditor"> </textarea>
						<!-- 	<textarea rows="5" placeholder="코스에 대한 간략한 설명을 기재할 수 있습니다. 쒸익"></textarea> -->
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_btn contect_btn_contact">
						<ul>
							<li><a class="insert">등록 <i class="fa fa-arrow-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<form id="idFrm" name="idFrm" role="form">
</form>
<script>
	$(function() {
		var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(35.86911924611688, 128.5932113110608), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		/* // 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map); */

		var list = [];
		$("#tourSearch")
				.on(
						"click",
						function() {
							$
									.ajax({
										type : 'GET',
										url : '../course/tourSearch/'
												+ $("#type option:selected")
														.val() + '/'
												+ $('#loc').val(),
										/* data : {
											type : "A",
											keyword : "경주"
										},
										dataType : "json", */
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										success : function(data) {
											list = data;
											console.log(list);
											$('#tourList li').empty();
											for (var i = 0; i < data.length; i++) {
												$('#tourList')
														.append(
																$(
																		'<li data-contentId="'+data[i].contentId+'" data-mapX="'+data[i].mapX+'" data-mapY="'+data[i].mapY+'" style="cursor: pointer;" />')
																		.text(
																				data[i].title
																						+ ' | '
																						+ data[i].addr1));
											}
										}
									})
						});
		var markers = [];
		var marker;
		var markersIdx = [];
		var markerIdx = 0;
		var polyline;
		$("#tourList")
				.on(
						"click",
						"li",
						function() {
							$("#selectList")
									.append(
											'<li data-markerIdx="' + markerIdx + '" style="cursor: pointer;"><i class="fa fa-long-arrow-right"></i>&nbsp;&nbsp;'
													+ $(this).text()
													+ '<span style="float: right"><i class="fa fa-times-circle"></i></span></li>')
									.append('<hr>');
							$("#idFrm")
									.append('<input data-markerIdx="' + markerIdx + '" type="hidden" id="contentId" name="contentId" value="'+$(this).attr("data-contentId")+'">');
							
							// 마커가 표시될 위치입니다 
							var markerPosition = new kakao.maps.LatLng($(this).attr("data-mapY"), $(this).attr("data-mapX"));

							// 마커를 생성합니다
							marker = new kakao.maps.Marker({
								position : markerPosition
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);

							markers.push(marker);
							markersIdx.push(markerIdx);
							console.log(markerPosition.getLat());
							console.log(markerPosition.getLng());
							markerIdx++;
							// 이동할 위도 경도 위치를 생성합니다 
							var moveLatLon = new kakao.maps.LatLng(
									markerPosition.getLat(), markerPosition
											.getLng());

							// 지도 중심을 부드럽게 이동시킵니다
							// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
							map.panTo(moveLatLon);

							if (markers.length >= 2) {
								var xy1 = markers[(markerIdx - 2)]
										.getPosition();
								var xy2 = markers[(markerIdx - 1)]
										.getPosition();
								var x1 = xy1.getLat();
								var y1 = xy1.getLng();
								var x2 = xy2.getLat();
								var y2 = xy2.getLng();
								// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
								var linePath = [ new kakao.maps.LatLng(x1, y1),
										new kakao.maps.LatLng(x2, y2) ];

								// 지도에 표시할 선을 생성합니다
								polyline = new kakao.maps.Polyline({
									path : linePath, // 선을 구성하는 좌표배열 입니다
									strokeWeight : 5, // 선의 두께 입니다
									strokeColor : '#9999FF', // 선의 색깔입니다
									strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
									strokeStyle : 'solid' // 선의 스타일입니다
								});

								// 지도에 선을 표시합니다 
								polyline.setMap(map);
							}
						});

		$("#selectList").on("click", "li", function() {
			var targetIdx = $(this).attr("data-markerIdx");
			console.log(targetIdx);
			$("#idFrm input[data-markerIdx="+targetIdx+"]").remove(); // 확인 필
			$(this).next().remove();
			$(this).remove();

			markers[targetIdx].setMap(null);
			console.log('list : ' + markersIdx);
			console.log('idx : ' + markersIdx.indexOf(targetIdx));
			polyline.setMap(null);
		});
	});
	
	// course insert
	$(function(){

		$('.insert').on('click', function(){
	    	/* //값들의 갯수 -> 배열 길이를 지정
			var cnt = $("input[name=contentId]").length;
			//배열 생성
			var arr = []
			//배열에 값 주입
			for(var i=0; i<cnt; i++){                          
				arr[i] = {'contentId' : $("input[name=contentId]").eq(i).val()};
		    } */
			console.log(JSON.stringify($("#frm").serializeArray()));
		    console.log(JSON.stringify($("#idFrm").serializeArray()))
		/* 	//객체를 string으로 변환
	   		console.log(JSON.stringify(list));
			var listData = JSON.stringify(list); */
	   		//ajax 호출 
	   		var data = $('form').serialize(); 
	   		$.ajax({
	   			url: 'write',
	   		    type: 'post',
	   		    data : /* {"board" :JSON.stringify($("#frm").serializeArray()),
	   		    	"tour" : JSON.stringify($("#idFrm").serializeArray())
	   		    } */
	   		 			JSON.stringify(data),
	   		 	dataType: 'json',
	   		 	contentType: 'application/json; charset=utf-8',
	   		 	traditional : true,
	   		    success: function (data){
	   		        console.log(data);
	   		    },
	   		    error: function (error){
	   		        alert(error + "등록이 실패하였습니다.");
	   		    }
	   		});
		});
	});

	CKEDITOR.instances.content.getData();
</script>

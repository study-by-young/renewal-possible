<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
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

.custom-btn {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	color: #fff;
	background-color: #6495ed;
}

.custom-input input {
	/* width: 100%; */
	height: 42px;
	padding-left: 10px;
	border: 1px solid #e8e8e8;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 5px;
}

.x_offer_car_heading_wrapper h3:after {
    content: '';
    position: absolute;
    width: 30px;
    border: 2px solid #6495ed;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    left: 0;
    right: 0;
    bottom: -20px;
    margin: 0px auto;
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
						<input id="writer" name="writer" value="${user }" type="text"
							placeholder="Writer" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-5 col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input type="text" id="genDate" name="genDate"
							value="<%=sf.format(nowTime)%>" placeholder="Date"
							readonly="readonly">
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
				<div class="row">
					<div class="col-xl-1"></div>
					<div
						class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="margin: 0px">
						<div class="contect_form4 col-12" align="center"
							style="margin-top: 10px; margin-bottom: 15px;">
							<textarea id="content" name="content" class="ckeditor"></textarea>
							<!-- 	<textarea rows="5" placeholder="코스에 대한 간략한 설명을 기재할 수 있습니다. 쒸익"></textarea> -->
						</div>
					</div>
				</div>
				<div class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12" 
					style="background-color: white; border: 1px solid lightgray; border-radius: 10px; margin-top: 20px; margin-right: 5px; box-shadow: 0px 0 8px rgba(0, 0, 0, 0.1);">
						<hr style="border: 0; height: 3px; background: #ccc;">
						<div class="contect_form2">
							<h3>인원</h3><span style="float: right; margin-top: -35px;"><button id="minusPeople" type="button" class="btn btn-outline-light text-dark">-</button><span id="people">1</span><button id="plusPeople" type="button" class="btn btn-outline-light text-dark">+</button></span>
						</div>
						<hr style="border: 0; height: 3px; background: #ccc;">
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
					style="background-color: white; border: 1px solid lightgray; border-radius: 10px; margin-top: 20px; margin-right: 5px; box-shadow: 0px 0 8px rgba(0, 0, 0, 0.1);">
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
					style="background-color: white; border: 1px solid lightgray; border-radius: 10px; margin-top: 30px; box-shadow: 0px 0 8px rgba(0, 0, 0, 0.1);">
					<div class="input-group mb-3 custom-input" style="margin-top: 20px;">
						<select id="type" name="type" class="select">
							<option value="T" ${pageMaker.cri.type =='T'? 'selected' : "" }>선택</option>
							<option value="R" ${pageMaker.cri.type =='R'? 'selected' : "" } style="margin-bottom: 1px solid gray">지역</option>
							<option value="A" ${pageMaker.cri.type =='A'? 'selected' : "" }>관광지</option>
							<option value="C" ${pageMaker.cri.type =='C'? 'selected' : "" }>문화시설</option>
						</select> <input type="text" id="loc" name="loc"
							value="${pageMaker.cri.keyword }" class="form-control"
							placeholder="떠나고 싶은 장소를 검색해보세요."
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button id="tourSearch" class="custom-btn" type="button">검색</button>
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
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 30px;">
					<div class="contect_btn contect_btn_contact">
							<button type="button" class="custom-btn insert">등록</button>
							<button type="button" class="custom-btn" style="background-color: red;" onclick="location.href='../course'">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<script>

	var markers = [];
	var marker;
	var markersIdx = [];
	var markerIdx = 0;
	var lines = [];
	var polyline;

	$("#plusPeople").on("click", function() {
		$("#people").text(Number($("#people").text())+1);	
	});
	$("#minusPeople").on("click", function() {
		if(Number($("#people").text())>1) {
			$("#people").text(Number($("#people").text())-1);	
		}
	});
	
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

		var forCheck = [];
		$("#tourList")
				.on(
						"click",
						"li",
						function() {
							if (forCheck.indexOf($(this).attr("data-contentId")) == -1) {
								forCheck.push($(this).attr("data-contentId"));
								console.log(forCheck);
								$("#selectList")
										.append(
												'<li data-markerIdx="' + markerIdx + '" style="cursor: pointer;"><i class="fa fa-long-arrow-right"></i>&nbsp;&nbsp;'
														+ $(this).text()
														+ '<span style="float: right"><i class="fa fa-times-circle"></i></span></li>')
										.append('<hr>')
										.append(
												'<input type="hidden" id="contentId" name="contentId" value="'
														+ $(this)
																.attr(
																		"data-contentId")
														+ '">');

								// 마커가 표시될 위치입니다 
								var markerPosition = new kakao.maps.LatLng($(
										this).attr("data-mapY"), $(this).attr(
										"data-mapX"));

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
									/* // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
									var linePath = [
											new kakao.maps.LatLng(x1, y1),
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
									lines.push(polyline); */
									//console.log(lines);
								}
							} else {
								alert("이미 등록된 장소입니다.");
								return false;
							}
						});

		$("#selectList").on("click", "li", function() {
			forCheck.splice(forCheck.indexOf($(this).next().next().val()),1);
			var targetIdx = $(this).attr("data-markerIdx");
			console.log(targetIdx);
			$(this).next().next().remove();
			$(this).next().remove();
			$(this).remove();

			markers[targetIdx].setMap(null);
			/* console.log('list : ' + markersIdx);
			console.log('idx : ' + markersIdx.indexOf(targetIdx)); */
			//polyline.setMap(null);
			for (var l=0 ; l < lines.length ; l++) {
				lines[l].setMap(null);
			}
			console.log(markers);
/*  			if (markers.length >= 2) {
				for (var m=0 ; m < markers.length ; m++) {
					var xy1 = markers[m]
							.getPosition();
					var xy2 = markers[m+1]
							.getPosition();
					var x1 = xy1.getLat();
					var y1 = xy1.getLng();
					var x2 = xy2.getLat();
					var y2 = xy2.getLng();
					// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
					var linePath = [
							new kakao.maps.LatLng(x1, y1),
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
					lines.push(polyline);
					console.log(lines);
				}
			}  */
			console.log(lines);
		});
	});

	// course insert
	$(function() {
		//코스 담을 배열
		var arr = [];

		$('.insert').on('click', function() {
			//입력값 검증
			if ($("#title").val().length == 0) {
				alert("제목은 필수값입니다.")
				$("#title").focus();
				return false;
			}
			if ($("#startDate").val().length == 0) {
				alert("시작 날짜는 필수값입니다.")
				$("#startDate").focus();
				return false;
			}
			if ($("#endDate").val().length == 0) {
				alert("종료 날짜는 필수값입니다.")
				$("#endDate").focus();
				return false;
			}
			if (CKEDITOR.instances.content.getData().length == 0) {
				alert("내용은 필수값입니다.")
				CKEDITOR.instances.content.focus();
				return false;
			}

			//값들의 갯수 -> 배열 길이를 지정
			var contentIds = $("input[name=contentId]");

			//배열에 값 주입
			for (var i = 0; i < contentIds.length; i++) {
				let orgName = contentIds.eq(i).attr("name");
				//contentIds.eq(i).attr("name", orgName + i);
				var temp = {
					contentId : contentIds.eq(i).val()
				}
				arr.push(temp);
			}

			//코스 2개 이상만 등록 가넝한.
			if (arr.length < 2) {
				alert("코스 등록은 2개 이상부터 가능합니다.");
				arr = [];
				return false;
			}

			/* let data = JSON.stringify({
			   	title: $('[name="title"]').val(),
			   	writer: $('[name="writer"]').val(),
			   	genDate: $('[name="genDate"]').val(),
			   	startDate: $('[name="startDate"]').val(),
			   	endDate: $('[name="endDate"]').val(),
			   	content: $('[name="content"]').val()
			   });
			contentId: arr */

			let data = {
				title : $('[name="title"]').val(),
				writer : $('[name="writer"]').val(),
				genDate : $('[name="genDate"]').val(),
				startDate : $('[name="startDate"]').val(),
				endDate : $('[name="endDate"]').val(),
				people : $("#people").text(),
				content : CKEDITOR.instances.content.getData(),
				boardList : arr
			}
			console.log(data);

			//console.log($('form').serialize());
			//console.log(JSON.stringify($("#frm").serializeObject()));
			//console.log(JSON.stringify($("#idFrm").serializeObject()));
			//let data = JSON.stringify($("#frm").serializeObject()) + JSON.stringify($("#idFrm").serializeObject());
			//console.log(data);
			/* 	//객체를 string으로 변환
				console.log(JSON.stringify(list));
				var listData = JSON.stringify(list); */

			//ajax 호출 
			$.ajax({
				url : 'write',
				type : 'post',
				data : JSON.stringify(data),
				dataType : 'text',
				contentType : 'application/json; charset=utf-8',
				success : function(data) {
					console.log(data);
					alert("등록이 완료되었습니다.");
					if (data == "success") {
						location.href = "../course";
					}
				},
				error : function(error) {
					console.log(error);
				}
			}); 
		});
	});

	$(function() {
		$('.returnList').on('click', function() {
			location.href = "../course";
		});
	});

	CKEDITOR.instances.content.getData();
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--favicon-->
<link rel="shortcut icon" type="image/png" href="images/fevicon.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
	integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

	<div class="x_inner_team_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-xl-10 offset-xl-1 col-lg-12 col-md-12">
					<div
						class="x_offer_car_heading_wrapper x_offer_car_tb_heading_wrapper float_left">
						<h3>
							<span class="badge badge-pill badge-primary">${cnt }코스</span>
							${board.title }
						</h3>
						<p>위치&nbsp;&nbsp; | &nbsp;&nbsp;코스 총 거리 : 000km</p>
					</div>
					<div>
						<span style="margin-right: 30px"><i class="far fa-heart">&nbsp;${board.likes }개</i></span>
						<!-- <span style="margin-right: 30px"><i class="fas fa-share-alt">&nbsp;10회</i></span> -->
						<span style="float: right;"><i class="far fa-eye">&nbsp;${board.views }회</i></span>
					</div>
					<hr>
					<div>${board.content }</div>
					<div id="takePlaceMap"
						style="margin-top: 10px; margin-bottom: 10px; height: 400px;"></div>
					<div
						style="margin-top: 30px; padding: 20px; background-color: lightgray;">
						<!-- xs offer car tabs Start -->
						<div class="row">
							<div class="col-md-12">
								<div class="x_ln_car_heading_wrapper float_left">
									<h3>Tour Course</h3>
								</div>
							</div>
							<div class="col-md-12">
								<div class="btc_ln_slider_wrapper">
									<div class="owl-carousel owl-theme">
										<c:forEach var="course" items="${course }">
											<div class="item">
												<div class="btc_team_slider_cont_main_wrapper">
													<div class="btc_team_img_wrapper">
														<img
															src="${course.firstImage}"
															alt="team_img1">
													</div>
													<div class="btc_team_img_cont_wrapper">
														<h4>
															<a href="#">${course.title}</a>
														</h4>
														<p>${course.addr1}</p>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<!--js Start-->
						<!-- x booking Wrapper Start -->
						<div
							style="margin-top: 30px; padding: 20px; background-color: white; border: 1px solid blue; border-radius: 10px;">
							<div class="row">
								<div class="col-md-12">
									<div>
										<h4>장소 이름</h4>
										<p>주소 어쩌구 저쩌구</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12"></div>
			</div>
		</div>
	</div>

	<script>

	$(function() {
		var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(35.86911924611688, 128.5932113110608), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 마커가 표시될 위치입니다 
		<c:forEach items="${course }" var="item">
			var markerPosition = new kakao.maps.LatLng("${item.mapY}","${item.mapX}");
	
			// 마커를 생성합니다
			marker = new kakao.maps.Marker({
				position : markerPosition
			});
	
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng("${item.mapY}","${item.mapX}");
	
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
			
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
		</c:forEach>

	});
	</script>
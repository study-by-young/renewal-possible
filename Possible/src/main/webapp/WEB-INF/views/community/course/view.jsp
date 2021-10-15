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

<style type="text/css">
.x_slider_checout_right li a {
	float: right;
}
.btc_team_img_cont_wrapper h4 {
    height: 50px;
    overflow: hidden;
    word-break: keep-all;
}
</style>

<div class="x_inner_team_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="row">
			<div class="col-xl-10 offset-xl-1 col-lg-12 col-md-12">
				<div>
					<img src="/app/resources/images/avatar.jpg"
						class="rounded-circle mr-2" height="34" alt=""> <span
						id="writer">${board.writer }</span>
				</div>
				<div
					class="x_offer_car_heading_wrapper x_offer_car_tb_heading_wrapper float_left">
					<h3>
						<span class="badge badge-pill badge-primary">${cnt }코스</span>
						${board.title }
					</h3>
					<p>
						<i class="fa fa-map" aria-hidden="true"></i> : <span id="coursePlace"></span>&nbsp;&nbsp; | &nbsp;&nbsp;코스 총 거리 :
						<span id="courseKm"></span> km&nbsp;&nbsp; | &nbsp;&nbsp;<i class="fa fa-user" aria-hidden="true"></i> : ${board.people }
					</p>
				</div>
				<div>
					<span style="margin-right: 30px;"> <c:if
							test="${user eq null}">
							<i id="heart" class="far fa-heart">&nbsp;</i>
						</c:if> <c:if test="${checkLike eq 0}">
							<i id="heart" class="far fa-heart">&nbsp;</i>
						</c:if> <c:if test="${checkLike eq 1}">
							<i id="heart" class="fa fa-heart-o" style="color: red">&nbsp;</i>
						</c:if> <span id="likeCnt">${likes }</span> LIKE
					</span>
					<!-- <span style="margin-right: 30px"><i class="fas fa-share-alt">&nbsp;10회</i></span> -->
					<span style="float: right;"><i class="far fa-eye"></i>&nbsp;${board.views } VIEWS</span>
				</div>
				<hr>
				<div style="margin-top: 50px; margin-bottom: 50px;">${board.content }</div>
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
													<c:if test="${course.firstImage ne null}">
														<img src="${course.firstImage}" alt="tourImg" style="height: 200px;">
													</c:if>
													<c:if test="${course.firstImage eq null}">
														<img src="${pageContext.request.contextPath}/resources/images/no_image.jpg" alt="tourImg" style="height: 200px;">
													</c:if>
												</div>
												<div class="btc_team_img_cont_wrapper">
													<h4>
														<a>${course.title}</a>
													</h4>
													<p id="courseAddr">${course.addr1}</p>
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
		<form id="frm" name="frm" role="form" action="view/delete"
			method="post">
			<div class="row" style="margin-top: 10px">
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 x_slider_checout_right">
					<input type="hidden" id="seq" name="seq" value="${board.seq }">
					<ul>
						<c:if test="${id eq board.writer}">
							<li><a href="javascript:void(0);" onclick="boardDelete();">삭제</a></li>
						</c:if>
						<li><a href="../course">목록</a></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</div>
<input type="hidden" id="memSeq" value="${user }">

<script>

	$(function() {
		var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
	    var option = { //지도를 생성할 때 필요한 기본 옵션
	        center: new kakao.maps.LatLng(35.86911924611688, 128.5932113110608), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };

		var map = new kakao.maps.Map(container, option); // 지도를 생성합니다
		 
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
			<c:forEach items="${course }" var="item">
		    {
		        title: "${item.title}", 
		        latlng: new kakao.maps.LatLng("${item.mapY}","${item.mapX}")
		    },
		    </c:forEach>
		];
		for (var i = 0; i < positions.length; i ++) {
			// 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		    });
		}

		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(positions[0].latlng.getLat(), positions[0].latlng.getLng());

		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
			
		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		var linePath = [ 
			<c:forEach items="${course }" var="item">
				new kakao.maps.LatLng("${item.mapY}","${item.mapX}"),
			</c:forEach>
		];
		
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
		var distance = polyline.getLength();
		var strArr = $("#courseAddr").eq(0).text().split(' ');
		$("#coursePlace").text(strArr[0]+" "+strArr[1]);
		$("#courseKm").text(Math.round((distance / 1000)*100)/100);

	});
	
	var user = $("#memSeq").val();
	console.log(user);
	$(function() {
		$("#heart").on("click", function() {
			if (user != "") {// 로그인 여부 확인
				if ($("#heart").attr("class") == "far fa-heart"){ // 빈 하트 일 시
					$.ajax({
						type : 'POST',
						url : 'plusLike',
						data : JSON.stringify({
							boardSeq : ${board.seq },
							memberSeq : user
						}),
						dataType : 'json',
						contentType : 'application/json; charset=utf-8',
						success : function(data) {
							$("#heart").attr("class", "fa fa-heart-o").css("color","red");
							$("#likeCnt").text(Number($("#likeCnt").text())+data);
							console.log(data);
						}
					})
				} else {
					$.ajax({
						type : 'POST',
						url : 'minusLike',
						data : JSON.stringify({
							boardSeq : ${board.seq },
							memberSeq : user
						}),
						dataType : 'json',
						contentType : 'application/json; charset=utf-8',
						success : function(data) {
							$("#heart").attr("class", "far fa-heart").css("color","");
							$("#likeCnt").text(Number($("#likeCnt").text())-data);
							console.log(data);
						}
					})
				}
			} else {
				if(confirm("로그인이 필요한 서비스 입니다.")==true) { //확인 시 로그인 페이지, 취소 시 return
					location.href="${pageContext.request.contextPath}/login"; 
				} else {
					return;
				}
			}
		});
	});
	
	function boardDelete() {
		if(confirm("정말 삭제하시겠습니까?")==true) {
			frm.submit();
			alert("삭제가 완료되었습니다.");
		} else {
			return;
		}
	}

	</script>
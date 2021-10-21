<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

@
-webkit-keyframes bounce { 0%, 20%, 50%, 80%, 100% {
	-webkit-transform: translateY(0);
}

40




















%
{
-webkit-transform




















:




















translateY


















(




















-20px




















)




















}
60




















%
{
-webkit-transform




















:




















translateY


















(




















-20px




















)


















;
}
}
@
keyframes bounce { 0%, 20%, 50%, 80%, 100% {
	transform: translateY(0);
}

40




















%
{
transform




















:




















translateY


















(




















-20px




















)


















;
}
60




















%
{
transform




















:




















translateY


















(




















-20px




















)


















;
}
}
.bounce {
	-webkit-animation-duration: 0.8s;
	animation-duration: 0.8s;
	-webkit-animation-name: bounce;
	animation-name: bounce;
}
.badge-custom {
    color: #fff;
    background-color: #007bff;
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
						<span class="badge badge-pill badge-custom">${cnt }코스</span>
						${board.title }
					</h3>
					<p>
						<i class="fa fa-map" aria-hidden="true"></i> : <span
							id="coursePlace"></span>&nbsp;&nbsp; | &nbsp;&nbsp;코스 총 거리 : <span
							id="courseKm"></span> km&nbsp;&nbsp; | &nbsp;&nbsp;<i
							class="fa fa-user" aria-hidden="true"></i> : ${board.people }
					</p>
				</div>
				<div>
					<span style="margin-right: 30px;"> <c:if
							test="${checkLike eq 0}">
							<i id="heart" class="far fa-heart">&nbsp;</i>
						</c:if> <c:if test="${checkLike eq 1}">
							<i id="heart" class="fa fa-heart-o" style="color: red">&nbsp;</i>
						</c:if> <span id="likeCnt">${likes }</span> LIKE
					</span>
					<!-- <span style="margin-right: 30px"><i class="fas fa-share-alt">&nbsp;10회</i></span> -->
					<span style="float: right;"><i class="far fa-eye"></i>&nbsp;${board.views }
						VIEWS</span>
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
														<img src="${course.firstImage}" alt="tourImg"
															style="height: 200px;">
													</c:if>
													<c:if test="${course.firstImage eq null}">
														<img
															src="${pageContext.request.contextPath}/resources/images/no_image.jpg"
															alt="tourImg" style="height: 200px;">
													</c:if>
												</div>
												<div class="btc_team_img_cont_wrapper" style="height: 150px;">
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
								<h4>댓글</h4>
								<hr>
								<ul class="chat">
									<c:forEach var="cmt" items="${cmt }">
										<li data-seq="${cmt.seq }" style="margin-bottom: 20px">
													${cmt.writer } | <fmt:formatDate pattern = "yyyy/MM/dd" value= "${cmt.genDate }"/><br>
													${cmt.content }
											<%-- <input type="hidden" id="cmtSeq" name="cmtSeq"
												value="${cmt.seq }"> --%>
											<sec:authorize access="isAuthenticated()">
												<sec:authentication property="principal.id" var="loginUserId" />
												<c:if test="${loginUserId eq cmt.writer}">
													<span style="float: right"><i id="cmtDelete" class="fa fa-times-circle"></i></span>
												</c:if>
											</sec:authorize>
											<br>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="col-md-12">
								<div class="panel-heading">
									<input id="content" name="content" size="30">
									<!-- 버튼 -->
									<button type="button" id="cmtInsert">등록</button>
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
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.id" var="loginUserId" />
							<c:if test="${loginUserId eq board.writer}">
								<li><a href="javascript:void(0);" onclick="boardDelete();">삭제</a></li>
							</c:if>
						<c:if test="${loginUserId ne board.writer}">
							<li><button type="button" id="reportBtn"
									class="btn btn-danger">신고</button></li>
						</c:if>
						</sec:authorize>
						<li><span style="float: right;"><a href="../course">목록</a></span></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</div>
<input type="hidden" id="memSeq" value="${user }">
<input type="hidden" id="memId" data-check="${reportCheck }"
	value="${id }">

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">신고글 작성</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="reason"
						id="exampleRadios1" value="비방 및 욕설" checked> <label
						class="form-check-label" for="exampleRadios1"> 비방 및 욕설 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="reason"
						id="exampleRadios2" value="부적절한 컨텐츠"> <label
						class="form-check-label" for="exampleRadios2"> 부적절한 컨텐츠 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="reason"
						id="exampleRadios3" value="스팸 및 현혹 행위"> <label
						class="form-check-label" for="exampleRadios2"> 스팸 및 현혹 행위
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="reason"
						id="exampleRadios4" value="잘못된 정보"> <label
						class="form-check-label" for="exampleRadios2"> 잘못된 정보 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="reason" id="etc">
					<label class="form-check-label" for="exampleRadios2"> 기타 </label> <input
						type="text" class="input" id="etcDetail" disabled="disabled">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button id="reportSubmit" type="button" class="btn btn-danger">접수</button>
			</div>

		</div>
	</div>
</div>

<script>
	let loginUser = '';
	
	$(function() {
		var container = $('#takePlaceMap')[0]; //지도를 담을 영역의 DOM 레퍼런스
	    var option = { //지도를 생성할 때 필요한 기본 옵션
	        center: new kakao.maps.LatLng(35.86911924611688, 128.5932113110608), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
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
		
		var markerImage;
		var marker;
		for (var i = 0; i < positions.length; i ++) {
			var imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/icon_map_num'+(i+1)+'.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(30, 45), // 마커이미지의 크기입니다
		      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			// 마커를 생성합니다
		    marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image: markerImage
		    });
			
			//클릭 이벤트 등록
		    kakao.maps.event.addListener(marker, 'click', moveToCenter(marker, map));
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
			strokeColor : '#FF3333', // 선의 색깔입니다
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
	
	function moveToCenter(marker, map){
		return function() {
	    	// 이동할 위도 경도 위치를 생성합니다 
			var move = new kakao.maps.LatLng(marker.getPosition().getLat(), marker.getPosition().getLng());
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(move);
			/* map.setLevel(6, {animate: true}, {anchor: new kakao.maps.LatLng(marker.getPosition().getLat(), marker.getPosition().getLng())}); */
	  	};
	}
	
	console.log(${board.seq });
	$(function() {
		$("#heart").on("click", function() {
			if ($("#heart").attr("class") == "far fa-heart"){ // 빈 하트 일 시
				$.ajax({
					type : 'POST',
					url : 'plusLike',
					data : JSON.stringify({
						boardSeq : ${board.seq },
					}),
					dataType : 'json',
					contentType : 'application/json; charset=utf-8',
					success : function(data) {
						if (data == 1) {
							$("#heart").attr("class", "fa fa-heart-o bounce").css("color","red");
							$("#likeCnt").text(Number($("#likeCnt").text())+data);
							console.log(data);
						} else {
							if(confirm("로그인이 필요한 서비스 입니다.")==true) { //확인 시 로그인 페이지, 취소 시 return
								location.href="${pageContext.request.contextPath}/login"; 
							} else {
								return;
							}
						}
					}
				})
			} else {
				$.ajax({
					type : 'POST',
					url : 'minusLike',
					data : JSON.stringify({
						boardSeq : ${board.seq },
					}),
					dataType : 'json',
					contentType : 'application/json; charset=utf-8',
					success : function(data) {
						if (data == 1) {
							$("#heart").attr("class", "far fa-heart").css("color","");
							$("#likeCnt").text(Number($("#likeCnt").text())-data);
							console.log(data);
						} else {
							if(confirm("로그인이 필요한 서비스 입니다.")==true) { //확인 시 로그인 페이지, 취소 시 return
								location.href="${pageContext.request.contextPath}/login"; 
							} else {
								return;
							}
						}
					}
				})
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
	
	$("#reportBtn").on("click", function() {
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.seq" var="loginUserSeq"/>
			loginUser = ${loginUserSeq};
		</sec:authorize>
		if(loginUser == ''){
			if(confirm("로그인이 필요한 서비스 입니다.")==true) { //확인 시 로그인 페이지, 취소 시 return
				location.href="${pageContext.request.contextPath}/login"; 
			} else {
				return;
			}
		} else {
			if(reportCheck == 0) {
				$("#reportBtn").attr("data-toggle", "modal")
				$("#reportBtn").attr("data-target", "#exampleModal");
			} else {
				alert("이미 신고한 게시글입니다.");
				return;
			}
		}
	});
	
	var reportCheck = $("#memId").attr("data-check");
	console.log(reportCheck);
	$("#reportSubmit").on("click", function() {
		if($("input[name=reason]:checked").attr("id") == "etc") {
			if ($("#etcDetail").val() != "") {
				$("#etc").val($("#etcDetail").val());
				$.ajax({
					type : 'POST',
					url : 'report',
					data : JSON.stringify({
						target : $("#seq").val(),
						writer : $("#writer").text(),
						reason : $('.form-check-input:checked').val()
					}),
					dataType : 'text',
					contentType : 'application/json; charset=utf-8',
					success : function(data) {
						if (data == 1) {
							alert('신고가 접수되었습니다.');
							location.href = "../course";
						}
					}
				})
			} else {
				alert("내용을 입력해주세요.")
				return;
			}
		} else {
			$.ajax({
				type : 'POST',
				url : 'report',
				data : JSON.stringify({
					target : $("#seq").val(),
					writer : $("#writer").text(),
					reason : $('.form-check-input:checked').val(),
					reporter : $("#memId").val()
				}),
				dataType : 'text',
				contentType : 'application/json; charset=utf-8',
				success : function(data) {
					alert('신고가 접수되었습니다.');
					location.href = "../course";
				}
			})
		}
	});
	
	$(document).ready(function(){
	    // 라디오버튼 클릭시 이벤트 발생
	    $("input:radio[name=reason]").click(function(){
	 
	        if($("input[name=reason]:checked").attr("id") == "etc"){
	        	$("#etcDetail").attr("disabled",false);
	        } else {
	        	$("#etcDetail").val('');
	        	$("#etcDetail").attr("disabled",true);
	        }
	    });
	});
	
	/* $(function () {
		
		function makeLi(data) {
			return '<li>'
				+ '<div class="panel panel-default">'
				+ '<input type="hidden" id="rno" value="' + data.seq + '"><div class="panel-heading">' + data.writer 
				+ ' | ' + data.genDate + '<button type="button" onclick="replyDel()" class="btn btn-default" style="float: right;">삭제</button>'
				+ '</div>'   
				+ '<div class="panel-body">' + data.content + '</div>'
				+ '</div>'
				+ '</li>';
		}
		
		var courseSeq = $("#seq");
		//목록조회
		$.ajax({
			url: "../comment/",
			data: {
				courseSeq: courseSeq
			}, 
			dataType: "json",
			success: function (datas) {
				console.log(datas);
				str = "";
				for (i = 0; i < datas.list.length; i++) {
					str += makeLi(datas.list[i]);
					$(".chat").html(str);
				}
			}
		});

	}); */
	
	$("#cmtInsert").on("click", function() {
		<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.seq" var="loginUserSeq"/>
		loginUser = ${loginUserSeq};
		</sec:authorize>
		if(loginUser == '') {
			if(confirm("로그인이 필요한 서비스 입니다.")==true) { //확인 시 로그인 페이지, 취소 시 return
				location.href="${pageContext.request.contextPath}/login"; 
			} else {
				return;
			}
		} else {
			$.ajax({
				type : 'POST',
				url: "insertCmt",
				data:  JSON.stringify({
					content : $("#content").val(),
					courseSeq : $("#seq").val()
				}), 
				dataType: "json",
				contentType : 'application/json; charset=utf-8',
				success: function (data) {
					if(data == null) {
						if(confirm("로그인이 필요한 서비스 입니다.")==true) { //확인 시 로그인 페이지, 취소 시 return
							location.href="${pageContext.request.contextPath}/login"; 
						} else {
							return;
						}
					} else {
						$("#content").val("");
						$(".chat").append('<li data-seq="'+data.seq+'" style="margin-bottom: 20px">'+data.writer+' | '+data.genDate+'<br>'+data.content+'<input type="hidden" id="cmtSeq" value="'+data.seq+'">'
								+'<span style="float: right"><i id="cmtDelete" class="fa fa-times-circle"></i></span>');
					}
				}
			});
		}
	});
	
	$(".chat").on("click", "i", function() {
		var dataSeq = $(this).parent().parent().attr("data-seq");
		console.log($(this).parent().parent().attr("data-seq"));
		$.ajax({
			type : 'POST',
			url: "deleteCmt",
			data:  {
				seq : $(this).parent().parent().attr("data-seq")
			}, 
			success: function (data) {
				if(data == 1) {
					alert("삭제 완");
					$("[data-seq="+dataSeq+"]").remove()
				} 
			}
		});
	});

	</script>
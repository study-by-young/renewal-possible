<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>

<%-- <h2><a href="${pageContext.request.contextPath}/company/editInfo?cmpnSeq=${cmpnSeq}">업체 정보 확인</a></h2>
<h2><a href="${pageContext.request.contextPath}/company/car?cmpnSeq=${cmpnSeq}">업체 보유 렌트카 리스트</a></h2>
<h2><a href="${pageContext.request.contextPath}/company/rent?cmpnSeq=${cmpnSeq}">렌트 내역 관리 페이지 </a></h2>
 --%>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content area -->
	<div class="content">

		<input type="hidden" class="form-control" name='cmpnSeq' value='${cmpnSeq }'>

		<div class="card">
			<div class="card-header header-elements-inline">
				<h5 class="card-title"><a href="${pageContext.request.contextPath}/company/dashboard">일별수익차트</a></h5>
				<div class="header-elements">
					<div class="list-icons">
						<a class="list-icons-item" data-action="collapse"></a> <a
							class="list-icons-item" data-action="reload"></a> <a
							class="list-icons-item" data-action="remove"></a>
					</div>
				</div>
			</div>
			<!-- 차트 -->
			<div style="margin: 50px;">
				<div>
					<canvas id="canvas" width="600px" height="300px" style="display:block"></canvas>
				</div>
			</div>
			</div>

		<!-- 렌트 내역 (오늘 나가는 거 5개) -->
		<div class="card">
			<div class="card-header header-elements-inline">
				<h5 class="card-title"><a href="${pageContext.request.contextPath}/company/dashboard">오늘 출발하는 렌트카</a>&nbsp;<span class="badge badge-primary badge-pill">5</span></h5>
				<div class="header-elements">
					<div class="list-icons">
						<a class="list-icons-item" data-action="collapse"></a> <a
							class="list-icons-item" data-action="reload"></a> <a
							class="list-icons-item" data-action="remove"></a>
					</div>
				</div>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align:center">예약자</th>
								<th>전화번호</th>
								<th>출발일자</th>
								<th>도착일자</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="todayList" end="4" items="${todayList }">
								<tr>
									<td style="text-align:center">${todayList.receiver }</td>
									<td>${todayList.phone }</td>
									<td><fmt:formatDate pattern="yyyy/MM/dd"
											value="${todayList.startDate }" /></td>
									<td><fmt:formatDate pattern="yyyy/MM/dd"
											value="${todayList.endDate }" /></td>
									<td style="text-align:right"><button type="button" class="btn bg-pink-300 rounded-round" onclick="location.href='${pageContext.request.contextPath}/company/rent/view?seq=${todayList.seq}' ">상세보기</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 후기 -->
		<div class="card">
			<div class="card-header header-elements-inline">
				<h5 class="card-title"><a href="${pageContext.request.contextPath}/company/dashboard">후기</a>&nbsp;<span class="badge badge-primary badge-pill">5</span></h5>
				<div class="header-elements">
					<div class="list-icons ml-3">
						<div class="list-icons-item dropdown">
							<a href="#" class="list-icons-item caret-0 dropdown-toggle"
								data-toggle="dropdown"> <i class="icon-arrow-down12"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<ul class="media-list media-chat media-chat-scrollable mb-3">
				<c:forEach var="reviewList" end="4" items="${reviewList}">
					<li class="media">
						<div class="mr-3">
							<a
								href="../../../../global_assets/images/placeholders/placeholder.jpg">
								<img
								src="${pageContext.request.contextPath}/resources/images/user.png"
								class="rounded-circle" width="40" height="40" alt="">
							</a>
						</div>

						<div class="media-body">
							<div class="media-chat-item" style="background-color: #6e9cee; color:#fff;">
								${reviewList.content} -
								${reviewList.name} 님
							</div>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>

	</div>
</div>
<script>
	var chartLabels = [];
	var chartData = [];

	$.getJSON("salesList", function(data) {

		$.each(data, function(inx, obj) {
			chartLabels.push(obj.UPTDATE);
			chartData.push(obj.EARN);
			console.log(moment(obj.uptDate).format("YYYY-MM-DD"));
		});

		createChart();
		console.log("create Chart");
		console.log(data);

	});

	var lineChartData = {

		labels : chartLabels,
		datasets : [

		{
			label : "일별수익",
			fillColor : "rbga(151,187,205,0.2)",
			strokeColor : "rbga(151,187,205,1)",
			pointColor : "rbga(151,187,205,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rbga(151,187,205,1)",
			
			data : chartData
		} ]
	}

	function createChart() {

		var ctx = document.getElementById("canvas").getContext("2d");
		LineChartDemo = Chart.Line(ctx, {

			data : lineChartData,

			options : {
				 responsive: false,
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		})
	}
</script>

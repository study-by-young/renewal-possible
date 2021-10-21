<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">
.x_slider_checout_right li a {
	float: right;
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
}

.cTitle {
	height: 50px;
	overflow: hidden;
	word-break: keep-all;
	margin-left: 5px;
	margin-right: 5px;
}
</style>

<div class="x_inner_team_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="custom-input" style="margin-bottom: 50px;">
					<form id="actionForm"
						action="${pageContext.request.contextPath}/community/course"
						method="get">
						<select name="type" class="select">
							<option value="T"
								<c:out value="${pagination.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
							<option value="C"
								<c:out value="${pagination.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
							<option value="W"
								<c:out value="${pagination.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
							<option value="TC"
								<c:out value="${pagination.cri.type eq 'TC' ? 'selected':''}"/>>제목
								or 내용</option>
						</select> &nbsp; <input class="input" name="keyword"
							value="${pagination.cri.keyword}"> <input type="hidden"
							name="pageNum" value="${pagination.cri.pageNum}"> <input
							type="hidden" name="amount" value="${pagination.cri.amount}">&nbsp;
						<button class="custom-btn btn-primary"
							onclick="$('[name=pageNum]').val(1)">검색</button>
					</form>
				</div>
				<div
					class="x_offer_car_heading_wrapper x_offer_car_tb_heading_wrapper float_left">
					<h4>Tour Course</h4>
					<h3>나만의 여행 코스</h3>
					<p>
						우리, 여행갈카? <br> '여행갈카'와 함께한 나만의 여행 코스를 공유해주세요.
					</p>
				</div>
			</div>
			<c:forEach var="list" items="${list }">
				<div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12">
					<div class="btc_team_bot_cont_main_wrapper">
						<div class="btc_team_img_bot_wrapper">
							<c:if test="${list.firstImage ne null }">
							<img
								src="${list.firstImage}"
								alt="Course" style="height: 180px;">
							</c:if>
							<c:if test="${list.firstImage eq null }">
							<img
								src="${pageContext.request.contextPath}/resources/images/no_image.jpg"
								alt="Course" style="height: 180px;">
							</c:if>
							<div class="btc_team_social_tb_wrapper">
								<h3>
									<fmt:formatDate value="${list.startDate }" pattern="yyyy-MM-dd" />
									~
									<fmt:formatDate value="${list.endDate }" pattern="yyyy-MM-dd" />
								</h3>
							</div>
						</div>
						<div class="btc_team_img_bot_cont_wrapper" style="height: 100px;">
							<h4>
								<a class="cTitle"
									href="${pageContext.request.contextPath}/community/course/view?seq=${list.seq}">${list.title }</a>
							</h4>
							<p>${list.writer }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 페이징 -->
		<jsp:include page="/pagination" />
		<div class="row" style="margin-top: 10px">
			<div class="col-12 x_slider_checout_right">
				<ul>
					<c:if test="${user ne null}">
						<li><a href="course/write">등록</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#pageButton a").on("click", function(e) {
		e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
		var p = $(this).attr("href");
		$('[name="pageNum"]').val(p);
		actionForm.submit();
	});
</script>

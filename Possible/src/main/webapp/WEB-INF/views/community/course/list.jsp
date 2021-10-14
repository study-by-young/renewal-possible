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
</style>

	<div class="x_inner_team_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
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
								<img
									src="${pageContext.request.contextPath}/resources/images/tb1.jpg"
									alt="team_img1">
								<div class="btc_team_social_tb_wrapper">
									<h3>
										<fmt:formatDate value="${list.startDate }"
											pattern="yyyy-MM-dd" />
										~
										<fmt:formatDate value="${list.endDate }" pattern="yyyy-MM-dd" />
									</h3>
								</div>
							</div>
							<div class="btc_team_img_bot_cont_wrapper">
								<h4>
									<a
										href="${pageContext.request.contextPath}/community/course/view?seq=${list.seq}">${list.title }</a>
								</h4>
								<p>${list.writer }</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row" style="margin-top: 10px">
				<div class="col-12 x_slider_checout_right">
					<ul>
						<c:if test="${user ne null}"><li><a href="course/write">등록</a></li></c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

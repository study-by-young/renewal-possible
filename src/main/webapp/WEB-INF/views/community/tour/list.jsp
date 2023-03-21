<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
.custom-input input {
/* 	width: 100%; */
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

.padding_tb_100 {
	padding-top: 100px;
	padding-bottom: 50px;
}

.x_offer_car_heading_wrapper {
	text-align: center;
}

.float_left {
	float: left;
	width: 100%;
}

.x_offer_car_heading_wrapper {
	text-align: center;
}

.x_offer_car_heading_wrapper h4 {
	font-size: 14px;
	font-family: 'Lato', sans-serif;
	color: #4f5dec;
	text-transform: uppercase;
}

.x_offer_car_heading_wrapper h3 {
	font-size: 30px;
	font-weight: 800;
	text-transform: uppercase;
	padding-top: 0px;
	position: relative;
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

.x_offer_car_heading_wrapper p {
	padding-top: 30px;
}

.x_offer_car_tb_heading_wrapper {
	padding-bottom: 30px;
}

.float_left {
	float: left;
	width: 100%;
}
</style>

<div class="x_inner_team_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="custom-input" style="padding: 20px; padding-top: 0px;">
					<div
						class="x_offer_car_heading_wrapper x_offer_car_tb_heading_wrapper float_left">
						<h4 style="color: #6495ed">Tour Course</h4>
						<h3>여행지 둘러보기</h3>
						<p>
							우리, 여행갈카? <br> 어디로 떠날지 고민 중이시라면, 여행지를 둘러보세요!
						</p>
					</div>
					<form id="actionForm"
						action="${pageContext.request.contextPath}/community/tour"
						method="get">
						<div style="display: inline-flex; width: 10%;">
							<select name="type" class="select select-wrapper">
								<option value="T"
									<c:out value="${pagination.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
								<option value="A"
									<c:out value="${pagination.cri.type eq 'A' ? 'selected':''}"/>>주소</option>
							</select> &nbsp;
						</div>
						<input class="custom-input input" name="keyword"
							value="${pagination.cri.keyword}"> <input type="hidden"
							name="pageNum" value="${pagination.cri.pageNum}"> <input
							type="hidden" name="amount" value="${pagination.cri.amount}">&nbsp;
						<button class="custom-btn btn-primary"
							onclick="$('[name=pageNum]').val(1)">검색</button>
					</form>
				</div>
				<c:forEach var="list" items="${list }" varStatus="status">
					<div class="card card-body">
						<div
							class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
							<div class="mr-lg-3 mb-3 mb-lg-0">
								<a href="../../../../global_assets/images/placeholders/placeholder.jpg" data-popup="lightbox">
									<c:if test="${list.firstImage ne null}">
										<img src="${list.firstImage }" width="300" alt="">
									</c:if>
									<c:if test="${list.firstImage eq null}">
										<img src="${pageContext.request.contextPath}/resources/images/no_image.jpg" width="300" alt="">
									</c:if>
								</a>
							</div>

							<div class="media-body">
								<h6 class="media-title font-weight-semibold">
									<a href="#">${list.title }</a>
								</h6>

								<ul class="list-inline list-inline-dotted mb-3 mb-lg-2">
									<li class="list-inline-item"><a href="#"
										class="text-muted">${list.addr1 }</a></li>
									<li class="list-inline-item"><a href="#"
										class="text-muted">${list.zipCode }</a></li>
								</ul>

								<p class="mb-3" id="overview${status.index}" style="color: gray;">
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 페이징 -->
			<jsp:include page="/pagination" />
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
	var list = [
	<c:forEach var="item" items="${list}">
        '${item.contentId}',
    </c:forEach>
    ];
    $(document).ready(function() {
        for(let i=0;i<list.length;i++) {
            $.ajax({
                method: 'get',
                async : false,
                url : 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=%2Bxd0HNP4Gd4KAuGtJitYZzafrxzKZ40VMcf3uX%2BQ7AfWFbNEvS2jj43sWtAeAlQPnB65kOz6PjhVjsUPnvkKtw%3D%3D&contentId='+list[i]+'&defaultYN=N&addrinfoYN=N&overviewYN=Y&MobileOS=ETC&MobileApp=AppTest',
                dataType : 'json',
                success : function(data) {
                    $("#overview" + i).html(data.response.body.items.item.overview);
                },
                error: function(error){
                    console.log("error" + error);
                }
            })
        }
    });
</script>

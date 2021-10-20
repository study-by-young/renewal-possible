<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="x_inner_team_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="custom-input" style="margin-bottom: 50px;">
					<form id="actionForm"
						action="${pageContext.request.contextPath}/community/tour"
						method="get">
						<select name="type" class="select">
							<option value="T"
								<c:out value="${pagination.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
						</select> &nbsp; <input class="input" name="keyword"
							value="${pagination.cri.keyword}"> <input type="hidden"
							name="pageNum" value="${pagination.cri.pageNum}"> <input
							type="hidden" name="amount" value="${pagination.cri.amount}">&nbsp;
						<button class="custom-btn btn-primary"
							onclick="$('[name=pageNum]').val(1)">검색</button>
					</form>
				</div>
				<c:forEach var="list" items="${list }">
					<div class="card card-body">
						<div
							class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
							<div class="mr-lg-3 mb-3 mb-lg-0">
								<a
									href="../../../../global_assets/images/placeholders/placeholder.jpg"
									data-popup="lightbox"> <c:if
										test="${list.firstImage ne null}">
										<img src="${list.firstImage }" width="300" alt="">
									</c:if> <c:if test="${list.firstImage eq null}">
										<img
											src="${pageContext.request.contextPath}/resources/images/no_image.jpg"
											width="300" alt="">
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

								<p class="mb-3" id="overview">
									<!-- <a href="https://api.visitkorea.or.kr/guide/tourDetail.do?contentId=${list.contentId }&langtype=KOR&typeid=12&oper=area&burl=&contentTypeId=${list.contentTypeId}&areaCode=&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1">상세정보</a> -->
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- 페이징 -->
<jsp:include page="/pagination" />

<script type="text/javascript">
	$("#pageButton a").on("click", function(e) {
		e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
		var p = $(this).attr("href");
		$('[name="pageNum"]').val(p);
		actionForm.submit();
	});
	
</script>

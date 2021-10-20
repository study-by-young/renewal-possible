<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
.select {
	width: 70px; /* 원하는 너비설정 */
	padding: .5em .4em; /* 여백으로 높이 설정 */
	border: 1px solid #999;
	font-family: inherit; /* 폰트 상속 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	border-radius: .5em;
	-moz-appearance: none;
	appearance: none;
}

.input {
	width: 200px; /* 원하는 너비설정 */
	padding: .5em .4em; /* 여백으로 높이 설정 */
	border: 1px solid #999;
	font-family: inherit; /* 폰트 상속 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	border-radius: .5em;
	-moz-appearance: none;
	appearance: none;
}
</style>
<!-- Main content -->
<div class="content-wrapper">

	<!-- Content area -->
	<div class="content">

		<div class="card">
			<div class="card-header header-elements-inline">
				<h4 class="card-title">
					<a
						href="${pageContext.request.contextPath}/company/car"
						class="nav-link">보유렌트카리스트</a>
				</h4>
				<div class="header-elements">
					<div class="list-icons">
						<a class="list-icons-item" data-action="collapse"></a>
					</div>
				</div>
			</div>
			
			<div class="col-sm-12" style="padding-right: 2.5rem">
					<div align="right">
						<form id="actionForm" action="car" method="get">
							<label><input type="checkbox" name="type" value="A" ${pageMaker.cri.type =='A'? 'checked' : "" } >&nbsp;대기</label>
							<label><input type="checkbox" name="type"  value="B" ${pageMaker.cri.type =='B'? 'checked' : "" }>&nbsp;예약</label>
							<label><input type="checkbox" name="type" value="C" ${pageMaker.cri.type =='C'? 'checked' : "" } >&nbsp;사용</label>
							<label><input type="checkbox" name="type"  value="D" ${pageMaker.cri.type =='D'? 'checked' : "" }>&nbsp;수리</label>
								<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
								<input type="hidden" name="cmpnSeq" value="${cmpnSeq }">
							<button class="btn alpha-pink border-pink-400 text-pink-800 btn-icon rounded-round ml-2" onclick="$('[name=pageNum]').val(1)"><i class="icon-search4"></i></button>
						</form>
					</div>
				</div>
			
			<input type="hidden" name="cmpnSeq" value="${cmpnSeq}">
			<br>
			<hr style="margin: 0px">
			<div class="card-body" style="padding: 0px">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>브랜드</th>
								<th>모델</th>
								<th>연식</th>
								<th>상태</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							   <c:forEach var="companyCarList" items="${companyCarList }">
							       <c:set var="car" value="${companyCarList.get('carVO')}" />
								<tr>
									<td>${car.seq}</td>
									<td>${companyCarList.get('brand')}</td>
									<td>${companyCarList.get('model') }</td>
									<td>${car.year }</td>
									<td>${companyCarList.get('status') }</td>
									<td><a class="move" href="${pageContext.request.contextPath}/company/car/view?seq=${car.seq}&cmpn=${car.cmpnSeq}">상세보기</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
			<hr style="margin: 0px">
			<br>



			<div class="col-sm-12">
				<div class="d-flex align-items-center justify-content-center mb-2">
					<div id="pageButton">
						<ul class="pagination pagination-flat align-self-center">
							<c:if test="${pageMaker.prev }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage-1}">이전</a></li>
								<span aria-hidden="true">&laquo;</span>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<li class="page-item"><a class="page-link" href="${num }">${num }</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage+1}">다음</a></li>
								<span aria-hidden="true">&laquo;</span>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-sm-12" style="padding-right: 2.5rem">
				<div align="right">
					<div style="padding-left: 5px; margin-bottom:20px;">
						<button type="button" class="btn btn-primary"
							onclick="location.href='car/register?=${cmpnSeq}'">등록</button>
					</div>
				</div>
			</div>

		</div>
		</div>
	</div>

<script>
	$(function() {
		var actionForm = $("#actionForm");

	
		$("#pageButton a").on("click", function(e) {
			e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
			var p = $(this).attr("href");
			$('[name="pageNum"]').val(p);
			actionForm.submit();
		});
	});
	
	   $(function(){
		     var pageBtn = $("ul > li");   
		      pageBtn.find("a").click(function(){   
		      pageBtn.removeClass("active");     // pageBtn 속에 (active) 클래스를 삭제.
		      $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
		     })
		    });
</script>
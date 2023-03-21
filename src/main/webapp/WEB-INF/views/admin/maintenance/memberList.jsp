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
						href="${pageContext.request.contextPath}/admin/maintenance/member"
						class="nav-link">회원관리</a>
				</h4>
				<div class="header-elements">
					<div class="list-icons">
						<a class="list-icons-item" data-action="collapse"></a>
					</div>
				</div>
			</div>

			<div class="row">
			<div class="col-sm-6" style="padding-left: 2.5rem">
				<div class="d-flex">
					<div align="left">
						<form id="actionForm" action="member" method="get">
							<select name="type" class="select" style="cursor:pointer">
								<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
								<option value="I" ${pageMaker.cri.type =='I'? 'selected' : "" }>아이디</option>
								<option value="N" ${pageMaker.cri.type =='N'? 'selected' : "" }>이름</option>
								<option value="P" ${pageMaker.cri.type =='P'? 'selected' : "" }>전화번호</option>
							</select> <input class="input" name="keyword"
								value="${pageMaker.cri.keyword }"> <input type="hidden"
								name="pageNum" value="${pageMaker.cri.pageNum }"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount }">
							<button class="btn btn-primary"
								onclick="$('[name=pageNum]').val(1)">Search</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6" style="padding-right: 2.5rem">
					<div align="right">
						<form id="actionForm" action="member" method="get">
								<label style="cursor:pointer"><input type="checkbox" name="type" value="U" ${pageMaker.cri.type =='U'? 'checked' : "" } >&nbsp;회원</label>
								<label style="cursor:pointer"><input type="checkbox" name="type"  value="C" ${pageMaker.cri.type =='C'? 'checked' : "" }>&nbsp;업체</label>
								<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<button class="btn alpha-pink border-pink-400 text-pink-800 btn-icon rounded-round ml-2" onclick="$('[name=pageNum]').val(1)"><i class="icon-search4"></i></button>
						</form>
					</div>
				</div>
			</div>
			
			<br>
			<hr style="margin: 0px">
			<div class="card-body" style="padding: 0px">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>전화번호</th>
								<th>이름</th>
								<th>권한</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="memberList" items="${memberList }">
								<tr>
									<td>${memberList.seq }</td>
									<td>${memberList.id}</td>
									<td>${memberList.phone }</td>
									<td>${memberList.name }</td>
									<c:if test="${memberList.author eq 'ROLE_USER'}">
									<td style="color: blue">회원</td>
									</c:if>
									<c:if test="${memberList.author eq 'ROLE_COMPANY'}">
									<td style="color: red">업체</td>
									</c:if>
									<c:if test="${memberList.author eq 'ROLE_ADMIN'}">
									<td>관리자</td>
									</c:if>
									<td><a class="move" href="${memberList.seq }">상세보기</a></td>
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
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<li class="page-item"><a class="page-link" href="${num }">${num }</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage+1}">다음</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>


			</div>
		</div>
	</div>

<script>
	$(function() {
		var actionForm = $("#actionForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							var seq = $(this).attr("href"); //클릭한 게시글의 번호를 읽어와서 
							actionForm
									.append('<input type="hidden" name="seq" value="'+ seq +'">') //여기넣어주고
							actionForm.attr("action", "member/view") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
							actionForm.submit(); //실행
						});

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
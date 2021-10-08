<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
.dash {
	background: #ffffff;
	box-shadow: 0px 0 8px rgb(0 0 0/ 10%);
	float: left;
	width: 100%;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-top: 0px;
	margin-bottom: 70px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

.pagination {
	justify-content: center;
}

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
<div class="content">
<div class="col-md-8">
	<div class="blog_single_comment_heading">
		<h4>업체 승인</h4>
	</div>
	<div class="dash">
	<form id="actionForm" action="companyOneSelect" method="get">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>업체명</th>
					<th>대표자</th>
					<th>사업자번호</th>
					<th>사업자주소</th>
					<th>대표번호</th>
					<th>승인</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="comRegList" items="${comRegList }">
				<tr>
					<td>${comRegList.seq }</td>
					<td>${comRegList.name}</td>
					<td>${comRegList.postal}</td>
					<td>${comRegList.cmpnNum }</td>
					<td>${comRegList.addr1 }</td>
					<td>${comRegList.addr2 }</td>
					<td>${comRegList.area }</td>
					<td>${comRegList.tel }</td>
					<td>
					<a class="move" href="${comRegList.seq }">승인요청</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		</form>
	<br>

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
							actionForm.attr("action", "view") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
							actionForm.submit(); //실행
						});
	});
</script>
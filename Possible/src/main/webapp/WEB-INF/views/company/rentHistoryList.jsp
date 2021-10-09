<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Main content -->
		<div class="content-wrapper">

			<!-- Content area -->
			<div class="content">

				<div class="card">
					<div class="card-header header-elements-inline">
						<h6 class="card-title">렌트내역</h6>
						<div class="header-elements">
							
						</div>
					</div>

					<div class="card-body py-0">
						<div class="row">
							<div class="col-sm-12">
								<div class="d-flex align-items-center justify-content-center mb-2">
									<form id="actionForm" action="rent" method="get">
									<table class="table table-hover">
									<thead>
										<tr>
											<th>번호</th>
											<th>구분</th>
											<th>시작날짜</th>
											<th>종료날짜</th>
											<th>수령자</th>
											<th>상태</th>
											<th>갱신날짜</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="rentHistoryList" items="${rentHistoryList }">
										<input type="hidden" class="form-control" name='carSeq' value="${rentHistoryList.carSeq}">
										<input type="hidden" class="form-control" name='memSeq' value="${rentHistoryList.memSeq}">
										<tr>
											<td>${rentHistoryList.seq }</td>
											<td>${rentHistoryList.rentType }</td>
											<td><fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistoryList.startDate }"/></td>
											<td><fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistoryList.endDate }"/></td>
											<td>${rentHistoryList.receiver }</td>
											<td>${rentHistoryList.status }</td>
											<td><fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistoryList.uptDate }"/></td>
											<td><a class="move" href="${rentHistoryList.seq }">상세보기</a></td>
										</tr>
									</c:forEach>
								</tbody>
								</table>
								</form>
								</div>
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
							actionForm.attr("action", "rent/view") //바꾸기 앞에는 속성이름 뒤에는 바꾸는거
							actionForm.submit(); //실행
						});
	});
</script>
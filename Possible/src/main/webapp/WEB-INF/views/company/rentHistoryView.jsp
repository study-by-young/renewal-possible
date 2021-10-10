<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">
.pagination {
	justify-content: center;
}

.select {
	width: 70px; /* 원하는 너비설정 */
	padding: .4em .4em; /* 여백으로 높이 설정 */
	border: 1px solid #999;
	font-family: inherit; /* 폰트 상속 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	border-radius: .5em;
	-moz-appearance: none;
	appearance: none;
}

.input {
	width: 200px; /* 원하는 너비설정 */
	padding: .4em .4em; /* 여백으로 높이 설정 */
	border: 1px solid #999;
	font-family: inherit; /* 폰트 상속 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	border-radius: .5em;
	-moz-appearance: none;
	appearance: none;
}

.card-body {
    padding: 50px;
}
</style>
<!-- Main content -->
		<div class="content-wrapper">

			<!-- Content area -->
			<div class="content">

				<div class="card">
					<div class="card-header header-elements-inline">
						<h6 class="card-title">번호</h6>
						<div class="header-elements">
							
						</div>
					</div>

					<div class="card-body py-0">
						<div class="row">
							<div class="col-sm-12">
							<div class="row">
								<div class="col-md-12">
										
										<div class="form-group">
											<label>번호</label> 
											<input type="text" class="form-control" name='seq' value='<c:out value="${rentHistory.seq}"/>'readonly="readonly">
										</div>

										<div class="form-group">
											<label>구분</label> 
											<input type="text" class="form-control" name='name' value='<c:out value="${rentHistory.rentType}"/>'readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>시작일자</label> 
											<input class="form-control" name='startDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistory.startDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>수령일자</label> 
											<input class="form-control" name='receiveDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistory.receiveDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>반납일자</label> 
											<input class="form-control" name='returnDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistory.returnDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>끝일자</label> 
											<input class="form-control" name='endDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistory.endDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>수령자</label>
											<input type="text" class="form-control" name='receiver' value='<c:out value="${rentHistory.receiver}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>가격</label>
											<input type="text" class="form-control" name='price' value='<c:out value="${rentHistory.price}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>견적</label>
											<input type="text" class="form-control" name='estimate' value='<c:out value="${rentHistory.estimate}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>상태</label>
											<input type="text" class="form-control" name='status' value='<c:out value="${rentHistory.status}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>등록일자</label> 
											<input class="form-control" name='genDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistory.genDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>갱신일자</label> 
											<input class="form-control" name='uptDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${rentHistory.uptDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>takePlaceCode</label>
											<input type="text" class="form-control" name='takePlaceCode' value='<c:out value="${rentHistory.takePlaceCode}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>takePlaceBasic</label>
											<input type="text" class="form-control" name='takePlaceCode' value='<c:out value="${rentHistory.takePlaceBasic}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>takePlaceDetail</label>
											<input type="text" class="form-control" name='takePlaceDetail' value='<c:out value="${rentHistory.takePlaceDetail}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>merchantUid</label>
											<input type="text" class="form-control" name='merchantUid' value='<c:out value="${rentHistory.merchantUid}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>payMethod</label>
											<input type="text" class="form-control" name='payMethod' value='<c:out value="${rentHistory.payMethod}"/>' readonly="readonly">
										</div>
										
										
											
											
								</div>
								</div>
						
						<br>
								</div>
							</div>
						</div>
					</div>

				</div>
</div>
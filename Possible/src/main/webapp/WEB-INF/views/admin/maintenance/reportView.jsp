<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h6 class="card-title"></h6>
						<div class="header-elements">
							
						</div>
					</div>

					<div class="card-body py-0">
						<div class="row">
							<div class="col-sm-12">
									<div class="row">
								<div class="col-md-12">
										<input type="hidden" class="form-control" name='seq' value='<c:out value="${comRegList.seq}"/>' readonly="readonly">
										<input type="hidden" class="form-control" name='memSeq' value='<c:out value="${comRegList.memSeq}"/>' readonly="readonly">
										
										<div class="form-group">
											<input type="hidden" class="form-control" name='seq' value='<c:out value="${report.seq}"/>'readonly="readonly">
										</div>
										
										<div class="row">
										<div class="col-sm-6">									
										<div class="form-group">
											<h5 class="font-weight-bold"><label>게시글 번호</label></h5> 
											<input type="text" class="form-control" name='target' value='<c:out value="${report.target}"/>' readonly="readonly" style="color:red">
										</div>
										</div>
										
										<div class="col-sm-6">	
												<div class="form-group">
													<h5 class="font-weight-bold"><label></label></h5> 
													<a href="${pageContext.request.contextPath}/community/course/view?seq=${report.target}"><i class="icon-square-up-right mr-3 icon-2x"></i></a>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-sm-6">	
												<div class="form-group">
													<h5 class="font-weight-bold"><label>게시글 작성자</label></h5> 
													  <input type="text" id="writer" class="form-control" name='writer' value='<c:out value="${report.writer}"/>' readonly="readonly">
												</div>
											</div>
											
											<div class="col-sm-6">	
												<div class="form-group">
													<h5 class="font-weight-bold"><label></label></h5> 
													<a href="${pageContext.request.contextPath}/admin/maintenance/member/view?seq=${report.memSeq}"><i class="icon-square-up-right mr-3 icon-2x"></i></a>
												</div>
											</div>
										</div>
										<div class="form-group">
											<h5 class="font-weight-bold"><label>신고자</label></h5> 
											<input type="text" class="form-control" name='reason' value='<c:out value="${report.reporter}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<h5 class="font-weight-bold"><label>이유</label></h5> 
											<input type="text" class="form-control" name='reason' value='<c:out value="${report.reason}"/>' readonly="readonly">
										</div>
										
										<div class="row">
										<div class="col-md-6">
										<div class="form-group">
											<h5 class="font-weight-bold"><label>신고일자</label></h5> 
											<input class="form-control" name='genDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${report.genDate }"/>' readonly="readonly">				
										</div>
										</div>
										
										
										</div>
										<div align="right">
										<a class="btn btn-primary" id="list_btn" href="${pageContext.request.contextPath}/admin/maintenance/report">목록</a>
										</div>
										<br>
								</div>

								</div>
							</div>

							
							

							</div>
						</div>
					</div>

				</div>
</div>
  







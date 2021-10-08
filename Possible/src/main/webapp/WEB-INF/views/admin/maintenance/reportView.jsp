<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

.card-body{
	padding:50px;
}
</style>

<div class="col-md-8">
	<div class="blog_single_comment_heading">
		<h4>신고글 한건</h4>
	</div>
		<!-- 2 columns form -->
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="card-title">신고글</h5>
					
					</div>

					<div class="card-body">
							<div class="row">
								<div class="col-md-12">
										<input type="hidden" class="form-control" name='seq' value='<c:out value="${comRegList.seq}"/>' readonly="readonly">
										<input type="hidden" class="form-control" name='memSeq' value='<c:out value="${comRegList.memSeq}"/>' readonly="readonly">
										
										<div class="form-group">
											<label>번호</label> 
											<input type="text" class="form-control" name='seq' value='<c:out value="${report.seq}"/>'readonly="readonly">
										</div>
										
										<div class="form-group">
													<label>제목</label>
													<input type="text" class="form-control" name='title' value='<c:out value="${report.title}"/>' readonly="readonly">
												</div>
											
												<div class="form-group">
													<label>내용</label>
													<input type="text" class="form-control" name='content' value='<c:out value="${report.content}"/>' readonly="readonly">
												</div>
										
										<div class="form-group">
											<label>타겟</label> 
											<input type="text" class="form-control" name='target' value='<c:out value="${report.target}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>작성자</label> 
											<input type="text" class="form-control" name='writer' value='<c:out value="${report.writer}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>이유</label> 
											<input type="text" class="form-control" name='reason' value='<c:out value="${report.reason}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>가입일자</label> 
											<input class="form-control" name='genDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${report.genDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>수정일자</label> 
											<input class="form-control" name='uptDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${report.uptDate }"/>' readonly="readonly">						
										</div>
										
										<a class="btn btn-primary" id="list_btn" href="${pageContext.request.contextPath}/admin/maintenance/report">목록</a>
								</div>
								</div>
					</div>
				</div>
				
				<!-- /2 columns form -->
</div>
<script>

</script>






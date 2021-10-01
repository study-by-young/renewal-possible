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
		<h4>업체 승인</h4>
	</div>
		<!-- 2 columns form -->
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="card-title">업체정보</h5>
					
					</div>

					<div class="card-body">
						<form role="form" action="companyOneSelect" method="post">
							<div class="row">
								<div class="col-md-12">
										<input type="hidden" class="form-control" name='seq' value='<c:out value="${comRegList.seq}"/>' readonly="readonly">
										
										<div class="form-group">
											<label>업체명</label> 
											<input type="text" class="form-control" name='name' value='<c:out value="${comRegList.name}"/>'readonly="readonly">
										</div>
										
										<div class="form-group">
													<label>POSTAL</label>
													<input type="text" class="form-control" name='cmpnNum' value='<c:out value="${comRegList.postal}"/>' readonly="readonly">
												</div>
										
											
												<div class="form-group">
													<label>사업자번호</label>
													<input type="text" class="form-control" name='cmpnNum' value='<c:out value="${comRegList.cmpnNum}"/>' readonly="readonly">
												</div>
										
										<div class="form-group">
											<label>대표번호</label> 
											<input type="text" class="form-control" name='tel' value='<c:out value="${comRegList.tel}"/>' readonly="readonly">
										</div>
										
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
												<label>사업지 주소</label> 
													<input type="text" class="form-control" name='addrCode' value='<c:out value="${comRegList.addr1}"/>' readonly="readonly">
												</div>
											</div>
											
											<div class="col-md-4">
												<div class="form-group">
												<label>&nbsp;</label> 
													<input type="text" class="form-control" name='addrBasic' value='<c:out value="${comRegList.addr2}"/>' readonly="readonly">
												</div>
											</div>
											
											<div class="col-md-4">
												<div class="form-group">
												<label>&nbsp;</label> 
													<input type="text" class="form-control" name='addrDetail'value='<c:out value="${comRegList.area}"/>' readonly="readonly">
												</div>
											</div>
										</div>
																			
										<div class="col-md-4">
												<div class="form-group">
												<label>상태</label> 
													<input type="text" class="form-control" name='status' value='<c:out value="${comRegList.status}"/>' readonly="readonly">
												</div>
											</div>
										
										<div class="form-group">
											<label>가입일자</label> 
											<input class="form-control" name='genDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${comRegList.genDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>수정일자</label> 
											<input class="form-control" name='uptDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${comRegList.uptDate }"/>' readonly="readonly">						
										</div>
								</div>
								</div>
							<br>
							<div class="text-right">
							<c:if test="${comRegList.status eq 'N'}">
								<button class="btn btn-primary" onclick="reg()">승인</button>
								<button id="del" formaction="companyRegDelete" class="btn btn-primary">거부</button>
							</c:if>
							</div>
						</form>
					</div>
				</div>
				
				<!-- /2 columns form -->
</div>
<script>
	function reg(){
		if(confirm("승인하시겠습니까?") == true ){
			document.form.submit();
		}else{
			return false;
		}
	}
	
	$("#del").on("click", function(){
		if(confirm("거부하시겠습니까?") == true ){
			document.form.submit();
		}else{
			return false;
		}
	});
	
	
	
</script>




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
		<h4>회원 관리</h4>
	</div>
		<!-- 2 columns form -->
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="card-title">회원정보수정</h5>
					
					</div>

					<div class="card-body">
						<form role="form" action="view" method="post">
							<div class="row">
								<div class="col-md-12">
									<fieldset>
										<input type="hidden" class="form-control" name='seq' value='<c:out value="${member.seq}"/>' readonly="readonly">
										
										<div class="form-group">
											<label>이름</label> 
											<input type="text" class="form-control" name='name' value='<c:out value="${member.name}"/>'readonly="readonly">
										</div>
										
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>아이디</label>
													<input type="text" class="form-control" name='id' value='<c:out value="${member.id}"/>' readonly="readonly">
												</div>
											</div>
											
											<div class="col-md-6">
												<div class="form-group">
													<label>비밀번호</label>
													<input type="password" class="form-control" name='password' value='<c:out value="${member.password}"/>' readonly="readonly">
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<label>생년월일</label> 
											<input type="text" class="form-control" name='birth' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${member.birth }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>이메일</label> 
											<input type="text" class="form-control" name='email' value='<c:out value="${member.email}"/>' readonly="readonly">
										</div>
										
										<div class="form-group">
											<label>휴대전화</label> 
											<input type="text" class="form-control" name='phone' value='<c:out value="${member.phone}"/>' readonly="readonly">
										</div>
										
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
												<label>주소</label> 
													<input type="text" class="form-control" name='addrCode' value='<c:out value="${member.addrCode}"/>' readonly="readonly">
												</div>
											</div>
											
											<div class="col-md-4">
												<div class="form-group">
												<label>&nbsp;</label> 
													<input type="text" class="form-control" name='addrBasic' value='<c:out value="${member.addrBasic}"/>' readonly="readonly">
												</div>
											</div>
											
											<div class="col-md-4">
												<div class="form-group">
												<label>&nbsp;</label> 
													<input type="text" class="form-control" name='addrDetail'value='<c:out value="${member.addrDetail}"/>' readonly="readonly">
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<label>권한</label> 
											<input type="text" class="form-control" name='author' value='<c:out value="${member.author}"/>' readonly="readonly"> 
										</div>
									
										<div class="form-group">
											<label>상태</label>
											<select name='status' class="form-control form-control-select2">
												<option value='status' name='status'>${member.status}</option>
												<c:if test="${member.status eq 'Y' }"><option value='N' name='status'>N</option></c:if>
												<c:if test="${member.status eq 'Y' }"><option value='D' name='status'>D</option></c:if>
												<c:if test="${member.status eq 'N' }"><option value='Y' name='status'>Y</option></c:if>
												<c:if test="${member.status eq 'N' }"><option value='D' name='status'>D</option></c:if>
												<c:if test="${member.status eq 'D' }"><option value='Y' name='status'>Y</option></c:if>
												<c:if test="${member.status eq 'D' }"><option value='N' name='status'>N</option></c:if>
											</select>
										</div>
										
										<div class="form-group">
											<label>가입일자</label> 
											<input class="form-control" name='genDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${member.genDate }"/>' readonly="readonly">				
										</div>
										
										<div class="form-group">
											<label>수정일자</label> 
											<input class="form-control" name='uptDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${member.uptDate }"/>' readonly="readonly">						
										</div>
									</fieldset>
								</div>
							</div>
							<br>
							<div class="text-right">
								<button id="up" type="submit" class="btn btn-primary">수정하기</button>
						  		<button class="btn btn-primary" id="list_btn">목록</button>
							</div>
						</form>
					</div>
				</div>
				<!-- /2 columns form -->
</div>
<script>

$("#up").on("click", function(){
	if(confirm("수정하시겠습니까?") == true ){
		document.form.submit();
	}else{
		return false;
	}
});

$("#list_btn").on(
		"click",
		function(e) {
			form.find("#seq").remove();
			form.attr("action",
					"${pageContext.request.contextPath}/admin/maintenance/member?pageNum="
							+ $('#pageNum').val() + "&amount="
							+ $('#amount').val());
			form.submit();
		})
</script>







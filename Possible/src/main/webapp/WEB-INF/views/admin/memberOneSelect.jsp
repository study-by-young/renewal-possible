<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Modify</div>
			<div class="panel-body">
				<form role="form" action="memberOneSelect" method="post">
					<input class="form-control" name='seq'
						value='<c:out value="${member.seq}"/>' readonly="readonly">
					<input class="form-control" name='id'
						value='<c:out value="${member.id}"/>' readonly="readonly">
					<input class="form-control" name='password'
						value='<c:out value="${member.password}"/>' readonly="readonly">
					<input class="form-control" name='name'
						value='<c:out value="${member.name}"/>' readonly="readonly">
					<input class="form-control" name='birth' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${member.birth }"/>' readonly="readonly">				
					<input class="form-control" name='email'
						value='<c:out value="${member.email}"/>' readonly="readonly">
					<input class="form-control" name='phone'
						value='<c:out value="${member.phone}"/>' readonly="readonly">
					<input class="form-control" name='addrCode'
						value='<c:out value="${member.addrCode}"/>' readonly="readonly">
					<input class="form-control" name='addrBasic'
						value='<c:out value="${member.addrBasic}"/>' readonly="readonly">
					<input class="form-control" name='addrDetail'
						value='<c:out value="${member.addrDetail}"/>' readonly="readonly">
					<input class="form-control" name='author'
							value='<c:out value="${member.author}"/>' readonly="readonly"> 
						
						<select name='status'>
							<option value='status' name='status'>${member.status}</option>
							<option value='Y' name='status'>Y</option>
							<option value='N' name='status'>N</option>
						</select> 
						
	 
						<input class="form-control" name='genDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${member.genDate }"/>' readonly="readonly">				
							<input class="form-control" name='uptDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${member.uptDate }"/>' readonly="readonly">						
					<button type="submit" class="btn btn-defult">Modify</button>
					<a class="btn btn-defult"
						href="memberList?pageNum=${cri.pageNum}&amount=${cri.amount}">List</a>
				</form>


			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- /.row -->
</div>
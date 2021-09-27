<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="lr_bc_first_box_img_cont_wrapper">
		<h2>${notice.title}</h2>
		<ul>
			<li><i class="fa fa-calendar"></i>&nbsp; <a>${notice.writer}</a></li>
			<li><i class="fa fa-user-o"></i>&nbsp; <a>${notice.genDate}</a></li>
			<li><i class="fa fa-comments-o"></i>&nbsp; <a>${notice.views}</a></li>
		</ul>
		<p>
			${notice.content}
		</p>
	</div>
	<div class="lr_bc_first_box_img_cont_wrapper" align="right">
		<button type="button" class="btn btn-primary" onclick="location.href='list'">목록</button>
		<button type="button" class="btn btn-dark" onclick="location.href='update?seq=${notice.seq}'">수정</button>
		<button id="deleteBtn" type="button" class="btn btn-dark">삭제</button>
	</div>
</div>
<br><br>
<script>
$('#deleteBtn').on('click', function(){

	var result = confirm('삭제 하시겠습니까?');
	
	if(result == true) {
		location.href='delete?seq=${notice.seq}';
	}
	else {
		return;
	}
})
</script>
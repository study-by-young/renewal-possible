<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	ul {
		list-style: none;
	}
	
	li {
		float: left;
	}
	
	li:last-child {
		float: none;
	}
	
	.card-header+.card-footer {
		border-bottom: 0px;
	}
	
	.card-footer {
		background-color: white;
	}
	
	.card {
    margin-bottom: 3rem;
    }
    
	.input_title {
		width: 100%;
		height: 50px;
		border: 1px solid lightgray;
		padding: 10px 8px;
		border-radius: 5px;
	}  
</style>

<div class="container">
	<div class="card" style="margin-top: 50px; padding: 20px;">
		<div class="card-header lr_bc_first_box_img_cont_wrapper">
			<h2 style="font-weight: 600; margin-bottom: 25px;">${qna.title}</h2>
			<ul style="padding-left: 5px;">
				<li><i class="fa fa-user"></i>&nbsp; <a>${qna.writer}</a></li>
				<li>&nbsp;&nbsp; <i class="fa fa-calendar"></i>&nbsp; <a><fmt:formatDate value="${qna.genDate}" pattern="yy년 MM월 dd일" /></a></li>
				<li>&nbsp;&nbsp; <i class="fa fa-eye"></i>
					&nbsp; 
					<a>
						<c:choose>
							<c:when test="${qna.answerCnt>='1'}">
								<td>답변완료</td>
							</c:when>
							<c:otherwise>
								<td>답변대기</td>
							</c:otherwise>
						</c:choose>
					</a>
				</li>
			</ul>
			<hr>
			<div class="card-body">${qna.content}</div>
		</div>
		<div class="card-footer lr_bc_first_box_img_cont_wrapper" align="right" style="border-bottom: 0px;">
			<!-- <button class="btn btn-primary" type="button" id="list_btn">목록</button> -->
			<button class="btn btn-primary" type="button" id="list_btn" >목록</button>
			<button class="btn btn-dark" type="button" id="update_btn">수정</button>
			<button id="deleteBtn" type="button" class="btn btn-dark">삭제</button>
		</div>
		<form id="intoForm" action="${pageContext.request.contextPath}/qna/update" method="get">
			<input type="hidden" id="seq" name="seq"
				value='<c:out value="${qna.seq}"/>'> <input type="hidden"
				id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" id="amount" name="amount"
				value='<c:out value="${cri.amount}"/>'>
		</form>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-laballedby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 답변 작성 폼 -->
	
	<c:if test="${user.author eq 'ROLE_ADMIN'}">
		<div class="card" style="margin-top: 50px; padding: 20px;">
			<form id="answerForm">
				<input type="hidden" id="qnaSeq" name="qnaSeq" value="${qna.seq}">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card-header">
							<div class="card-header col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 0px; padding-left: 0px; padding-bottom: 0px;">
								<div class="contect_form1">
									<h2 style="font-weight: 600;">문의 답변 등록</h2>
								</div>
							</div>
							<div class="card-header col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 10px 0px;">
								<div class="contect_form1">
									<input class="input_title" type="hidden" id="title" name="title" value="RE: ${qna.title}" readonly="readonly">
								</div>
							</div>
							<div class="col-xl-12 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="contect_form2">
									<input type="hidden" id="writer" name="writer" placeholder="writer" value="${user.id}" readonly="readonly">
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
								<div class="contect_form4">
									<!-- <textarea id="content" name="content" class="ckeditor" required="required"></textarea> -->
									<textarea class="input_title" id="content" name="content" required="required" style="width: 100%; height: 250px;"></textarea>
								</div>
								<br>
							</div>
					<!-- 		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
								<div class="contect_form4">
									<input id="content" name="content" required="required">
								</div>
								<br>
							</div> -->
						</div>
						<div class="card-footer col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12"
							align="right">
							<button type="button" id="saveAnswer" class="btn btn-primary">답변등록</button>
							<!-- <button type="button" id="updateAnswer" class="btn btn-dark">수정</button> -->
						</div>
					</div>
				</div>
			</form>
		</div>	
	</c:if>
	
<%-- 	<div class="row">
		<div class="panel-heading">
			<form id="answerForm">
				<input type="hidden" id="qnaSeq" name="qnaSeq" value="${qna.seq}">
				<input id="writer" name="writer" value="user10">
				<input id="title" name="title">
				<input id="content" name="content" size="30">
				
				<button type="button" id="saveAnswer">답변등록</button>
				<button type="button" id="updateAnswer">수정</button>
	  		</form>
		</div>
	</div> --%>


<%-- 
	<!-- 답변 보여주는 위치 -->
	<div class="row">
		<div class="col-lg-12">
			<!-- panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>답변
				</div>
				<div class="panel-body">
					<ul class="chat">
						<!-- 답변 내용은 여기에 추가됩니다. / 스크립트로 추가 -->
					</ul>
				</div>
				<div class="panel-footer"></div>
			</div>
			<!-- end panel -->
		</div>
		<!-- end row -->
	</div>
--%>	
 
<%-- 	<c:choose>
		<c:when test="${qna.answerCnt>='1'}">
		 	<!-- 답변 보여주는 위치 -->
		  	<div class="card">
		  		<ul class="chat" style="padding-left: 0px;">
		  		</ul>
			</div>
		</c:when>
		<c:otherwise>
			<div></div>
		</c:otherwise>
	</c:choose> --%>
 
  	<c:if test="${qna.answerCnt>='1'}">
	 	<!-- 답변 보여주는 위치 -->
	  	<div class="card">
	  		<ul class="chat" style="padding-left: 0px;">
	  		</ul>
		</div>
	</c:if>
	
</div>

<script>
	// 게시글 삭제
	$('#deleteBtn').on('click', function() {

		var result = confirm('삭제 하시겠습니까?');

		if (result == true) {
			location.href = '${pageContext.request.contextPath}/qna/delete?seq=${qna.seq}';
			form.find("#seq").remove();
			form.attr("action", "${pageContext.request.contextPath}/mypage/qna");
			//form.attr("action", "${pageContext.request.contextPath}/qna/list?pageNum=" + $('#pageNum').val() + "&amount=" + $('#amount').val());
			form.submit();
		} else { 
			return;
		}
	})

	// 게시글 수정
	let form = $("#intoForm");

	$("#list_btn").on("click", function(e) {
		form.find("#seq").remove();
		form.attr("action", "${pageContext.request.contextPath}/mypage/qna");
		// /qna/list?pageNum=" + $('#pageNum').val() + "&amount=" + $('#amount').val());
		form.submit();
	})

	$("#update_btn").on("click", function(e) {
		form.attr("action", "${pageContext.request.contextPath}/qna/update")
		form.submit();
	})
	
	
	$(document).ready(function(){
		var updateResult = '<c:out value="${updateResult}"/>';
		checkModal(updateResult);
		
		function checkModal(updateResult) {
			if (updateResult === '') {
				return;
			}
			if (parseInt(updateResult) > 0) {
				$('.modal-body').html("문의글 수정이 완료되었습니다.");
			}
			$('#myModal').modal('show');
		}
	})
	
	
	
 	const qnaSeq = "${qna.seq}";
	
	$(document).ready(function() {
		
		qnaAnswerList();
		
		$('#saveAnswer').on('click', function() {
			qnaAnswerService.add(function(data) {
				$('.chat').append(makeLi(data));
			});
		});
		
		function qnaAnswerList() {
			
			$.ajax({
				url : '../answer/',
				data : {
					qnaSeq : qnaSeq
				},
				type : 'get',
				dataType : 'json',
				success : function(datas) {
					var str = "";
					for (i = 0; i < datas.length; i++) {
						str += makeLi(datas[i]);
					}
					$('.chat').html(str);
				},
				error: function(reject){
					console.log(reject);
				}
			});
		}
		
/*  		function makeLi(data) {
			return '<li data-seq="' + data.seq + '"class="left clearfix">'
					+ '	<div>'
					+ '		<div class="header">'
					+ '			<strong class="primary-font">'
					+ data.writer
					+ '</strong>'
					+ '			<small class="pull-right text-muted">'
					+ displayTime(data.genDate)
					+ '</small>'
					+ '			<p>'
					+ data.title
					+ '</small>'
					+ '			<p>'
					+ data.content
					+ '</p>'
					+ '			<p align="right"><button id="readQnaAnswer">보기</button>&nbsp;<button id="deleteQnaAnswer">삭제</button></p>'
					+ '		</div>' + '	</div>' + '</li>'
		} */
		

		function makeLi (data) {
			return	'<li data-seq="' + data.seq + '" style="padding: 20px;">'
				+	'	<div class="card-header lr_bc_first_box_img_cont_wrapper">'
				+	'		<h2 style="font-weight: 600; margin-bottom: 25px;">' + data.title + '</h2>'
				+	'		<ul style="padding-left: 5px;">'
				+	'			<li><i class="fa fa-user"></i>&nbsp; <a>관리자</a></li>'
				+	'		</ul>'
				+	'		<hr>'
				+	'		<div class="card-body">' + data.content + '</div>'
				+	'	</div>'
				+	'	<div class="card-footer lr_bc_first_box_img_cont_wrapper" align="right" style="border-bottom: 0px;">'
/* 				+	'		<button class="btn btn-primary" type="button" id="readQnaAnswer">보기</button>' */
 				+	'		<c:if test="${user.author eq 'ROLE_ADMIN'}">'
				+	'			<button class="btn btn-dark" type="button" id="deleteQnaAnswer">삭제</button>'
				+	'		</c:if>'
				+	'	</div>'	
				+	'</li>'
		}
		
		
		$('body').on('click', '#readQnaAnswer', function() {
			var seq = $(this).closest('li').data('seq');
			$.ajax({
				url : '../answer/' + seq,
				type : 'GET',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 : " + status + " Http에러메시지 : " + msg);
				},
				success : qnaAnswerSelectResult
			});
		});		
		
		function qnaAnswerSelectResult(data) {
			$('input:text[name="writer"]').val(data.writer);
			$('input:text[name="content"]').val(data.content);
		}
		
		$('body').on('click', '#updateAnswer', function() {
			var writer = $('input:text[name="writer"]').val();
			var content = $('input:text[name="content"]').val();

			$.ajax({
				url : '../answer/',
				type : 'put',
				dataType : 'json',
				data : JSON.stringify({
					writer : writer,
					content : content
				}),
				contentType : 'application/json',
				error : function(xhr, status, msg) {
					alert("상태값 : " + status + " Http에러메시지 : " + msg);
				},
				success : function(data) {
					qnaAnswerList();
				}
			});
			
		});		
		
		$('body').on('click', '#deleteQnaAnswer', function() {
			var seq = $(this).closest('li')
					.data('seq');
			var result = confirm('정말로 삭제하시겠습니까?');
			var li = $(this).closest('li');
			if (result) {
				$.ajax({
					url : '../answer/' + seq,
					type : 'DELETE',
					dataType : 'json',
					error : function(xhr, status, msg) {
						console.log("상태값 : " + status + " Http에러메시지 : " + msg);
					},
					success : function(xhr) {
						if (xhr == true) {
							console.log(xhr.result);
							li.remove();
							alert("삭제완료");
						}
					}
				}); // ajax 끝
			} // if
		}); // 삭제버튼 클릭		
	
		function displayTime(timeValue) {
			const today = new Date();

			const gap = today.getTime() - timeValue;

			const dateObj = new Date(timeValue);

			let str = "";

			if (gap < (1000 * 60 * 60 * 24)) {

				let hh = dateObj.getHours();
				let mi = dateObj.getMinutes();
				let ss = dateObj.getSeconds();

				return [ (hh > 9 ? '' : '0') + hh, ':',
						(mi > 9 ? '' : '0') + mi, ':',
						(ss > 9 ? '' : '0') + ss ].join('');
			} else {
				let yy = dateObj.getFullYear();
				let mm = dateObj.getMonth() + 1;
				let dd = dateObj.getDate();
				return [ yy, '/', (mm > 9 ? '' : '0') + mm,
						'/', (dd > 9 ? '' : '0') + dd ]
						.join('');
			}
		}		
		
	})
	
	const qnaAnswerService = (function(){
   
   // 댓글 등록
	function add(callback, error) { 
	   $.ajax({
	      url: '../answer/',
	      data: $('#answerForm').serialize(),
	      method: 'POST',
	      dataType: 'json',
	      success: function(data){
	         if(callback) callback(data);
	         window.location.reload();
	      },
	      error: function(){ if(error) error(); }
	   });
	}
   
   
    // 목록 조회
	function getList(param, callback, error) {
	
	   $.ajax({
	      url: '../answer/',
	      data: param,
	      dataType: 'json',
	      success: function(data){
	         if(callback)
	         // callback(data)
	         callback(data);
	      },
	      error: function(){ if(error) error(); }      
	   });      
	}
	
	
	return {add: add, getList: getList}
   
})();
 
</script>
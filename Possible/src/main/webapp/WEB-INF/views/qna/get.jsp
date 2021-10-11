<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="lr_bc_first_box_img_cont_wrapper">
		<h2>${qna.title}</h2>
		<ul>
			<li><i class="fa fa-calendar"></i>&nbsp; <a>${qna.writer}</a></li>
			<li><i class="fa fa-user-o"></i>&nbsp; <a>${qna.genDate}</a></li>
			<li><i class="fa fa-comments-o"></i>&nbsp; <a>${qna.status}</a></li>
		</ul>
		<p>${qna.content}</p>
	</div>
	<div class="lr_bc_first_box_img_cont_wrapper" align="right">
		<button class="btn btn-primary" type="button" id="list_btn">목록</button>
		<button class="btn btn-dark" type="button" id="update_btn">수정</button>
		<button id="deleteBtn" type="button" class="btn btn-dark">삭제</button>
	</div>
	<form id="intoForm"
		action="${pageContext.request.contextPath}/qna/update" method="get">
		<input type="hidden" id="seq" name="seq"
			value='<c:out value="${qna.seq}"/>'> <input type="hidden"
			id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" id="amount" name="amount"
			value='<c:out value="${cri.amount}"/>'>
	</form>
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
	<div class="row">
		<div class="panel-heading">
			<form id="answerForm">
				<input type="hidden" id="qnaSeq" name="qnaSeq" value="${qna.seq}">
				<input id="writer" name="writer" value="user10">
				<input id="title" name="title">
				<input id="content" name="content" size="30">
				<!-- 버튼 -->
				<button type="button" id="saveAnswer">답변등록</button>
				<button type="button" id="updateAnswer">수정</button>
	  		</form>
		</div>
	</div>

	
	<!-- 답변 보여주는 위치 -->
	<div class='row'>
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
	
</div>
<br>
<br>
<script>
	$('#deleteBtn').on('click', function() {

		var result = confirm('삭제 하시겠습니까?');

		if (result == true) {
			location.href = 'delete?seq=${qna.seq}';
			form.find("#seq").remove();
			form.attr("action",
					"${pageContext.request.contextPath}/qna/list?pageNum="
							+ $('#pageNum').val() + "&amount="
							+ $('#amount').val());
			form.submit();
		} else {
			return;
		}
	})

	let form = $("#intoForm");

	$("#list_btn").on(
			"click",
			function(e) {
				form.find("#seq").remove();
				form.attr("action",
						"${pageContext.request.contextPath}/qna/list?pageNum="
								+ $('#pageNum').val() + "&amount="
								+ $('#amount').val());
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
	
	
	
/* 	$(function() {
		
		$('#saveAnswer').click(function() {
			console.log("들어오겠냐?");
			var content = $('#content').val();
			var	writer = $('#writer').val();
			var	seq = $('#seq').val();
			
			$.ajax({
				url : '../answer/',
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					qnaAnswerList();
					$('#content').val('');
					$('#writer').val('');
				},
				error : function(error) {
					console.log("에러 : " + error);
				}
			})
		})
	}) */
	
	
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
				dataType : 'json',
				success : function(datas) {
					var str = "";
					for (i = 0; i < datas.list.length; i++) {
						str += makeLi(datas.list[i]);
					}
					$('.chat').html(str);
				}
			});
		}
		
		function makeLi(data) {
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
					+ data.content
					+ '</p>'
					+ '			<p align="right"><button id="readQnaAnswer">보기</button>&nbsp;<button id="deleteQnaAnswer">삭제</button></p>'
					+ '		</div>' + '	</div>' + '</li>'
		}
		
		$('body')
		.on(
				'click',
				'#readQnaAnswer',
				function() {
					var seq = $(this).closest('li')
							.data('seq');
					$.ajax({
						url : '../answer/' + seq,
						type : 'GET',
						dataType : 'json',
						error : function(xhr, status,
								msg) {
							alert("상태값 :" + status
									+ " Http에러메시지 :"
									+ msg);
						},
						success : qnaAnswerSelectResult
					});
				});		
		
		function qnaAnswerSelectResult(data) {
			$('input:text[name="writer"]').val(data.writer);
			$('input:text[name="content"]').val(data.content);
		}
		
		$('body').on('click', '#updateAnswer', function() {
			var writer = $(
					'input:text[name="writer"]')
					.val();
			var content = $(
					'input:text[name="content"]')
					.val();

					$.ajax({
						url : '../answer/',
						type : 'put',
						dataType : 'json',
						data : JSON.stringify({
							writer : writer,
							content : content
						}),
						contentType : 'application/json',
						error : function(xhr,
								status, msg) {
							alert("상태값 :"
									+ status
									+ " Http에러메시지 :"
									+ msg);
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
							url : '../answer/'
									+ seq,
							type : 'DELETE',
							dataType : 'json',
							error : function(
									xhr,
									status, msg) {
								console
										.log("상태값 :"
												+ status
												+ " Http에러메시지 :"
												+ msg);
							},
							success : function(
									xhr) {
								if (xhr == true) {
									console
											.log(xhr.result);
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
   

   return {add:add, getList:getList}
   
})();
 
</script>
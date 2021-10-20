<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%-- <div class="accordion" id="accordionExample">
  <div class="card">
  <c:forEach items="${list}" var="faq">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          ${faq.title}
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
        ${faq.content}
      </div>
    </div>
    </c:forEach>
  </div>

</div>

<script>
    var acc = document.getElementsByClassName("accordion");
    var i;
 
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
</script>
 --%>

<script type="text/javascript">
	function check(tag) {
		console.log($(tag).children().text());

		var tab = $(tag).children().text();
		/* $.ajax({
			type : 'GET',
			url : 'category',
			data : {category : $(this).text()},
			dataType : 'json',
			success : function(datas) {
				str = "";
				for (i=0; i < datas.categoryTab.length; i++) {
					str += makeLi(datas.categoryTab[i]);
				$(".categoryContent").html(str);
				}
			},
			error : function() {
				alert("error");
			}
		}) */
	}
	/* 
	$(".tabmenu").on("click", function(){
		
		console.log("abdakd");
		var tab = $(tag).children().text();
		$.ajax({
			type : 'GET',
			url : 'category',
			data : {category : tab},
			dataType : 'json',
			success : function(datas) {
				str = "";
				for (i=0; i < datas.categoryTab.length; i++) {
					str += makeLi(datas.categoryTab[i]);
				$(".categoryContent").html(str);
				}
			},
			error : function() {
				alert("error");
			}
		})
	}); */
</script>


<style>
.accordion {
	background-color: #ffffff;
	cursor: pointer;
	padding: 16px;
	width: 100%;
	outline: none;
	border: none;
	text-align: left;
	font-size: 16px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #f5f5f5;
	font-weight: bold;
}

.accordion:after {
	content: '\002B';
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.panel {
	padding: 0 16px;
	background-color: #ffffff;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	border-bottom: 1px solid #eeeeee;
}

.custom-input input {
	/* width: 100%; */
	height: 42px;
	padding-left: 10px;
	border: 1px solid #e8e8e8;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 5px;
}

.custom-btn {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
</style>

<div class="container">
	<div style="margin-top: 50px;">

		<div class="card" style="padding: 20px 0px;">
			<div class="card-header header-elements-inline">
				<h2 class="card-title" style="font-weight: 600; padding-left: 20px;">FAQ</h2>
				<div class="header-elements">
					<div class="list-icons" style="padding-right: 20px;">
						<a class="list-icons-item" data-action="collapse"></a> <a
							class="list-icons-item" data-action="reload"></a>
					</div>
				</div>
			</div>

			<div class="custom-input" style="padding: 20px; padding-top: 0px;">
				<form id="actionForm"
					action="${pageContext.request.contextPath}/faq/list" method="get">
					<div style="display: inline-flex; width: 15%; padding-left: 20px;">

						<select name="type" class="select select-wrapper">
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
						</select> &nbsp;
					</div>
					<input class="input" name="keyword"
						value="${pageMaker.cri.keyword}"> <input type="hidden"
						name="pageNum" value="${pageMaker.cri.pageNum}"> <input
						type="hidden" name="amount" value="${pageMaker.cri.amount}">&nbsp;
					<button class="custom-btn btn-primary"
						onclick="$('[name=pageNum]').val(1)">검색</button>
				</form>
				<br>
			</div>

			<!-- Light navbar demo -->
			<div class="mb-4">
				<div
					class="navbar navbar-expand-xl navbar-light bg-light navbar-component rounded">
					<div class="text-center d-xl-none w-100">
						<button type="button" class="navbar-toggler dropdown-toggle"
							data-toggle="collapse" data-target="#navbar-demo2-mobile">
							<i class="icon-unfold mr-2"></i> Light navbar component
						</button>
					</div>

					<div class="navbar-collapse collapse" id="navbar-demo2-mobile">
						<ul id="category" class="nav navbar-nav tab">
							<li class="nav-item tabmenu on" id="default"><a href="#"
								class="navbar-nav-link">대여안내</a></li>
							<li class="nav-item tabmenu"><a href="#"
								class="navbar-nav-link">인수/반납</a></li>
							<li class="nav-item tabmenu"><a href="#"
								class="navbar-nav-link">자차보험</a></li>
							<li class="nav-item tabmenu"><a href="#"
								class="navbar-nav-link">취소/환불</a></li>
						</ul>
						<div id="tabContent"></div>
					</div>
				</div>
			</div>

			<!-- 메뉴 -->
			<!-- 		<div class="lr_bc_first_box_img_cont_wrapper">
			<ul id="category" class="tab">
				<li class="tabmenu">대여안내</li>
				<li id="tab2" class="tabmenu">인수/반납</li>
				<li id="tab3" class="tabmenu">자차보험</li>
				<li id="tab4" class="tabmenu">취소/환불</li>
			</ul>
			<div id="tabContent"></div>
		</div> -->

			<div class="lr_bc_first_box_img_cont_wrapper categoryContent"></div>


		</div>

		<div align="right">
			<button type="button" class="btn btn-primary"
				onclick="location.href='insert'">등록</button>
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
	</div>
</div>
<br>
<!-- <script>
    var acc = document.getElementsByClassName("accordion");
    var i;
 
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
</script> -->

<script>
	$(document).ready(

			
			
			function() {
				var insertResult = '<c:out value="${insertResult}"/>';
				var updateResult = '<c:out value="${updateResult}"/>';
				var deleteResult = '<c:out value="${deleteResult}"/>';
				checkModal(insertResult, updateResult, deleteResult);

				function checkModal(insertResult, updateResult, deleteResult) {
					if (insertResult === '' && updateResult === ''
							&& deleteResult === '') {
						return;
					}
					if (parseInt(insertResult) > 0) {
						$('.modal-body').html("등록되었습니다.");
					}
					if (parseInt(updateResult) > 0) {
						$('.modal-body').html("수정되었습니다.");
					}
					if (parseInt(deleteResult) > 0) {
						$('.modal-body').html("삭제되었습니다.");
					}
					$('#myModal').modal('show');
				}
			})

	let form = $("#actionForm");

	$("button[id^='deleteBtn").on(
			'click',
			function() {

				var result = confirm('삭제 하시겠습니까?');

				if (result == true) {
					location.href = 'delete?seq='
							+ Number($(this).attr("data-seq"));
					form.find("#seq").remove();
					form.attr("action",
							"${pageContext.request.contextPath}/faq/list?pageNum="
									+ $('#pageNum').val() + "&amount="
									+ $('#amount').val());
					form.submit();
				} else {
					return;
				}
			})

	$("#category").on("click", "li", function() {
		$.ajax({
			type : 'GET',
			url : 'category',
			data : {
				category : $(this).text()
			},
			dataType : 'json',
			success : function(datas) {
				str = "";
				for (i = 0; i < datas.length; i++) {
					str += makeLi(datas[i]);
					$(".categoryContent").html(str);
					acc();
					console.log(str);
				}
			},
			error : function() {
				alert("error");
			}
		})
	});

	function makeLi(data) {
		return '<div class="lr_bc_first_box_img_cont_wrapper firstWrap">'
				+ '<button class="accordion">'
				+ data.title
				+ '</button>'
				+ '<div class="panel">'
				+ '<p>'
				+ data.content
				+ '</p>'
				+ '<div class="lr_bc_first_box_img_cont_wrapper" align="right">'
				+ '<button class="btn btn-dark" type="button" onclick="location.href=update?seq='
				+ data.seq
				+ '">수정</button>&nbsp;'
				+ '<button data-seq="'+data.seq+'" id="deleteBtn'+data.seq+'" type="button" class="btn btn-dark">삭제</button>'
				+ '<p></div></div></div>'
		/* '<div class="col-md-6">'
		+ '<div class="card mb-2"> <a class="text-default collapsed" data-toggle="collapse" href="update?seq='+ data.seq +'">
		+ '<div class="card-header"><h6 class="card-title"><i class="icon-help mr-2 text-slate"></i>'+ data.title + '</h6></div></a>'
		+ '<div id="question'+ data.seq +'" class="collapse"><div class="card-body">'+ data.content +'</div></div></div></div>'  */
	}

	function acc() {
		/* 아코디언이,,,,,안,,,,,,ㅇ,,,,안열려요,,,,,,,,,,,,,,,,,,,,,,,,, */
		var acc = document.getElementsByClassName("accordion");

		for (var i = 0; i < acc.length; i++) {

			acc[i].onclick = function() {
				// 클릭이 일어났을 때 기존에 열려 있던 아코디언을 접는다. (1개의 아코디언만 열리게)
				for (var j = 0; j < acc.length; j++) {
					// 버튼 상태에 입혀진 active 라는 클래스를 지운다.
					acc[j].classList.remove("active");
					// 버튼 다음에 있는 div 콘텐츠 높이를 0으로 만든다. == 아코디언을 접는다.
					if (this !== acc[j]) {
						acc[j].nextElementSibling.style.maxHeight = null;
					}
				}

				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					this.classList.remove("active");
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}

			}
		}
	}
</script>
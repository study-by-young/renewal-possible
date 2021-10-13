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
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
</style>

<div class="container">
	<div style="margin-top: 50px;">
	<h2>자주 묻는 질문</h2>
	<br>
	
		<div class="custom-input">
			<form id="actionForm"
				action="${pageContext.request.contextPath}/faq/list"
				method="get">
				<select name="type" class="select">
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
				</select> &nbsp; 
				<input class="input" name="keyword" value="${pageMaker.cri.keyword}"> 
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">&nbsp;
				<button class="custom-btn btn-primary" onclick="$('[name=pageNum]').val(1)">검색</button>
			</form>
		</div>
 
 
 
 
 <!-- 메뉴 -->
      <div class="lr_bc_first_box_img_cont_wrapper">
         <ul>
            <li><a href="${pageContext.request.contextPath}/faq/#">대여안내</a></li>
            <li><a href="${pageContext.request.contextPath}/faq/#">인수/반납</a></li>
            <li><a href="${pageContext.request.contextPath}/faq/#">자차보험</a></li>
            <li><a href="${pageContext.request.contextPath}/faq/#">취소/환불</a></li>
         </ul>
      </div>
                        
	 <div class="lr_bc_first_box_img_cont_wrapper">
	 	<c:forEach items="${list}" var="faq">
			<button class="accordion">${faq.title}</button>
			<div class="panel">
	    	<p>${faq.content}</p>
	    	<div class="lr_bc_first_box_img_cont_wrapper" align="right">
	    		<button class="btn btn-dark" type="button" onclick="location.href='update?seq=${faq.seq}'">수정</button>
				<button id="deleteBtn" type="button" class="btn btn-dark">삭제</button><p>
			</div>
			</div>
		</c:forEach>
	<br>
	</div>

 
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
	var acc = document.getElementsByClassName("accordion");

	for (var i = 0; i < acc.length; i++) {

		  acc[i].onclick = function() {	 
             // 클릭이 일어났을 때 기존에 열려 있던 아코디언을 접는다. (1개의 아코디언만 열리게)
			 for (var j = 0 ; j<acc.length; j++){
                // 버튼 상태에 입혀진 active 라는 클래스를 지운다.
				 acc[j].classList.remove("active");
                // 버튼 다음에 있는 div 콘텐츠 높이를 0으로 만든다. == 아코디언을 접는다.
				 if (this!==acc[j]) {
					 acc[j].nextElementSibling.style.maxHeight = null;
				 }
			 }

			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight){
				this.classList.remove("active");
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
	 
		  }
	}
	
	$(document).ready(function() {
		var insertResult = '<c:out value="${insertResult}"/>';
		var deleteResult = '<c:out value="${deleteResult}"/>';
		checkModal(insertResult, deleteResult);
		
	 	function checkModal(insertResult, deleteResult) {
			if (insertResult === '' && deleteResult === '') {
				return;
			}
			if (parseInt(insertResult) > 0) {
				$('.modal-body').html("글이 등록되었습니다.");
			}
			if (parseInt(deleteResult) > 0) {
				$('.modal-body').html("글 삭제가 완료되었습니다.");
			}
			$('#myModal').modal('show');
		} 	
	})
	
	
	$('#deleteBtn').on('click', function() {

		var result = confirm('삭제 하시겠습니까?');

		if (result == true) {
			location.href = 'delete?seq=${faq.seq}';
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
	
	
</script>
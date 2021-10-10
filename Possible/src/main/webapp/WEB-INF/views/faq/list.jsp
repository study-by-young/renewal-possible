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
					<option
						<c:out value="${empty pageMaker.cri.type ? 'selected':''}"/>>선택</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
					<option value="TC"
						<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목
						or 내용</option>
				</select> &nbsp; 
				<input class="input" name="keyword" value="${pageMaker.cri.keyword}"> 
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">&nbsp;
				<button class="custom-btn btn-primary" onclick="$('[name=pageNum]').val(1)">검색</button>
			</form>
		</div>
 
 
 <br>
 
 <c:forEach items="${list}" var="faq">
<button class="accordion">${faq.title}</button>
<div class="panel">
    <p>${faq.content}</p>
</div>
 
</c:forEach>
 
 
	</div>
</div>
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
	</script>
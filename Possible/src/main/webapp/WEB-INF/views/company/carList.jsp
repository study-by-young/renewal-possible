<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 10:56
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
    .stateBanner {
        text-align: center;
        font-size: 18px;
        border-radius: 0px;
        position: relative;
        width: 100%;
    }
</style>
<!-- Main content -->
		<div class="content-wrapper">
	<!-- Content area -->
			<div class="content">
	
	 <form id="actionForm" action="car" method="get">
		 	<div class="col-sm-12" style="padding-left: 2.5rem">
				<div class="d-flex">
					<div align="left">
						<select name="type" class="select">
							<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
							<option value="B" ${pageMaker.cri.type =='B'? 'selected' : "" }>수령자</option>
						</select> 
							<input class="input" name="keyword" value="${pageMaker.cri.keyword }"> 
							<input type="hidden" name="pageNum" value="1"> 
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<input type="hidden" name="cmpnSeq" value="${cmpnSeq }">
						<button class="btn btn-primary"
							onclick="$('[name=pageNum]').val(1)">Search</button>
					</div>
				</div>
			</div> 
			</form>
		
		<input type="hidden" name="cmpnSeq" value="${cmpnSeq}">
    <div class="row">
        <c:forEach var="companyCarList" items="${companyCarList }">
        	<c:set var="car" value="${companyCarList.get('carVO')}" />
				<div class="card" style="width: 400px; margin:5px">
						<h4 class="card-title"><a href="${pageContext.request.contextPath}/company/car/view?seq=${car.seq}&cmpn=${car.cmpnSeq}">
                                ${companyCarList.get('brand')},
                                ${companyCarList.get('model') },
                                ${car.year }
                        </a></h4>
					<img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/cars/Hyundai/santafe.png" alt="Card image"
						style="width: 100%">
					<div class="card-body">
				 <div class="stateBanner badge-primary">${companyCarList.get('status') }</div>
					</div>
				</div>
        </c:forEach>
    </div>
        <span style="float:right; padding-left:5px;"><button type="button" class="btn btn-primary" onclick="location.href='car/register?=${cmpnSeq}'">등록</button></span>    
     </div>
     
     <div class="col-sm-12">
				<div class="d-flex align-items-center justify-content-center mb-2">
					<div id="pageButton">
						<ul class="pagination pagination-flat align-self-center">
							<c:if test="${pageMaker.prev }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage-1}">이전</a></li>
								<span aria-hidden="true">&laquo;</span>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<li class="page-item"><a class="page-link" href="${num }">${num }</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage+1}">다음</a></li>
								<span aria-hidden="true">&laquo;</span>
							</c:if>
						</ul>
					</div>
				</div>
			</div> 

</div>

<script>
	$(function() {
		var actionForm = $("#actionForm");


		$("#pageButton a").on("click", function(e) {
			e.preventDefault(); //a, submit 경우에 쓸 수 있음 태그의 원래기능을 막고 정의한 함수 실행
			var p = $(this).attr("href");
			$('[name="pageNum"]').val(p);
			actionForm.submit();
		});
	});
	
	   $(function(){
		     var pageBtn = $("ul > li");   
		      pageBtn.find("a").click(function(){   
		      pageBtn.removeClass("active");     // pageBtn 속에 (active) 클래스를 삭제.
		      $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
		     })
		    });
</script>

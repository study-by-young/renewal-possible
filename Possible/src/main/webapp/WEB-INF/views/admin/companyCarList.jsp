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

<c:forEach var="companyCarList" items="${companyCarList }">
<div class="container">
  <h2>보유렌터카</h2>
  <div class="card" style="width:200px">
    <img class="card-img-top" src="${companyCarList.img1 }" alt="Card image" style="width:100%">
    <div class="stateBanner badge-primary">${companyCarList.status }</div>
    <div class="card-body">
			<h4 class="card-title">
				<a class="show" href="#" data-seq='${companyCarList.seq }' data-toggle="modal" data-target="#myModal"> 
				
						
						${companyCarList.brand},
						${companyCarList.model },
						${companyCarList.year }
						
				</a>  
			</h4>
		</div>
  </div>
</div>
</c:forEach>


  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
 
<script>
$(function(){	//page ready  이벤트 페이지가 준비되면 실행
$(".show").on("click",function(){
		
		$.ajax({
			url : "companyCarOneSelect",
			method : "get",		//post
			data : {seq : this.dataset.seq},
			// async : false,	//아작스처리 끝나야 다음이 실행됨 동기식
			success : function(data){	//컨트롤러의 리턴값
				console.log(data);
			}
		});
	}); //btn1 click end
}) //end of $(function(){
</script>


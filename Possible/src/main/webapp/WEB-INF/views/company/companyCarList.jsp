
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

<div class="container">
  <h2>보유렌터카</h2>
  <input type="hidden" name="seq" value="1">
  <div class="row">
			<div class="allCheck">
				<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
			</div>
			<div class="delBtn">
				<button type="button" class="selectDelete_btn">선택 삭제</button>
			</div>
		</div>
<div class="row">
<c:forEach var="companyCarList" items="${companyCarList }">
  <div class="card" style="width:200px">
  <input type="checkbox" name="chBox" class="chBox" data-seq="${companyCarList.seq }" />
    <img class="card-img-top" src="${companyCarList.img1 }" alt="Card image" style="width:100%">
    <div class="stateBanner badge-primary">${companyCarList.status }</div>
    <div class="card-body">
			<h4 class="card-title">
				
				<a class="show" href="#" data-seq='${companyCarList.seq }' data-toggle="modal" data-target="#myModal"> 
				
						${companyCarList.cmpnSeq },
						${companyCarList.brand},
						${companyCarList.model },
						${companyCarList.year }
						
				</a>  
			</h4>
		</div>
  </div> 
  &nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>
</div>
</div>


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
          
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">수정</button>
        </div>
        
      </div>
    </div>
  </div>
 
<script>
$(function(){	//page ready  이벤트 페이지가 준비되면 실행
	
	$("#allCheck").click(function(){
		 var chk = $("#allCheck").prop("checked");
		 if(chk) {
		  $(".chBox").prop("checked", true);
		 } else {
		  $(".chBox").prop("checked", false);
		 }
	});
   
	 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
	});
	 
	//조회
	$(".show").on("click",function(){
			
			$.ajax({
				url : "companyCarOneSelect",
				method : "get",		//post
				data : {seq : this.dataset.seq},
				// async : false,	//아작스처리 끝나야 다음이 실행됨 동기식
				success : function(data){	//컨트롤러의 리턴값
					console.log(data);
					makeLi(data);
				}
			});
		}); //show click end
		
	//삭제

	$(".selectDelete_btn").click(function() {
			var confirm_val = confirm("정말 삭제하시겠습니까?");

			if (confirm_val) {
				var checkArr = new Array();

				$("input[class='chBox']:checked").each(function() {
					checkArr.push($(this).attr("data-seq"));
				});

				$.ajax({
					url : "companyCarDel",
					type : "post",
					data : {chbox : checkArr},
					success : function(result){
						  if(result == 1) {          
						   location.href = "${pageContext.request.contextPath}/companyDashboard";
						  } else {
						   alert("삭제 실패");
						  }
					}
				});
			}
		});

		function makeLi(data) {
			var list = '';
			$(".modal-body").empty();

			list = '<div class="row">'
			list += '<div class="col-md-12">'
			list += '<div class="form-group">'
			list += '<label>SEQ</label>'
			list += '<input type="text" class="form-control" name="seq" value="'+ data.seq+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>BRAND</label>'
			list += '<input type="text" class="form-control" name="brand" value="'+ data.brand+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>MODEL</label>'
			list += '<input type="text" class="form-control" name="model" value="'+ data.model+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>SEGMENT</label>'
			list += '<input type="text" class="form-control" name="segment" value="'+ data.segment+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>TRIM</label>'
			list += '<input type="text" class="form-control" name="trim" value="'+ data.trim+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>COLOR</label>'
			list += '<input type="text" class="form-control" name="color" value="'+ data.color+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>YEAR</label>'
			list += '<input type="text" class="form-control" name="year" value="'+ data.year+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>FUEL</label>'
			list += '<input type="text" class="form-control" name="fuel" value="'+ data.fuel+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>PASSENGER</label>'
			list += '<input type="text" class="form-control" name="passenger" value="'+ data.passenger+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>MISSION</label>'
			list += '<input type="text" class="form-control" name="mission" value="'+ data.mission+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>TRUNK</label>'
			list += '<input type="text" class="form-control" name="trunk" value="'+ data.trunk+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>DOOR</label>'
			list += '<input type="text" class="form-control" name="door" value="'+ data.door+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>KMPL</label>'
			list += '<input type="text" class="form-control" name="kmpl" value="'+ data.kmpl+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>PRICE</label>'
			list += '<input type="text" class="form-control" name="price" value="'+ data.price+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>STATUS</label>'
			list += '<input type="text" class="form-control" name="status" value="'+ data.status+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>IMG1</label>'
			list += '<input type="file" class="form-control" name="img1" value="'+ data.img1+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>IMG2</label>'
			list += '<input type="file" class="form-control" name="img2" value="'+ data.img2+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>IMG3</label>'
			list += '<input type="file" class="form-control" name="img3" value="'+ data.img3+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>GEN_DATE</label>'
			list += '<input type="text" class="form-control" name="genDate" value="'+ data.genDate+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>UPT_DATE</label>'
			list += '<input type="text" class="form-control" name="uptDate" value="'+ data.uptDate+'"/>'
			list += '</div>'
			list += '<div class="form-group">'
			list += '<label>CAR_NUM</label>'
			list += '<input type="text" class="form-control" name="carNum" value="'+ data.carNum+'"/>'
			list += '</div>'
			list += '</div>'
			list += '</div>'

			$(".modal-body").append(list);

		}
		;

	}) //end of $(function(){
</script>


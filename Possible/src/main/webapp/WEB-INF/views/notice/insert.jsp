<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<form id="insertForm" role="form"
			action="${pageContext.request.contextPath}/notice/insert"
			method="post">
			<div class="row">
				<div class="col-md-12">
					<div
						class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
						<h3>공지사항 등록</h3>
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form1">
						<input type="text" name="title" placeholder="제목 무조끈 *"
							required="required">
					</div>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form2">
						<input type="text" name="writer" placeholder="Writer"
							value="admin" readonly="readonly">
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_form4">
						<textarea name="content" id="content" class="ckeditor" required="required"></textarea>
					</div>
					<br>
				</div>
				<div
					class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12"
					align="right">
					<button id="insertBtn" type="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-dark"
						onclick="location.href='list'">목록</button>
				</div>
			</div>
		</form>
		
		<div class="form-group">
            <label>File</label> <input type="file" class="form-control" name="uploadFile" multiple="multiple">
            <button type="button" id="uploadBtn" class="btn btn-default">첨부 파일 등록</button>
         </div>
         <ul id="uploaded"></ul>
		
	</div>
</div>

<script>
	CKEDITOR.instances.content.getData()
	
	
	  $(function() {
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 5242880; //5MB

      function checkExtension(fileName, fileSize) {

         if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
         }

         if (regex.test(fileName)) {
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
         }
         return true;
      }
      $("#uploadBtn").on("click", function() {
    	 //alert("click");
         var formData = new FormData(document.insertForm);
         var inputFile = $("input[name='uploadFile']");
         var files = inputFile[0].files;
         for (i = 0; i < files.length; i++) {
            if (!checkExtension(files[i].name, files[i].size)) {
               return;
            }
            formData.append("uploadFile", files[i]);
         }
         //formData
         $.ajax({
            processData : false,
            contentType : false,
            url : "../uploadAjaxAction",
            data : formData,
            method : "POST",
            success : function(datas) {
               var str ="";
               for(i=0; i<datas.length; i++) {
                  var obj = datas[i];
                  var fileCallPath =  encodeURIComponent(obj.name +"_"+obj.orgName);               
                   var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
                     
                  str += "<li "
                  str += "data-name='"+obj.name+"' data-filename='"+obj.orgName+"' data-type='"+obj.image+"' ><div>";
                  str += "<span> "+ obj.orgName+"</span>";
                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
                  str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                  str += "<img src='../resources/img/attach.png'></a>";
                  str += "</div>";
                  str +"</li>";
               }
               $("#uploaded").html(str);
               alert("uploaded");
            }
         });
      });
      
      //등록버튼 이벤트
      $("#insertBtn").on("click", function(){
         var str = "";
         $("#uploaded li").each(function(i, obj){
            var jobj = $(obj);
            str += "<input type='hidden' name='attachList["+i+"].orgName' value='"+jobj.data("orgname")+"'>";
            str += "<input type='hidden' name='attachList["+i+"].name' value='"+jobj.data("name")+"'>";
         });
         $("#insertForm").append(str).submit();
      })
      
      $("#uploaded").on("click", "button", function(e){
         if(confirm("Remove this file?")) {
            var targetLi = $(this).closest("li");
            targetLi.remove();
         }
      })
   });
	
	
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	.card-header+.card-footer {
		border-bottom: 0px;
	}
	
	.card-footer {
		background-color: white;
		border-top: 0px;
	}
	
	input[type=file] {
	    display: inline;
	    width: 20%;
	}
	
	.btn {
		padding: .4rem .65rem;
	}
	
	.input_title {
		width: 100%;
		height: 50px;
		border: 1px solid lightgray;
		padding: 10px 8px;
		border-radius: 5px;
	}
	
	.card {
    margin-bottom: 3rem;
    }
</style>

<div class="x_contact_title_main_wrapper float_left padding_tb_100">
	<div class="container">
		<div class="card" style="margin-top: 50px; padding: 20px;">
			<form id="insertForm" name="insertForm" role="form"
				action="${pageContext.request.contextPath}/notice/insert"
				method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card-header">
							<div class="card-header col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 0px; padding-left: 0px;">
								<div class="contect_form1">
									<h2 style="font-weight: 600;">공지사항 등록</h2>
								</div>
							</div>
							<div class="card-header col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 10px 0px;">
								<div class="contect_form1">
									<input class="input_title" type="text" name="title" placeholder=" 제목을 입력해주세요. *" required="required">
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="contect_form2">
									<input type="hidden" name="writer" placeholder="writer" value="admin" readonly="readonly">
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
								<div class="contect_form4">
									<textarea name="content" id="content" class="ckeditor" required="required"></textarea>
								</div>
								<br>
							</div>
						</div>
						<div class="form-group" style="padding-left: 20px; padding-right: 20px;">
							<input type="file" class="form-control" id="uploadFile" name="uploadFile" multiple="multiple">
							<button type="button" id="uploadBtn" class="btn btn-primary">첨부파일 등록</button>
						</div>
						<ul id="uploaded" style="list-style: none;"></ul>
						<input type="hidden" id="noticeSeq" value="${file.noticeSeq}">
						<div class="card-footer col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12"
							align="right">
							<button id="insertBtn" type="button" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-dark"
								onclick="location.href='list?pageNum=${cri.pageNum}&amount=${cri.amount}'">목록</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	// ckeditor 유효성 검사 (작동안함ㅠ)
	$("#insertBtn").on("click", function() {
		check();
	});

	function check() {
		if (CKEDITOR.instances.content.getData() == "" || CKEDITOR.instances.content.getData().length == 0) {
			alert("내용을 입력해주세요.");
			CKEDITOR.instances.content.focus();
			return false;
		} else {
			$("#insertForm").submit();
		}
	}

	var noticeSeq = $('#noticeSeq').val();
	// 첨부파일 업로드
	$(function() {
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		// 파일 사이즈 및 종류 필터
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
		
		
		// 첨부파일 등록 버튼 클릭 시 이벤트 (교재 502페이지)
		$("#uploadBtn").on("click", function(e) {
			e.preventDefault();
			// alert("click");
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			for (i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return;
				}
				formData.append("uploadFile", files[i]);
			}
			
			// formData
			$.ajax({
				url : "${pageContext.request.contextPath}/uploadAjaxAction",
				processData : false,
				contentType : false,
				data : formData,
				method : "POST",
				success : function(datas) {
					console.log(datas);
					var str = "";
					for (i = 0; i < datas.length; i++) {
						var obj = datas[i];
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.name + "_" + obj.orgName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");

						str += "<li "
          				str += "data-path='" + obj.uploadPath + "'data-name='" + obj.name + "' data-orgname='" + obj.orgName+"' data-type='" + obj.image + "' ><div>";
						str += "<span>" + obj.orgName + "</span>&nbsp;&nbsp;";
						str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'"; 
         				str += "class='btn btn-primary btn-circle'><i class='fa fa-times'></i></button><br>";
						// str += "<img src='../resources/img/attach.png'></a>";
						str += "</div>";
						str + "</li>";
						
						console.log(str);
					}
					
					$("#uploaded").html(str);
					alert("첨부파일이 등록되었습니다.");
				},
				error: function(reject){
	            	console.error(reject);
	            }
			});
		});
		
		//등록버튼 이벤트
		$("#insertBtn").on("click", function() {
			var str = "";
			$("#uploaded li").each(function(i, obj) {
				var jobj = $(obj);
				str += "<input type='hidden' name='attachList[" + i + "].orgName' value='" + jobj.data("orgname") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].name' value='" + jobj.data("name") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].noticeSeq' value='" + noticeSeq + "'>";
			});
			$("#insertForm").append(str).submit();
		})

		$("#uploaded").on("click", "button", function(e) {
			if (confirm("이 파일을 삭제하시겠습니까?")) {
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		})
	});
</script>
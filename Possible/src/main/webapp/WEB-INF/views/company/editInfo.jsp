<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<style>
.card-body {
    padding: 50px;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편주소 api -->

<!-- Main content -->
		<div class="content-wrapper">

			<!-- Content area -->
			<div class="content">

				<div class="card">
					<div class="card-header header-elements-inline">
						<h6 class="card-title"></h6>
						<div class="header-elements">
							
						</div>
					</div>

					<div class="card-body py-0">
						<div class="row">
							<div class="col-sm-12">
								<div class="col-md-12">
									<form id="frm" name="frm" action="editInfo/complete" method="post">
									
										<div class="row">
											<input type="hidden" name='seq' value="${company.seq}">
										   	<div class="form-group col-md-12">
											   	<h5 class="font-weight-bold"><label for="InputId">업체명*</label></h5>
											    <input type="text" class="form-control"  id="name" name="name" value="${company.name }" readonly>
											</div>   
										</div>
										<div class="row">
											<div class="form-group col-md-6">
													<h5 class="font-weight-bold"><label for="InputId">사업자번호*</label></h5>
												<input type="text" class="form-control"  id="cmpnNum" name="cmpnNum" value="${company.cmpnNum }" readonly> 
											</div>
											<div class="form-group col-md-6">
													<h5 class="font-weight-bold"><label for="InputId">업체전화번호*</label></h5>
												<input type="text" class="form-control"  id="tel" name="tel" value="${company.tel }">
											</div>
										</div>
										
										<!-- 우편번호 Start -->
                      							<h5 class="font-weight-bold"><label for="InputAddr">주소*</label></h5>
                        				<div class="form-group"> 
                        					<input type="text" class="form-control" id="postal" name="postal" value="${company.postal }" style="width: 30%; display: inline;">
											 <button type="button" class="btn btn-default" onclick="DaumPostcode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                      
                        				</div>
                        				<div class="form-group"> 
											<input type="text" class="form-control" id="addr1" name="addr1" value="${company.addr1 }" style="width: 70%; display: inline;">
										</div>
										<div class="form-group"> 
											<input type="text" class="form-control" id="addr2" name="addr2" value="${company.addr2 }" style="width: 50%; display: inline;">
											<input type="text" class="form-control" id="extraAddress" placeholder="참고항목" style="width: 40%; display: inline;">
  	                      				</div>
  	                      				<div class="form-group"> 
											<input type="text" class="form-control" id="area" name="area" value="${company.area }" style="width: 50%; display: inline;">
  	                      				</div>
  	                      				<!-- 주소 종료 -->
  	                      				 <div class="row justify-content-end">
										      <button id="up" type="submit" class="btn btn-primary mr-2">수정</button>
										      <button id="del" formaction="editInfo/delete" type="submit" class="btn btn-danger" style="margin-right:.625rem!important">탈퇴</button>
										      <button class="btn btn-danger">취소 </button>
										 </div>
							</form>
									</div>
									<br>
									<!-- card BODY END -->
								</div>
								<!-- 업체등록 END -->	
								</div>
						</div>
					</div>
				</div>
</div>

<script>
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            		
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("[name=postal]").val(data.zonecode);
            $("[name=addr1]").val(addr);
            $("[name=area]").val(data.sido);
            // 커서를 상세주소 필드로 이동한다.
          	$('#addr2').focus();
        }
    }).open();
}

$("#up").on("click", function(){
	if(confirm("수정하시겠습니까?") == true ){
		document.form.submit();
	}else{
		return false;
	}
});

$("#del").on("click", function(){
	if(confirm("탈퇴하시겠습니까?") == true ){
		document.form.submit();
	}else{
		return false;
	}
});
</script>
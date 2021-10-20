<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-08
  Time: 오전 10:57
  To change this template use File | Settings | File Templates.
--%>
<style>
.card-body {
    padding: 50px;
}
</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Main content -->
<div class="content-wrapper">
	<!-- Content area -->
	<div class="content">
	<div class="card">
			<div class="card-header header-elements-inline">
				<h6 class="card-title">차량등록</h6>
				<div class="header-elements"></div>
			</div>
			<hr>
			
				<div class="card-body py-0">
						<div class="row">
							<div class="col-sm-12">
							<form id="frm" name="frm" action="register" method="post" enctype="multipart/form-data">
								<input type="hidden" class="form-control" name='cmpnSeq' value='${cmpnSeq}'>
								<div class="col-md-12">
										<div class="row">
										<ul class="list-unstyled row">
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">IMG1
													<input type="file" name="uploadFile" onchange="setThumbnail(event)"/>
												</label></h5>
											</li>
											<li id="image_container"></li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">브랜드 
												<select name="brand" id="brand" class="form-control select-fixed-single" onchange="searchModelByBrand()" required>
															<optgroup label="브랜드">
																<option>브랜드를 선택하세요</option>
																<c:forEach var="brand" items="${brands}">
																	<option value="${brand.code}">${brand.name}</option>
																</c:forEach>
															</optgroup>
												</select>
												</label></h5>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">모델 
												<select name="model" id="model" class="form-control select-fixed-single" onchange="searchTrimByModel()" required>
															<optgroup label="모델명">
																<option>모델을 선택하세요</option>
																<c:forEach var="model" items="${models}">
																	<option value="${model.code}">${model.name}</option>
																</c:forEach>
															</optgroup>
												</select>
												</label></h5>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">등급
														<select name="trim" id="trim" class="form-control select-fixed-single" onchange="searchByBrand()" required>
															<optgroup label="트림">
																<option>등급을 선택하세요</option>
															</optgroup>
													</select>
												</label></h5>
											<br>
											</li>
												<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">세그먼트 
												<select name="segment" id="segment" class="form-control select-fixed-single" onchange="searchByBrand()" required>
															<optgroup label="세그먼트">
																<option>세그먼트를 선택하세요</option>
																<c:forEach var="segment" items="${segment}">
																	<option value="${segment.code}">${segment.name}</option>
																</c:forEach>
															</optgroup>
												</select>
												</label></h5>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">연료 
												<select name="fuel" id="fuel" class="form-control select-fixed-single" required>
															<optgroup label="연료">
																<option>연료를 선택하세요</option>
																<c:forEach var="fuel" items="${fuels}">
																	<option value="${fuel.code}">${fuel.name}</option>
																</c:forEach>
															</optgroup>
													</select>
												</label></h5>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">연식 
												<select name="year" id="year" class="form-control select-fixed-single" required>
															<optgroup label="연식">
																<option value="">연식을 선택하세요</option>
																	<option value="2022">2022년</option>
																	<option value="2021">2021년</option>
																	<option value="2020">2020년</option>
																	<option value="2019">2019년</option>
																	<option value="2018">2018년</option>
																	<option value="2017">2017년</option>
																	<option value="2016">2016년</option>
															</optgroup>
													</select>
												</label></h5>
											<br>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">색깔
												<select name="color" id="color" class="form-control select-fixed-single" required>
															<optgroup label="색깔">
																<option value="">색깔을 선택하세요</option>
																	<option value="검은색">검은색</option>
																	<option value="흰색">흰색</option>
																	<option value="은색">은색</option>
																	<option value="청색">청색</option>
																	<option value="자주">자주</option>
																	<option value="회색">회색</option>
																	<option value="적색">적색</option>
															</optgroup>
													</select>
												</label></h5>
											
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">인원
												<select name="passenger" id="passenger" class="form-control select-fixed-single" required>
															<optgroup label="인원">
																<option value="">인원을 선택하세요</option>
																	<option value="7">7</option>
																	<option value="6">6</option>
																	<option value="5">5</option>
																	<option value="4">4</option>
																	<option value="3">3</option>
																	<option value="2">2</option>
																	<option value="1">1</option>
															</optgroup>
													</select>
												</label></h5>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">기어
												<select name="mission" id="mission" class="form-control select-fixed-single" required>
															<optgroup label="기어">
																<option value="">기어를 선택하세요</option>
																	<option value="자동">자동</option>
																	<option value="수동">수동</option>
															</optgroup>
													</select>
												</label></h5>
												<br>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">트렁크
												<select name="trunk" id="trunk" class="form-control select-fixed-single" required>
															<optgroup label="트렁크">
																<option value="">트렁크를 선택하세요</option>
																	<option value="500">500</option>
																	<option value="300">300</option>
															</optgroup>
													</select>
												</label></h5>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">도어
													<input type="text" class="form-control" name='door' placeholder="도어를 입력해주세요">
												</label></h5>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">연비
													<input type="text" class="form-control" name='kmpl' placeholder="연비를 입력해주세요">
												</label></h5>
											<br>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">가격
													<input type="text" class="form-control" name='price' placeholder="가격을 입력해주세요">
												</label></h5>
											</li>
											<li class="col-md-4">
												<h5 class="font-weight-bold"><label class="d-block">차 번호
													<input type="text" class="form-control" name='carNum' placeholder="차 번호를 입력해주세요">
												</label></h5>
											</li>
										
										<li class="col-md-12 my-3">
                                                <h5 class="font-weight-bold"><label>차량 옵션</label></h5>
                                                <hr class="my-2">
                                                <div class="x_slider_checkbox_bottom_filter_use">
                                                    <c:forEach var="option" items="${carOpt}" varStatus="status">
                                                        <label class="pr-3">
                                                        <input name="options" id="options" type="checkbox" value="${option.code}">
                                                        ${option.name}</label>
                                                    </c:forEach>
                                                </div>
                                            </li>
  										</ul>
									</div>
										</div>
										<button id="reg" class="btn btn-primary" style="float:right; margin-bottom:15px;">등록</button>
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
<script>

    let brand = $('#brand');
    let model = $('#model');
    let trim = $('#trim');
      

    $('#startDate').datepicker({
        minDate:'+1D'
    });

    $('#endDate').datepicker({
        minDate: '+1D'
    });

    function searchModelByBrand(){
        model.children('optgroup').html('');
        trim.children('optgroup').html('');

        $.ajax({
            url : '../../findModels',
            data : {brand : brand.val()},
            dataType : 'json',
            success : function(result){
                model.children('optgroup').append($('<option>').text('모델을 선택하세요'));

                result.forEach(function (item) {
                    let opt = $('<option>').attr('value', item['code'])
                        .attr('data-img-src', item['img'])
                        .attr('data-seg',item['segCode'])
                        .text(item['name']);
						
                    let seg = $('<input>').attr('value', item['segCode'])
                    		.text(item['segCode']);
                    
                    model.children('optgroup').append(opt);
                    model.childern('optgroup').append(seg);
                    
                });

                model.select2();
            }
        });
    }

    function searchTrimByModel(){
        trim.children('optgroup').html('');

        $.ajax({
            url : '../../findTrims',
            data : {model : model.val()},
            dataType : 'json',
            success : function(result){
                trim.children('optgroup').append($('<option>').text('등급을 선택하세요'));

                result.forEach(function (item) {
                    trim.children('optgroup').append(
                        $('<option>').attr('value', item['code'])
                            .text(item['name'])
                    );
                });
                trim.select2();
                trim.parent().children('#segment').val(model.find('option:selected').data('seg'));

                let carInfo = $('.x_car_access_filer_top_img');
                carInfo.children('img').attr('src', '${pageContext.request.contextPath}' + model.find('option:selected').data('img-src'));
                carInfo.children('h3').text(model.find('option:selected').text());

            }
        });
    }

    
    

    function updateCarInfo(){

    }
    
    $("#reg").on("click", function(){
		if(confirm("등록하시겠습니까?") == true ){
			document.form.submit();
		}else{
			return false;
		}
	});
    
    <!-- 이미지 미리보기 -->
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			$('#imageContainer').empty();
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			document.querySelector("li#image_container").appendChild(img);
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
    
</script>
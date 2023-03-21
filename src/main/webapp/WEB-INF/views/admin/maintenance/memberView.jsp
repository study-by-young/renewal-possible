<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
.pagination {
   justify-content: center;
}

.select {
   width: 70px; /* 원하는 너비설정 */
   padding: .4em .4em; /* 여백으로 높이 설정 */
   border: 1px solid #999;
   font-family: inherit; /* 폰트 상속 */
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   border-radius: .5em;
   -moz-appearance: none;
   appearance: none;
}

.input {
   width: 200px; /* 원하는 너비설정 */
   padding: .4em .4em; /* 여백으로 높이 설정 */
   border: 1px solid #999;
   font-family: inherit; /* 폰트 상속 */
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   border-radius: .5em;
   -moz-appearance: none;
   appearance: none;
}

.card-body {
    padding: 50px;
}
</style>
      <!-- Main content -->
      <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">

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
                           <form role="form" action="view" method="post">
                     <div class="row">
                        <div class="col-md-12">
                           <fieldset>
                              <input type="hidden" class="form-control" name='seq' value='<c:out value="${memberView.seq}"/>' readonly="readonly">
                              <div class="form-group">
                                 <h5 class="font-weight-bold"><label>이름</label></h5>
                                 <input type="text" class="form-control" name='name' value='<c:out value="${memberView.name}"/>'readonly="readonly">
                              </div>
                              
                              <div class="row">
                                 <div class="col-md-12">
                                    <div class="form-group">
                                       <h5 class="font-weight-bold"><label>아이디</label></h5>
                                       <input type="text" class="form-control" name='id' value='<c:out value="${memberView.id}"/>' readonly="readonly">
                                    </div>
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <h5 class="font-weight-bold"><label>생년월일</label></h5>
                                 <input type="text" class="form-control" name='birth' value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${memberView.birth }"/>' readonly="readonly">            
                              </div>
                              
                              <div class="form-group">
                                 <h5 class="font-weight-bold"><label>이메일</label></h5>
                                 <input type="text" class="form-control" name='email' value='<c:out value="${memberView.email}"/>' readonly="readonly">
                              </div>
                              
                              <div class="form-group">
                                 <h5 class="font-weight-bold"><label>휴대전화</label></h5>
                                 <input type="text" class="form-control" name='phone' value='<c:out value="${memberView.phone}"/>' readonly="readonly">
                              </div>
                              
                              <div class="row">
                                 <div class="col-md-4">
                                    <div class="form-group">
                                    <h5 class="font-weight-bold"><label>주소</label></h5> 
                                       <input type="text" class="form-control" name='addrCode' value='<c:out value="${memberView.addrCode}"/>' readonly="readonly">
                                    </div>
                                 </div>
                                 
                                 <div class="col-md-4">
                                    <div class="form-group">
                                       <h5 class="font-weight-bold"><label>&nbsp;</label></h5> 
                                       <input type="text" class="form-control" name='addrBasic' value='<c:out value="${memberView.addrBasic}"/>' readonly="readonly">
                                    </div>
                                 </div>
                                 
                                 <div class="col-md-4">
                                    <div class="form-group">
                                    <h5 class="font-weight-bold"><label>&nbsp;</label></h5> 
                                       <input type="text" class="form-control" name='addrDetail'value='<c:out value="${memberView.addrDetail}"/>' readonly="readonly">
                                    </div>
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <h5 class="font-weight-bold"><label>권한</label></h5> 
                                 <input type="text" class="form-control" name='author' value='<c:out value="${memberView.author}"/>' readonly="readonly"> 
                              </div>
                           
                              <div class="form-group">
                                 <h5 class="font-weight-bold"><label>상태</label></h5>
                                 <select name='status' class="form-control form-control-select2">
                                    <c:if test="${memberView.status eq 'Y' }"><option value='status' name='status'>활성</option></c:if>
                                    <c:if test="${memberView.status eq 'N' }"><option value='status' name='status'>비활성</option></c:if>
                                    <c:if test="${memberView.status eq 'D' }"><option value='status' name='status'>제명</option></c:if>
                                    <c:if test="${memberView.status eq 'Y' }"><option value='N' name='status'>비활성</option></c:if>
                                    <c:if test="${memberView.status eq 'Y' }"><option value='D' name='status'>제명</option></c:if>
                                    <c:if test="${memberView.status eq 'N' }"><option value='Y' name='status'>활성</option></c:if>
                                    <c:if test="${memberView.status eq 'N' }"><option value='D' name='status'>제명</option></c:if>
                                    <c:if test="${memberView.status eq 'D' }"><option value='Y' name='status'>활성</option></c:if>
                                    <c:if test="${memberView.status eq 'D' }"><option value='N' name='status'>비활성</option></c:if>
                                 </select>
                              </div>
                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="form-group">
                                       <h5 class="font-weight-bold">
                                          <label>가입일자</label>
                                       </h5>
                                       <input class="form-control" name='genDate'
                                          value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${memberView.genDate }"/>'
                                          readonly="readonly">
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="form-group">
                                       <h5 class="font-weight-bold">
                                          <label>수정일자</label>
                                       </h5>
                                       <input class="form-control" name='uptDate'
                                          value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${memberView.uptDate }"/>'
                                          readonly="readonly">
                                    </div>
                                 </div>
                              </div>
                           </fieldset>
                        </div>
                     </div>
                     <br>
                     <div class="text-right">
                        <button id="up" type="submit" class="btn btn-primary">수정하기</button>
                          <button class="btn btn-primary" id="list_btn">목록</button>
                     </div>
                  </form>
                  <br>
                        </div>
                     </div>


                     
                     
                  </div>
               </div>

            </div>
</div>

<script>

$("#up").on("click", function(){
   if(confirm("수정하시겠습니까?") == true ){
      document.form.submit();
   }else{
      return false;
   }
});

$("#list_btn").on(
      "click",
      function(e) {
         form.find("#seq").remove();
         form.attr("action",
               "${pageContext.request.contextPath}/admin/maintenance/member?pageNum="
                     + $('#pageNum').val() + "&amount="
                     + $('#amount').val());
         form.submit();
      })
</script>




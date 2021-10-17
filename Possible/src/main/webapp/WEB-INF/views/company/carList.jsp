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

		
		<input type="hidden" name="cmpnSeq" value="${cmpnSeq}">
    <div class="row">
        <c:forEach var="companyCarList" items="${companyCarList }">
        	<c:set var="car" value="${companyCarList.get('carVO')}" />
        
            <div class="card" style="width:850px; margin:5px">
               <div class="row no-gutters">
                <div class="col-4">
                <div class="stateBanner badge-primary">${companyCarList.get('status') }</div>
                <img class="card-img-top" src="${car.img1 }" alt="Card image" style="width:100%">
                </div>
                <div class="col-8">
                <div class="card-body">
                    <h4 class="card-title">

                        <a class="show" href="${pageContext.request.contextPath}/company/car/view?seq=${car.seq}&cmpn=${car.cmpnSeq}">
								${car.seq },
                                ${car.cmpnSeq },
                                ${companyCarList.get('brand')},
                                ${companyCarList.get('model') },
                                ${car.year }
                        </a>
                    </h4>
                </div>
            </div>
            </div>
            </div>
        </c:forEach>
    </div>
        <span style="float:right; padding-left:5px;"><button type="button" class="btn btn-primary" onclick="location.href='car/register?=${cmpnSeq}'">등록</button></span>    
     </div>

</div>





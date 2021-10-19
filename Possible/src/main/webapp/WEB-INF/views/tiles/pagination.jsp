<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-10-13
  Time: 오전 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-12">
    <div class="card card-body text-center">
        <ul class="pagination pagination-flat align-self-center">
            <li class="page-item">
                <a class="page-link" href="?pageNum=${pagination.startPage-1}&amount=${pagination.cri.amount}" <c:if test="${!pagination.prev }">style="display: none"</c:if>><i class="fas fa-chevron-left"></i></a>
            </li>
            <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="num">
                <li class="page-item <c:if test="${param.getOrDefault('pageNum',1) == (num )}"> active</c:if>">
                    <a href="?pageNum=${num }&amount=${pagination.cri.amount}" class="page-link">${num }</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="?pageNum=${pagination.endPage+1}&amount=${pagination.cri.amount}" <c:if test="${!pagination.next }">style="display: none"</c:if>><i class="fas fa-chevron-right"></i></a>
            </li>
        </ul>
    </div>
</div>

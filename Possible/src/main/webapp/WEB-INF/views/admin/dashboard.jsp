<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-24
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h2><a href="${pageContext.request.contextPath}/admin/maintenance/member">회원관리</a>

<a href="${pageContext.request.contextPath}/admin/maintenance/company">업체등록관리</a>

<a href="${pageContext.request.contextPath}/admin/maintenance/confirmCompany">업체정보관리</a>

<a href="${pageContext.request.contextPath}/admin/maintenance/report">신고글관리</a>


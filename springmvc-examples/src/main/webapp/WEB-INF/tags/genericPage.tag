<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" type="java.lang.String" description="The title of the page" rtexprvalue="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${empty title}">
	<c:choose>
		<c:when test="${!empty controllerTitle}">
			<c:set var="title" value="${controllerTitle}"/>
		</c:when>
		<c:otherwise>
			<c:set var="title" value="SpringMVC Examples"/>
		</c:otherwise>
	</c:choose>
</c:if>

<!doctype html>
<html class="no-js" lang="en">

<head>
<%@ include file="/WEB-INF/frags/head.jspf" %>
</head>

<body>
	<%@ include file="/WEB-INF/frags/preload.jspf" %>
    <!-- page container area start -->
    <div class="page-container">
    	<%@ include file="/WEB-INF/frags/sidebar.jspf" %>
        <!-- main content area start -->
        <div class="main-content">
			<%--
			<%@ include file="/WEB-INF/frags/header.jspf" %>
			--%>
			<%@ include file="/WEB-INF/frags/title.jspf" %>
            <div class="main-content-inner">
            	<div>&nbsp;</div>
                <c:if test="${!empty message}">
                	<div class="alert alert-success"><spring:message code="${message}"/></div>
                </c:if>
                
                <!-- MAIN CONTENT GOES HERE -->
				<jsp:doBody/>                
            </div>
        </div>
        <!-- main content area end -->
		<%@ include file="/WEB-INF/frags/footer.jspf" %>
    </div>
    <!-- page container area end -->
    <%@ include file="/WEB-INF/frags/offsetarea.jspf" %>
    <%@ include file="/WEB-INF/frags/javascripts.jspf" %>
</body>
</html>

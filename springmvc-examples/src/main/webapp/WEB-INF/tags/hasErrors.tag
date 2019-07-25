<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="path" type="java.lang.String" required="true" rtexprvalue="true"%>
<%@ attribute name="var" type="java.lang.String" required="true" rtexprvalue="false"%>
<%@ variable name-from-attribute="var" scope="AT_BEGIN" alias="outVar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:bind path="${path}">
	<c:if test="${status.error}">
		<jsp:doBody var="outVar" />
	</c:if>
</spring:bind>
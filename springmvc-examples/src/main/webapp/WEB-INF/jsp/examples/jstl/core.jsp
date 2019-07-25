<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericPage>

<h3>Tag &lt;c:if&gt; example</h3>

<c:if test="${!empty aString}">
La condizione è vera.
</c:if>

<h3>Tag &lt;c:choose&gt; example</h3>

<%--
<c:set var="anInt" value="${2}" scope="session"/>
--%>

<c:choose>
	<c:when test="${anInt == 1}">The attribute is 1</c:when>
	<c:when test="${anInt == 2}">The attribute is 2</c:when>
	<c:otherwise>Current value = ${anInt } </c:otherwise>
</c:choose>

<%-- <c:remove var="anInt"/> --%>

<h3>Tag &lt;c:forEach&gt; example</h3>

<c:forEach var="i" begin="1" end="10" step="2">
	<div>${i}</div>
</c:forEach>

<h3>Tag &lt;c:forEach&gt; example</h3>

<c:forEach var="i" items="${items}" varStatus="status">
	<div>${i.description} - ${i.cost} (${status.index}, ${status.count}, ${status.first}, ${status.last})</div>
</c:forEach>
</t:genericPage>
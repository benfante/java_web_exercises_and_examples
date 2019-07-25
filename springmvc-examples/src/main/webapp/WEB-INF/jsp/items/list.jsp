<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:genericPage title="Items list">
	<div>
		<a href='<c:url value="/items/new"/>'>Add Item</a>
	</div>
	<c:choose>
		<c:when test="${!empty items}">
			<ol class="list-group">
				<c:forEach var="item" items="${items}" varStatus="status">
					<c:url value="/items/delete" var="deleteUrl">
						<c:param name="id">${status.index}</c:param>
					</c:url>
					<c:choose>
						<c:when test="${item.priority == 1}">
							<c:set var="priorityClass" value="list-group-item-danger" />
						</c:when>
						<c:when test="${item.priority == 2}">
							<c:set var="priorityClass" value="list-group-item-warning" />
						</c:when>
						<c:otherwise>
							<c:set var="priorityClass" value="" />
						</c:otherwise>
					</c:choose>
					<li
						class="list-group-item d-flex justify-content-between align-items-center ${priorityClass}">${item.description}(${item.cost})
						<a href="${deleteUrl}" class="btn btn-primary btn-sm"
						role="button">Elimina</a>
					</li>
				</c:forEach>
			</ol>
		</c:when>
		<c:otherwise>
			<div>Non devi comprare nulla</div>
		</c:otherwise>
	</c:choose>
</t:genericPage>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello ${greetingName}!</title>
</head>
<body>
	<h1>Hello ${greetingName}!</h1>

	<c:url value="/hello" var="helloUrl" />
	<form action="${helloUrl}">
		<label for="filterId">Filtro:</label> <input id="filterId"
			name="filter" value="${param.filter}" /> <input type="submit"
			value="Filtra" />
	</form>

	<c:choose>
		<c:when test="${!empty items}">
			<ol>
				<c:forEach var="item" items="${items}" varStatus="status">
					<c:url value="/item/delete" var="deleteUrl">
						<c:param name="id">${status.index}</c:param>
					</c:url>
					<li>${item.description}(${item.cost})<a href="${deleteUrl}">Elimina</a></li>
				</c:forEach>
			</ol>
		</c:when>
		<c:otherwise>
			<div>Non devi comprare nulla</div>
		</c:otherwise>
	</c:choose>
</body>
</html>

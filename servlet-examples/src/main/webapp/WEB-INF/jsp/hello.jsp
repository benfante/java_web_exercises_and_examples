<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Hello ${greetingName}!</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="/servlet-examples/assets/bootstrap/sticky-footer-navbar.css" />
</head>
<body class="d-flex flex-column h-100">
	<header>
		<!-- Fixed navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="#">Fixed navbar</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="<c:url value='/hello' />">Items
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#"
						tabindex="-1" aria-disabled="true">Disabled</a></li>
				</ul>
				<form class="form-inline mt-2 mt-md-0" action="<c:url value='/hello' />">
					<input class="form-control mr-sm-2" type="text" name="filter" value="${param.filter}"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</nav>
	</header>

	<!-- Begin page content -->
	<main role="main" class="flex-shrink-0">
	<div class="container">

		<h1>Hello ${greetingName}!</h1>

		<c:if test="${!empty message}">
			<div class="alert alert-success" role="alert">${message}</div>
			<c:remove var="message" />
		</c:if>

<%--
		<c:url value="/hello" var="helloUrl" />
		<form action="${helloUrl}">
			<label for="filterId">Filtro:</label> <input id="filterId"
				name="filter" value="${param.filter}" /> <input type="submit"
				value="Filtra" />
		</form>
--%>

		<div>
			<a href='<c:url value="/item/add"/>'>Add Item</a>
		</div>
		<c:choose>
			<c:when test="${!empty items}">
				<ol class="list-group">
					<c:forEach var="item" items="${items}" varStatus="status">
						<c:url value="/item/delete" var="deleteUrl">
							<c:param name="id">${status.index}</c:param>
						</c:url>
						<c:choose>
							<c:when test="${item.priority == 1}">
								<c:set var="priorityClass" value="list-group-item-danger"/>
							</c:when>
							<c:when test="${item.priority == 2}">
								<c:set var="priorityClass" value="list-group-item-warning"/>
							</c:when>
							<c:otherwise>
								<c:set var="priorityClass" value=""/>
							</c:otherwise>
						</c:choose>
						<li class="list-group-item d-flex justify-content-between align-items-center ${priorityClass}">${item.description}(${item.cost})
						<a href="${deleteUrl}" class="btn btn-primary btn-sm" role="button">Elimina</a></li>
					</c:forEach>
				</ol>
			</c:when>
			<c:otherwise>
				<div>Non devi comprare nulla</div>
			</c:otherwise>
		</c:choose>





	</div>
	</main>

	<footer class="footer mt-auto py-3">
		<div class="container">
			<span class="text-muted">Place sticky footer content here.</span>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>

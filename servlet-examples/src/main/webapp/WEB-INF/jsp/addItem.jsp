<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add an item</title>
</head>
<body>

<c:url value="/item/add" var="addUrl"/>
<form action="${addUrl}" method="post">
	<div>
		<label for="descriptionId">Description:</label>
		<input id="descriptionId" name="description" value="${param.description}"/>
	</div>
	<div>
		<label for="costId">Cost:</label>
		<input id="costId" name="cost" value="${param.cost}"/>
	</div>
	<div>
		<label for="priorityId">Priority:</label>
		<input id="priorityId" name="priority" value="${param.priority}"/>
	</div>
	<div><input type="submit" value="Add item"/></div>
</form>
</body>
</html>
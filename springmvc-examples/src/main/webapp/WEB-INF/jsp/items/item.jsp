<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<t:genericPage title="Add an Item">
	<c:url value="/items/add" var="addUrl" />
	<form:form action="${addUrl}" method="post">
		<div class="form-row">
			<div class="col-md-12">
				<spring:message code="label.description" var="descriptionLabel"/>
				<form:label path="description">${descriptionLabel}:</form:label>
				<t:hasErrors path="description" var="invalidClass">is-invalid</t:hasErrors>
				<form:input path="description" class="form-control ${invalidClass}" placeholder="${descriptionLabel}" />
				<div class="invalid-feedback">
					<form:errors path="description" />
				</div>
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 col-sm-12">
				<spring:message code="label.cost" var="costLabel"/>
				<form:label path="cost">${costLabel}:</form:label>
				<t:hasErrors path="cost" var="invalidClass">is-invalid</t:hasErrors>
				<form:input path="cost" type="number" step="any" class="form-control ${invalidClass}" placeholder="${costLabel}" />
				<div class="invalid-feedback">
					<form:errors path="cost" />
				</div>
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 col-sm-12">
				<spring:message code="label.priority" var="priorityLabel"/>
				<form:label path="priority">${priorityLabel}:</form:label>
				<t:hasErrors path="priority" var="invalidClass">is-invalid</t:hasErrors>
				<form:input path="priority" type="number" class="form-control ${invalidClass}" placeholder="${priorityLabel}" />
				<div class="invalid-feedback">
					<form:errors path="priority" />
				</div>
			</div>
		</div>
		<div class="form-row">
			<div class="col-sm-2">
				<spring:message code='label.addItem' var="addItemLabel"/>
				<input type="submit" value="${addItemLabel}" class="form-control btn btn-primary" />
			</div>
		</div>
	</form:form>
</t:genericPage>
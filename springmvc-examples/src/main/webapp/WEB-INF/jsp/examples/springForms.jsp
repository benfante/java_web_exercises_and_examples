<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<t:genericPage title="Spring Form Example">

	<c:url value="/examples/spring_form_submit" var="submitUrl" />
	<form:form action="${submitUrl}" modelAttribute="formExample"
		method="get">
		<div class="form-row">
			<div class="col-md-4 mb-3">
				<form:label path="fullName"><spring:message code="label.fullName"/>:</form:label>
				<t:hasErrors path="fullName" var="invalidClass">is-invalid</t:hasErrors>
				<form:input path="fullName" class='form-control ${invalidClass}' />
				<div class="invalid-feedback">
					<form:errors path="fullName" />
				</div>
			</div>
		</div>
		<div>
			<form:label path="age">Age:</form:label>
			<form:input path="age" type="number" />
		</div>
		<div>
			<form:label path="birthDate">Birth date:</form:label>
			<form:input path="birthDate" type="date" />
		</div>
		<div class="form-row">
			<div class="col-md-4 mb-3">
				<form:label path="homeProvince">Provincia residenza:</form:label>
				<t:hasErrors path="homeProvince" var="invalidClass">is-invalid</t:hasErrors>
				<form:select path="homeProvince" class='form-control ${invalidClass}'>
					<form:option value="" label="Nessuna provincia"/>
					<form:options items="${provinceList}" itemLabel="description" itemValue="code"/>
				</form:select>
				<div class="invalid-feedback">
					<form:errors path="homeProvince" />
				</div>
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-4 mb-3">
				<form:label path="workProvince">Provincia lavorativa:</form:label>
				<t:hasErrors path="workProvince" var="invalidClass">is-invalid</t:hasErrors>
				<form:select path="workProvince" class='form-control ${invalidClass}' multiple="multiple">
					<form:options items="${provinceList}" itemLabel="description" itemValue="code"/>
				</form:select>
				<div class="invalid-feedback">
					<form:errors path="workProvince" />
				</div>
			</div>
		</div>
		<input type="submit" value="Invia" />
	</form:form>
</t:genericPage>
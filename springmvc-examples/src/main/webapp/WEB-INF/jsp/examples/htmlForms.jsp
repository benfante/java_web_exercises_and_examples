<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:genericPage title="HTML Form Example">

	<c:url value="/examples/form_submit" var="submitUrl" />

	<form action='${submitUrl}' method="post">
		<div>
			<label for="fullNameField">Full Name</label>	
			<input id="fullNameField" type="text" name="fullName" placeholder="Full Name" value="${param.fullName}"/>
		</div>
		
		<div>
			<label for="ageField">Age</label>	
			<input id="ageField" type="number" name="age" placeholder="Age" value="${param.age}" min="0" max="100"/>
		</div>
		
		<div>
			<label for="birthDateField">Birthdate</label>	
			<input id="birthDateField" type="date" name="birthDate" placeholder="Birthdate" value="${param.birthDate}"/>
		</div>
		
		<div>
			<label for="provinceField">Province residenza</label>	
			<select id="provinceField" name="province">
				<option value="MI" <c:if test='${param.province == "MI"}'>selected</c:if>>Milano</option>
				<option value="TO" <c:if test='${param.province == "TO"}'>selected</c:if>>Torino</option>
				<option value="VR" <c:if test='${param.province == "VR"}'>selected</c:if>>Verona</option>
				<option value="RM" <c:if test='${param.province == "RM"}'>selected</c:if>>Roma</option>
				<option value="VE" <c:if test='${param.province == "VE"}'>selected</c:if>>Venezia</option>
			</select>
		</div>
		
		<div>
			<label for="workingProvinceField">Province lavorativa</label>	
			<select id="workingProvinceField" name="workingProvince" multiple>
				<option value="MI" <c:if test='${MIselected}'>selected</c:if>>Milano</option>
				<option value="TO" <c:if test='${TOselected}'>selected</c:if>>Torino</option>
				<option value="VR" <c:if test='${VRselected}'>selected</c:if>>Verona</option>
				<option value="RM" <c:if test='${RMselected}'>selected</c:if>>Roma</option>
				<option value="VE" <c:if test='${VEselected}'>selected</c:if>>Venezia</option>
			</select>
		</div>
		
		<div>
			<label for="provinceField2">Province residenza</label>	
			<input id="MIProvince2" type="radio" name ="province2" value="MI" <c:if test='${param.province2 == "MI"}'>checked</c:if>/>
			<label for="MIProvince2">Milano</label>
			<input id="TOProvince2" type="radio" name ="province2" value="TO" <c:if test='${param.province2 == "TO"}'>checked</c:if>/>
			<label for="TOProvince2">Torino</label>
			<input id="VRProvince2" type="radio" name ="province2" value="VR" <c:if test='${param.province2 == "VR"}'>checked</c:if>/>
			<label for="VRProvince2">Verona</label>
			<input id="RMProvince2" type="radio" name ="province2" value="RM" <c:if test='${param.province2 == "RM"}'>checked</c:if>/>
			<label for="RMProvince2">Roma</label>
			<input id="VEProvince2" type="radio" name ="province2" value="VE" <c:if test='${param.province2 == "VE"}'>checked</c:if>/>
			<label for="VEProvince2">Venezia</label>
		</div>
		<div>
			<label for="workingprovinceField2">Province residenza</label>	
			<input id="workingMIProvince2" type="checkbox" name ="workingprovince2" value="MI" <c:if test='${MIselected2}'>checked</c:if>/>
			<label for="workingMIProvince2">Milano</label>
			<input id="workingTOProvince2" type="checkbox" name ="workingprovince2" value="TO" <c:if test='${TOselected2}'>checked</c:if>/>
			<label for="workingTOProvince2">Torino</label>
			<input id="workingVRProvince2" type="checkbox" name ="workingprovince2" value="VR" <c:if test='${VRselected2}'>checked</c:if>/>
			<label for="workingVRProvince2">Verona</label>
			<input id="workingRMProvince2" type="checkbox" name ="workingprovince2" value="RM" <c:if test='${RMselected2}'>checked</c:if>/>
			<label for="workingRMProvince2">Roma</label>
			<input id="workingVEProvince2" type="checkbox" name ="workingprovince2" value="VE" <c:if test='${VEselected2}'>checked</c:if>/>
			<label for="workingVEProvince2">Venezia</label>
		</div>
		<input type="submit" value="Invia" />
	</form>

</t:genericPage>
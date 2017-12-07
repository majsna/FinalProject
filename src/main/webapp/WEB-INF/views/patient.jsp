<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@	page isELIgnored="false"%>
<%@	taglib	prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patients</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>">

</head>
<%@	include file="../../../header.jsp"%>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-3">
				<h2 class="text-center">ADD NEW PATIENT</h2>
				<form:form method="post" modelAttribute="patient" id="patientForm" >
				<!-- <div class="form-group"> -->
					
					First name:<form:input path="firstname" id="firstname" class="form-control"/>
					<form:errors path="firstname" />
					<br>
					Last name:
					<form:input path="lastname" id="lastname" class="form-control"/>
					<form:errors path="lastname" />
						<br>
					Email:
					<form:input path="email" id="email" class="form-control"/>
					<p>${alert}</p>
					<form:errors path="email" />
					<br>
					Phone Number:
					<form:input path="phone" id="phone" class="form-control"/>
					<form:errors path="phone" />
					<br>
					Pesel:
					<form:input path="pesel" id="pesel" class="form-control"/>
					<form:errors path="pesel" />
					<br>
					Street:
					<form:input path="street" id="street" class="form-control"/>
					<form:errors path="street" />
					<br>
					Postcode:
					<form:input path="postcode" id="postcode" class="form-control"/>
					<form:errors path="postcode" />
					<br>
					City:
					<form:input path="city" id="city" class="form-control"/>
					<form:errors path="city" />
					<br>
					Basic diagnosis:
					<form:input path="basicDiagnosis" id="basicDiagnosis" class="form-control"/>
					<form:errors path="basicDiagnosis" />
					<br>
					<input type="submit" value="Add" class="btn btn-primary add-patient"/>
				</form:form>
				<!-- </div> -->
			</div>
			<div class="col-sm-3">
				<h2 class="text-center">LIST OF PATIENTS</h2>
				<br>
				<ul class="patientList list-group"></ul>
				
				<template id="patientTemplate">
					<li class="list-group-item">
						<p data-id="{{id}}" class="text-center"><b>{{firstname}} {{lastname}}</b></p>
						<button data-id="{{id}}" class="showDetails btn btn-primary">Details</button>
						<button data-id="{{id}}" class="delPatient btn btn-primary">Delete</button>
						<a href="<c:url value="/patient/details/{{id}}"/>" class="btn btn-primary">Documentation</a>					
						<div data-id="{{id}}"></div>
						<div class="editForm" style="display: none" data-id="{{id}}">
								<br>
								<input type="text" name="firstname" value="{{firstname}}" class="form-control"/><br> 
								<input type="text" name="lastname" value="{{lastname}}" class="form-control"/><br>
								<input type="text" name="email" value="{{email}}" class="form-control"/><br> 
								<input type="text" name="phone" value="{{phone}}" class="form-control"/><br>
								<input type="text" name="pesel" value="{{pesel}}" class="form-control"/><br>
								<input type="text" name="street" value="{{street}}" class="form-control"/><br>
								<input type="text" name="postcode" value="{{postcode}}" class="form-control"/><br>
								<input type="text" name="city" value="{{city}}" class="form-control"/><br>
								<input type="text" name="basicDiagnosis" value="{{basicDiagnosis}}" class="form-control"/><br>
							<button class="savePatient btn btn-primary">Save</button>
						</div>
					</li>
				</template>
					
				<template id="patientDetailsTmp">
					<hr>
					<ul>
						<li><strong>Email: </strong>{{email}}</li>
						<li><strong>Pesel: </strong>{{pesel}}</li>
						<li><strong>Phone no: </strong>{{phone}}</li>
						<li><strong>Address: </strong><br>
							<span>ul. {{street}}</span><br>
							<span>{{postcode}} {{city}}</span><br></li>
						<li><strong>Basic diagnosis: </strong><br>
						{{basicDiagnosis}}</li>
					</ul>
					<br>
					<button data-id="{{id}}" class="editPatient btn btn-primary">Edit</button>	
				</template>
				
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value="/static/js/patient.js?newversion"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/mustache.js"/>"></script>
</body>
</html>
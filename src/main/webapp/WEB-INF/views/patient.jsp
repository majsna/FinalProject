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
<title>Pacjenci</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>

</head>
<%@	include file="../../../header.jsp"%>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-4">
				<h2>ADD NEW PATIENT</h2>
				<form:form method="post" modelAttribute="patient" id="patientForm">
					First name:<br>
					<form:input path="firstname" id="firstname" class="alert alert-success"/>
					<form:errors path="firstname" />
					<br>
					Last name:<br>
					<form:input path="lastname" id="lastname" class="alert alert-success"/>
					<form:errors path="lastname" />
					<br>
					Email:<br>
					<form:input path="email" id="email" class="alert alert-success"/>
					<form:errors path="email" />
					<br>
					Phone Number:<br>
					<form:input path="phone" id="phone" class="alert alert-success"/>
					<form:errors path="phone" />
					<br>
					Pesel:<br>
					<form:input path="pesel" id="pesel" class="alert alert-success"/>
					<form:errors path="pesel" />
					<br>
					Street:<br>
					<form:input path="street" id="street" class="alert alert-success"/>
					<form:errors path="street" />
					<br>
					Postcode:<br>
					<form:input path="postcode" id="postcode" class="alert alert-success"/>
					<form:errors path="postcode" />
					<br>
					City:<br>
					<form:input path="city" id="city" class="alert alert-success"/>
					<form:errors path="city" />
					<br>
					<input type="submit" value="Dodaj" class="btn btn-outline-success"/>
				</form:form>
			</div>
			<div class="col-sm-4">
				<h2>LIST OF PATIENTS</h2>
				<ul class="patientList list-group"></ul>
				
				<template id="patientTemplate">
					<li class="list-group-item list-group-item-action">
						<p data-id="{{id}}"><span>{{firstname}}</span> <span>{{lastname}}</span></p>
						<button data-id="{{id}}" class="showDetails btn btn-outline-success">Details</button>
						<button data-id="{{id}}" class="delPatient btn btn-outline-success">Delete</button>					
						<div data-id="{{id}}"></div>
						<div class="editForm" style="display: none" data-id="{{id}}">
								First Name:<br> 
								<input type="text" name="firstname" value="{{firstname}}" class="alert alert-success"/><br> 
								Last Name:<br> 
								<input type="text" name="lastname" value="{{lastname}}" class="alert alert-success"/><br>
								Email:<br> 
								<input type="text" name="email" value="{{email}}" class="alert alert-success"/><br> 
								Phone No:<br> 
								<input type="text" name="phone" value="{{phone}}" class="alert alert-success"/><br>
								Pesel:<br>
								<input type="text" name="pesel" value="{{pesel}}" class="alert alert-success"/><br>
								Street:<br>
								<input type="text" name="street" value="{{street}}" class="alert alert-success"/><br>
								Postcode:<br>
								<input type="text" name="postcode" value="{{postcode}}" class="alert alert-success"/><br>
								City:<br>
								<input type="text" name="city" value="{{city}}" class="alert alert-success"/><br>
							<button class="savePatient btn btn-outline-success">Save</button>
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
					</ul>
					<button data-id="{{id}}" class="editPatient btn btn-outline-secondary">Edit</button>	
				</template>
				
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>

<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script> -->
<!-- <script type="text/javascript" src="/PhysioApp/resources/patient.js?newversion"></script> -->
<script type="text/javascript" src="<c:url value="/static/js/patient.js?newversion"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/mustache.js"/>"></script>
</body>
</html>
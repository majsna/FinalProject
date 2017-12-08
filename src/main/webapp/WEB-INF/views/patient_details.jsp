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
<title>PhysioApp</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>">


</head>
<%@	include file="../../../header.jsp"%>
<body>

<div class="jumbotron">
	<h2 class="text-center"><b>DOCUMENTATION</b></h2>
</div>

<div class="container">
	<div class="row">
		<h4><b>PATIENT DATA</b></h4>
			<div class="col-sm-4">
				<p>${patient.firstname} ${patient.lastname}</p>
				<p>ul. ${patient.street}</p>
				<p>${patient.postcode}</p>
				<p>${patient.city}</p>
				<p>
					<b>Basic diagnosis:</b> <br>${patient.basicDiagnosis}
				</p>
				<br>
				<p>
					<a href="<c:url value="/calendar/add/${patient.id}"/>"
						class="btn btn-default"> ADD NEW VISIT <span
						class="glyphicon glyphicon-plus-sign"></span>
					</a>
				</p>
			</div>


			<div class="col-sm-8">
			
			<table class="table table-hover table-bordered">
				<tr>
					<th colspan="3" class="text-center">COMMING VISITS</th>
				<tr>
				<tr>
					<th>DATE</th>
					<th>TIME</th>
					<th>SERVICE</th>
				</tr>
				<c:forEach items="${visits}" var="v">
					<tr>
						<td>${v.date}</td>
						<td>${v.hour}:00</td>
						<td>${v.service.name}</td>
					</tr>
				</c:forEach>
			</table>
			
			<br>
			<hr class="style-one">
			<br>
			
			<table class="table table-hover table-bordered diagnosisTbl">
				<tr>
					<th colspan="5" class="text-center">HISTORY OF TREATMENT</th>
				<tr>
				<tr>
					<th>DATE</th>
					<th>TIME</th>
					<th>SERVICE</th>
					<th>DIAGNOSIS/DESCRIPTION</th>
					<th class="text-center">ADD/EDIT</th>
				</tr>
				<c:forEach items="${visitsPast}" var="vp">
					<tr>
						<td>${vp.date}</td>
						<td>${vp.hour}:00</td>
						<td>${vp.service.name}</td>
						<td class="diagnosis text-center">
						
								<span class="diagnosis">${vp.diagnosis}</span><br>
								<div style="display: none">
									<input type="hidden" name="id" value="${vp.id}"/>
									<input type="hidden" name="date" value="${vp.date}"/>
									<textarea name="diagnosis" form="diagnoForm" rows="5" cols="25"></textarea>
									<input type="hidden" name="hour" value="${vp.hour}"/>
									<input type="hidden" name="patient_id" value="${vp.patient.id}"/>
									<input type="hidden" name="service_id" value="${vp.service.id}"/><br>
									<button class="submitDiagnosis btn btn-default" data-id="${vp.id}" >Submit <span class="glyphicon glyphicon-ok-circle"></button>

								</div>

						</td>
						<td class="text-center">
							<button class="btn btn-default diagnosis" ><span class="glyphicon glyphicon-edit"></button>
						</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
		
	</div>
</div>

	
	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value="/static/js/patient_details.js?newversion"/>"></script>
</body>
</html>
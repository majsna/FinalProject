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

	<h2>ADD VISIT FORM</h2>
	
		<form:form method="post" modelAttribute="visit">
			Patient:<br> 
			<form:select path="patient" items="${patients}" itemValue="id" itemLabel="lastname"/>
			<form:errors path="patient"/><br>
			Date(yyyy-mm-dd):<br>
			<form:input path="date"/>
			<form:errors path="date"/><br>
			Time:<br>
			<form:select path="hour">
				<form:option value="9" label="9:00"/>
				<form:option value="10" label="10:00"/>
				<form:option value="11" label="11:00"/>
				<form:option value="12" label="12:00"/>
				<form:option value="13" label="13:00"/>
				<form:option value="14" label="14:00"/>
				<form:option value="15" label="15:00"/>
				<form:option value="16" label="16:00"/>
				<form:option value="17" label="17:00"/>
				<form:option value="18" label="18:00"/>
			</form:select><br>
			<form:errors path="hour"/>
			Service:<br>
			<form:select path="service" items="${services}" itemValue="id" itemLabel="name"/><br>			
			<form:errors path="service"/>
			<input type="submit" value="Add"/>	
		</form:form>

	
	
</body>
</html>
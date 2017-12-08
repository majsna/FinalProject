<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@	page isELIgnored="false"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		<h2 class="text-center"><b>ADD VISIT FOR ${onePatient.firstname} ${onePatient.lastname}</b></h2>
	</div>

	<div class="container center_div">
		<div class="col-sm-4 col-sm-offset-4">
		
			<form:form method="post" modelAttribute="visit" align="left">		
				Date(yyyy-mm-dd):<br>
				<form:input path="date" class="form-control datepicker" />
				<form:errors path="date" class="error" />
				<span class="error">${message}</span>
				<br>
					Time:<br>
				<form:select path="hour" class="form-control">
					<form:option value="9" label="9:00" />
					<form:option value="10" label="10:00" />
					<form:option value="11" label="11:00" />
					<form:option value="12" label="12:00" />
					<form:option value="13" label="13:00" />
					<form:option value="14" label="14:00" />
					<form:option value="15" label="15:00" />
					<form:option value="16" label="16:00" />
					<form:option value="17" label="17:00" />
					<form:option value="18" label="18:00" />
				</form:select>
				<br>
				<form:errors path="hour" class="error" />
				Service:<br>
				<form:select path="service" items="${services}" itemValue="id"
					itemLabel="name" class="form-control" />
				<br>
				<form:errors path="service" class="error" />

				<input type="submit" value="Add" class="btn btn-default"/>
			</form:form>
		</div>
	</div>

</body>
<script type="text/javascript" src="<c:url value="/static/js/datepicker.js"/>"></script>
</html>
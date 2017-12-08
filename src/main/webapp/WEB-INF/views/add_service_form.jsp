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
		<h1 class="text-center">ADD SERVICE FORM</h1>
	</div>
	
	<div class="container center_div">
		<div class="col-sm-4 col-sm-offset-4">
			<form:form method="post" modelAttribute="service">
			Name:<br>
				<form:input path="name" class="form-control"/>
				<form:errors path="name" class="error" />
				<br>
			Description:<br>
				<form:textarea path="description" cols="30" rows="5" class="form-control"/>
				<form:errors path="description" class="error" />
				<br>
			Price:<br>
				<form:input path="price" class="form-control"/>
				<form:errors path="price" class="error" />
				<br>
				<input type="submit" value="Add" class="btn btn-default"/>
			</form:form>
		</div>
	</div>


</body>
</html>
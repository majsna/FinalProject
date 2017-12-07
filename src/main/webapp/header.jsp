<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<header>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid collapse navbar-collapse">
		<div class="navbar-header ">
			<a class="navbar-brand" href="#">PhysioApp</a>
		</div>
		<ul class="nav navbar-nav">
			<li ><a href="<c:url value="/"/>">Home</a></li>
			<li ><a href="<c:url value="/calendar"/>">Calendar</a></li>
			<li ><a href="<c:url value="/patient/view"/>">Patients</a></li>
			<li ><a href="<c:url value="/service"/>">Services</a></li>
		</ul>
<%-- 		<ul class="nav navbar-nav navbar-right">
			<li class="login-li"><a href="<c:url value="/patient"/>"><span class="glyphicon glyphicon-user"></span>
					Sign Up</a></li>
			<li class="login-li"><a href="<c:url value="/patient"/>"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul> --%>
	</div>
	</nav>
</header>

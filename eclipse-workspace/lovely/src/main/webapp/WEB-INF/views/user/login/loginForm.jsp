<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<div class="panel-body">
		<form:form role="form" commandName="loginCommand" action="/login"
			method="post">
			<fieldset>
				<div class="form-group">
					<form:input type="text" class="form-control" placeholder="ID"
						path="id" />
					<form:errors path="id" />
				</div>
				<div class="form-group">
					<form:password class="form-control" placeholder="Password"
						path="pw" />
					<form:errors path="pw" />
				</div>
				<div class="checkbox">
					<label> <form:checkbox path="rememberId" />아이디 기억
					</label>
				</div>
				<button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
			</fieldset>
		</form:form>
	</div>



</body>
</html>
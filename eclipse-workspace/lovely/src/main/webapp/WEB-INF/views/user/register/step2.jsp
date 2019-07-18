<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		<div class="row">
			<div class="col-lg-6">
				<form:form role="form" commandName="registerRequest"
					action="/register/step3" method="post">
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-check"></i></span>
						<form:input type="text" class="form-control" placeholder="ID"
							path="id" />
						<form:errors path="id" />
					</div>
					
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						<form:input type="text" class="form-control" placeholder="Name"
							path="name" />
						<form:errors path="name" />
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<form:password class="form-control" placeholder="Password"
							path="pw" />
						<form:errors path="pw" />
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<form:password class="form-control" placeholder="Password Check"
							path="checkPw" />
						<form:errors path="checkPw" />
					</div>
					<button type="submit" class="btn btn-default">가입하기</button>
					<button type="button" class="btn btn-secondary">
						<a href='<c:url value='/'/>'  role="button">취소하기</a>
					</button>
				</form:form>
			</div>
		</div>
	</div>



</body>
</html>
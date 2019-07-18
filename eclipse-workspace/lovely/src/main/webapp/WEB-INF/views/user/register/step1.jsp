<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="col-lg-12">
				<h4>이용약관</h4>
				<div class="panel-body" style="border: 1px solid #ccc">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare
						lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum
						dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>
				</br>
				<h4>개인정보</h4>
				<div class="panel-body" style="border: 1px solid #ccc">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare
						lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum
						dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>
				<br />
				<form role="form" action="/register/step2">
					<div class="form-group">
						<label class="checkbox-inline"> <input type="checkbox"
							name="agree" value="true">동의합니다.
						</label>
					</div>
					<button type="submit" class="btn btn-default">다음 단계</button>
					<button type="button" class="btn btn-secondary">
						<a href='<c:url value='/'/>'  role="button">뒤로가기</a>
					</button>

				</form>
			</div>
		</div>
</body>
</html>
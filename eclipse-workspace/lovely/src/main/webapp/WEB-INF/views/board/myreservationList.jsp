<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>나의 예약</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<link href="/resources/css/list.css" rel="stylesheet">


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#up_button {
	width: 70px;
	height: 30px;
	border: solid 2px dodgerblue;
	position: fixed;
	bottom: 150px;
	right: 20px;
	text-align: center;
}
</style>
<script>
	$(function() {
		$('.navbar-toggle').click(function() {
			$('.navbar-nav').toggleClass('slide-in');
			$('.side-body').toggleClass('body-slide-in');
			$('#search').removeClass('in').addClass('collapse').slideUp(200);

			/// uncomment code for absolute positioning tweek see top comment in css
			//$('.absolute-wrapper').toggleClass('slide-in');

		});

		// Remove menu for searching
		$('#search-trigger').click(function() {
			$('.navbar-nav').removeClass('slide-in');
			$('.side-body').removeClass('body-slide-in');

			/// uncomment code for absolute positioning tweek see top comment in css
			//$('.absolute-wrapper').removeClass('slide-in');

		});
	});
</script>
</head>



<body>

	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/board/boardList">문화/정보 사이트</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">

				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> MY INFO </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item"
								href='/board/myreservationList?id=${authInfo.id }'> 나의 예약 정보</a><a
								class="dropdown-item"
								href='/board/myboardList?id=${authInfo.id }'>나의 게시물</a> <a
								class="dropdown-item"
								href='/board/myreplyList?id=${authInfo.id }'>나의 댓글</a>
						</div></li>
				</ul>
				<div style="position: absolute; right: 0; color: white;"">
					사용자ID :${authInfo.id } <input type=button class="btn btn-info"
						value="로그아웃" OnClick="window.location='/logout'">
				</div>
			</div>
		</div>
	</nav>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('/resources/image/main1_.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<p>
							<i><b>모든 공연/전시 예매는 여기서!</b></i>
						</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('/resources/image/main2_.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<p>
							<i><b>지역별,분야별 공연/전시 정보를 한눈에!</b></i>
						</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('/resources/image/main3_.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<p>
							<i><b>나의 정보 관리도 손쉽게!</b></i>
						</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<div class="card">
		<div class="card-body p-4">
			<form method="post">
				<div align="center">
					<span style="font-size: 30px;"><b>나의 예약 확인하기<b /></span>
				</div>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list}" var="reservation">
							<table
								class="table table-striped table-bordered table-hover form-container form-1 form-1"
								style="text-align: center; padding-left: 40%">

								<tr>
									<td>제목</td>
									<td style="text-align: left">${reservation.subject}</td>
								</tr>
								<tr>
									<td>이름</td>
									<td style="text-align: left">${reservation.name}</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td style="text-align: left">${reservation.phone}</td>
								</tr>
								<tr>
									<td>카드</td>
									<td style="text-align: left">${reservation.card}</td>
								</tr>
								<tr>
									<td>작성일자</td>
									<td style="text-align: left">${reservation.date}</td>
								</tr>
								<tr>
									<td>공연/전시 시간</td>
									<td style="text-align: left">${reservation.performtime}</td>
								</tr>
								<tr>
									<td>공연/전시 날짜</td>
									<td style="text-align: left">${reservation.performdate}</td>
								</tr>
								<tr>
									<td>공연/전시 위치</td>
									<td style="text-align: left">${reservation.performlocation}</td>
								</tr>
								<tr>
									<td>공연/전시 지역</td>
									<td style="text-align: left">${reservation.area}</td>
								</tr>
								<tr>
									<td>공연/전시 유형</td>
									<td style="text-align: left">${reservation.type}</td>
								</tr>

							</table>

							<div style="text-align: center">
								<input type=button class="btn btn-danger" value="취소하기"
									OnClick="window.location='/board/deletereservation?num=${reservation.num}&id=${authInfo.id } '">
							</div>
							<br>

						</c:forEach>
					</c:when>
					<c:otherwise>
						<table class="table table-striped table-bordered table-hover"
							style="text-align: center">
							<tr>
								<td>내가 예매한 내역이 없습니다</td>
							</tr>
						</table>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>


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
	<script src="https://use.fontawesome.com/b4aae4cb0e.js"></script>
	<script type="text/javascript"
		src="https://cdn.rawgit.com/leafo/sticky-kit/v1.1.2/jquery.sticky-kit.min.js"></script>
	<script type="text/javascript">
		$(".sidebar").stick_in_parent();
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>예약하기</title>
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

<script>  
	$(function () {
	    $('.navbar-toggle').click(function () {
	        $('.navbar-nav').toggleClass('slide-in');
	        $('.side-body').toggleClass('body-slide-in');
	        $('#search').removeClass('in').addClass('collapse').slideUp(200);

	        /// uncomment code for absolute positioning tweek see top comment in css
	        //$('.absolute-wrapper').toggleClass('slide-in');
	        
	    });
	   
	   // Remove menu for searching
	   $('#search-trigger').click(function () {
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
							<a class="dropdown-item" href='/board/myreservationList?id=${authInfo.id }'> 나의 예약 정보</a><a
								class="dropdown-item"
								href='/board/myboardList?id=${authInfo.id }'>나의 게시물</a> <a
								class="dropdown-item"
								href='/board/myreplyList?id=${authInfo.id }'>나의 댓글</a>
						</div></li>
				</ul>
				<div style="position: absolute; right: 0; color: white;"">
					사용자ID : ${authInfo.id } <input type=button class="btn btn-info"
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
	<div class="container bg-2 text-center" style="margin-top: 30px;">
		<div class="card">
			<div class="card-body p-4">


				<form action="/board/boardReservation" method="post">
					<table class="table table-striped table-bordered table-hover"
						style="text-align: center">
						<caption style="text-align: center">예약하기</caption>
						<input type="hidden" name="id" value="${authInfo.id }">
						<tr>
							<td>제목</td>
							<td style="text-align: left"><input type="text"
								name="subject" value="${detail.TITLE}" readonly
								onfocus="this.blur();"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td style="text-align: left"><input type="text" name="name"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td style="text-align: left"><input type="text" name="phone"></td>
						</tr>
						<tr>
							<td>카드</td>
							<td style="text-align: left"><input type="text" name="card"></td>
						</tr>
						<tr>
							<td>공연/전시 시간</td>
							<td style="text-align: left"><input type="text"
								name="performtime" value="${detail.PERFORMTIME}" readonly
								onfocus="this.blur();"></td>
						</tr>
						<tr>
							<td>공연/전시 날짜</td>
							<td style="text-align: left"><input type="text"
								name="performdate" value="${detail.PERFORMDATE}" readonly
								onfocus="this.blur();"></td>
						</tr>
						<tr>
							<td>공연/전시 위치</td>
							<td style="text-align: left"><input type="text"
								name="performlocation" value="${detail.PERFORMLOCATION}" readonly
								onfocus="this.blur();"></td>
						</tr>
						<tr>
							<td>공연/전시 지역</td>
							<td style="text-align: left"><input type="text" name="area"
								value="${detail.AREA}" readonly onfocus="this.blur();"></td>
						</tr>
						<tr>
							<td>공연/전시 유형</td>
							<td style="text-align: left"><input type="text" name="type"
								value="${detail.TYPE}" readonly onfocus="this.blur();"></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: right"><input type=submit
								class="btn btn-warning" value="예약"> <input type=button
								class="btn btn-secondary" value="취소"
								OnClick="window.location='/board/boardDetail?idx=${detail.IDX }&title=${detail.TITLE }'">
							</td>
						</tr>
					</table>


				</form>
			</div>
		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="js/jquery.dropotron.min.js"></script>
	<script src="js/browser.min.js"></script>
	<script src="js/breakpoints.min.js"></script>
	<script src="js/util.js"></script>

	<script src="js/main2.js"></script>
</body>
</html>
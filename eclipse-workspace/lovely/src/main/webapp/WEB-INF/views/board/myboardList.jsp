<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>나의 게시판</title>
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
								href='/board/myreservationList?id=${authInfo.id }'> 나의 예약 정보</a>
							<a class="dropdown-item"
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
	<div align="center">
		<span style="font-size: 30px;"><b>나의 게시물 확인하기<b /></span>
	</div>
	<c:choose>
		<c:when test="${fn:length(list) > 0 }">
			<c:forEach items="${list}" var="map">
				<div class="container my-5">

					<!-- Grid row -->
					<div class="row">

						<!-- Grid column -->
						<div class="col-md-12">

							<div class="card ">
								<div class="card-body p-4">

									<!-- Grid row -->
									<div class="row">

										<!-- Grid column -->
										<div class="col-lg-4">



											<div class="media mb-3">
												<%-- <c:forEach var="row" items="${list }">
										<input type="hidden" id=BOARD_TITLE value="${row.BOARD_TITLE }">
									<img width="300" height="400" src="/resources/boardimage/${row.STORED_FILE_NAME }" >
									</c:forEach> --%>
											</div>

											<hr class="blue-border mb-4">

											<div style="text-align: center">

												<c:if test="${map.CREA_ID eq authInfo.id}">
													<button type="button" class="btn btn-warning btn-lg">
														<a style="color: white"
															href='<c:url value='/board/boardUpdate?idx=${map.IDX }&title=${map.TITLE}'/>'>수정</a>
													</button>
													<button type="button" class="btn btn-danger btn-lg">
														<a style="color: white"
															href='<c:url value='/board/boardDelete?idx=${map.IDX }'/>'>삭제</a>
													</button>
												</c:if>
											</div>

										</div>
										<!-- Grid column -->

										<!-- Grid column -->
										<div class="col-lg-8">

											<h3
												class="mb-4 py-2 mt-lg-0 mt-4 text-center font-weight-bold text-uppercase">공연/전시
												내용</h3>






											<!-- Table with panel -->
											<table class="table table-striped table-bordered "
												style="text-align: center; height: 300px">



												<tr>
													<th class="table-danger">공연/전시 제목</th>
													<td style="text-align: left">${map.TITLE }</td>
													<th class="table-danger">공연/전시 날짜</th>
													<td style="text-align: left">${map.PERFORMDATE}</td>

												</tr>
												<tr>
													<th class="table-primary">작성자</th>
													<td style="text-align: left">${map.CREA_ID }</td>
													<th class="table-primary">작성일자</th>
													<td style="text-align: left">${map.CREA_DATE }</td>

												</tr>
												<tr>
													<th class="table-danger">공연/전시 내용</th>
													<td colspan="3" style="text-align: left">${map.CONTENTS }</td>
												</tr>
												<tr>
													<th class="table-primary">공연/전시 지역</th>
													<td style="text-align: left">${map.AREA }</td>
													<th class="table-primary">공연/전시 장소</th>
													<td style="text-align: left">${map.PERFORMLOCATION}</td>
												</tr>
												<tr>
													<th class="table-danger">공연 분야</th>
													<td style="text-align: left">${map.TYPE}</td>
													<th class="table-danger">조회수</th>
													<td style="text-align: left">${map.HIT_CNT}</td>
												</tr>

											</table>
											<!-- Grid row -->

											</form>



										</div>
										<!-- Grid column -->

									</div>
									<!-- Grid row -->

								</div>
							</div>

						</div>
						<!-- Grid column -->

					</div>
					<!-- Grid row -->

				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<table class="table table-striped table-bordered table-hover"
				style="text-align: center">
				<tr>
					<td>내가 작성한 게시물이 없습니다</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	<%-- 	<div class="container col-md-6">
		<div class="card">

			<c:url value="/board/boardReply" var="insertUrl" />
			<form method="post" action="${insertUrl}">
				<h3
					class="mb-4 py-2 mt-lg-0 mt-4 text-center font-weight-bold text-uppercase">댓글
					작성하기</h3>
				<input type="hidden" name="idx" value="${detail.IDX }" />
				<div class="form-group">
					<label for="exampleFormControlInput1">제목</label> <input type="text"
						class="form-control" id="exampleFormControlInput1" name="subject"
						placeholder="제목을 작성해주세요.">
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">공연 제목</label> <input
						type="text" class="form-control" id="exampleFormControlInput1"
						name="title" value="${detail.TITLE }"readonly/'>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">작성자</label> <input
						type="text" class="form-control" id="exampleFormControlInput1"
						name="id" value="${authInfo.id }"readonly/'>
				</div>

				<div class="form-group">
					<label for="exampleFormControlTextarea1">내용</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						name="content" rows="10"></textarea>
				</div>
				<button type="submit" class="btn btn-info">등록하기</button>
				<button type="button" class="btn btn-secondary">
					<a href='<c:url value='/board/boardList'/>' class="btn btn-info"
						role="button">목록으로</a>
				</button>

			</form> --%>
	<%-- <c:url value="/board/boardReply" var="insertUrl" />
			<form method="post" action="${insertUrl}">
				<h3
					class="mb-4 py-2 mt-lg-0 mt-4 text-center font-weight-bold text-uppercase">댓글
					작성하기</h3>
				<table style="text-align: center"
					class="table  table-striped  table-bordered ">
					<tr>
						<th class="table-danger">공연 제목</th>
						<td colspan='3' style="text-align: left" name="subject">${detail.TITLE}
						</th>

					</tr>
					<tr>
						<th class="table-primary">제목</th>

						<td colspan='3' style="text-align: left"><input type="text"
							name="title" cols="90" placeholder="제목을 입력하세요" form="inform"></td>

					</tr>
					<tr>
						<th class="table-danger">작성자</th>
						<td style="text-align: left">${detail.CREA_ID }</td>
						<th class="table-danger">email</th>
						<td style="text-align: left">${detail.EMAIL }</td>
					</tr>

					<tr>
						<th class="table-primary">내용</th>
						<td colspan='2' style="text-align: left"><textarea
								name="content" cols="90" rows="5" placeholder="내용을 입력하세요"
								form="inform"></textarea></td>
						<td style="vertical-align: bottom">
							<button type="submit" class="btn btn-info">댓글달기</button>
						</td>
					</tr>
				</table>

			</form> --%>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
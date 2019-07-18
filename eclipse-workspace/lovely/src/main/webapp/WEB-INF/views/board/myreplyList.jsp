<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<title>나의 댓글</title>
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
		<span style="font-size: 30px;"><b>나의 댓글 확인하기<b /></span>
	</div>
	<c:choose>
		<c:when test="${fn:length(list) > 0 }">
			<c:forEach items="${list}" var="reply">
				<div class="container">
					<tbody>


						<p
							style="text-align: left; font-size: 25px; font-family: 'Playfair Display', serif; margin-bottom: -1%;">
							<b>${reply.ID }</b>
						</p>
						<p style="text-align: right;">작성일자: ${reply.BOARDDATE }</p>
						<table style="text-align: center; margin: auto;"
							class="table table-hover">
							<!--<caption style="text-align:center">댓글 </caption>-->
							<tr>
								<td style="width: 20%;">게시물 제목</td>
								<td style="text-align: left">${reply.TITLE}</td>

							</tr>
							<tr>
								<td style="width: 20%;">댓글 제목</td>
								<td style="text-align: left">${reply.SUBJECT }</td>

							</tr>

							<tr>
								<td>댓글 내용</td>
								<td style="text-align: left"><textarea readonly="readonly"
										style="width: 890px; height: 110px; background: none; outline: none; border-bottom: medium none; border-left: medium none; border-right: medium none; border-top: medium none;">${reply.CONTENT }</textarea></td>
							</tr>

						</table>
						<input type="hidden" name="count" value="${reply.COUNT }">
						<input type="hidden" name="title" value="${reply.TITLE }">
				</div>

				<div class="container bg-2 text-right"
					style="margin-top: 20px; margin-bottom: 20px;">
					<c:if test="${reply.ID eq authInfo.id}">
						<%-- 
			<form
				action='<c:url value='/board/ReplyUpdate?count=${reply.COUNT}'/>'
				style="float: left; margin: 0;">
				<input type="hidden" name="count" value="${reply.COUNT }"> <input
					type="hidden" name="title" value="${reply.TITLE }"> --%>
						<img id="edit" onmouseover="OnMouseIn_1(this)"
							onmouseout="OnMouseOut_1(this)" src="/resources/image/edit.png"
							width="40px" height="40px"
							onclick="window.location='/board/ReplyUpdate?count=${reply.COUNT}&title=${reply.TITLE }'">
						<img id="delete" style="margin-left: 10px;"
							onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)"
							src="/resources/image/delete.png" width="40px" height="40px"
							onclick="/board/ReplyDelete?count=${reply.COUNT}&title=${reply.TITLE }'">
						<%-- <button type="submit" class="btn btn-info">수정</button>
			
			<form action='<c:url value='/board/ReplyDelete'/>' method="post">
				<input type="hidden" name="count" value="${reply.COUNT }"> <input
					type="hidden" name="title" value="${reply.TITLE }">
				<button type="submit" class="btn btn-info">삭제</button>
			</form> --%>
					</c:if>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<table class="table table-striped table-bordered table-hover"
				style="text-align: center">
				<tr>
					<td>내가 남긴 댓글이 없습니다</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>

	</tbody>

	</table>



	</div>

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
	<%-- <c:if test="${not empty Replylist}"> 
<c:forEach items="${Replylist}" var="Arrayreply">



<div class="container bg-2 text-center" style="margin-top: 20px;">

<p style="text-align:left; font-size: 25px; font-family: 'Playfair Display', serif; margin-bottom: -1%;" ><b>${Arrayreply.id}</b></p> 
<p style="text-align:right;"> 작성일자: ${Arrayreply.boarddate}</p>
<table style="text-align:center; margin: auto;" class="table table-hover">
		<!--<caption style="text-align:center">댓글 </caption>-->

			<tr>
				<td style="width: 20%;">제목</td>
				<td style="text-align:left">${Arrayreply.title}</td>
				
		</tr>

		<tr >
			<td>내용</td>
			<td style="text-align:left"><textarea readonly="readonly" style="width: 890px; height: 110px; background: none; outline: none; border-bottom: medium none; border-left: medium none; border-right: medium none; border-top: medium none;">${Arrayreply.content}</textarea></td>						
		</tr>
			
		</table>
	</div>

		<div class="container bg-2 text-right" style="margin-top: 20px; margin-bottom: 20px;">
		<c:if test="${Arrayreply.id eq id}">
		<img id="edit" onmouseover="OnMouseIn_1(this)" onmouseout="OnMouseOut_1(this)" src="./image/edit.png" width="40px" height="40px" onclick="window.location='replymodifyform.do?count=${Arrayreply.count}'">
		<img id="delete" style="margin-left: 10px;" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)" src="./image/delete.png" width="40px" height="40px" onclick="window.location='replydelete.do?count=${Arrayreply.count}'">
		</c:if>	
		</div>

		</c:forEach>
		</c:if>
	<c:if test="${empty Replylist}">
		 <script language=javascript>
				  	self.window.alert("작성된 댓글이 없습니다. 처음 댓글을 남겨주세요!");
				  	location.href="/board/boardList";//원글번호를 받으면 가능할듯?
		 </script>
		
		</c:if>  --%>
</body>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0 }">
					<c:forEach items="${list}" var="reply">

						<p
							style="text-align: left; font-size: 25px; font-family: 'Playfair Display', serif; margin-bottom: -1%;">
							<b>${reply.ID }</b>
						</p>
						<p style="text-align: right;">작성일자: ${reply.BOARDDATE }</p>
						<table style="text-align: center; margin: auto;"
							class="table table-hover">
							<!--<caption style="text-align:center">댓글 </caption>-->
							<tr>
								<td style="width: 20%;">댓글 제목</td>
								<td style="text-align: left">${reply.SUBJECT }</td>

							</tr>

							<tr>
								<td>댓글 내용</td>
								<td style="text-align: left"><textarea readonly="readonly"
										style="width: 890px; height: 110px; background: none; outline: none; border-bottom: medium none; border-left: medium none; border-right: medium none; border-top: medium none;">${reply.CONTENT }</textarea></td>
							</tr>

						</table>
						<input type="hidden" name="count" value="${reply.COUNT }">
						<input type="hidden" name="title" value="${reply.TITLE }">
	</div>

	<div class="container bg-2 text-right"
		style="margin-top: 20px; margin-bottom: 20px;">
		<c:if test="${reply.ID eq authInfo.id}">

			<form
				action='<c:url value='/board/ReplyUpdate?count=${reply.COUNT}'/>'
				style="float: left; margin: 0;">
				<input type="hidden" name="count" value="${reply.COUNT }"> <input
					type="hidden" name="title" value="${reply.TITLE }">
				<button type="submit" class="btn btn-info">수정</button>
			</form>
			<form action='<c:url value='/board/ReplyDelete'/>' method="post">
				<input type="hidden" name="count" value="${reply.COUNT }"> <input
					type="hidden" name="title" value="${reply.TITLE }">
				<button type="submit" class="btn btn-info">삭제</button>
			</form>
		</c:if>
	</div>
	</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="7">조회된 결과가 없습니다.</td>
		</tr>
	</c:otherwise>
	</c:choose>

	</tbody>

	</table>
	
	<a href='<c:url value='/board/boardList'/>'
		class="text-dark">메인으로</a>

	</div>
</body>
</html> --%>
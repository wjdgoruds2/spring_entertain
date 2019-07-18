<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script> 
      function writeCheck()
        {
         var form = document.writeform;
         
        if( !form.subject.value )
         {
          alert( "제목을 적어주세요" );
          form.subject.focus();
          return;
         }
       
        if( !form.content.value )
         {
          alert( "내용을 적어주세요" );
          form.content.focus();
          return;
         }  
       
        form.submit();
        }
    </script>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Playfair+Display&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
   <title>댓글 수정</title>
   
   <style>
   
   body{
font-family: 'Noto Sans KR', sans-serif;
}
.bg-1{
   background-color: gray;
   color: #FFFFFF;
   text-align: right;
}

*, *::before, *::after {
  box-sizing: border-box;
}
.basicBox {
  width: 130px;
  height: 40px;
  margin: 15px auto;
  color: #908383;
  font-size: 1.25rem;
  line-height: 40px;
  text-transform: uppercase;
  text-align: center;
  position: relative;
  cursor: pointer;
}

svg {
  position: absolute;
  top: 0;
  left: 0;
}
svg rect {
  fill: none;
  stroke: #908383;
  stroke-width: 1;
}
.basicBox:hover svg rect {
  stroke: #908383;
}

/* Basic Box */
svg rect {
  stroke-dasharray: 400, 0;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.basicBox:hover svg rect {
  stroke-width: 3;
  stroke-dasharray: 35, 220;
  stroke-dashoffset: 38;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}

.btn-three {
   color: #FFF;
   transition: all 0.5s;
   position: relative;
}
.btn-three::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   z-index: 1;
   background-color: rgba(255,255,255,0.1);
   transition: all 0.3s;
}
.btn-three:hover::before {
   opacity: 0 ;
   -webkit-transform: scale(0.5,0.5);
           transform: scale(0.5,0.5);
}
.btn-three::after {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   z-index: 1;
   opacity: 0;
   transition: all 0.3s;
   border: 1px solid rgba(255,255,255,0.5);
   -webkit-transform: scale(1.2,1.2);
           transform: scale(1.2,1.2);
}
.btn-three:hover::after {
   opacity: 1;
   -webkit-transform: scale(1,1);
           transform: scale(1,1);
}

.btn-two {
   color: #908383;
   transition: all 0.5s;
   position: relative;
}
.btn-two::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   z-index: 1;
   background-color: rgba(144, 131, 131,0.1);
   transition: all 0.3s;
}
.btn-two:hover::before {
   opacity: 0 ;
   -webkit-transform: scale(0.5,0.5);
           transform: scale(0.5,0.5);
}
.btn-two::after {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   z-index: 1;
   opacity: 0;
   transition: all 0.3s;
   border: 1px solid rgba(144, 131, 131,0.5);
   -webkit-transform: scale(1.2,1.2);
           transform: scale(1.2,1.2);
}
.btn-two:hover::after {
   opacity: 1;
   -webkit-transform: scale(1,1);
           transform: scale(1,1);
}
footer{
   margin-top: 60px;
   height: 60px;
   background-color: #908383;
   color: white;
   text-align: center;
}
</style>
   
</head>
<body>
<div class="container-fluid bg-1">
   <br/><b><i>${authInfo.id }</i></b>님, 안녕하세요!　

  <div class="btn btn-three" style="margin-right: 10px;" OnClick="window.location='logout.do'">
<span>로그아웃</span>
  </div>
<h1 style="letter-spacing: -1px; font-family: 'Noto Serif KR', serif; text-align: center; margin-top: 100px; margin-bottom: 20px;"><b>후기수정</b></h1>
</div>


<div class="container bg-2 text-center" style="margin-top: 30px;">
 <form action='<c:url value='/board/ReplyUpdate'/>' method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="subject"
					value="${detail.SUBJECT }">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">작성자</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="id"
					value="${detail.ID }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="10" name="content">${detail.CONTENT }</textarea>
			</div>
			<input type="hidden" name="count" value="${detail.COUNT }">
			<input type="hidden" name="title" value="${detail.TITLE }">
			<button type="submit" class="btn btn-info">수정하기</button>
			<button type="button" class="btn btn-secondary">
			<a href='<c:url value='/board/boardReplydetail?title=${detail.TITLE }'/>' class="text-dark" style="color:white">뒤로가기</a>
		</button>
		</form>
   </div>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container col-md-6">
		<form action='<c:url value='/board/ReplyUpdate'/>' method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="subject"
					value="${detail.SUBJECT }">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">작성자</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="id"
					value="${detail.ID }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="10" name="content">${detail.CONTENT }</textarea>
			</div>
			<input type="hidden" name="count" value="${detail.COUNT }">
			<input type="hidden" name="title" value="${detail.TITLE }">
			<button type="submit" class="btn btn-info">수정하기</button>
			<button type="button" class="btn btn-secondary">
			<a href='<c:url value='/board/boardReplydetail?title=${detail.TITLE }'/>' class="text-dark">뒤로가기</a>
		</button>
		</form>
	</div>
</body>
</html --%>
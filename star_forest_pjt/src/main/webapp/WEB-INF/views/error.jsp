<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
  <!-- 구글폰트 전체 기본적용 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
	<!-- 구글폰트 전체 기본적용 END -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/error.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	 <script type="text/javascript">
	 
	  <!-- 미로그인시 글쓰기 버튼 누르면 로그인페이지로 이동 -->
	  </script>
  <title>별숲도서관</title>
</head>

<body class="d-flex flex-column">
	<div id="page-content">
		<!-- navigation start-->
			<div id="navigation">
				<!-- include_common_left.jsp start-->
				<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
				<!-- include_common_left.jsp end-->
			</div>
			<!-- navigation end-->
	
	<!-- MAIN SECTION -->
	<section id="contact" class="pt-3 pb-5">
		<!-- 사이드바 -->
		<div id="error" class="container text-center">
		  <div class="row my-2">
				<div class="col-md-12 text-center my-5">
	        <h5 class="noto-serif">죄송합니다. 서비스중에 문제가 발생하였습니다.</h5>
	        <hr>
	        
	        <img alt="error" src="../img/sorry.gif" width="300">
	      
	      </div>
	      <div class="col-md-6 p-2">
	      	<div class="row">
		        <div class="col">
		          <h6>도서관소개</h6>
		          <hr>
		          <p><a href="howtoInfo">대출/반납/연장</a></p>
		          <a href="postList?option=p_title&search=&group=10"><p>공지사항</p></a>
		          <a href="faqViewpage"><p>자주묻는질문</p></a>
		          <a href="QnaList"><p>묻고답하기</p></a>
		          <a href="addrViewpageAPI"><p>오시는 길</p></a>
		        </div>
		        <div class="col">
			        <h6>도서정보</h6>
			        <hr>
			        <a href="SearchResult"><p>도서검색</p></a>
			        <a href="recommendedBooks"><p>사서추천도서</p></a>
			        <a href="Newbooks"><p>신착도서</p></a>
			        <a href="popularBook"><p>인기도서</p></a>
		        </div>
	        </div>
        </div>
        <div class="col-md-6 p-2">
	        <div class="row">
		        <div class="col">
	            <h6>커뮤니티</h6>
	            <hr>
	            <a href="postList?option=p_title&search=&group=20"><p>창작물게시판</p></a>
	            <a href="postList?option=p_title&search=&group=30"><p>중고장터</p></a>
	            <a href="postList?option=p_title&search=&group=60"><p>자유게시판</p></a>
		        </div>
		        <div class="col">
	            <h6>나의도서</h6>
	            <hr>
	            <a href="mypage_main?cust_no=${cust_no }"><p>나의도서정보</p></a>
	            <a href="borrowList"><p>대출현황</p></a>
				<a href="return_borrowList"><p>대출/반납이력</p></a>
	            <a href="MyPage_Folder?cust_no=${cust_no }&group=50"><p>내서재</p></a>
	            <a href="MyPage_Info?cust_no=${cust_no }"><p>개인정보수정</p></a>
						</div>
					</div>
				</div>
				
		  </div>
		</div>
	</section>
	</div>
  
	<!-- FOOTER -->
	<footer id="main-footer" class="p-5 noto-serif">
    <div class="container">
      <div class="row">
      	<div class="col-md-3 mb-3">
      		<p class="mb-1"><a href="howtoInfo">이용안내</a></p>
      		<p class="mb-1"><a href="postList?option=p_title&search=&group=10">공지사항</a></p>
      		<p class="mb-1"><a href="faqViewpage">자주묻는질문</a></p>
      		<p class="mb-1"><a href="QnaList">묻고답하기</a></p>
      	</div>
      	<div class="col-md-3 mb-3">
      		<p class="mb-1"><a href="postList?option=p_title&search=&group=20">창작물게시판</a></p>
      		<p class="mb-1"><a href="postList?option=p_title&search=&group=30">중고장터</a></p>
      		<p class="mb-1"><a href="postList?option=p_title&search=&group=60">자유게시판</a></p>
      		<p class="mb-1"><a href="http://localhost:8088/MyPage_Folder?cust_no=${cust_no }&group=50">내서재</a></p>
      	</div>
        <div class="col-md-6">
        	<table class="footer-table">
        		<tbody>
        			<tr>
        				<th>Delibrary</th>
        				<td>서울 마포구 백범로 23 구프라자 3층</td>
        			</tr>
        			<tr>
        				<th>고객센터</th>
        				<td>070-1234-5678</td>
        			</tr>
        			<tr>
        				<th>이용시간</th>
        				<td>평일 9:00 - 18:00, 점심시간 12:00 - 13:30 &nbsp;<small>( 주말/공휴일 휴무 )</small></td>
        			</tr>
        			<tr>
        				<th>팩스번호</th>
        				<td>0504-123-1234</td>
        			</tr>
        			<tr>
        				<th>이메일</th>
        				<td>delibrary@book.com</td>
        			</tr>
        		</tbody>
        	</table>
			<br>
			<br>
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
        </div>
      </div>
    </div>
  </footer>
  <script type="text/javascript">
	  //Get the current year for the copyright
	  $('#year').text(new Date().getFullYear());
  </script>
</body>
</html>
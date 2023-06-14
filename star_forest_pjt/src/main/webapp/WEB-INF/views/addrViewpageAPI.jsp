<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
  <link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
	<!-- 구글폰트 전체 기본적용 END -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/faq.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <title>도서관소개 - 별숲도서관</title>
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
	
	<!-- 도서관소개 PAGE HEADER -->
		<header id="page-header" class="noto-serif">
			<div class="page-header-overlay">
				<div class="container pt-5">
				  <div class="row">
					<div class="col-md-6 m-auto text-center">
					  <h2>오시는길</h2>
					</div>
				  </div>
				</div>
			</div>
		</header>
	
	<!-- MAIN SECTION -->
	<section id="contact" class="py-3">
		<!-- 사이드바 -->
		<div class="container">
		  <div class="row">
			<div class="col-md-3">
					  <div class="sidebar noto-serif">
							<div class="side-head">
								<h4 class="text-light text-center" style="color:black !important; font-weight: 900 !important">도서관소개</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
								<li class="list-group-item"><a href="howtoInfo">대출/반납</a></li>
								<li class="list-group-item"><a href="notice_list">공지사항</a></li>
								<li class="list-group-item"><a href="faqViewpage">자주묻는질문</a></li>						
								<li class="list-group-item active"><a href="addrViewpageAPI">오시는길</a></li>
							</ul>
					  </div>
					</div>

			<!-- 메인내용 -->
			<div class="col-md-9">
				<div class="p-4">
				<section id="main_section">      
				<div class="addr">	
				
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.7937003135344!2d126.90864681542784!3d37.55992397979906!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c99209ebc1031%3A0x49428de79f4b10b4!2z67OE7Iiy!5e0!3m2!1sko!2skr!4v1665714375991!5m2!1sko!2skr" 
						width="600" height="450" style="border:0;" allowfullscreen="" 
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				
						<div id="text" align="center">	 
							<table id="info-table">
	        		<tbody><br>
	        			<tr>
	        				<th>별숲도서관</th>
	        				<td>서울특별시 마포구 성산1동 32-4</td>
	        			</tr>
	        			<tr>
	        				<th>고객센터</th>
	        				<td>070-1588-8888</td>
	        			</tr>
	        			<tr>
	        				<th>이용시간</th>
	        				<td> &nbsp 평일 9:00 - 18:00, 점심시간 12:00 - 13:30</td>
	        			</tr>
	        			<tr>
	        				<th>팩스번호</th>
	        				<td>0504-123-1234</td>
	        			</tr>
	        			<tr>
	        				<th>이메일</th>
	        				<td>star_forest@library.com</td>
	        			</tr>
	        		</tbody>
	        	</table>
						</div>
			    </div> 
				</section>
			 </div>	
			</div>
		  </div>
		</div>
	</section>
</div>
  

	<!-- FOOTER -->
   <!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->


  <script>
		// Get the current year for the copyright
		$('#year').text(new Date().getFullYear());
	
		window.onload=function(){
			//푸터 명언
			const footer_display = document.getElementById('footer-display');
			const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
			const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
			footer_display.textContent =footer_quotes[footer_getQuote];
		}
	</script>
 </body>
</html>
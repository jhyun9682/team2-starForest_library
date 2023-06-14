<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>별숲도서관 - 대출/반납</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/faq.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>


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
	
		<!-- PAGE HEADER -->
		<header id="page-header" class="noto-serif">
			<div class="page-header-overlay">
				<div class="container pt-5">
				  <div class="row">
					<div class="col-md-6 m-auto text-center">
					  <h2>대출/반납</h2>
					</div>
				  </div>
				</div>
			</div>
		</header>
	
	
	<section id="contact" class="py-3 noto-serif">
			<div class="container">
			  <div class="row">
					<!-- 사이드바 -->
					<div class="col-md-3">
					  <div class="sidebar noto-serif">
							<div class="side-head">
								<h4 class="text-light text-center" style="color:black !important; font-weight: 900 !important">도서관소개</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
								<li class="list-group-item active"><a href="howtoInfo">대출/반납</a></li>
								<li class="list-group-item"><a href="notice_list">공지사항</a></li>
								<li class="list-group-item"><a href="faqViewpage">자주묻는질문</a></li>						
								<li class="list-group-item"><a href="addrViewpageAPI">오시는길</a></li>
							</ul>
					  </div>
					</div>

				<div class="col-md-9">		   
        <div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs card-header-tabs" id="info-list" role="tablist">
							<li class="nav-item">
								<a class="nav-link active siteMapAnchor" href="#borrow" href="#description" role="tab" aria-controls="borrow" aria-selected="true">대출안내</a>
							</li>
							<li class="nav-item">
								<a class="nav-link siteMapAnchor" href="#return" role="tab" aria-controls="return" aria-selected="false">반납안내</a>
							</li>
						</ul>
					</div>
					<div class="card-body">
						<div class="tab-content mt-3">
							<div class="tab-pane active" id="borrow" role="tabpanel">	
								<div class="pb-4">
									<h5 class="card-title">대출권수</h5>
									<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;1인 3권까지</p>
									<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;대출도서에 포함된 부록은 권수에 포함 안됨</p>
								</div>	
								<div class="pb-4">
									<h5 class="card-title">대출기간</h5>
									<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;대출일로부터 7일까지</p>
									<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;연체시 연체된 날짜만큼 대출 제한[나의도서에서 확인가능] </p>
								</div>
								<div class="pb-4">
									<h5 class="card-title">재대출</h5>
									<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;대출도서 반납 승인 후 재대출 가능</p>
									<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;본인이 연체자인 경우에는 연장이나 재대출 제한</p>
								</div>	
							</div>

							<div class="tab-pane" id="return" role="tabpanel" aria-labelledby="return-tab">  
								<h5 class="card-title">도서반납</h5> 
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;반납신청</p>
								<p class="card-text howtoText pl-4">별숲 도서관의 직접 방문을 통해 반납을 해주시기 바랍니다.</p>	
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;반납처리</p>
								<p class="card-text howtoText  pl-4">담당자가 반납도서를 확인 후 반납을 승인할 때까지 기다려주시기 바랍니다.[최대 3일소요]</p>
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;반납완료</p>
								<p class="card-text howtoText pl-4">담당자의 승인으로 반납이 완료될 경우 회원의 대출수량이 정상처리됩니다.</p>
							</div>


</div>
</div>
</div>
</div>	

	<script>

		$('#info-list a').on('click', function (e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>	
	</div>
	</div>
		</section>
	</div>
	<!-- MAIN SECTION -->
    
	
	
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
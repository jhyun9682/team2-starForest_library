<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>별숲도서관</title>

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
   integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
   crossorigin="anonymous">
   <link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap"
   rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->

<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
   integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
   crossorigin="anonymous"></script>

<!-- 외부 CSS, JS 파일 링크 -->
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/HomeCSS.css">
<script type="text/javascript" src="./js/HomeJS.js"></script>


<!-- 관리자 페이지 script, css -->
<script type="text/javascript">

$(function(){
    
      $(document).on('click','#phone_a',function(e){
    	  Swal.fire({
			  title: '',
			  html: "<br>고객센터 : 070) 1588-8888 <br>"
	               + "이용시간 : 평일 9:00 - 18:00,<br> &nbsp&nbsp점심시간 12:00 - 13:30 (주말/공휴일 휴무) <br>"   
	               + "팩스번호 : 0504-123-1234 <br>",
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인'
			}).then((result) => {
			  if (result.isConfirmed) {
			  
			    
			  }
			})
      });
});

$(function keywordCheck() {
	var str_keyword = window.searchform.keyword.value;
	if (!str_keyword || str_keyword === "") {
		Swal.fire({
			  title: '',
			  text: '검색어를 입력하세요.',
			  icon: 'warning',
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인'
			}).then((result) => {
			  if (result.isConfirmed) {
		window.searchform.keyword.focus();
			  
			  }
			})
		return false;
	}
	window.searchform.submit();
});
$(function() {
	var $type=$("type");
	var $keyword=$("keyword");
})

function formSubmit(){
	if($("#select").val() == "none"){
		frm.type.focus();
		return false;
	}else if($("#input").val() == "none"){
		frm.keyword.focus();
		return false;
	}else{
		return true;
	}
	location.href="SearchResult";
}


/* 검색 *
$(function() {
	$('#search').click(function() {
		location.href = "http://localhost/star_forest_pjt/SearchResult?query="+$("#keyword").val();
	})
	});*/

</script>
<style type="text/css">
.main_card img{
height:210px;
width:150px;"
}
</style>

</head>
<body>
   <!-- navigation start-->
         <div id="navigation">
            <!-- include_common_left.jsp start-->
            <jsp:include page="common/include_common_top_menu_templateVer.jsp" />
            <!-- include_common_left.jsp end-->
         </div>
         <!-- navigation end-->

   <!-- HOME HEADING SECTION -->
   <section id="home-heading" class="p-4 noto-serif">
      <div class="dark-overlay">
         <div class="row">
            <div class="col">
               <div class="container">
                  <div>
                     <h1 id="home-display"></h1>
                  </div>
               </div>
               <div class="container">
               <form  action="SearchResult" method="get">
                  <div class="input-group mb-3" id="home-searchbar">
                  <select data-trigger="" name="type" id="type" required>
										<option value="" selected disabled>선택하세요</option>
										<option value="book_title">제목</option>
										<option value="book_author">저자</option>
										<option value="book_publisher">출판사</option>
										<option value="category_name">분야명</option>
									</select>
                     <input class="form-control searchbar" id="keyword" name="keyword" type="text" placeholder="검색어를 입력하세요." required>
                     <div class="input-group-append">
                        <button class="btn btn-outline-light btn-lg px-5" 
                           type="submit" onclick="formSubmit();">
                           &nbsp;&nbsp;&nbsp;<b>도서 검색</b> &nbsp;&nbsp;&nbsp;
                        </button>
                     </div>
                  </div>
                  </form>
               </div>
            </div>
         </div>
         <p id="heroDesc">Admont Abbey Library, Admont, Austria</p>
         <p id="heroDescKor">아드몬트 수도원 도서관, 아드몬트, 오스트리아</p>
      </div>

   </section>

   <!-- SHOWCASE SLIDER   -->
   <div class="container pt-5">
      <div class="row">
         <c:if test="${empty sUserId}">
         <div class="col-md-6">
            <div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example">
               <div class="hr-green mb-4">
                  <h3 class="d-inline-block mb-3 noto-serif">추천 도서</h3><!--Controls-->
                  <div class="controls-bottom pull-right">
                     <a class="btn btn-outline-success prev" data-slide="prev" href="#multi-item-example"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-success next" data-slide="next" href="#multi-item-example"><i class="fa fa-chevron-right"></i></a>
                  </div><!--/.Controls-->
               </div>
               <!--Slides-->
               <div class="carousel-inner" role="listbox">
                  <!--First slide-->
                  <div class="carousel-item active">
                     <div class="row">
                        <c:forEach items="${favorite}" var="book" begin="0" end="2">
                           <div class="col-md-4 clearfix d-none d-md-block">
                              <div class="main_card"><a href="book_detail?book_no=${book.book_no}">
                                 <img src="${book.book_image_src}" class="img-fluid" alt="Card image cap"></a>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
                  <!--Second slide-->
                  <div class="carousel-item">
                     <div class="row">
                        <c:forEach items="${favorite}" var="book" begin="3" end="5">
                           <div class="col-md-4 clearfix d-none d-md-block">
                              <div class="main_card"><a href="book_detail?book_no=${book.book_no}">
                                 <img src="${book.book_image_src}" class="img-fluid" alt="Card image cap"></a>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div><!--/.Second slide-->
               </div><!--/.Slides-->
            </div><!--/.Carousel Wrapper-->
         </div>
      </c:if>
      <c:if test="${not empty sUserId}">
         <div class="col-md-6">
            <div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example">
               <div class="hr-green mb-4">
                  <h3 class="d-inline-block mb-3 noto-serif">${sUserId}님의 추천 도서</h3><!--Controls-->
                  <div class="controls-bottom pull-right">
                     <a class="btn btn-outline-success prev" data-slide="prev" href="#multi-item-example"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-success next" data-slide="next" href="#multi-item-example"><i class="fa fa-chevron-right"></i></a>
                  </div><!--/.Controls-->
               </div>
               <!--Slides-->
               <div class="carousel-inner" role="listbox">
                  <!--First slide-->
                  <div class="carousel-item active">
                     <div class="row">
                        <c:forEach items="${userBook}" var="book" begin="0" end="2">
                           <div class="col-md-4 clearfix d-none d-md-block">
                              <div class="main_card"><a href="book_detail?book_no=${book.book_no}">
                                 <img src="${book.book_image_src}" class="img-fluid" alt="Card image cap"></a>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
                  <!--Second slide-->
                  <div class="carousel-item">
                     <div class="row">
                        <c:forEach items="${userBook}" var="book" begin="3" end="5">
                           <div class="col-md-4 clearfix d-none d-md-block">
                              <div class="main_card"><a href="book_detail?book_no=${book.book_no}">
                                 <img src="${book.book_image_src}" class="img-fluid" alt="Card image cap"></a>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div><!--/.Second slide-->
               </div><!--/.Slides-->
            </div><!--/.Carousel Wrapper-->
         </div>
      </c:if>
         <div class="col-md-6">
            <!--Carousel Wrapper-->
            <div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example2">
               <div class="hr-green mb-4">
                  <h3 class="d-inline-block mb-3 noto-serif">이번달 신작 도서</h3><!--Controls-->
                  <div class="controls-bottom pull-right">
                     <a class="btn btn-outline-success prev" data-slide="prev" href="#multi-item-example2"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-success next" data-slide="next" href="#multi-item-example2"><i class="fa fa-chevron-right"></i></a>
                  </div><!--/.Controls-->
               </div>
               <!--Slides-->
               <div class="carousel-inner" role="listbox">
                  <!--First slide-->
                  <div class="carousel-item active">
                     <div class="row">
                        <c:forEach items="${newBook}" var="book" begin="6" end="8">
                           <div class="col-md-4 clearfix d-none d-md-block">
                              <div class="main_card"><a href="book_detail?book_no=${book.book_no}">
                                 <img src="${book.book_image_src}" class="img-fluid" alt="Card image cap"></a>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
                  <!--Second slide-->
                  <div class="carousel-item">
                     <div class="row">
                        <c:forEach items="${newBook}" var="book" begin="9" end="11">
                           <div class="col-md-4 clearfix d-none d-md-block">
                              <div class="main_card"><a href="book_detail?book_no=${book.book_no}">
                                 <img src="${book.book_image_src}" class="img-fluid" alt="Card image cap"></a>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
                  <!--/.Second slide-->
               </div>
               <!--/.Slides-->
            </div><!--/.Carousel Wrapper-->
         </div>
      </div>
   </div>

   <!-- TODAY, ADs -->
   <div class="container pb-5">
      <div class="row">
         <div class="col-md-4 mb-3">
            <!-- 오늘날짜 -->
            <div id="home-today" class="noto-serif">
               <p id="year-month" class="d-inline"></p>
               &nbsp;
               <p id="date" class="text-center p-0 m-0"></p>
            </div>
            <!-- 정기휴관일 -->
            <div id="home-holiday" class="text-center">
               <h6>정기휴관일</h6>
               <p id="holiday-fisrt" class="m-0 noto-serif"></p>
               <p id="holiday-last" class="m-0 noto-serif"></p>
            </div>
         </div>
         <div class="col-md-4 mb-3 noto-serif">
            <a href="addrViewpageAPI"><div class="home-tag mb-2">
                  <img class="pr-4 m-0" alt="찾아오시는 길" src="./img/home/map.png"
                     height="30px">찾아오시는 길
               </div></a>
               <div class="home-tag mb-2" id="phone_a" >
                  <img class="pr-4 m-0" alt="전화번호"
                     src="./img/home/telephone.png" height="30px">전화번호
               </div> 
               <a href="QnaList"><div class="home-tag mb-2">
                  <img class="pr-4 m-0" alt="묻고답하기" src="./img/home/question.png"
                     height="30px">묻고답하기
               </div></a> 
               <a href="faqViewpage"><div class="home-tag mb-0">
                  <img class="pr-4 m-0" alt="자주묻는질문" src="./img/home/faq.png"
                     height="30px">자주묻는질문
               </div></a>
         </div>
         <div class="col-md-4 mb-3">
            <!-- TESTIMONIALS -->
            <section id="showcase">
               <div id="myCarousel" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                     <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                     <li data-target="#myCarousel" data-slide-to="1"></li>
                     <li data-target="#myCarousel" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                     <div class="carousel-item carousel-image-1 active">
                        <div class="container">
                           <div class="carousel-caption d-none d-sm-block mb-5">
                              <p></p>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item carousel-image-2">
                        <div class="container">
                           <div class="carousel-caption d-none d-sm-block mb-5">
                              <p></p>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item carousel-image-3">
                        <div class="container">
                           <div class="carousel-caption mb-5">
                              <p></p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <a href="#myCarousel" data-slide="prev"
                     class="carousel-control-prev"> <span
                     class="carousel-control-prev-icon"></span>
                  </a> <a href="#myCarousel" data-slide="next"
                     class="carousel-control-next"> <span
                     class="carousel-control-next-icon"></span>
                  </a>
               </div>
            </section>
         </div>
      </div>
   </div>

   <!--HOME TABLES  -->
   <div class="home-gray">
      <section id="home-icons" class="py-5">
         <div class="container">
            <div class="row">
               <div class="col-md-4 mb-4 text-left">
                  <!-- HOVERABLE -->
                  <div class="home-table p-4">
                     <div class="hr-green">
                        <div class="row">
                           <div class="col noto-serif">
                              <h4>공지사항</h4>
                           </div>
                           <div class="text-right mr-4">
                              <a href="notice_list"><small
                                 class="text-muted">전체보기 &gt;</small></a>
                           </div>
                        </div>
                     </div>
                     <table class="table table-hover">
                        <tbody>
                           <c:forEach items="${HNlist}" var="notice" begin="0" end="4"
                              step="1">
                              <tr>
                                 <td class="home_post_title ellipsis"><a
                                    href="postDetail?p_id=${notice.p_id}&&group=10">${notice.p_title }</a></td>
                                 <td class="home_post_date"><fmt:formatDate
                                       value="${notice.p_regdate }" pattern="YYYY-MM-dd" /></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
               <div class="col-md-4 mb-4 text-left">
                  <!-- HOVERABLE -->
                  <div class="home-table p-4">
                     <div class="hr-green">
                        <div class="row">
                           <div class="col noto-serif">
                              <h4>독서동아리</h4>
                           </div>
                           <div class="text-right mr-4">
                              <a href="bookclub"><small
                                 class="text-muted">전체보기 &gt;</small></a>
                           </div>
                        </div>
                     </div>
                     <table class="table table-hover">
                        <tbody>
                           <c:forEach items="${clubList}" var="making" begin="0"
                              end="4" step="1">
                              <tr>
                                 <td class="home_post_title ellipsis"><a
                                    href="bookclub?club_no=${club.club_no}">${club.club_title}</a></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
               <div class="col-md-4 mb-4 text-left">
                  <!-- HOVERABLE -->
                  <div class="home-table p-4">
                     <div class="hr-green">
                        <div class="row">
                           <div class="col noto-serif">
                              <h4>열람실예약</h4>
                           </div>
                           <div class="text-right mr-4">
                              <a href="seatReservation"><small
                                 class="text-muted">전체보기 &gt;</small></a>
                           </div>
                        </div>
                     </div>
                     <table class="table table-hover">
                        <tbody>
                           <c:forEach items="${HMarketlist}" var="market" begin="0"
                              end="4" step="1">
                              <tr>
                                 <td class="home_post_title ellipsis"><a
                                    href="postDetail?p_id=${market.p_id}&&group=30">${market.p_title }</a></td>
                                 <td class="home_post_date"><fmt:formatDate
                                       value="${market.p_regdate }" pattern="YYYY-MM-dd" /></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>

  <!-- .footer-navigation -->
   <!-- footer start-->
   <div id="navigation">
      <!-- include_common_left.jsp start-->
      <jsp:include page="common/include_common_bottom_templateVer.jsp" />
      <!-- include_common_left.jsp end-->
   </div>
   <!-- footer end-->


   <script type="text/javascript">
   
      window.onload = function() {
         //홈헤딩 이미지
         const home_heading = document.getElementById('home-heading');
      
         const images = ['library1.png','library2.png','library3.png','library4.png','library5.png','library6.png','library7.png','library8.jpg'];
         const getImage = Math.floor(Math.random() * images.length);
         
         home_heading.style.background = "url('./img/" + images[getImage] + "')";
      
         //홈헤딩 명언
         const home_display = document.getElementById('home-display');
         const quotes = ['무슨 책 읽을래?', '한 시간 정도 독서하면 어떤 고통도 진정된다.', '책과 친구는 수가 적고 좋아야 한다. ', '약으로 병을 고치듯이 독서로 마음을 다스린다. ','친구를 고르는 것처럼 저자를 고르라.','네가 읽는 책들이 너를 말해준다.', '단 한 권의 책 밖에 읽은 적이 없는 사람을 경계하라.'];
         const getQuote = Math.floor(Math.random() * quotes.length);
         
         home_display.textContent = quotes[getQuote];
      
         //홈헤딩 장소
         const locEng  = ['Tianjin Binhai Library, Tianjin, China','George Peabody Library, Baltimore, USA', 
                        'Stuttgart City Library, Stuttgart, Germany', 'Trinity College Library, Dublin','Biblioteca Vasconcelos, Mexico City',
                        'Vennesla Library and Culture House, Norway', 'Starfield Library, Seoul, Korea', 'Admont Abbey Library, Admont, Austria' ];
         
         const locKor = ['텐진 빈하이 공공도서관, 텐진, 중국','조지 피바디 도서관, 볼티모어, 미국','슈트트가르트 도서관, 슈트트가르트, 독일',
                        '트리니티 컬리지 도서관, 더블린, 아일랜드','바스콘셀로스 도서관, 멕시코시티, 멕시코','베네슬라 도서관/문화의집, 베네슬라, 노르웨이',
                        '별마당 도서관, 서울, 대한민국','아드몬트 수도원 도서관, 아드몬트, 오스트리아'];
      
         const heroImageEng = document.getElementById('heroDesc');
         const heroDescKor = document.getElementById('heroDescKor');
         
         heroImageEng.textContent = locEng[getImage];
         heroDescKor.textContent = locKor[getImage];

      }   
      //오늘 날짜, 휴관일
      let today=new Date();
      const year1=today.getFullYear();
      const month=today.getMonth()+1;
      const date=today.getDate();

      document.getElementById('year-month').textContent=year1+"년 "+month+"월";
      document.getElementById('date').textContent=date+"일";

      const first=new Date(today.getFullYear(), today.getMonth(), 1);
      const last=new Date(today.getFullYear(), today.getMonth()+1,0);

      document.getElementById('holiday-fisrt').textContent=first.getFullYear()+"년 "+(first.getMonth()+1)+"월 "+first.getDate()+"일";
      document.getElementById('holiday-last').textContent=last.getFullYear()+"년 "+(last.getMonth()+1)+"월 "+last.getDate()+"일";
      
   </script>

</body>
</html>
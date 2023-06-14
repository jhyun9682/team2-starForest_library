<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
   <!-- 구글폰트 전체 기본적용 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
	<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
	<!-- 구글폰트 전체 기본적용 END -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/faq.css">
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <title>도서정보 - 별빛도서관</title>
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"   src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
<style type="text/css">
	.card-body.p-0 img{
	width:170px;
	height:220px;
	}
</style>
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
					  <h2>신착도서</h2>
					</div>
				  </div>
				</div>
			</div>
		</header>
   
  <!-- MAIN SECTION -->
   <section id="contact" class="py-3">
      <div class="container">
        <div class="row">
				  <!-- 사이드바 -->
         <div class="col-md-3 noto-serif mb-3">
           <div class="sidebar">
               <div class="side-head">
                  <h4 class="text-light" style="color:black !important; font-weight: 900 !important">신착도서</h4>
               </div>
               <ul class="list-group list-group-flush mb-5">
                  <li class="list-group-item"><a href="SearchResult2">도서검색</a></li>
                  <li class="list-group-item"><a href="SearchList">전체 도서</a></li>
                  <li class="list-group-item"><a href="recommendedBooks">사서추천도서</a></li>
                  <li class="list-group-item active"><a href="Newbooks">신착도서</a></li>                  
                  <li class="list-group-item"><a href="popularBook">이달의 인기도서</a></li>
               </ul>
           </div>
         </div>
         
         
         <!-- 메인내용 -->
         <div class="col-md-9">
            <div class="row">
            	<c:forEach items="${newBook}" var="book" begin="0" end="15">
					<div class="col-md-3">
						<div class="card mb-3">
							<div class="card-body p-0">
								<a href="book_detail?book_no=${book.book_no}"><img class="card-image-top img-fluid" width="100%" alt="${book.book_image}" src="${book.book_image_src}"></a>
								<div class="card-body">
									<div class="card-title">
										<div class="book-title" id="book-title">${book.book_title}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
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

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
   <script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"   src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

<title>도서정보 - 별숲도서관</title>

<script type="text/javascript"> 
</script>
<script type="text/javascript">

		
	$(document).on('click', '#btn_search', function(e) {

		const keyword=$('input').val();
		const type=$('type').val();
		
		if($("#type").val() == null){
			Swal.fire({
				  title: '',
				  text: '검색항목을 선택해주세요.',
				  icon: 'warning',
				  showCancelButton: false,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '확인'
				}).then((result) => {
				  if (result.isConfirmed) {
				  
				  }
				})
			return false;
		}
		if($("#keyword").val() == false){
			Swal.fire({
				  title: '',
				  text: '검색어를 입력해주세요.',
				  icon: 'warning',
				  showCancelButton: false,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '확인'
				}).then((result) => {
				  if (result.isConfirmed) {
				  
				  }
				})
			return false;
		}
		
		var param = 'keyword=' + $('input').val() + '&type='+ $('select').val();
		  
		console.log(param);
		$.ajax({
			url : 'getSearchList',
			method : 'GET',
			data : param,
			success : function(bookList) {
				console.log(bookList);
				var html='';
				for(var i=0;i < bookList.length;i++){
					var book = bookList[i];
					console.log(book.book_image_src);
					console.log(book.book_title);
					html+="<div class=\"col-md-3\"><div class=\"card mb-3\">";
					html+="					<div class=\"card-body p-0\">";
					html+="					<a href=\"book_detail?book_no="+book.book_no+"\">";
					html+="					<img class=\"card-image-top img-fluid\" width=\"100%\" alt=\""+book.book_image+"\" src=\""+book.book_image_src+"\">";
					html+="			</a>";
					html+="				<div class=\"card-body\">";
					html+="				<div class=\"card-title\">";
					html+="						<div class=\"book-title\" id=\"book-title\">"+book.book_title+"</div>";
					html+="			</div>";
					html+="				</div>";
					html+="			</div>";
					html+="		</div>";
					html+="	</div>";
					console.log(html);	
				}
				$('#searchBookList').html(html);
			}
		
		});
		
		$.ajax({
			url : 'getSearchList',
			method : 'GET',
			data : param,
			success : function(bookList) {
				if(bookList == ""){
					Swal.fire({
						  title: '',
						  text: '검색결과가 없습니다.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
							window.location.href = "SearchResult2";
						  
						  }
						})
				}
			}
			});
		
		e.preventDefault();
	});

</script>
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
							<h2>도서검색</h2>
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
								<h4 class="text-light" style="color:black !important; font-weight: 900 !important">도서검색</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
								<li class="list-group-item active"><a href="SearchResult2">도서검색</a></li>
								<li class="list-group-item"><a href="SearchList">전체 도서</a></li>
								<li class="list-group-item"><a href="recommendedBooks">사서추천도서</a></li>
								<li class="list-group-item"><a href="Newbooks">신착도서</a></li>
								<li class="list-group-item"><a href="popularBook">이달의 인기도서</a></li>
							</ul>
						</div>
					</div>
					<!--  -->
					<!-- 메인내용 -->
					<div class="col-md-9">
						<div class="row">
							<form name="f" action="getSearchList" onsubmit="return false;" >
								<div class="input-group noto-serif">
									<select data-trigger="" name="type" id="type" required>
										<option value="" selected disabled>선택하세요</option>
										<option value="book_title">제목</option>
										<option value="book_author">저자</option>
										<option value="book_publisher">출판사</option>
										<option value="category_name">분야명</option>
									</select>
									<input class="form-control searchbar" id="keyword" name="keyword" type="text" placeholder="검색어를 입력하세요." required>
									<div class="input-group-append">
										<button class="btn btn-outline-success btn-r" type="button" id="btn_search">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>도서검색</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</button>
									</div>
								</div>
							</form>
							<br> <br> <br>
							<!-- CARD COLUMNS -->
							<div class="paging"></div>
						</div>
						<div class="row" id="searchBookList">
							<!-- -------------------------------- 
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body p-0">
										<a href="book_detail?book_no=454">
											<img class="card-image-top img-fluid" width="100%" alt="남주의 첫날밤을 가져 버렸다 1.img" src="https://image.aladin.co.kr/product/30197/26/cover200/k912839296_1.jpg">
										</a>
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">남주의 첫날밤을 가져 버렸다 1</div>
												<h6 class="book_author">황도톨(원작),MSG(그림),티바(각색)</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						    -------------------------------- -->
						</div>
					</div>
				</div>
				</div>
		</section>
	</div>
	<!--  -->
	<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script>
		// Get the current year for the copyright
		$('#year').text(new Date().getFullYear());

		$('.slider').click({
			infinite : true,
			slideToShow : 1,
			slideToScroll : 1
		});
	</script>
</body>
</html>
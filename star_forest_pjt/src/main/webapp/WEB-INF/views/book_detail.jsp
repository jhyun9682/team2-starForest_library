<%@page import="com.itwill.domain.Book"%>
<%@page import="com.itwill.service.BookServiceImpl"%>
<%@page import="com.itwill.service.RentalService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<meta property="og:description" content="" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/book_detail.css">
<link rel="stylesheet" href="./css/yeji.css">
<link rel="stylesheet" href="css/faq.css">
<link rel="profile" href="https://gmpg.org/xfn/11" />
<title>도서정보 - 별숲도서관</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />

<!-- 템플릿 건들 X -->
<link rel='stylesheet' id='kulib-bootstrap-select-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap-select/css/bootstrap-select.min.css?ver=20190905'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-bootstrap-datetimepicker-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css?ver=20190927'
	type='text/css' media='all' />

<link rel='stylesheet' id='kulib-bootstrap-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap/css/bootstrap.css?ver=20190905'
	type='text/css' media='all' />
<!-- 템플릿 건들 X -->
<link rel='stylesheet' id='kulib-style-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/style.css?ver=20210913'
	type='text/css' media='all' />

<!-- <script type='text/javascript'
	src='https://library.korea.ac.kr/wp-includes/js/jquery/jquery.js?ver=1.12.4-wp'
	id='jquery-core-js'></script> -->
<script type='text/javascript'
	id='graphina-charts-for-elementor-public-js-extra'>
	
</script>

<style type="text/css">
.broken_link, a.broken_link {
	text-decoration: line-through;
}
d
.container.container-fluid
</style>
   <link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<link rel="icon"
	href="https://library.korea.ac.kr/wp-content/uploads/2020/02/cropped-favicon-3-192x192.png"
	sizes="192x192" />
<link rel="apple-touch-icon"
	href="https://library.korea.ac.kr/wp-content/uploads/2020/02/cropped-favicon-3-180x180.png" />
<meta name="msapplication-TileImage"
	content="https://library.korea.ac.kr/wp-content/uploads/2020/02/cropped-favicon-3-270x270.png" />
<!-- <script type='text/javascript'
	src='https://library.korea.ac.kr/wp-includes/js/wp-embed.min.js?ver=5.5.10'
	id='wp-embed-js'></script> -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- MODAL 필수 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<script type="text/javascript">
<!-- MODALMODAL -->
	$(function(){
		/***********로그인 세션확인**************/
		$.ajax({
			url : 'user_session_check',
			method : 'POST',
			dataType : 'json',
			success : function(jsonResult) {
				if (jsonResult.code == 1) {
					console.log(jsonResult);
				}else{ //세션 존재하지 않을경우 메세지창보여줌
					//alert('로그인이 필요한 페이지입니다:)');
					Swal.fire({
						  title: '로그인이 필요한 페이지입니다:)',
						  text: '',
						  icon: 'error',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
						  
						    
						  }
						})
				}
			}
		});
	
		$(document).on('show.bs.modal','#item-user-request',function(e){
			
			var menu=$(e.relatedTarget).attr('title');
			
			if(menu=="소장정보발송"){
				$.ajax({
					url:'rest_book_detail',
					data:'book_no='+$(e.target).attr("book_no"),
					type:'GET',
					success:function(book){
						
						
						var html1=
									`<body class="modal-page">
									 <div class="container">
										<div class="entry-content">
											<div class="content-d">
												<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 소장정보 인쇄 서비스</h4>
												<div class="content-l">
													<h5>소장정보</h5>
													<ul>
														<li>도서정보: ${book.book_title}</li>
														<li>저자사항: ${book.book_author}}</li>
														<li>출판정보: ${book.book_publisher}</li>						
														<li>I S B N : ${book.isbn}</li>
														<li>소장정보: 별숲도서관</li>
													</ul>
												</div>
											</div>
											<div class="content-d d-flex justify-content-center">
												<button type="button" class="btn btn-primary submit-request" >인쇄</button>
											</div>
										</div><!-- .entry-content -->
									</div><!-- .container -->
								</body>`;
						$(e.target).find('#modal-body-user-request').html(html1);
						
					}
				});
			}else if(menu=="간편대출신청"){
				$(e.target).find('#modal-body-user-request').html("");
				console.log($(e.target).attr('book_no'));
				$.ajax({
					url:'',
					data:null,
					type:'GET',
					success:function(result){
						
						var html1 = `<body class="modal-page">
							
							<div class="container">
								
								<div class="entry-content">

									
									<div class="content-d">
										<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 수령처</h4>
										<div class="content-l">
																
																<div>
												<label class="attr-value-label">
													<input type="radio" checked="checked" name="receive_location_code" class="purchase-type" > 별숲도서관 1층 데스크
												</label>
											</div>
															</div>
									</div>
									
									<div class="content-d d-flex justify-content-center">
										<button type="button" class="btn btn-primary submit-request" book_no="${book.book_no}">신청</button>
									</div>
									
									<div class="content-d">
										<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 간편대출 안내</h4>
										<div class="content-l">
											<ul>
												<li>간편대출 최대 신청 회수 : 3회</li>
												<li>신청된 간편대출 자료는 1일 2회(오전09:00, 오후2:00) 확인 후 통보하여 드립니다.</li>
												<li>오후 2:00 이후 신청된 자료는 익일 오전에 확인하여 통보됩니다.</li>
												<li>간편대출 서비스를 신청하였으나 대출이 불가한 자료의 경우는 별도로 안내해 드립니다.(*서가에 없거나 파손이 심한 경우 등)</li>
												<li>도착 통보 후 3일 이내 반드시 자료를 수령하셔야 합니다. (자료 미수령시 1개월간 간편대출서비스 이용 불가)</li>
											</ul>
										</div>
									</div>
									
								</div><!-- .entry-content -->
								
							</div><!-- .container -->



						</body>`
						$(e.target).find('#modal-body-user-request').html(html1);
						$(document).on('click','.btn.btn-primary.submit-request', function(e){
										$.ajax({
											url:'rest_rental',
											dataType :'json',
											data:'book_no='+$(e.target).attr("book_no"),
											method:'POST',
											success: function (jsonResult) {
												if(jsonResult.code==1){
									            //alert("대여신청이 완료되었습니다.");
									            //console.log(jsonResult.code);
									            Swal.fire({
															  title: '',
															  text: '대여신청이 완료되었습니다.',
															  icon: 'success',
															  showCancelButton: false,
															  confirmButtonColor: '#3085d6',
															  cancelButtonColor: '#d33',
															  confirmButtonText: '확인'
															}).then((result) => {
															  if (result.isConfirmed) {
																  
														            location.href='book_detail?book_no='+$(e.target).attr("book_no");
															    
															  }
															})
												} else if(jsonResult.code==0){
									        	//alert("이미 대여한 도서입니다.");
									        	Swal.fire({
														  title: '',
														  text: '이미 대여한 도서입니다.',
														  icon: 'error',
														  showCancelButton: false,
														  confirmButtonColor: '#3085d6',
														  cancelButtonColor: '#d33',
														  confirmButtonText: '확인'
														}).then((result) => {
														  if (result.isConfirmed) {
														  
													        	location.reload();
														    
														  }
														})
												} else if(jsonResult.code==-1){
													//alert(jsonResult.msg);
													Swal.fire({
														  title: '',
														  text: jsonResult.msg,
														  icon: 'error',
														  showCancelButton: false,
														  confirmButtonColor: '#3085d6',
														  cancelButtonColor: '#d33',
														  confirmButtonText: '확인'
														}).then((result) => {
														  if (result.isConfirmed) {
														  
														    
														  }
														})
												}else if(jsonResult.code==3){
													//alert(jsonResult.msg);
													Swal.fire({
														  title: '',
														  text: jsonResult.msg,
														  icon: 'error',
														  showCancelButton: false,
														  confirmButtonColor: '#3085d6',
														  cancelButtonColor: '#d33',
														  confirmButtonText: '확인'
														}).then((result) => {
														  if (result.isConfirmed) {
														  
													        	location.reload();
														    
														  }
														})
													//location.reload();	
												}
									        }
										}) 
										});
											
										
									}
								});
								
							
			}else if(menu=='도서예약신청'){
				$(e.target).find('#modal-body-user-request').html("");
				$.ajax({
					url:'',
					data:null,
					type:'GET',
					success:function(result){
						
						var html1 = 
							`<body class="modal-page">
								
								<div class="container">

									<div class="entry-content">

										
										<div class="content-d">
											<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 도서예약 안내</h4>
											<div class="content-l">
												<ol>
													<li>
														<div>예약자료 도착 알림 : 개인공지 </div>
													</li><li>
														<div>예약 정보 확인 및 취소 : &lt;나의공간 - 대출/예약 현황&gt; 메뉴</div>
														<div>단, <font color="red">도착통보 후에는 직접 취소가 불가</font>하오니 1:1 문의 게시판 또는 전화로 취소 요청하시기 바랍니다.</div>
													</li>
												</ol>
											</div>
										</div>
										<div class="content-d d-flex justify-content-center">
											<button type="button" class="btn btn-primary submit-request" book_no="${book.book_no}">신청</button>
										</div>

										
									</div><!-- .entry-content -->

								</div><!-- .container -->



							</body>`;
						$(e.target).find('#modal-body-user-request').html(html1);
						$(document).on('click','.btn.btn-primary.submit-request', function(event){
							console.log($(event.target).attr('book_no'));
							$.ajax({
							url:'reservation',
							dataType :'json',
							data:'book_no='+$(e.target).attr("book_no"),
							method:'POST',
							success:function(jsonResult){
								if(jsonResult.code==1){
						           // alert("예약이 완료되었습니다.");
						        		console.log(jsonResult.code);
						        		Swal.fire({
											  title: '',
											  text: '예약이 완료되었습니다.',
											  icon: 'success',
											  showCancelButton: false,
											  confirmButtonColor: '#3085d6',
											  cancelButtonColor: '#d33',
											  confirmButtonText: '확인'
											}).then((result) => {
											  if (result.isConfirmed) {
											  
									            location.href='book_detail?book_no='+$(e.target).attr("book_no");
										        	
											    
											  }
											})
						        	}else if(jsonResult.code==0){
						            //alert("이미 예약한 도서입니다.");
						        		Swal.fire({
													  title: '',
													  text: '이미 예약한 도서입니다.',
													  icon: 'error',
													  showCancelButton: false,
													  confirmButtonColor: '#3085d6',
													  cancelButtonColor: '#d33',
													  confirmButtonText: '확인'
													}).then((result) => {
													  if (result.isConfirmed) {
													  
													    
													  }
													})
						        	}else if(jsonResult.code==2){
						        		//alert(jsonResult.msg);
						        		Swal.fire({
													  title: '',
													  text: jsonResult.msg,
													  icon: 'error',
													  showCancelButton: false,
													  confirmButtonColor: '#3085d6',
													  cancelButtonColor: '#d33',
													  confirmButtonText: '확인'
													}).then((result) => {
													  if (result.isConfirmed) {
													  
													    
													  }
													})
						        	}
							} ,
							error:function(jqXHR, textStatus, errorThrown ) {
								

								alert( jqXHR.status );

								alert( jqXHR.statusText );

								alert( jqXHR.responseText );

								alert( jqXHR.readyState );

								},
							fail : function() {
								Swal.fire({
									  title: '',
									  text: '인터넷 연결상태를 확인해주세요.',
									  icon: 'error',
									  showCancelButton: false,
									  confirmButtonColor: '#3085d6',
									  cancelButtonColor: '#d33',
									  confirmButtonText: '확인'
									}).then((result) => {
									  if (result.isConfirmed) {
							            $('.wrap-loading').addClass('display-none');
									  
									    
									  }
									})
					        }
						}) 
						});
							
						
					}
				});
				
			}
		});
		
		/**********favorite_insert***********/
		$(document).on('click','#insert_favorite',function(e){
			var param='book_no='+$(e.target).attr('book_no');
			console.log(param);
			$.ajax({
				url:'favorite_insert',
				method:'POST',
				data:param,
				success:function(jsonResult){
					if(jsonResult.code==1){
						//alert(jsonResult.msg);
						Swal.fire({
						  title: '',
						  text: jsonResult.msg,
						  icon: 'success',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
						  
						location.reload();
						    
						  }
						})
					}else if(jsonResult.code==-1){
						//alert(jsonResult.msg);
						Swal.fire({
						  title: '',
						  text: jsonResult.msg,
						  icon: 'error',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
						  
						    
						  }
						})
					}else if(jsonResult.code==3){

						//alert(jsonResult.msg);
						Swal.fire({
						  title: '',
						  text: jsonResult.msg,
						  icon: 'error',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
						  
						    
						  }
						})
					}
				}
			});
		});
		
		
	});

	

</script>

</head>


<body>
	<!-- Modal -->

	<div class="modal fade" id="item-user-request" tabindex="-1"
		book_no="${book.book_no}" role="dialog"
		aria-labelledby="item-user-request-title" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="item-user-request-title">별숲도서관</h5>
					<button type="button" class="close reset-iframe-content"
						data-dismiss="modal" aria-label="닫기">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body item-overview-info-block-body active"
					id="modal-body-user-request"></div>
				<div class="modal-footer">
					<button type="button"
						class="btn btn-secondary reset-iframe-content"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<header>

		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
	</header>

	<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h2>책 상세보기</h2>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- #masthead -->

	<div id="content" class="site-content">

		<div id="primary" class="content-area">
			<main id="main" class="site-main">

				<article id="post-2053"
					class="post-2053 page type-page status-publish hentry entry">

					<header class="entry-header">

						<div class="entry-header-bar">

							<div class="entry-nav">
								<!-- Breadcrumb NavXT 6.5.0 -->
								<span property="itemListElement" typeof="ListItem"><a
									property="item" typeof="WebPage" title="Go to 별숲 도서관."
									href="http://localhost/star_forest_pjt/Home" class="home"><span
										property="name">HOME</span></a>
									<meta property="position" content="1"></span> &gt; <span
									class="post post-page current-item">상세정보</span>
							</div>
							<!-- .entry-nav -->

						</div>
						<!-- .entry-header-bar -->
					</header>

					<script>
				

							
					</script>

					<div class="container">

						<div class="item-detail row">

							<div class="item-cover col-lg-2">

								<div>
									<img class="multi-cover" style="display: none;"
										src="${book.book_image_src }" alt="${book.book_image }" />
								</div>
								<script>
									
									/*쓰고싶지만 못쓰겠구나 미리보기*/
								</script>

								<div class="item-cover-slider">
									<a id="preview-link" style="display: none;"
										href="https://www.aladin.co.kr/shop/book/wletslookViewer.aspx?ISBN=9788954699914"
										target="_blank" class="btn btn-lightgrey">미리보기&nbsp;<svg
											class="svg-icon" width="19" height="19" aria-hidden="true"
											role="img" focusable="false"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M0 0h24v24H0z" fill="none"></path>
														<path
												d="M15.357,4.288c-3.051-3.051-8.017-3.051-11.068,0c-3.052,3.052-3.052,8.016,0,11.069c2.716,2.716,6.949,3.008,9.997,0.885 c0.065,0.306,0.212,0.594,0.448,0.83l4.443,4.441c0.646,0.648,1.693,0.648,2.338,0c0.646-0.646,0.646-1.69,0-2.335l-4.444-4.445 c-0.235-0.234-0.523-0.382-0.826-0.446C18.367,11.237,18.074,7.006,15.357,4.288z M13.954,13.954c-2.279,2.277-5.986,2.277-8.263,0 c-2.276-2.278-2.276-5.984,0-8.263c2.276-2.277,5.984-2.277,8.263,0C16.231,7.97,16.231,11.676,13.954,13.954z"></path></svg></a>
								</div>
								<script>
									jQuery(function($) {
										$(document).ready(function() {
											$(".multi-cover").show();
										});
									});
								</script>

							</div>

							<div class="item-data col-lg-10">

								<div class="item-row d-lg-flex justify-content-between mb-3"
									style="height: 50px;">
									<div class="item-title">
										<h2>${book.book_title }
											<span class="item-meta-value"> (<span class="number">${book.book_rental_cnt }</span>회
												대출)
											</span>
										</h2>
									</div>

									<div
										class="item-functions flex-shrink-0 d-flex justify-content-center justify-content-lg-end">


										<span id="insert_favorite" class="item-modal"
											data-toggle="modal" data-target="#directory-select">
											<button id="btn_club_join" class="w-f-btn w-btn-favorite"
												book_no="${book.book_no }" type="button">
												<img book_no="${book.book_no }" src="./img/favorite.png"
													alt="">내서재
											</button>

										</span>
									</div>
									<!-- .item-functions -->
								</div>

								<div class="item-meta">

									<div class="d-lg-flex">
										<div class="item-meta-key">자료유형</div>
										<div class="item-meta-value">단행본</div>
									</div>

									<div class="d-lg-flex">
										<div class="item-meta-key">개인저자</div>
										<div class="item-meta-value">
											<span> <!-- <a href="/datause/advanced-search/advanced-search-form/advanced-search-result/?verb=detail&target=catalog&st=FRNT&fi1=2&q1=%EA%B9%80%ED%9B%88%2C++%E9%87%91%E8%96%B0%2C++1948-&lmt0[]=TOTAL"> -->
												${book.book_author } <!-- </a> -->
											</span>
										</div>
									</div>


									<div class="d-lg-flex">
										<div class="item-meta-key">서명 / 저자사항</div>
										<div class="item-meta-value">${book.book_title}:
											${book.book_author }</div>
									</div>



									<div class="d-lg-flex">
										<div class="item-meta-key">발행사항</div>
										<div class="item-meta-value">${book.book_publisher },
											&nbsp; ${book.book_publish_date } &nbsp;</div>
									</div>

									<div class="d-lg-flex">
										<div class="item-meta-key">형태사항</div>
										<div class="item-meta-value">${book.book_page }p</div>
									</div>

									<!-- Notes: 아래와 같이 2021.04.05 수정 당시 본 line으로 주석처리 상태이였음.
																																																																																																																																-->
									<div class="d-lg-flex">
										<div class="item-meta-key">ISBN</div>
										<div class="item-meta-value">
											<!-- 2019.10.25 주석후 아래로 보완 - 9788954699914 -->
											<span>${book.isbn } </span>
										</div>
									</div>


								</div>

							</div>
							<!-- .item-data -->

						</div>
						<!-- .item-detail -->

						<hr class="d-none d-lg-block" />

						<div id="er_finder-result"></div>
						<script>
							
						</script>



						<div class="item-location item-additional-info">

							<div
								class="item-location-header d-md-flex justify-content-start align-items-center mb-3">

								<h3>소장정보</h3>


							</div>
							<!-- .item-location-header -->
							<script>
								
							</script>

							<div class="item-location-content tab-content">
								<div class="tab-pane fade show active" id="locs-1"
									role="tabpanel" aria-labelledby="locs-1-tab">
									<div class="table-container table-locations">
										<table class="table table-sm table-hover text-center">
											<thead>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">소장처</th>
													<th scope="col">ISBN</th>
													<th scope="col">대출가능권수</th>
													<th scope="col">도서상태</th>
													<th scope="col">반납예정일</th>
													<th scope="col">예약</th>
													<th scope="col">서비스</th>
												</tr>
											</thead>
											<tbody>

												<tr>
													<td><span class="th-item">No.</span> 1</td>
													<td><span class="th-item">소장처</span> 별숲도서관</td>
													<td><span class="th-item">ISBN</span> ${book.isbn }</td>
													<td><span class="th-item">대출가능권수</span>
														${book.book_qty}/1</td>
													<td><span class="th-item">도서상태</span> ${rental_status}</td>
													<td><span class="th-item">반납예정일</span>
														${rental_duedate.substring(0,10)}</td>
													<td><span class="th-item">예약</span> ${res_status}
														${reservation1}<!-- <span
														class="item-modal"> <a data-toggle="modal"
															data-target="#item-user-request" class="item-loc-service"
															title="도서예약신청" href=""> <span class="char-icon">R</span>
														</a> --> </span></td>
													</td>
													<!-- 2020.03.08 서비스 아이콘 셀 왼쪽 정렬 -->
													<td><span class="th-item">서비스</span>${rentalPos } <!-- <span
														class="item-modal"> <a data-toggle="modal"
															data-target="#item-user-request" class="item-loc-service"
															title="간편대출신청" href=""><span
																class="char-icon char-icon-magenta">B</span></a> --> </span> <span
														class="item-modal"> <a class="item-loc-service"
															data-toggle="modal" data-target="#item-user-request"
															title="소장정보발송" href=""> <span
																class="char-icon char-icon-blue">M</span>
														</a>
													</span></td>
													<!-- 모달 테스트 -->
													<!-- <td>
													<a href="/WEB-INF/views/rentalModal.jsp" class="nav-link" 
																data-toggle="modal" data-target="#theModal">Modal</a>
													</td> -->
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .table-container.table-locations -->
								</div>
								<!-- .tab-pane -->


							</div>
							<!-- .item-location-content -->

							<!-- R=도서예약, B=간편대출, M=소장정보 -->
							<div class="item-location-footer">
								<div class="item-services text-right">
									<span><span class="char-icon char-icon">R</span> 도서예약</span> <span><span
										class="char-icon char-icon-magenta" id="user_rental_btn">B</span>
										간편대출</span> <span><span class="char-icon char-icon-blue">M</span>
										소장정보</span>
								</div>
							</div>
							<!-- .item-location-footer -->

						</div>
						<!-- .item-location.item-additional-info -->

						<div class="item-additional-info item-overview-info">

							<h3 class="mb-3">컨텐츠정보</h3>
							<!-- <h3 class="mb-3">도서 개요</h3> -->

							<div class="item-overview-info-block mb-5">
								<!-- 책소개 -->
								<h4>책소개</h4>
								<div class="item-overview-info-block-body">
									<div class="inner-area">
										<p>${book.book_summary }</p>
										<br /> <span>정보제공 : <a
											href="http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=298570092&partner=openAPI&start=api"
											target="_blank"><img src="img/aladin.png" alt="Aladin"></a></span>
									</div>
									<!-- .inner-area -->
								</div>

							</div>
						</div>




		</div>
		<!-- .container -->
		<!-- .item-detail-content -->

	</div>
	<!-- .entry-content -->
	</article>
	<!-- #post-2053 -->


	</main>
	<!-- #main -->
	</div>
	<!-- #primary -->


	</div>
	<!-- #content -->

	<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->

	</div>
	<!-- #page -->


</body>
</html>

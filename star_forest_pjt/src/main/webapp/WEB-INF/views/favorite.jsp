<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<title>나의도서 - 별숲도서관</title>
<style>
.img-fluid {
	height: 250px;
	width: 244px;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="./js/FavoriteHtmlContents.js"></script>
<script type="text/javascript" src="./js/MyLibraryHtmlContents.js"></script>
<script type="text/javascript">
$(function(){
	

	/************로딩시세션체크*********/
	$.ajax({
		url : 'user_session_check',
		method : 'POST',
		dataType : 'json',
		success : function(jsonResult) {
			if (jsonResult.code == 1) {
				console.log(jsonResult);
			}else{ //세션 존재하지 않을경우 메세지창보여줌
				alert('로그인이 필요한 페이지입니다:)');
			}
		}
	});

	/*********************favorite(내서재)**********************/

	/*-------내서재 등록-------[bookDetail쪽으로 옮기기]*/
	
	
	/*-------내서재목록---------*/
	$.ajax({
			url:'favorite_list',
			method:'POST',
			success:function(jsonResult){
				var favoriteArray=jsonResult.data;
				$('#content').html(FavoriteHtmlContents.favorite_list_content(favoriteArray));
			}
		});
	$(document).on('click','#user_favorite',function(e){
		$.ajax({
			url:'favorite_list',
			method:'POST',
			success:function(jsonResult){
				var favoriteArray=jsonResult.data;
				$('#content').html(FavoriteHtmlContents.favorite_list_content(favoriteArray));
			}
		});
		e.preventDefault();
	});
	
	/*-------내서재전체삭제---------*/
	${document}.on('click','#btn_all_delete',function(e){
		$.ajax({
			url:'favorite_remove',
			method:'POST',
			success:function(jsonResult){
				if(jsonResult.code==1){
					$('#content').html(FavoriteHtmlContents.favorite_list_content(favoriteArray));
					//alert(jsonResult.msg);
					Swal.fire({
		                       title: jsonResult.msg,  
		                       text: '',
		                       icon: 'success',
		                       showCancelButton: false,
		                       confirmButtonColor: '#3085d6',
		                       cancelButtonColor: '#d33',
		                       confirmButtonText: '확인'
		                     }).then((result) => {
		                       if (result.isConfirmed) {
		                       }
		                     })
				}else{
					//alert(jsonResult.msg);
					Swal.fire({
		                       title: jsonResult.msg,  
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
		e.preventDefault();
	});
	
	
	/*-------내서재개별삭제---------*/
	${document}.on('click','#btn_delete',function(e){
		$.ajax({
			url:'favorite_delete_by_no',
			method:'POST',
			success:function(jsonResult){
				if(jsonResult.code==1){
					$('#content').html(FavoriteHtmlContents.favorite_list_content(favoriteArray));
					//alert(jsonResult.msg);
					Swal.fire({
		                       title: jsonResult.msg,  
		                       text: '',
		                       icon: 'success',
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
		                       title: jsonResult.msg,  
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
		e.preventDefault();
	});
	
});	
	
</script>

</head>

<body>
	<!-- navigation start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- navigation end-->

	<!-- PAGE HEADER -->
	<header id="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-6 m-auto text-center">
					<h1>나의도서</h1>
				</div>
			</div>
		</div>
	</header>

	<!-- MAIN SECTION -->
	<!-- 사이드바 -->
	<section id="contact" class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-3 noto-serif">
					<div class="sidebar">
						<div class="side-head">
							<h4 class="text-light">나의도서</h4>
						</div>
						<ul class="list-group list-group-flush mb-5">
							<li class="list-group-item">
								<a href="mypage" id="mypage">마이페이지</a>
							</li>
							<li class="list-group-item">
								<a href="userbook_status" id="userbook_status">나의도서정보</a></li>
							<li class="list-group-item">
								<a href="user_club_list" id="user_club_list">동아리신청내역</a></li>
							<li class="list-group-item">
								<a href="user_request_list" id="user_request_list">희망도서신청내역</a></li>
							<li class="list-group-item active">
								<a href="favorite" id="favorite">내서재</a></li>
							<li class="list-group-item">
								<a href="user_qr" id="user_qr">나의QR</a></li>

					</ul>

					</div>
				</div>

				<!-- 메인내용 -->
				<div class="col-md-9">
					<div class="col-6">
						<div class="row">
							<br>
						</div>
						<div class="row" id="item">
						<br>
						
						
							<!-- 내서재 목록 -->
							<div class="rentalTable" id="content">
						
								

							</div>
						</div>
					</div>
					</div>
				</div>
				
				
				
				
				
				
				
				
			</div>
		</div>



	</section>
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
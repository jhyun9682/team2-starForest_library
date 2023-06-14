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
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
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
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/faq.css">
<link rel="stylesheet" href="./css/yeji.css">
<link rel="stylesheet" href="./css/admin.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<title>나의도서 - 별숲도서관</title>
<style>
.img-fluid {
	height: 250px;
	width: 244px;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.listTable,.admintable{
	font-family: 'GmarketSansMedium';
}
h2,#keyword,#tablehead{
	font-family: 'GmarketSansMedium';
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="./js/adminContents.js"></script>
<script type="text/javascript">
/*********도서관 총 대출 리스트***********/
$(function(){
	$.ajax({
		url:'total_rental_list',
		method:'POST',
		dataType:'json',
		success:function(jsonResult){
			if(jsonResult.code==1){
				var rentalTArray=jsonResult.data;
				$('.listTable').html(adminContents.admin_total_rental_list_content(rentalTArray));
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
		}
	});
$(document).on('click','#admin_return',function(e){
	$.ajax({
		url:'total_rental_list',
		method:'POST',
		dataType:'json',
		success:function(jsonResult){
			if(jsonResult.code==1){
				var rentalTArray=jsonResult.data;
				$('.listTable').html(adminContents.admin_total_rental_list_content(rentalTArray));
			}else if(jsonResult.code==2){
				//alert(jsonResult.msg);
				Swal.fire({
							  title: '',
							  text: jsonResult.ms,
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

//admin 반납버튼 구현
$(document).on('click','#btn_admin_return',function(e){
	var book_no= $(e.target).attr("book_no");
	var user_id= $(e.target).attr('user_id');
	var param = {'book_no':book_no, 'user_id':user_id};
	 
	$.ajax({
		url:'rest_return',
		method:'POST',
		dataType:'json',
		data:param,
		success:function(jsonResult){
			if(jsonResult.code==1){
				//alert("반납처리 되었습니다.");
				//location.reload();
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
							  	location.href="admin";
							    
							  }
							})
				
			}else if(jsonResult.code==-1){
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
		},
		error:function(jsonResult){	
			if(jsonResult.code==2){
				Swal.fire({
					  title: '',
					  text: '오류',
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


/*********어드민 검색 회원이 현재 대출중인 도서 리스트***********/
$(document).on('click','#btn_search', function(e){
	var param='keyword='+$('input').val();
	console.log(param);
	$.ajax({
		url:'admin_user_now_rental_list',
		method:'POST',
		data: param,
		success:function(jsonResult){
			if(jsonResult.code==1){
				var rentalArray=jsonResult.data;
				$('.listTable').html(adminContents.admin_user_now_rental_list_content(rentalArray));
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
			
		}
	});
	e.preventDefault();
});



})
	
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
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h2>관리자</h2>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- MAIN SECTION -->
	<!-- 사이드바 -->
	<!-- <section id="contact" class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-3 noto-serif">
					<div class="sidebar">
						<div class="side-head">
							<h4 class="text-light">나의도서</h4>
						</div>
						<ul class="list-group list-group-flush mb-5"  id="menu">
							<li class="list-group-item">
								<a href="" id="btn_mypage" >어드민</a>
								<ul class='submenu'>
									<li><a href="MyPage_Folder" id="side_mypage">내정보</a></li>
									<li><a href=MyPage_Info id="side_update">개인정보변경</a></li>
								</ul>
							</li>
							<li class="list-group-item">
								<a href="#"  id="side_userbook_status">나의도서정보</a>
								<ul class='submenu'>
									<li><a href="#" id="side_userbook_status">대출현황</a></li>
									<li><a href="#" id="side_reservation">예약현황</a></li>
									<li><a href="#" id="side_now_userbook_status">현재대출현황</a></li>
								</ul>
							</li>
								
							<li class="list-group-item">
								<a href="MyPage_Folder" id="side_user_club">동아리신청내역</a></li>
							<li class="list-group-item">
								<a href="MyPage_Folder" id="side_user_request_list">희망도서신청내역</a></li>
							<li class="list-group-item">
								<a href="MyPage_Folder" id="side_favorite">내서재</a></li>
							<li class="list-group-item">
								<a href="MyPage_Folder" id="side_user_qr">나의QR</a></li>

					</ul>
					</div>
				</div> -->

				<!-- 메인내용 -->
				
						<div class="mypage">

						</div>
						<div class="rentalTable" >

						
						<!-- 대여리스트 -->
						<div class="col-md-9" >
					<div class="col-6" style="margin-left: auto; margin-right: auto;">
						<div class="row">
							<br>
						</div>
						<div class="row" id="item">
						
						<div>
						<form name="f" action="star_forest_pjt/admin_user_now_rental_list?keyword=" method="POST" style="float:right;">
						<input id="keyword" name="keyword" type="text" value="${rental.keyword }" placeholder="회원아이디 입력" style="left:850px;">
							<button type="button" id="btn_search" class="w-btn w-btn-detail" style="left:1120px;bottom:12px">검색</button>
							</form>
						</div>
							<!-- 도서관 대여 리스트 -->
							<h2>관리자 - 도서반납</h2>
							<div class="listTable" id="content"  style="margin-left: auto; margin-right: auto;">
							
							<!-- 도서관 대여 리스트 -->
						</div>
					</div>
				</div>
			</div>
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
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
<link rel="stylesheet" href="./css/yeji.css">
<link rel="stylesheet" href="./css/admin.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<title>관리자 - 별숲도서관</title>
<style>
.img-fluid {
	height: 250px;
	width: 244px;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="./js/adminContents.js"></script>
<script type="text/javascript">
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
				alert('로그인이 필요한 페이지입니다:)');
			}
		}
	});
	$.ajax({
		url:'user_all_list',
		method:'GET',
		success:function(jsonResult){
			var userArray=jsonResult.data;
			console.log(userArray);
			$('.listTable').html(adminContents.admin_user_list_content(userArray));
		}
			
	});
	$(document).on('click','#menu_admin_user',function(e){
		$.ajax({
			url:'user_all_list',
			method:'GET',
			success:function(jsonResult){
				var userArray=jsonResult.data;
				console.log(userArray);
				$('.listTable').html(adminContents.admin_user_list_content(userArray));
			}
				
		});
		e.preventDefault();
	});

	$(document).on('click','#btn_user_delete',function(e){
		var param='user_id='+$(e.target).attr('user_id');
		console.log(param);
		$.ajax({
			url:'admin_user_delete',
			method:'POST',
			data:param,
			success:function(jsonResult){
				if(jsonResult.code==1){
					Swal.fire({
						  title: '',
						  text: '회원목록에서 삭제되었습니다.',
						  icon: 'success',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
						  
						    
						  }
						})
					//alert("회원목록에서 삭제되었습니다.");
					$.ajax({
						url:'user_all_list',
						method:'GET',
						success:function(jsonResult){
							var userArray=jsonResult.data;
							console.log(userArray);
							$('.listTable').html(adminContents.admin_user_list_content(userArray));
						}
							
					});
				}else{
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
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h2>관리자 - 회원관리</h2>
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
						<div class="rentalTable">
						<!-- 대여리스트 -->
						<div class="col-md-9">
					<div class="col-6" style="margin-left: auto; margin-right: auto;">
						<div class="row">
							<br>
						</div>
						<div class="row" id="item">
						
						
							<!-- 도서관 대여 리스트 -->
							<div class="listTable" id="content"  style="margin-left:40px;">
							
							<!-- 도서관 대여 리스트 -->
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
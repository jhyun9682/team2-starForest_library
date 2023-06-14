<%@page import="com.itwill.domain.BookCategory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/favicon-16x16.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="./css/style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript" src="./js/BookClubHtmlContents.js"></script>
<script type="text/javascript" src="./js/UserHtmlContents.js"></script>

<title>나의도서 - 별숲도서관</title>
<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.img-fluid {
	height: 250px;
	width: 244px;
}

.table td {
	border: 1px solid ffffff;
}

.container table tr td {
	text-align: left;
	vertical-align: middle;
	word-break: keep-all;
	padding-right: 3em;
}

#btn_category,.rentalTable{
	font-family: 'GmarketSansMedium';
}
</style>



<script type="text/javascript">
	$(function() {
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
		
		
		/********club_list***********/
		$.ajax({
				url:'club_list',
				method:'GET',
				success:function(jsonResult){
					var bookClubArray=jsonResult.data;
						$('#content').html(BookClubHtmlContents.admin_club_join_html(bookClubArray));
				}
			});
		$(document).on('click','#side_bookClub,#menu_bookClub,#btn_all,#btn_list',function(e){
			$.ajax({
				url:'club_list',
				method:'GET',
				success:function(jsonResult){
					var bookClubArray=jsonResult.data;
					$('#content').html(BookClubHtmlContents.admin_club_join_html(bookClubArray));
				}
			});
			e.preventDefault();
		});
		
		/********club_category_list********/
		$(document).on('click','#btn1',function(e){
			var param='category_no='+$(e.target).attr('value');
			
			$.ajax({
				url:'club_select_by_category',
				method:'POST',
				dataType:'json',
				data:param,
				success:function(jsonResult){
					var bookClubArray=jsonResult.data;
					console.log(bookClubArray);
					$('#content').html(BookClubHtmlContents.admin_club_join_html(bookClubArray));
				}
			});
			e.preventDefault();
		});
		
		
		/***********club_write_form***********/
	    $(document).on('click','#btn_write_form',function(e){
			$('#content').html(BookClubHtmlContents.club_write_form_html());
			e.preventDefault();
	 	});
	
		/************club_write_action**************/
		$(document).on('click','#btn_write_action',function(e){
		if (document.f.club_name.value == "") {
				alert("이름을 입력하십시요.");
			    $("club_name").focus();
				return false;
			}
			if (document.f.club_person.value == "") {
				alert("모집대상을 입력하십시요.");
			    $("club_person").focus();
				return false;
			}
			if (document.f.club_count.value == "") {
				alert("모집인원을 입력하십시요.");
			    $("club_count").focus();
				return false;
			}

			if (document.f.club_place.value == "") {
				alert("장소를 입력하십시요.");
			    $("club_place").focus();
				return false;
			}
			if (document.f.club_time.value == "") {
				alert("시간을 입력하십시요.");
			    $("club_time").focus();
				return false;
			}
			if (document.f.club_content.value == "") {
				alert("내용을 입력하십시요.");
			    $("club_content").focus();
				return false;
			}
			var param=$('#club_write_form').serialize();
			console.log(param);
			$.ajax({
				url:'club_create',
				method:'POST',
				dataType:'json',
				data:param,
				success:function(jsonResult){
					if(jsonResult.code==1){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
		                       icon: 'success',
		                       showCancelButton: false,
		                       confirmButtonColor: '#3085d6',
		                       cancelButtonColor: '#d33',
		                       confirmButtonText: '확인'
		                     }).then((result) => {
		                       if (result.isConfirmed) {
		                       }
		                     })
						$("#btn_list").trigger('click');
					}else if(jsonResult.code==2){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
		
		/************club_modify_form**************/
		$(document).on('click','#btn_update',function(e){
			var club_no=$(e.target).attr('club_no');
			var param='club_no='+club_no;
			console.log(param);
			$.ajax({
				url:'club_update_form',
				method:'POST',
				dataType:'json',
				data:param,
				success:function(jsonResult){
					var club=jsonResult.data[0];
					console.log(club);
	    			$('#content').html(BookClubHtmlContents.club_modify_form_html(club));
				}
			});
			e.preventDefault();
		});
		
		
		/************club_modify_action**************/
		$(document).on('click','#btn_modify_action',function(e){
			var param=$('#club_modify_form').serialize();
			console.log(param);
			$.ajax({
				url:'club_update',
				method:'POST',
				data:param,
				success:function(jsonResult){
					if(jsonResult.code==1){
						var club_no=$("#club_modify_form input[name='club_no']").val();
						var param='club_no='+club_no;
						console.log(param);
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
		                       icon: 'success',
		                       showCancelButton: false,
		                       confirmButtonColor: '#3085d6',
		                       cancelButtonColor: '#d33',
		                       confirmButtonText: '확인'
		                     }).then((result) => {
		                       if (result.isConfirmed) {
		                       }
		                     })
						$.ajax({
							url:'club_detail',
							method:'POST',
							dataType:'json',
							data:param,
							success:function(jsonResult){
								var club=jsonResult.data[0];
								$('#content').html(BookClubHtmlContents.admin_club_detail_html(club));
							}
						});
					} else if(jsonResult.code==-1){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
		/**************remove**************/
		$(document).on('click','#btn_remove',function(e){
			var param='club_no='+$(e.target).attr('club_no');
			$.ajax({
				url:'club_remove',
				method:'POST',
				data:param,
				success:function(jsonResult){
					if(jsonResult.code==1){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
					<h1>도서동아리</h1>
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
							<h4 class="text-light" style="color:black !important">커뮤니티</h4>
						</div>
						<ul class="list-group list-group-flush mb-5">
							<li id="side_bookClub" class="list-group-item"><a href="bookclub"
								class="returnAll">도서동아리</a></li>
							<li id="post60" class="list-group-item"><a
								href="requestBoard"
								class="menu_RequestBoard">도서신청게시판</a></li>
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
							<button  id="btn_write_form" class="w-btn w-btn-detail">게시글 작성</button><br>
						
							<!-- 동아리신청,상세 -->
							<div class="rentalTable" id="content">
							
								<!-- 동아리신청,상세 -->

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



<!-- 	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script> -->
<!-- 	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script> -->
	<!-- <script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script> -->
	<!-- <script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- 	<script type="text/javascript"
		src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
 -->
</body>

</html>
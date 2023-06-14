<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.itwill.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//String sUserId = (String)session.getAttribute("sUserId");
%>
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

	/************user_login_form*************/
	$(document).on('click', '#a_user_login_form', function(e) {
		$('#loginPage').html(UserHtmlContents.user_login_form_content());

		e.preventDefault();
	});

	/*********user_login_action***********/
	$(document).on('click','#btn_login_action',function(e) {
	
		$.ajax({
			url : 'user_login_action',
			method : 'POST',
			dataType : 'json',
			data : $("#user_login_form").serialize(),
			dataType : "json",
			success : function(jsonResult) {
				if (jsonResult.code == 0) {
					console.log(jsonResult);
				} else if (jsonResult.code == 1) {
					console.log(jsonResult);
				} else if (jsonResult.code == 2) {
					
					location.href="Home";
					
					console.log("성공");
				}
			}
		});
		
		e.preventDefault();
	});
	
	/***********user_logout_action************/
	$(document).on('click','#a_user_logout_action',function(e){
		$.ajax({
			url:'user_logout_action',
			method:'POST',
			dataType:'json',
			success:function(jsonResult){
				location.href="user";
				console.log("로그아웃");
			}
		});
		e.preventDefault();
	});
	
	/*************user_write_form***************/
	
	$(document).on('click','#menu_my_seat',function(e){
		$.ajax({
		url:'login_check',
		method:'GET',
		success:function(jsonResult){
			if(jsonResult.code==2){
			alert(jsonResult.msg);
			location.href='user';
			}else if(jsonResult.code==1){
			location.href='seatReservation_my';
	}
		}
	});
	});
	
	
	$(document).on('click','#seatReservation_my',function(e){
		$.ajax({
		url:'login_check',
		method:'GET',
		success:function(jsonResult){
			if(jsonResult.code==2){
			alert(jsonResult.msg);
			location.href='user';
			}else if(jsonResult.code==1){
			location.href='seatReservation_my';
	}
		}
	});
	});
	
});	
</script>

<link rel="stylesheet" href="./css/style.css">
<nav
	class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
	<div class="container container-fluid">
		<a href="Home" class="navbar-brand"><img alt="별숲도서관"
			src="img/starForestLogo.png" height="50" width="90"
			class="pl-3 mb-1"></a>
		<button class="navbar-toggler" data-toggle="collapse"
			data-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse noto-serif" id="navbarCollapse">
			<ul class="navbar-nav ml-0" id="home-nav">
				<li class="nav-item dropdown"><a href="howtoInfo"
					class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="howtoInfo"> 대출/반납</a></li>
						<li><a class="dropdown-item" href="notice_list">
								공지사항 </a></li>
						<li><a class="dropdown-item" href="faqViewpage"> 자주묻는질문</a></li>
						<li><a class="dropdown-item" href="addrViewpageAPI"> 오시는길 </a></li>
					</ul></li>
				<li class="nav-item dropdown"><a href="SearchResult2"
					class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="SearchResult2">도서 검색</a></li>
						<li><a class="dropdown-item" href="SearchList">전체 도서</a></li>
						<li><a class="dropdown-item" href="recommendedBooks">사서추천도서</a></li>
						<li><a class="dropdown-item" href="Newbooks">신착도서</a></li>
						<li><a class="dropdown-item" href="popularBook">이달의 인기도서</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a href="postList?group=20"
					class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="bookclub" id="menu_bookClub">도서동아리</a></li>
						<li><a class="dropdown-item" href="requestBoard"
							id="menu_RequestBoard">도서신청게시판</a></li>
					</ul></li>
				<li class="nav-item dropdown">
					<a id="myMenu" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
							<li>
								<a class="dropdown-item" href="MyPage_Folder" id="user_favorite">
									내서재</a></li>
							<li>
								<a class="dropdown-item" href="MyPage_Folder" id="mypage">마이페이지</a>
							</li>
							<li>
								<a class="dropdown-item" href="MyPage_Folder" id="userbook_status">
									나의도서정보</a></li>
							<li>
								<a class="dropdown-item" href="MyPage_Folder" id="user_club_list">
									동아리신청내역</a></li>
							<li>
								<a class="dropdown-item" href="MyPage_Folder" id="user_request_list">
									희망도서신청내역</a></li>

					</ul>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown">열람실</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="seatReservation"
							id="menu_seatReservation">열람실예약</a></li>
						<li><a id="menu_my_seat" class="dropdown-item" href="seatReservation_my">예약확인</a></li>
					</ul>
				</li>
				
				<c:if test="${sUserId=='admin'}">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown">관리자</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="admin"
							id="menu_adminReturn">도서 반납</a></li>
						<li><a id="menu_admin_user" class="dropdown-item" href="user_admin">회원관리</a></li>
						<li><a id="menu_admin_insert_newbook" class="dropdown-item" href="adminNewBook">신착도서 입력</a></li>
					</ul>
				</li>
				</c:if>
			</ul>


			<ul id="app" class="navbar-nav ml-auto">
				<c:if test="${sUserId eq null}">
					<li class="nav-item" v-bind:title="login">
					<a href="user" class="nav-link" id="a_user_login_form">
					<i class="fas fa-sign-in-alt"></i></a>
						<p class="sr-only">로그인</p></li>
					<li class="nav-item" v-bind:title="signup">
					<a href="insertCustomer2" class="nav-link" id="a_user_write_form">
					<i class="fas fa-user-plus"></i></a>
						<p class="sr-only">회원가입</p></li>
				</c:if>
				<c:if test="${sUserId ne null}">
					<li class="nav-item p-1"><small class="text-dark">${sUserId}
							님</small></li>
					<li class="nav-item" v-bind:title="logout">
					<a href="user" class="nav-link" id="a_user_logout_action">
					<i class="fas fa-sign-out-alt" id="a_user_logout_action"></i></a>
						<p class="sr-only">로그아웃</p></li>
				</c:if>


			</ul>
		</div>
	</div>
</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap"
	rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/yurim.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script type="text/javascript" src="./js/UserHtmlContents.js"></script>
<script type="text/javascript">
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
					Swal.fire({
						  title: '',
						  text: '아이디가 존재하지 않습니다.',
						  icon: 'error',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
						  
						  }
				}) 
				}else if (jsonResult.code == 1) {
					console.log(jsonResult);
					Swal.fire({
						  title: '',
						  text: '비밀번호가 일치하지 않습니다.',
						  icon: 'error',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
						  
						    
						  }
						})
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
		
	/*************아이디 비번찾기***************/
	$(function(){
		
		var $UnameID = $("#UnameID");
		var $UphoneID = $("#UphoneID");
		var $idText = $("#idText");
		
		var $UidPwd = $("#UidPwd");
		var $UemailPwd = $("#UemailPwd");
		
		// JS 모달
		var $findOk = new bootstrap.Modal(document.getElementById('findOk'));
		var $findNone = new bootstrap.Modal(document.getElementById('findNone'));
		
		
		
		$("#findId").click(function(){
			
			$.ajax({
				type : "POST",
				url : "/star_forest_pjt/findUId",
				data : {
					"user_name" : $UnameID.val(),
					"user_phone" : $UphoneID.val()
				},
				success : function(data){
					if(data == ""){
						//console.log("없음!")
						$findNone.show();
					}else{
						//console.log("data :"+data)
						$idText.text("회원님의 아이디 : "+data)
						$idText.css({
							"color" : "#0D6EFD",
							"font-size" : "16px"
						})
						$findOk.show();	
					}
				}
			})
		})
		
		$("#findPwd").click(function(){
			
			$.ajax({
				type : "POST",
				url : "/star_forest_pjt/findUPwd",
				data : {
					"user_id" : $UidPwd.val(),
					"user_email" : $UemailPwd.val(),
				},
				success : function(data){
					if(data == ""){
						//console.log("없음!")
						$findNone.show();
					}else{
						//console.log("data :"+data)
						$idText.text("회원님의 비밀번호 : "+data)
						$idText.css({
							"color" : "#0D6EFD",
							"font-size" : "16px"
						})
						$findOk.show();	
					}
				}
			})
		})
	})
	
</script>

<title>로그인 - 별숲도서관</title>
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
		<header id="page-header">
			<div class="darkOverlay">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<h1></h1>
						</div>
					</div>
				</div>
			</div>
		</header>


		<!-- MAIN SECTION -->
		<section id="loginPage">
			<!-- 타이틀: 별숲 -->
			<h1 class="heroTitle">
				별숲<span class="heroTitle_dot"> : </span> <span class="heroTitle_kor">로그인</span>
			</h1>
			<hr class="heroLine">

			<!-- 로그인 폼 시작 -->
			<form id="user_login_form" >
				<div class="form-group mt-4">
					<input class="form-control form-control-lg loginForm" type="text"
						id="user_id" name="user_id" placeholder="아이디"> 
					<input class="form-control form-control-lg mt-2 loginForm"
						type="password" id="user_password" name="user_password" placeholder="비밀번호"> 
					<input type="hidden" name="loginOk" value="ok">
					<button
						class="btn btn-outline-success btn-lg btn-block mt-2 btn-Customer"
						type="submit" id="btn_login_action">로그인</button>
				</div>
			</form>
			<!-- 회원가입 / 아이디찾기 / 비밀번호찾기 -->
			<div id="loginInfo">
				<p class="text-right m-0 noto-serif">아직 별숲 회원이 아니신가요?</p>
				<p class="text-right m-0">
					<a href="insertCustomer2">회원가입하기 </a>
				</p>
				<hr class="heroLineSecond">
				<p class="text-muted text-center mb-5">
					<a href="#" data-toggle="modal" data-target="#emailModal">아이디
						찾기 </a> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#"
						data-toggle="modal" data-target="#pwModal">비밀번호찾기</a>
				</p>
				</form>
			</div>

			<!-- 아이디찾기 MODAL -->
			<div class="modal" id="emailModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">내 아이디 찾기</h5>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<!-- 폼시작 -->
							<!-- <form action="findEmail.do" method="post"> -->
							<div class="form-group">
								<label for="UnameID">이름</label> 
								<input type="text"	id="UnameID" name="UnameID" placeholder="이름 입력" class="form-control" required>
							</div>
							<div class="form-group">
								<label for="UphoneID">전화번호</label> 
								<input type="tel" id="UphoneID" name="UphoneID" placeholder="예시) 01012345678" class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-outline-info btn-Customer" id="findId" type="button">내 아이디 찾기</button>
							<!-- </form> -->
							<!--폼 종료 -->
						</div>
					</div>
				</div>
			</div>

			<!-- 비밀번호 찾기 MODAL -->
			<div class="modal" id="pwModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">내 비밀번호 찾기</h5>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="UidPwd">아이디 </label> 
								<input type="text" name="UidPwd" id="UidPwd" placeholder="아이디 입력" class="form-control">
							</div>
							<div class="form-group">
								<label for="UemailPwd">이메일</label> 
								<input type="email" name="UemailPwd" id="UemailPwd" placeholder="예시)hello@delibrary.com"
									class="form-control">
							</div>

						</div>
						<div class="modal-footer">
							<button type="submit" id="findPwd"
								class="btn btn-outline-info btn-Customer" data-dismiss="modal">비밀번호
								찾기</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="findOk" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">계정 정보 확인</h4>
      
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
		  <div class="container-fluid">
		    <div class="row">
		      <div class="col-sm-9">
		        <div class="row">
		          <p id="idText"></p>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      <div class="modal-footer">
        <a href="/star_forest_pjt/user"><button type="button" class="btn btn-default">로그인 화면으로 돌아가기</button></a>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="findNone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">계정 정보 확인</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
		  <div class="container-fluid">
		    <div class="row">
		      <div class="col-sm-9">
		        <div class="row">
		          <p id="idText">계정 정보를 확인 할 수 없습니다</p>
		          <p id="idText">정확한 정보를 확인 후 다시 입력해주세요</p>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
      <div class="modal-footer">
        <a href="/star_forest_pjt/user"><button type="button" class="btn btn-default">로그인 화면으로 돌아가기</button></a>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
			
		</section>
	</div>

	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->

	<!---------------------- 자바스크립트 섹션 ----------------------->

	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/yurim.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Bootstrap CSS -->

<!-- Style -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- CSS only -->

<!-- JavaScript Bundle with Popper -->

<!-- 주소 찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var idchk = false; // 아이디 검사
	var pwdchk = false; // 패스워드
	var pwdconfrimchk = false; // 패스워드 확인
	var namechk = false; // 이름
	var emchk = false; // 이메일
	var emconfirmchk = false; // 이메일 인증
	var birchk = false; // 생일
	var phchk = false; // 핸드폰
	
	$(function() {
		var $user_id = $("#user_id");
		var $id = $("#id");
		var $user_password = $("#user_password");
		var $user_name = $("#user_name");
		var $pwdconfrim = $("#pwdconfrim");
		var $user_email = $("#user_email");
		var $user_birth = $("#user_birth");
		var $user_phone = $("#user_phone");
		
		
		//console.dir("mid : "+$mid);
		
		// 아이디 정규식
		$user_id.on("keyup", function() { // 키보드 눌렀을 때 실행
			var regExp = /^[a-z]/g;
			if (!regExp.test($user_id.val())) { // id 가 공백인 경우 체크
				idchk = false;
				$id.html("<span id='check'>사용할 수 없는 아이디입니다.</span>");
				$("#check").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "13px"
				})
			} else { // 공백아니면 중복체크
				$.ajax({
					type : "POST",
					url : "/star_forest_pjt/checkid",
					data : {
						"type" : "user",
						"user_id" : $user_id.val()
					},
					success : function(data) {
						if (data == 1) { // 1이면 중복
							idchk = false;
							$id.html("<span id='check'>이미 존재하는 아이디입니다</span>")
							$("#check").css({
								"color" : "#FA3E3E",
								"font-weight" : "bold",
								"font-size" : "13px"
							})
							//console.log("중복아이디");
						} else { // 아니면 중복아님
							idchk = true;
							$id.html("<span id='check'>사용가능한 아이디입니다</span>")
							$("#check").css({
								"color" : "#0D6EFD",
								"font-weight" : "bold",
								"font-size" : "13px"
							})
							//console.log("중복아닌 아이디");
						}
					}
				})
			}
		});
		// 비밀번호 정규식
		$user_password.on("keyup", function() {
			var regExp =  /[0-9]/;
			//console.log("email : "+$memail.val());
			if (!regExp.test($user_password.val())) {
				//console.log("형식 미확인");
				$("#cpwdnew").html("<span id='chkpwd'>패스워드 형식이 맞지 않습니다</span>")
				$("#chkpwd").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "13px"
				})
				pwdchk = false;
			} else {
				//console.log("형식 확인");
				$("#cpwdnew").html("<span id='chkpwd'>패스워드 형식을 확인했습니다</span>")
				$("#chkpwd").css({
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "13px"
				})
				pwdchk = true;
				//console.log("idchk : "+idchk);
				//console.log("pwdconfrimchk : "+pwdconfrimchk);
				//console.log("emlchkchk : "+emlchkchk);
			}
		})
		// 패스워드 2중 검사
		$pwdconfrim.on("keyup", function() {
			if ($pwdconfrim.val() != $user_password.val()) {
				pwdconfrimchk = false;
				//console.log("불일치");
				$("#pwdText").html("<span id='checkpwd'>비밀번호가 일치하지 않습니다</span>")
				$("#checkpwd").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "13px"
				})
			} else {
				pwdconfrimchk = true;
				//console.log("동일한 비밀번호");
				$("#pwdText").html("<span id='checkpwd'>비밀번호 일치 확인</span>")
				$("#checkpwd").css({
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "13px"
				})
			}
		})
		// 이름 확인
		$user_name.on("keyup", function() {
			if ($user_name.val() == "") { // id 가 공백인 경우 체크
				namechk = false;
				$("#nameTxt").html("<span id='nmchk'>이름은 필수입니다</span>");
				$("#nmchk").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "13px"
				})
			} else {
				namechk = true;
				$("#nmchk").hide();
			}
		})
		// 생년월일 정규식 검사
		$user_birth.on("keyup",function() {
							var regExp = /([0-9]{4}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/;
							//console.log("email : "+$memail.val());
							if (!regExp.test($user_birth.val())) {
								//console.log("형식 미확인");
								birchk = false;
								$("#briTxt")
										.html(
												"<span id='chkbir'>생년월일 형식이 맞지않습니다</span>")
								$("#chkbir").css({
									"color" : "#FA3E3E",
									"font-weight" : "bold",
									"font-size" : "13px"
								})
							} else {
								birchk = true;
								//console.log("형식 확인");
								$("#briTxt")
										.html(
												"<span id='chkbir'>생년월일 형식을 확인했습니다</span>")
								$("#chkbir").css({
									"color" : "#0D6EFD",
									"font-weight" : "bold",
									"font-size" : "13px"
								})
								//console.log("idchk : "+idchk);
								//console.log("pwdconfrimchk : "+pwdconfrimchk);
								//console.log("emlchkchk : "+emlchkchk);
							}
						})
		// 이메일 정규식 검사
		$user_email.on("keyup",function() {
							var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							//console.log("email : "+$memail.val());
							if (!regExp.test($user_email.val())) {
								//console.log("형식 미확인");
								emchk  = false;
								$("#mailTxt")
										.html(
												"<span id='chkmail'>이메일 형식이 맞지 않습니다</span>")
								$("#chkmail").css({
									"color" : "#FA3E3E",
									"font-weight" : "bold",
									"font-size" : "13px"
								})
							} else {
								emchk  = true;
								//console.log("형식 확인");
								$("#mailTxt")
										.html(
												"<span id='chkmail'>이메일을 형식을 확인했습니다</span>")
								$("#chkmail").css({
									"color" : "#0D6EFD",
									"font-weight" : "bold",
									"font-size" : "13px"
								})
							}
						})
						
		
		// 핸드폰 번호
		$user_phone.on("keyup", function() {
			var regExp = /^\d{3}\d{4}\d{4}$/;
			//console.log("email : "+$memail.val());
			if (!regExp.test($user_phone.val())) {
				//console.log("형식 미확인");
				$("#phoneTxt").html(
						"<span text-align='left' id='chkphone'>핸드폰 번호 형식이 맞지 않습니다</span>")
				$("#chkphone").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "13px"
				})
				phchk = false;
			} else {
				//console.log("형식 확인");
				$("#phoneTxt").html(
						"<span id='chkphone'>핸드폰 번호를 형식을 확인했습니다</span>")
				$("#chkphone").css({
					"text-align" : "center",
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "13px"
				})
				phchk = true;
				//console.log("idchk : "+idchk);
				//console.log("pwdconfrimchk : "+pwdconfrimchk);
				//console.log("emlchkchk : "+emlchkchk);
			}
		})
		// selectBox 관련 JS
		var selectTarget = $('.selectbox select');
		// focus 가 되었을 때와 focus 를 잃었을 때
		selectTarget.on({
			'focus' : function() {
				$(this).parent().addClass('focus');
			},
			'blur' : function() {
				$(this).parent().removeClass('focus');
			}
		});
		selectTarget.change(function() {
			var select_name = $(this).children('option:selected').text();
			$(this).siblings('label').text(select_name);
			$(this).parent().removeClass('focus');
		});
	});
	
	
	
	
	// 주소 찾기 script
    function daumPostcode() {
		$("#user_address").val("");
		$("#user_address2").val("");
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = extraAddr;
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("user_address2").value = extraAddr;
                
                } else {
                    document.getElementById("user_address2").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#user_address").val(addr);
                $("#user_address2").val(extraAddr)
                
                $("#muser_address").remove();
                $("#muser_address2").remove();
                
                
                //$("#caddr").val(addr);
                //document.getElementById("caddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_address2").focus();
            }
        }).open();
    }
	
	
	// formSubmit 함수
	function formSubmit(){
		var maleCheck = $("#male").is(':checked');
		var femaleCheck = $("#female").is(':checked');
		
		//console.log("idchk : "+idchk)
		//console.log("pwdchk : "+pwdchk)
		//console.log("pwdconfrimchk : "+pwdconfrimchk)		
		//console.log("namechk : "+namechk)
		
		//console.log("birchk : "+birchk)
		//console.log("emchk : "+emchk)
		//console.log("emconfirmchk : "+emconfirmchk)
		//console.log("phchk : "+phchk)
		//console.log("select : "+$("#select").val())
		
		if(!idchk){
			frm.user_id.focus();
			return false;
		}else if(!pwdchk){
			frm.user_password.focus();
			return false;
		}else if(!pwdconfrimchk){
			frm.pwdconfrim.focus();
			return false;
		}else if(!namechk){
			frm.user_name.focus();
			return false;
		}else if(!birchk){
			frm.user_birth.focus();
			return false;
		}else if(!emchk){
			frm.user_email.focus();
			return false;
		}else if(!phchk){
			frm.user_phone.focus();
			return false;
		}else if(!$("#chek").is(":checked")){
			frm.chek.focus();
			return false;
		}else if($("#select").val() == "none"){
			frm.category_no.focus();
			return false;
		}else if($("#user_address").val()==""){
			frm.user_address.focus();
			return false;
		}else if(maleCheck == false && femaleCheck == false){
			frm.user_gender.focus();
			return false;
		}else{
			return true;
		}
		location.href="insertCustomerSuccess";
	}
</script>
<style>
/* .custom-btn {
	height: 40px;
	color: white;
	text-align: center;
	border-radius: 5px;
	padding: 10px 25px;
	/* background: transparent; */
	transition: all 0.3s ease;
	cursor: pointer;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
	border-radius: 5px;
} */
/* .btn-2 {
	background: rgb(96, 9, 240);
	background: linear-gradient(0deg, rgba(96, 9, 240, 1) 0%,
		rgba(129, 5, 240, 1) 100%);
	border: none;
	margin-left: 15px;
    margin-bottom: 10px;
} */
.btn-2:before {
	height: 0%;
	width: 2px;
}
.btn-2:hover {
	box-shadow: 4px 4px 6px 0 rgba(255, 255, 255, .5), -4px -4px 6px 0
		rgba(116, 125, 136, .5), inset -4px -4px 6px 0 rgba(255, 255, 255, .2),
		inset 4px 4px 6px 0 rgba(0, 0, 0, .4);
}
span {
	/* font-size: 20px; */
}
.container{
	max-width: 910px;
}
.col-md-8-custom {
    /* -webkit-box-flex: 0;
    -ms-flex: 0 0 66.66667%;
    flex: 0 0 66.66667%; */
    max-width: 80%; 
    padding: 30px 0 30px 145px;
}
#findAddr, #checkEmail{
	/* margin-left : 115px; */
	float: left;
}
.check{
  		/* height: 50px; */
    	line-height: 35px;
  	}
  	.mb-4>img {
  		width: 200px;
  		margin: 10px 0 10px 75px;
  	}
  	.member_register>form>div>label {
  		padding: 14px;
  	}
  	.member_register>form>div>input {
  		font-size: 12px;
  		height: 50px;
  	}
  	.addr_input>input, .email_input>input {
  		width: 260px;
  	}
  	.addr_input, .email_input {
  		float: left;
  	}
  	.addr_detail, .check_input {
  		clear: both;
  	}
  	.addr_btn, #checkEmail {
  		margin: 4px 0 0 5px;
  	}
  	.btn-group {
  		width: 206px;
  		margin: 0 0 0 7px;
  	}
  	#form-select {
  		border: 1px solid #ced4da;
  		border-radius: .375rem;
  	}
  	#form-select:focus {
  		border: 1px solid #0D6EFD;
  	}
  	.bg-white {
  		padding-bottom: 30px;
  	}
  	.btn-group{
  		display:inline-block;
  	}
  	.form-group last mb-4 addr_input{
  		display:inline-block;
  	}
  	#findAddr{
  		vertical-align: middle;
  	}
</style>
	<!-- header -->
<title>회원가입 - 별숲도서관</title>
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
							<h2>회원가입</h2>
							<small style="color: Gainsboro;">별숲도서관에 오신 걸 환영합니다.</small>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- MAIN SECTION -->
		<section id="insertCustomer">
			<!-- 폼 시작 -->
			<form action='<c:url value='/registerOkUser'/>' method="post"  name="frm" >
							<!-- <span>아이디</span> -->
							<br>
							<div class="form-group first">
								<label for="user_id" id="id"></label> 
								<input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디 입력 (영어 소문자)" required>
							</div>

							<!-- <span>비밀번호</span> -->
							<div class="form-group last mb-4">
								<label for="user_password" id="pwdnew"></label> 
								<input type="password" class="form-control" name="user_password" id="user_password" placeholder="비밀번호 입력 (숫자 4자리)" required>
							</div>

							<!-- <span>비밀번호 확인</span> -->
							<div class="form-group last mb-4">
								<label for="pwdconfrim" id="pwdText"></label> 
								<input type="password" class="form-control" id="pwdconfrim" placeholder="비밀번호 확인" required>
							</div>

							<!-- <span>이름</span> -->
							<div class="form-group last mb-4">
								<label for="user_name" id="nameTxt"></label> <input
									type="text" class="form-control" name="user_name" id="user_name" placeholder="이름 입력" required>
							</div>
							
							<!-- <span>주소</span> -->
							
							<div class="form-group last mb-4 addr_input">
								<label for="user_address" id="muser_address"></label>
								<input type="text" class="form-control" name="user_address" id="user_address" placeholder="주소 입력" required readonly>
							</div>
								<br><input type="button"  class="btn btn-outline-primary addr_btn" id="findAddr" onclick="daumPostcode()" value="주소 찾기" required><br>
							
							<!-- <span>상세 주소</span> -->
							<div class="form-group last mb-4 addr_detail">
								<label for="user_address2" id="muser_address2"></label>
								<input type="text" class="form-control" name="user_address2" id="user_address2" placeholder="상세 주소 입력" required>
							</div>

							<!-- <span>생년월일</span> -->
							<div class="form-group last mb-4">
								<label for="user_birth" id="briTxt" ></label> <input
									type="text" class="form-control" name="user_birth" id="user_birth" placeholder="생년월일 입력 (숫자만)" required>
							</div>

							<!-- <span>이메일 </span> -->
							<div class="form-group last mb-4 email_input">
								<label for="user_email" id="mailTxt"></label> 
								<input type="text" class="form-control" name="user_email" id="user_email" placeholder="이메일 입력" required>
							</div>
							<br><br>

							<!-- <span>핸드폰 번호</span> -->
							<div class="form-group last mb-4"><br>
								<label for="user_phone" id="phoneTxt"></label>
								<input type="text" class="form-control" name="user_phone"
									id="user_phone" placeholder="전화번호 입력 (숫자만)" required >
							</div>
							<br>
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							  <input type="radio" class="btn-check" name="user_gender" id="male" autocomplete="off" value="M">
							 남성
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="radio" class="btn-check" name="user_gender" id="female" autocomplete="off" value="F">
							  여성
						  	</div>
						  	<br>	<br>	
							<!-- <span>관심 분야</span> -->
							<div class="selectbox">
								<!-- <span for="select">관심분야 선택</span> --> 
								<select id="form-select" name="category_no" style="width:355px; height: 50px;">
									<option selected value="none">관심분야를 선택해주세요</option>
									<option class="dropdown-item" value=100>100 건강/취미/레저</option>
									<option class="dropdown-item" value=200>200 경제경영</option>
									<option class="dropdown-item" value=300>300 고전</option>
									<option class="dropdown-item" value=400>400 과학</option>
									<option class="dropdown-item" value=500>500 만화</option>
									<option class="dropdown-item" value=600>600 사회과학</option>
									<option class="dropdown-item" value=700>700 소설/시/희곡</option>
								</select>
							</div>
<!-- 마케팅 동의 -->
		<br>
							<hr class="divider">
							<div>
          						<p> 별숲도서관 약관 동의(필수)  <input type="checkbox" class="checkbox" name="chek" id="chek" /></p>
          					    <p> 마케팅 정보 수신 동의(선택)  <input type="checkbox" class="checkbox" name="chek" id="chek" /></p>
          					
          					</div>
          					<hr class="divider">
							<br /> <button class="btn btn-dark btn-block mb-1 btn-Customer" type="submit" onclick="formSubmit();">가입하기</button>
		
		</form>
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
	<!---------------------- 자바스크립트 섹션 ----------------------->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
	  <script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		$(function() {
			//푸터 명언
			const footer_display = document.getElementById('footer-display');
			const footer_quotes = [
					'좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴',
					'내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스',
					'목적이 없는 독서는 산보일 뿐이다. — B. 리튼',
					'사람은 책을 만들고, 책은 사람을 만든다. — 신용호',
					'기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨',
					'책은 한 권 한 권이 하나의 세계다. — W. 워즈워스',
					'책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절' ];
			const footer_getQuote = Math.floor(Math.random()
					* footer_quotes.length);
			footer_display.textContent = footer_quotes[footer_getQuote];
		});
	</script>
</body>
</html>
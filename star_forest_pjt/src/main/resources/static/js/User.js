////////////////////////////////////////////////
function() {
	
	/* validator객체변수선언 */
	var validator = null;
	/*validator객체 디폴트속성 설정*/
	$.validator.setDefaults({
	    rules : {
			user_id : {
			    required : true,
			},
			user_password : {
			    required : true
			},
			user_password2 : {
			    required : true,
			    equalTo : "#password"
			},
			user_name : {
			    required : true,
			},
			user_email : {
			    required : true,
			    user_email : true
			}

	    },
	    messages:{
			user_id : {
			    required: '아이디를 입력하세요'
			},
		  	user_password : {
		  	  	required: '비밀번호를 입력하세요'
			},
			user_password2 : {
			    required : '비밀번호 확인을 입력하세요',
			    equalTo:'비밀번호와 비밀번호 확인은 일치하여야 합니다'
			},
			user_name : {
			    required : '이름을 입력하세요'
			},
			user_email : {
			    required : '이메일을 입력하세요',
			    user_email : '이메일형식이 일치하지않습니다.'
			}
		},
		errorClass : 'error',
	    validClass : 'valid'
	};

//////////////////////////////////////////////////////////////

	
	function(){
	$(".mypage").click(function(event){
		if(${cust_no == null}){
			event.preventDefault();
			const loginOk = confirm("로그인 후 사용 가능합니다. 로그인하시겠습니까?");
			console.log(loginOk);
			if(loginOk){
				console.log("로그인하러갑니다.");
				window.location.href = "LoginPage";
			}
		}else{
			window.location.href="Home";
		}
	});
};
 // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

	//////////////////////////**우편번호**//////////////////////////////////
	window.onload=function(){
		document.querySelector('#getPostcode').addEventListener('click',function (){
			 new daum.Postcode({
				oncomplete: function (data) {
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
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("getDetail_addr").value = extraAddr;

					} else {
						document.getElementById("getAddr1").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('getPostcode_input').value = data.zonecode;
					document.getElementById("getAddr1").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("getAddr2").focus();
				}
			}).open();

		});


 	//////////////////////////**관심장르 체크박스**//////////////////////////////////
	let select = 0;
	let interestButton = ['#interest1','#interest2','#interest3','#interest4','#interest5','#interest6'];	
	let interestCheck = ['#interest_check1','#interest_check2','#interest_check3','#interest_check4','#interest_check5','#interest_check6'];	

	for(let i=0; i < interestButton.length; i++){	
		document.querySelector(interestButton[i]).addEventListener('click', function () {
				document.querySelector(interestButton[i]).classList.toggle('active');
				select += 1;
				if(select % 2 != 0) {
					document.querySelector(interestCheck[i]).setAttribute('checked', 'checked');
				} else {
					document.querySelector(interestCheck[i]).removeAttribute('checked');
				}
		})
	}
	//////////////////////////**이메일 중복체크:제이쿼리**//////////////////////////////////
	     /*
		$('#btn_emailCheck').click(function() {
			console.log('pleaassssssss');
			const email = $('#email').val();
			* $('#emailck').removeClass('is-valid');
			$('#emailck').removeClass('is-invalid');
			$('#email_ok').css('display','none');
			$('#email_ok_ok').css('display','none'); *
			
			$.ajax({
				url:'/emailCheck',
				type:'POST',
				data:{
					"email":email
				},
				success:function(re){
					$('#email_msg').css('display','none');
					if(re>0){
						alert('이미 존재하는 이메일입니다.');
						$('#email').removeClass('is-valid');
						$('#email').addClass('is-invalid');
						$('#email_ok_ok').css('display','none'); 
						$('#email_ok').css('display','block');
						
					}else{
						alert('사용 가능한 이메일입니다.')
						$('#email').removeClass('is-invalid');
						$('#email').addClass('is-valid');
						$('#email_ok').css('display','none');
						$('#email_ok_ok').css('display','block');
						$('#email').val(email);
					}				
				},
				error:function(){
					alert("중복확인오류");
					$('#email_ok_ok').css('display','none'); 
					$('#email_ok').css('display','none');
				}						
			});
			
	});	*/
	//////////////////////////**아이디 중복체크:제이쿼리**//////////////////////////////////
	   /*  
		$('#btn_idCheck').click(function() {
			console.log('pleaassssssss');
			const email = $('#user_id').val();
			/* $('#emailck').removeClass('is-valid');
			$('#emailck').removeClass('is-invalid');
			$('#email_ok').css('display','none');
			$('#email_ok_ok').css('display','none'); *
			
			$.ajax({
				url:'/user_idCheck',
				type:'POST',
				data:{
					"user_id":user_id
				},
				success:function(re){
					$('#user_id_msg').css('display','none');
					if(re>0){
						alert('이미 존재하는 아이디입니다.');
						$('#user_id').removeClass('is-valid');
						$('#user_id').addClass('is-invalid');
						$('#user_id_ok_ok').css('display','none'); 
						$('#user_id_ok').css('display','block');
						
					}else{
						alert('사용 가능한 아이디입니다.')
						$('#user_id').removeClass('is-invalid');
						$('#user_id').addClass('is-valid');
						$('#user_id_ok').css('display','none');
						$('#user_id_ok_ok').css('display','block');
						$('#user_id').val(user_id);
					}				
				},
				error:function(){
					alert("중복확인오류");
					$('#user_id_ok_ok').css('display','none'); 
					$('#user_id_ok').css('display','none');
				}						
			});
			
	});	*/
	//////////////////////////**전화번호 중복체크:제이쿼리**//////////////////////////////////
	  /*   
		$('#btn_phoneCheck').click(function() {
			console.log('pleaassssssss');
			const email = $('#user_id').val();
			/* $('#emailck').removeClass('is-valid');
			$('#emailck').removeClass('is-invalid');
			$('#email_ok').css('display','none');
			$('#email_ok_ok').css('display','none'); *
			
			$.ajax({
				url:'/user_phoneCheck',
				type:'POST',
				data:{
					"user_id":user_id
				},
				success:function(re){
					$('#user_phone_message').css('display','none');
					if(re>0){
						alert('이미 존재하는 번호입니다.');
						$('#user_phone').removeClass('is-valid');
						$('#user_phone').addClass('is-invalid');
						$('#user_phone_ok').css('display','none'); 
						$('#user_phone_ok').css('display','block');
						
					}else{
						alert('사용 가능한 번호입니다.')
						$('#user_phone').removeClass('is-invalid');
						$('#user_phone').addClass('is-valid');
						$('#user_phone_ok').css('display','none');
						$('#user_phone_ok_ok').css('display','block');
						$('#user_phone').val(user_id);
					}				
				},
				error:function(){
					alert("중복확인오류");
					$('#user_id_ok_ok').css('display','none'); 
					$('#user_id_ok').css('display','none');
				}						
			});
			
	});	*/

	//////////////////////////**비밀번호 및 비밀번호 확인**//////////////////////////////////
	/*
	let inputPw = document.getElementById('pw'); //패스워드 입력 
	let inputPw_check = document.getElementById('pw_check'); //패스워드 체크 입력

	let pw_length = document.getElementById('pw_length'); //패스워드 길이 메세지
	let pw_match = document.getElementById('pw_match'); // 패스워드 매치 메세지
	let pw_ok = document.getElementById('pw_ok'); // 패스워드 조합 메세지
	
	//패스워드창 클릭하면 메세지 띄우기
	inputPw.onfocus = function () {
		inputPw.classList.add('is-invalid');
		pw_match.style.display = 'block';
		pw_length.style.display = 'block';
		pw_ok.style.display = 'block';
	}

	//패스워드창 클릭 안하면 초록/빨강 인풋 테두리 없에기
	inputPw.onblur = function(){
		inputPw.classList.remove('is-invalid');
		inputPw.classList.remove('is-valid');
	}

	//패스워드창 패스워드 체크
	inputPw.onkeyup = function(){
		let lowerCaseLetters = /[a-z]/g;
		let upperCaseLetters = /[A-Z]/g;
		let numbers = /[0-9]/g;

		//패스워드 8~16자, 대문자, 소문자 다 있으면 메세지 없에기
		if(inputPw.value.match(lowerCaseLetters) && inputPw.value.match(upperCaseLetters) && inputPw.value.match(numbers)){
			pw_ok.style.display = 'none';
		}

		//패스워드 길이 8자 이상이면 메세지 없에기
		if(inputPw.value.length >= 8) {
			pw_length.style.display = 'none';
		}

		//조건 다 맞으면 인풋 테두리 초록
		if (inputPw.value.match(lowerCaseLetters) && inputPw.value.match(upperCaseLetters) && inputPw.value.match(numbers) && (inputPw.value.length >= 8)) {
			inputPw.classList.remove('is-invalid');
			inputPw.classList.add('is-valid');
		}
	}

	//패스워드체크창 클릭하면 빨간테두리
	inputPw_check.onfocus = function() {
		inputPw_check.classList.add('is-invalid');
	}

	//패스워드체크창 나가면 테두리 빼기
	inputPw_check.onblur = function() {
		inputPw.classList.remove('is-invalid');
		inputPw.classList.remove('is-valid');
	}
	
	inputPw_check.onkeyup = function(){
		inputPw_val = document.getElementById('pw').value; //패스워드 입력값
		inputPw_check_val = document.getElementById('pw_check').value; // 패스워드 체크 입력값

		if(inputPw_val === inputPw_check_val) { //두개 값 같아지면 초록테두리 
			inputPw_check.classList.remove('is-invalid');
			inputPw_check.classList.add('is-valid');
			pw_match.style.display = 'none'; //불일치 메세지 없에기
		}
	}
	
}*/
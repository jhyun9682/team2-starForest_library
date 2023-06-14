function UserHtmlContents() {
}
UserHtmlContents.user_login_content = function(sUserId) {
	return `
			<li>
				<a href=""></a>
				<p class="user_name">${sUserId}님</p>
			</li>
	<li class="nav-item" v-bind:title="logout">
				<a href="" class="nav-link" id="a_user_logout_action">
					<i class="fas fa-sign-out-alt"></i></a>
					<p class="sr-only">로그아웃</p>
			</li>
			
	`;
}
UserHtmlContents.user_logout_content = function() {
	return `<li class="nav-item" v-bind:title="login">
				<a href="LoginPage" class="nav-link" id="a_user_login_form">
					<i class="fas fa-sign-in-alt"></i></a>
					<p class="sr-only">로그인</p>
			</li>
			<li class="nav-item" v-bind:title="signup">
				<a href="insertCustomer" class="nav-link" id="a_user_write_form">
					<i class="fas fa-user-plus"></i></a>
					<p class="sr-only">회원가입</p>
			</li>
	`;
}
UserHtmlContents.user_login_form_content = function() {
	return `<h1 class="heroTitle">
				별숲<span class="heroTitle_dot"> : </span> <span class="heroTitle_kor">로그인</span>
			</h1>
			<hr class="heroLine">
			<!-- 로그인 폼 시작 -->
			<form method="post" id="user_login_form">
				<div class="form-group mt-4">
					<input class="form-control form-control-lg loginForm" type="id" id="id" name="id" placeholder="아이디"> 
					<input class="form-control form-control-lg mt-2 loginForm" type="password" id="pw" name="pw" placeholder="비밀번호"> 
					<button class="btn btn-outline-success btn-lg btn-block mt-2 btn-Customer"
						type="submit" id="btn_login_action">로그인</button>
				</div>
			</form>
			<!-- 회원가입 / 아이디찾기 / 비밀번호찾기 -->
			<div id="loginInfo">
				<p class="text-right m-0 noto-serif">아직 별숲 회원이 아니신가요?</p>
				<p class="text-right m-0">
					<a href="insertCustomer" id="user_write_form">회원가입하기 </a>
				</p>
				<hr class="heroLineSecond">
				<p class="text-muted text-center mb-5">
					<a href="#" id="findId" data-toggle="modal" data-target="#emailModal">아이디 찾기</a> 
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="#" id="findPassword" data-toggle="modal" data-target="#pwModal">비밀번호찾기</a>
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
								<label for="username">이름</label> <input type="text"
									id="findEmail_name" name="name" placeholder="이름을 입력하세요"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label for="password">가입 휴대전화번호</label> <input type="tel"
									id="findEmail_cell" name="m_phone"
									placeholder="예시) 010-1234-5678" class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-outline-info btn-Customer"
								id="btn_findId" type="button">내 아이디 찾기</button>
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
								<label for="userId">아이디 </label> 
									<input type="text" id="findPw_name" placeholder="아이디를 입력하세요" class="form-control">
							</div>
							<div class="form-group">
								<label for="password">가입 이메일</label> 
									<input type="email" id="findPw_email" placeholder="예시)hello@library.com"
									class="form-control">
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" id="btn_findPassword"
								class="btn btn-outline-info btn-Customer" data-dismiss="modal">비밀번호
								찾기</button>
						</div>
					</div>
				</div>
			</div>
	`;
}


UserHtmlContents.user_view_content=function(loginUser){
	return `
	<div class="mypage">
				<ul class="nav nav-tabs mypage-tabs">
					<li class="nav-item"><a class="nav-link active" href="#"
						id="myInfo">내정보</a></li>
					<li class="nav-item" ><a class="nav-link" href="passwordCheck"
						id="updatePW" >비밀번호변경</a></li>
					
				</ul>
			</div>
	<table class="table" border=0 cellpadding=0 cellspacing=0>
				<tr>
					<td>
						<!--contents--> <br />
						<table style="padding-left: 20px" border=0 cellpadding=0
							cellspacing=0>
						</table> <!-- view Form  -->
						<form  name="f" method="post">
							<input type="hidden" name="userId" value="${loginUser.user_id}" />
							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tr>
									<td width=140 align=center bgcolor="#ffc91d" height="22"  style=" padding-right: 12px;">이름</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_name}</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="#ffc91d" height="22" style=" padding-right: 12px;">
										아이디</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_id}</td>
								</tr>
								
								<tr>
									<td width=100 align=center bgcolor="#ffc91d" height="22" style=" padding-right: 12px;">이메일
										</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_email}</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="#ffc91d" height="22" style=" padding-right: 12px;">생일</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_birth.substring(0,10)}</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="#ffc91d" height="22" style=" padding-right: 12px;">성별</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_gender}</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="#ffc91d" height="22" style=" padding-right: 12px;">휴대폰번호</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_phone}</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="#ffc91d" height="22" style=" padding-right: 12px;">주소</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_address}</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="#ffc91d" height="22" style=" padding-right: 12px;">대출가능권수</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_book_cnt_limit} 권 / 3 권</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="#ffc91d" height="22" style=" padding-right: 12px;">연체여부</td>
									<td width=490 bgcolor="ffffff" style="padding-left: 10">
										${loginUser.user_rental_status}
										${(loginUser.user_rental_status=='대출불가(연체)')?'<button id="btn_rental_status" class="w-btn w-btn-detail" type="button">자세히</button>':' '}
									<br></td>
								</tr>
								
							</table>
						</form> <br />
						
					</td>
				</tr>
			</table>
	`;
}


UserHtmlContents.user_pwcheck_item=function(loginUser){
	return `<form method="post" id="user_pwCheck">
				<div class="form-group mt-4"><font size=4><img src="./img/detail.png" width=25 height=25>&nbsp&nbsp비밀번호 변경</font><br><br>
					<input type="hidden" name="user_id" value="${loginUser.user_id}">
					변경하고 싶은 비밀번호를 입력해주세요. <br>
					<input type="password" id="user_password" name="user_password" placeholder="비밀번호"> 
					<button style="float:center;" id="btn_PW_action" class="w-btn w-btn-detail" type="button">확인</button><br>
				
				</div>
			</form>
			`;
}
UserHtmlContents.user_modify_form=function(loginUser){
	return `<form id="user_modify_form" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="user_id" value="${loginUser.user_id}">
								<div class="form-group mt-2">
									<label for="name">이름</label>
									<h4 id="id_css">${loginUser.user_name }</h3>
								</div>
								<hr>
								<div class="form-group mt-4">
									<label for="email">비밀번호</label> <span class="signup_required">*</span>
									<div>
										<input type="text" id="password"
											value="${loginUser.user_password}" name="user_password" placeholder="비밀번호를 입력해주세요.">
									</div>
								</div>
								
								<hr>
								<hr>
								<div class="form-group mt-4">
									<label for="email">이메일</label> <span class="signup_required">*</span>
									<div>
										<input type="text" id="email"
											value="${loginUser.user_email}" name="user_email" placeholder="이메일 주소를 입력해주세요.">
									</div>
								</div>
								<hr>
								<div class="form-group mt-4">
									<label for="email">생일</label> <span class="signup_required">*</span>
									<div>
										<input type="text" id="birth"
											value="${loginUser.user_birth.substring(0,10)}" name="user_birth" placeholder="생일을 입력해주세요.">
									</div>
								</div>
								<hr>
								
								<div class="form-group my-4">
									<label for="m_phone">휴대폰번호</label> <span
										class="signup_required">*</span>
									<div class="input-group mb-3">
										<input class="form-control" type="tel" id="user_phone"
											name="user_phone" placeholder="형식) 010-0000-0000"
											value="${loginUser.user_phone }">
									</div>
								</div>
								<hr>
								
								
											&nbsp;
										</div>
									</div>
								</div>
								<button type="submit" id="modify_btn"
									class="btn btn-dark btn-block mb-1 btn-Customer">수정하기</button>
								<button type="button"
									class="btn btn-outline-danger btn-block mb-1 btn-Customer"
									id="remove_btn" data-toggle="modal" data-target="#outModal">회원탈퇴</button>
							</form>
	`;	
}

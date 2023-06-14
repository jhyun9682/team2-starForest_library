function adminContents() {
}
adminContents.admin_total_rental_list_item_content = function(book,i) {
	return `
					
			<tr>
				<th scope="row" style="height:50px;">${i+1}</th>
				<th scope="row">${book.book_title}</th>
				<th scope="row">${book.book_author}</th>
				<th scope="row">${book.book_publisher}</th>
				<th scope="row">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_duedate.substring(0, 10)}</th>
				<th scope="row">${book.rental.user_id}</th>
				<th scope="row"><button id="btn_admin_return" class="w-btn w-btn-detail" book_no="${book.book_no}" user_id="${book.rental.user_id}">반납</button></th>
			</tr>`
				;
}
adminContents.admin_total_rental_list_content = function(rentalTArray) {
	return `
	<div class="mybook">
			 
					<table class="admintable">
						<thead id=tablehead>
							<tr>
								<th scope="row" style="width:70px; height:60px;">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row" style="width:120px">대여일</th>
								<th scope="row" style="width:120px">반납예정일</th>
								<th scope="row" style="width:100px">회원ID</th>
								<th scope="row"style="width:80px">반납</th>
							</tr>
						</thead>
						<tbody>
							<!-- rentalList start -->
								${rentalTArray.map(adminContents.admin_total_rental_list_item_content).join('')
		}
							
							<!-- rentalList end -->
						</tbody>
					</table>
					
					<br>
					<br>
				`;
}

adminContents.admin_user_now_rental_item_content = function(book,i) {
	return `
	
			<tr>
				<th scope="row">${i+1}</th>
				<th scope="row">${book.book_title}</th>
				<th scope="row" style="width:180px">${book.book_publisher}</th>
				<th scope="row">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_duedate.substring(0, 10)}</th>
				<th scope="row">${book.rental.user_id}</th>
				<th scope="row" style="width:100px"><button id="btn_admin_return" class="w-btn w-btn-detail" book_no="${book.book_no}" user_id="${book.rental.user_id}">반납</button></th>

			</tr>`;
}
adminContents.admin_user_now_rental_list_content = function(rentalArray) {
	return `
			
			</div>
					<table class="table" >
						<thead>
							<tr>
								<th scope="row">No.</th>
								<th scope="row">제목</th>
								<th scope="row">출판사</th>
								<th scope="row">대여일</th>
								<th scope="row">반납예정일</th>
								<th scope="row">회원ID</th>
								<th scope="row">반납</th>
							</tr>
						</thead>
						<tbody>
							<!-- rentalList start -->
								${rentalArray.map(adminContents.admin_user_now_rental_item_content).join('')
		}
							
							<!-- rentalList end -->
						</tbody>
					</table>
					
					<br>
					<br>
				`;
}

adminContents.admin_user_list_item = function(user,i) {
	return `
	
	<tr>
				<th scope="row">${i+1}</th>
				<th scope="row">${user.user_name}</th>
				<th scope="row">${user.user_id}</th>
				<th scope="row">${user.user_password}</th>
				<th scope="row" width="100">${user.user_email}</th>
				<th scope="row">${user.user_birth}</th>
				<th scope="row">${user.user_phone}</th>
				<th scope="row">${user.user_rental_status}</th>
				<th scope="row"  width="100">${user.user_book_cnt_limit}</th>
				<th scope="row"><button id="btn_user_delete" class="w-btn w-btn-detail" user_id="${user.user_id}">회원삭제</button></th>
			</tr>`;
}
adminContents.admin_user_list_content = function(userArray) {
	return `
			
			</div>
					<table class="table" align="center" >
						<thead >
							<tr>
								<th scope="row">번호</th>
								<th scope="row">이름</th>
								<th scope="row">아이디</th>
								<th scope="row">비밀번호</th>
								<th scope="row"  width="100">이메일</th>
								<th scope="row">생일</th>
								<th scope="row">핸드폰번호</th>
								<th scope="row">대출상태</th>
								<th scope="row"  width="100">대출가능</th>
								<th scope="row">작업</th>
								
							</tr>
						</thead>
						<tbody>
							<!-- userList start -->
								${userArray.map(adminContents.admin_user_list_item).join('')
		}
							
							<!-- userList end -->
						</tbody>
					</table>
				`;
}
adminContents.admin=function(){
	return `
	<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown">관리자</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="admin"
							id="menu_adminReturn">도서 반납</a></li>
						<li><a id="menu_admin_user" class="dropdown-item" href="user_admin">회원관리</a></li>
						<li><a id="menu_admin_insert_newbook" class="dropdown-item" href="adminNewBook">신착도서 입력</a></li>
					</ul>
				</li>`;
}
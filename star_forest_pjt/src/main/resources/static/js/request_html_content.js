/*<a href="#" class="request_item_a" board_no="${requestBoard.board_no}" ${(requestBoard.board_status=='공지사항')?'style="color:pink; font-weight=bold;"':'style="color:black;"'}>
				${requestBoard.board_title}*/
function request_item_content(requestBoard){
	return `<tr id="table2">
		<td width=5% align=center class=t2><font size=2 color=#000000>${requestBoard.board_no}</td>
		<td width="300" bgcolor="ffffff" style="padding-left: 10">
		
		
				<a href="#" class="request_item_a" board_no="${requestBoard.board_no}" ${(requestBoard.board_status=='공지사항')?'style="color:#1c7b3a; font-weight:900;"':'style="color:black;"'}>
				
				${
								function(){
									var html='';
									
									if(requestBoard.board_status=='공지사항'){
										html=`<img src="img/notice_d.png" width=150px; height=40px;>`;
									}
									
									for(var i=0; i<requestBoard.board_depth;i++){
										html+=`&nbsp;&nbsp;&nbsp&nbsp&nbsp`;
									}
									if(requestBoard.board_depth>0){
									html+=`<img src="img/reply.png" width=70px;>`;
									}
									return html;
									 }()
	              }
	               ${requestBoard.board_title}
	               </a>
				
		<td width=7% align=right class=t3><font size=2 color=#000000>${requestBoard.user_id}</font></td>
		<td width=10% align=center class=t3><font size=2 color=#000000>${requestBoard.board_status}</font></td>
		<td width=10% align=center class=t3><font size=2 color=#000000>${requestBoard.board_date.substring(0,10)}</font></td>
		<td width=5% align=center class=t3><font size=2 color=#000000>${requestBoard.board_readcount}</font></td>
		</tr>`;
}
/*
function request_page_content(pageArray){
	return `
				<div class="page_area">
					<ul id="page">
				 		 <!-- 이전페이지 버튼 -->
                    	<li class="pageInfo_btn previous"><a href="requestBoard?pageNum='${pageArray.startPage-1}'">Previous</a></li>
                    	
						<li>${pageArray.startPage}
						<li>${pageArray.endPage}
						<!--이걸.. startPage 부터 endpage가 끝날때까지 뽑아야하는 거잖아..-->
						<!--<%=for(var num=pageArray.startPage; num<=pageArray.endPage; num++){}-->
	                    <li class="page_btn"><a href="requestBoard?pageNum='${pageArray.cri.pageNum}'">${pageArray.cri.pageNum}</a></li>
	                     <!-- 다음페이지 버튼 -->
	                    <li class="pageInfo_btn next"><a href="requestBoard?pageNum='${pageArray.endPage + 1 }'">Next</a></li>
	                    
               		</ul>
				</div>
			</div>
			</div>
			<form id = "moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageArray.cri.pageNum }">
        	<input type="hidden" name="amount" value="${pageArray.cri.amount }">    
			</form>
	`;
}
*/
//onClick="location.href='requestBoard?pageNum=${pageArray.cri.pageNum}&keyword=${pageArray.cri.keyword}&type=${pageArray.cri.type}'"
function request_list_content(requestArray,pageArray) {
	return `<table>
	
		<thead>
		<tr id="table1" align=center style="background-color:#ffc91d;">
		<td width=5% align=center class=t1><font size=2 color=#000000>번호</td>
		<td width=40% align=center class=t1><font size=2 color=#000000>제목</td>
		<td width=7% align=center class=t1><font size=2 color=#000000>작성자</td>
		<td width=10% align=center class=t1><font size=2 color=#000000>진행상태</td>
		<td width=10% align=center class=t1><font size=2 color=#000000>날짜</td>
		<td width=5% align=center class=t1><font size=2 color=#000000>조회수</td>
		</tr>
		</thead>
		
		<tbody>
			<!--requestBoard start-->
				${
					requestArray.map(request_item_content).join('')
				}
			<!--requestBoard end-->
		</tbody>
		
		</table>
		<div>
		<input type="button" id="btn_write" value="희망도서 신청하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
		<form id="page_form">
				<div class="search_wrap">
					<input type="hidden" name="pageNum" id="pageNum_hidden" value="${pageArray.cri.pageNum?pageArray.cri.pageNum:1}">
	        		<input type="hidden" name="amount" value="${pageArray.cri.amount?pageArray.cri.amount:10}">   
			        <div class="search_area">
			        	<select name="type" id="type_box" >
			        		${
								function(){
									if(pageArray.cri.type ==='board_title'){
											return`
												<option value="board_title" selected="selected">제목</option>
		                						<option value="board_content">내용</option>
		                						<option value="user_id" >작성자</option>
		                						`
									}
									if(pageArray.cri.type ==='board_content'){
											return`
												<option value="board_title" >제목</option>
		                						<option value="board_content" selected="selected">내용</option>
		                						<option value="user_id" >작성자</option>
		                						`
									}
									if(pageArray.cri.type ==='user_id'){
											return`
												<option value="board_title" >제목</option>
		                						<option value="board_content">내용</option>
		                						<option value="user_id" selected="selected">작성자</option>
		                						`
									}
									return`
											<option value="board_title" selected="selected">제목</option>
	                						<option value="board_content">내용</option>
	                						<option value="user_id" >작성자</option>
	                						`
							
								}()
				
							}
		                	
		           		 </select>    
			            <input type="text" id="keyword_box" name="keyword" value="${(pageArray.cri.keyword==null)?'':pageArray.cri.keyword}" style="margin-left:60px;">
			            <input type="button" id="search_btn" value="검색" >
			        </div>
	  	  		</div>    
  	  	  </form>
  	  	
		<div class="page_area">
	
					<ul id="page">
				 		
				 		
				 		<!-- 이전페이지 버튼 -->
				 		${
							function(){
								var prev = pageArray.prev;
								var html='';
								if(prev){
									html=`<li class="page_btn_prev"><a href="requestBoard?pageNum=${pageArray.startPage-1}" pageNum=${pageArray.startPage-1}>Prev</a></li>`
								}
								return html;
							}()
						}
                    	${
							function(){
								var html='';	
							 	for(var i=pageArray.startPage;i <= pageArray.endPage;i++){
							 		html+=`<li class="page_btn ${pageArray.cri.pageNum == i ? 'active':'' }"><a href="requestBoard?pageNum=${i}" pageNum=${i}>${i}</a></li>`;
								}							
								return html;
							}()
	                    }
	                    
	                     <!-- 다음페이지 버튼 -->${
							function(){
								var next = pageArray.next;
								var html='';
								if(next){
									html=`<li class="page_btn_next"><a href="requestBoard?pageNum=${pageArray.endPage + 1 }" pageNum=${pageArray.endPage+1}>Next</a></li>`
								}
								return html;
							}()
						}
	                    
	                    
               		</ul>
               		
		</div>
			
			
			
		`;
}
/*
function request_list(pageArray){
	$.each(pageArray,function(i,pageArray.))
	
	for(var num=pageArray.startPage; num<=pageArray.endPage;num++){
		<li class="page_btn"><a href="requestBoard?pageNum='${pageArray.cri.pageNum}'">${pageArray.cri.pageNum}</a></li>
	}
}
*/
	
/*
<div class="search_wrap">
	        <div class="search_area">
	        	//*<!--<input type="text" name="keyword" value="${pageMaker.cri.keyword }">-->//
	            <input type="text" name="keyword" value="">
	            <button>Search</button>
	        </div>
  	  	</div>    
*/

/*
function request_write_form_content() {
	return `<table width="0" border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td>
						<!--contents--> <br>
						<table style="padding-left: 10px" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리 -
											방명록 쓰기</b></td>
								</tr>
							</tbody>
						</table> <!-- guest write Form  -->
						<form id="guest_write_form" name="f" method="post">
							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tbody>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">이름</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_name"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">이메일</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_email"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">홈페이지</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_homepage"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">타이틀</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 240" name="guest_title"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">내용</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><textarea wrap="soft"
												style="width: 240px" rows="10" name="guest_content"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form> <br>
						<table width="590" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="center"><input type="button" value="방명록쓰기" id="btn_guest_write_action"> &nbsp; 
									<input type="button" id="btn_guest_list" value="방명록목록"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>`;
}
*/
function request_view(requestBoard){
	return `
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<form name="f" method="post">
								<input type="hidden" name="board_no" value="${requestBoard.board_no}">
								<input type="hidden" name="board_groupno" value="${requestBoard.groupno}">
								<table border="0" cellpadding="0" cellspacing="1" width="400" bgcolor="BBBBBB">
									<tbody><tr>
										<td bgcolor="#ffc91d" height="22" class="t4">번호</td>
										<td class="t5">${requestBoard.board_no}</td>
									</tr>
									<tr>
										<td bgcolor="#ffc91d" height="22" class="t4">작성자</td>
										<td class="t5">${requestBoard.user_id}</td>
									</tr>
									<tr>
										<td bgcolor="#ffc91d" height="22" class="t4">날짜</td>
										<td class="t5">${requestBoard.board_date.substring(0,10)}</td>
									</tr><tr>
										<td bgcolor="#ffc91d" height="22" class="t4">조회수</td>
										<td class="t5">${requestBoard.board_readcount}</td>
									</tr>
									<tr>
										<td bgcolor="#ffc91d" height="22" class="t4">진행상태</td>
										<td class="t5">${requestBoard.board_status}</td>
									</tr>
									<tr>
										<td bgcolor="#ffc91d" height="22" class="t4">카테고리</td>
										<td class="t5">${requestBoard.category_name}</td>
									</tr>
									<tr>
										<td bgcolor="#ffc91d" height="22" class="t4">제목</td>
										<td class="t5">${requestBoard.board_title}</td>
									</tr>
									<tr>
										<td bgcolor="#ffc91d" height="22" class="t4">내용</td>
										<td id="td_content" class="t5"><pre style="font-size:12pt;">${requestBoard.board_content}</pre></td>
									</tr>
								</tbody></table>
							</form>
							<div class="btn_mrl">
							
										<input type="button" value="수정" id="btn_request_modify_form" board_no="${requestBoard.board_no}"> &nbsp; 
										<input type="button" value="삭제" id="btn_request_remove_action" board_groupno="${requestBoard.board_groupno}" board_no="${requestBoard.board_no}"> &nbsp; 
										<input type="button" value="목록" id="btn_request_list">
							</div>
	
	`
}
/*
										<input type="button" value="${(requestBoard.user_id=='soyoon')?'답글쓰기':'수정'}" id="btn_request_modify_form" board_no="${requestBoard.board_no}"> &nbsp; 
*/
function request_modify_form(requestBoard){
	return `
	<table width="800">
			<tbody>
					<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>도서신청게시판 -
											게시글 수정</b></td>
				    </tr>
			</tbody>
			</table> 
			<!-- request modify Form  -->
						<form id="request_modify_form" name="f" method="post">
							<input type="hidden" name="board_no" value="${requestBoard.board_no}">
							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tbody>
									<tr>
										<td width="100" align="center" bgcolor="#ffc91d" height="22">작성자</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">${requestBoard.user_id}</td>
									</tr>
								
									<tr>
										<td width="100" align="center" bgcolor="#ffc91d" height="22">진행상태</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select name="board_status">
												<option value="신청접수" selected>${requestBoard.board_status}</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="#ffc91d" height="22">제목</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 350px" name="board_title" value="${requestBoard.board_title}"></td>
									</tr>
									
									<tr>
										<td width="100" align="center" bgcolor="#ffc91d" height="22">신청도서 카테고리</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select name="category_name">
											<option value="건강/취미/레저" ${(requestBoard.category_name=='건강/취미/레저')?'selected':''}>건강/취미/레저</option>
											<option value="경제경영" ${(requestBoard.category_name=='경제경영')?'selected':''}>경제경영</option>
											<option value="고전" ${(requestBoard.category_name=='고전')?'selected':''}>고전</option>
											<option value="과학" ${(requestBoard.category_name=='과학')?'selected':''}>과학</option>
											<option value="만화" ${(requestBoard.category_name=='만화')?'selected':''}>만화</option>
											<option value="사회과학" ${(requestBoard.category_name=='사회과학')?'selected':''}>사회과학</option>
											<option value="소설/시/희곡" ${(requestBoard.category_name=='소설/시/희곡')?'selected':''}>소설/시/희곡</option>
											<option value="기타" ${(requestBoard.category_name=='기타')?'selected':''}>기타</option>	
											</select>
											</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="#ffc91d" height="22">내용</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
				
											<textarea wrap="soft"
												style="width: 500px" rows="10" name="board_content">
${requestBoard.board_content}
												</textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form> <br>
						<input type="button" value="확인" id="btn_request_modify_action"> &nbsp; 
						<input type="button" id="btn_request_list" value="목록">
	
	`
}

/***************user_request_list******************/
function user_request_item_content(requestBoard) {
	return `
	
	<tr>
				<th scope="row">${requestBoard.board_title}</th>
				<th scope="row" style="width:130px;">${requestBoard.board_date.substring(0,10)}</th>
				<th scope="row">${requestBoard.board_content}</th>
				<th scope="row">${requestBoard.board_status}</th>
				<th scope="row">${requestBoard.category_name}</th>
				
			</tr>`;
}
function user_request_list_content(requestArray) {
	return `
	<h2>희망도서신청내역</h2>
			
	<div class="mybook">
			
			</div>
					<table class="tableList" width="100%">
						<thead>
							<tr>
								<th scope="row">제목</th>
								<th scope="row">신청날짜</th>
								<th scope="row">내용</th>
								<th scope="row">신청상태</th>
								<th scope="row">카테고리</th>
							</tr>
						</thead>
						<tbody>
							<!-- rentalList start -->
								${requestArray.map(user_request_item_content).join('')
		}
							
							<!-- rentalList end -->
						</tbody>
					</table>
				`;
}
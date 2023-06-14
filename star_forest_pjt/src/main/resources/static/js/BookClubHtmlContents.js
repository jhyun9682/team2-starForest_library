function BookClubHtmlContents() {
}

BookClubHtmlContents.club_item_html = function(club) {
	return `
			<div class="rentalTable">
					<table class="table" style="width: 750px">
						<thead style="border: 1px solid #dee2e6">
							<tr>
								<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;font-weight:bold"><font size="4">${club.club_no}
								</font></td>
								<td colspan="1" style="padding:0px;text-align:left;padding-left: 30px;font-weight:bold"><font size="4">
									<a href="#" class="club_item" club_no="${club.club_no}"> ${club.club_name} </a>
								</td>
								<td colspan="4" style="padding:10px;text-align:right;padding-right: 30px;font-weight:bold"><font size="4">조회 ${club.club_readcount}
								</td>
								
								
							</tr>
						</thead>
						<tbody>
							<tr id="rental_item_"
								style="border: 1px solid #dee2e6; height: 250px;">
	
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed; padding:0px;text-align:middle;padding-left: 20px"><img src="./img/book_club.png" width=150 height=150>
								</td>
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed; padding:0px;text-align:left;padding-left: 30px">대상 : ${club.club_person} <br> 모집인원 : ${club.club_count}명 <br> 시간 : ${club.club_time} <br> 장소 : ${club.club_place}
								</td><input type="hidden" value="${club.club_content}">
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed;padding:0px;text-align:center;padding-left: 0px">
								
								

									
									<button id="btn_detail" class="w-btn w-btn-detail" club_no="${club.club_no}" type="button">자세히</button><br>
									<button id="btn_join" class="w-btn w-btn-join" club_no="${club.club_no}" type="button">신&nbsp;&nbsp;&nbsp;청</button>
							
						
	
	
							</tr>
							<tr id="rental_item_"></tr>
						</tbody>
					</table>
					
				</div>`;
}


BookClubHtmlContents.club_join_html = function(bookClubArray,pageArray) {
	return `
	<img src="img/book_club_notice.png" width="700px;" style="margin-left:30px;"><br><br><br>
	<div class="category" id="btn_category">
				            <div>
				             <button type="button" id="btn_all" value="all" style="width:50px" >전체</button>
				             <button type="button" id="btn1" value="100" style="width:130px">건강/취미/레저</button>
				             <button type="button" id="btn1" value="200" style="width:80px">경제경영</button>
				             <button type="button" id="btn1" value="300" style="width:50px">고전</button>
				             <button type="button" id="btn1" value="400" style="width:50px">과학</button> 
				             <button type="button" id="btn1" value="500" style="width:50px">만화</button>
				             <button type="button" id="btn1" value="600" style="width:85px">사회과학</button>
				             <button type="button" id="btn1" value="700" style="width:120px">소설/시/희곡</button>
				             <br>
				        </div>
							<br><br>
	
								<div class="rentalTable">
									${bookClubArray.map(BookClubHtmlContents.club_item_html).join('')
		}
								</div>
							<div class="page_area">
		<form id="page_form" method="get">
		<input type="hidden" name="pageNum" id="pageNum_hidden" value="${pageArray.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageArray.cri.amount}">    
					<ul id="page" >
				 		
				 		
				 		<!-- 이전페이지 버튼 -->
				 		${
							function(){
								var prev = pageArray.prev;
								var html='';
								if(prev){
									html=`<li class="page_btn_prev" ><a href="bookclub?pageNum=${pageArray.startPage-1}" pageNum=${pageArray.startPage-1}>Prev</a></li>`
								}
								return html;
							}()
						}
                    	${
							function(){
								var html='';	
							 	for(var i=pageArray.startPage;i <= pageArray.endPage;i++){
							 		html+=`<li class="page_btn ${pageArray.cri.pageNum == i ? 'active':'' }"><a href="bookclub?pageNum=${i}" pageNum=${i}>${i}</a></li>`;
								}							
								return html;
							}()
	                    }
	                    
	                     <!-- 다음페이지 버튼 -->${
							function(){
								var next = pageArray.next;
								var html='';
								if(next){
									html=`<li class="page_btn_next"><a href="bookclub?pageNum=${pageArray.endPage + 1 }" pageNum=${pageArray.endPage+1}>Next</a></li>`
								}
								return html;
							}()
						}
	                    
	                    
               		</ul>
               		</form>
		</div>
									
									
							`;
}

BookClubHtmlContents.club_cate_item_html = function(club) {
	return `
			<div class="rentalTable">
					<table class="table" style="width: 750px">
						<thead style="border: 1px solid #dee2e6">
							<tr>
								<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;font-weight:bold"><font size="4">${club.club_no}
								</font></td>
								<td colspan="1" style="padding:0px;text-align:left;padding-left: 30px;font-weight:bold"><font size="4">
									<a href="#" class="club_item" club_no="${club.club_no}"> ${club.club_name} </a>
								</td>
								<td colspan="4" style="padding:10px;text-align:right;padding-right: 30px;font-weight:bold"><font size="4">조회 ${club.club_readcount}
								</td>
								
								
							</tr>
						</thead>
						<tbody>
							<tr id="rental_item_"
								style="border: 1px solid #dee2e6; height: 250px;">
	
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed; padding:0px;text-align:middle;padding-left: 20px"><img src="./img/book_club.png" width=100 height=100>
								</td>
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed; padding:0px;text-align:left;padding-left: 30px">대상 : ${club.club_person} <br> 모집인원 : ${club.club_count}명 <br> 시간 : ${club.club_time} <br> 장소 : ${club.club_place}
								</td><input type="hidden" value="${club.club_content}">
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed;padding:0px;text-align:center;padding-left: 0px">
								
								

									
									<button id="btn_detail" class="w-btn w-btn-detail" club_no="${club.club_no}" type="button">자세히</button><br>
									<button id="btn_join" class="w-btn w-btn-join" club_no="${club.club_no}" type="button">신&nbsp;&nbsp;&nbsp;청</button>
							
						
	
	
							</tr>
							<tr id="rental_item_"></tr>
						</tbody>
					</table>
					
				</div>`;
}


BookClubHtmlContents.club_cate_join_html = function(bookClubArray) {
	return `<div class="category" id="btn_category">
				            <div>
				             <button type="button" id="btn_all" value="all" style="width:50px" >전체</button>
				             <button type="button" id="btn1" value="100" style="width:130px">건강/취미/레저</button>
				             <button type="button" id="btn1" value="200" style="width:80px">경제경영</button>
				             <button type="button" id="btn1" value="300" style="width:50px">고전</button>
				             <button type="button" id="btn1" value="400" style="width:50px">과학</button> 
				             <button type="button" id="btn1" value="500" style="width:50px">만화</button>
				             <button type="button" id="btn1" value="600" style="width:85px">사회과학</button>
				             <button type="button" id="btn1" value="700" style="width:120px">소설/시/희곡</button>
				             <br>
				        </div>
							<br><br>
	
								<div class="rentalTable">
									${bookClubArray.map(BookClubHtmlContents.club_cate_item_html).join('')
		}
								</div>
							`;
}

BookClubHtmlContents.admin_club_item_html = function(club) {
	return `
			<div class="rentalTable">
					<table class="table" style="width: 750px">
						<thead style="border: 1px solid #dee2e6">
							<tr>
								<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;font-weight:bold"><font size="4">${club.club_no}
								</font></td>
								<td colspan="1" style="padding:0px;text-align:left;padding-left: 30px;font-weight:bold"><font size="4">
									<a href="#" class="club_item" club_no="${club.club_no}"> ${club.club_name} </a>
								</td>
								<td colspan="4" style="padding:10px;text-align:right;padding-right: 30px;font-weight:bold"><font size="4">조회 ${club.club_readcount}
								</td>
								
								
							</tr>
						</thead>
						<tbody>
							<tr id="rental_item_"
								style="border: 1px solid #dee2e6; height: 250px;">
	
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed; padding:0px;text-align:middle;padding-left: 20px"><img src="./img/book_club.png" width=150 height=150>
								</td>
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed; padding:0px;text-align:left;padding-left: 30px">대상 : ${club.club_person} <br> 모집인원 : ${club.club_count}명 <br> 시간 : ${club.club_time} <br> 장소 : ${club.club_place}
								</td>
								<td colspan="2" style="width: 250px; height: 250px;word-break:break-all;table-layout:fixed;padding:0px;text-align:center;padding-left: 0px">
								
								

									
									<button id="btn_update" class="w-btn w-btn-detail" club_no="${club.club_no}" type="button">수&nbsp;&nbsp;&nbsp;정</button><br>
									<button id="btn_remove" class="w-btn w-btn-join" club_no="${club.club_no}" type="button">삭&nbsp;&nbsp;&nbsp;제</button>
							
						
	
	
							</tr>
							<tr id="rental_item_"></tr>
						</tbody>
					</table>
					
				</div>`;
}
BookClubHtmlContents.admin_club_join_html = function(bookClubArray) {
	return `<div class="category" id="btn_category">
				            <div>
				             <button type="button" id="btn_all" value="all" style="width:50px" >전체</button>
				             <button type="button" id="btn1" value="100" style="width:130px">건강/취미/레저</button>
				             <button type="button" id="btn1" value="200" style="width:80px">경제경영</button>
				             <button type="button" id="btn1" value="300" style="width:50px">고전</button>
				             <button type="button" id="btn1" value="400" style="width:50px">과학</button> 
				             <button type="button" id="btn1" value="500" style="width:50px">만화</button>
				             <button type="button" id="btn1" value="600" style="width:85px">사회과학</button>
				             <button type="button" id="btn1" value="700" style="width:120px">소설/시/희곡</button>
				             <br>
				        </div>
							<br><br>

	
								<div class="rentalTable">
									${bookClubArray.map(BookClubHtmlContents.admin_club_item_html).join('')
		}
								</div>
							
									
									
							`;
}

BookClubHtmlContents.club_detail_html = function(club) {
	return ` <img src="./img/detail.png" width=25 height=25>&nbsp&nbsp도서동아리 > 자세히 
											<div class="rentalTable">
												<table class="table" style="width: 855px">
													<br>
													<tbody>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7 ">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">이름
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_name}
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7 ">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">대상
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_person}
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">모집인원
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_count}&nbsp 명
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">장소
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_place}
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">시간
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_time}
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 130px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">내용
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_content}
															</td>
															
								
								
														</tr>
														<tr 
															style=" height: 130px; ">
								
															<td colspan="5" >
															<button id="btn_club_join" class="w-btn w-btn-detail" club_no="${club.club_no}" type="button">신청</button>
															
															
															<button id="btn_list" class="w-btn w-btn-detail" type="button">목록</button><br>
															</td>
															
															
								
								
														</tr>
														
													</tbody>
												</table>
											</div>
									`;
}
BookClubHtmlContents.admin_club_detail_html = function(club) {
	return ` <img src="./img/detail.png" width=25 height=25>&nbsp&nbsp도서동아리 > 자세히 
											<div class="rentalTable">
												<table class="table" style="width: 855px">
													<br>
													<tbody>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7 ">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">이름
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_name}
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7 ">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">대상
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_person}
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">모집인원
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_count}&nbsp 명
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">장소
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_place}
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">시간
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_time}
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 130px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">내용
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															${club.club_content}
															</td>
															
								
								
														</tr>
														<tr 
															style=" height: 130px; ">
								
															<td colspan="5" >
															
															
															<button id="btn_list" class="w-btn w-btn-detail" type="button">목록</button><br>
															</td>
															
															
								
								
														</tr>
														
													</tbody>
												</table>
											</div>
									`;
}
BookClubHtmlContents.club_user_item_html=function(loginUser,i){
	return `  	
				<tr>
					<th scope="row">${i+1}</th>
					<th scope="row">${loginUser.club_name}</th>
					<th scope="row">${loginUser.club_person}</th>
					<th scope="row">${loginUser.club_time}</th>
					<th scope="row">${loginUser.club_place}</th>
				</tr>
	`;
}
BookClubHtmlContents.club_user_list_html=function(bookClubArray){
	return `  
	<h2>동아리 신청 내역</h2>
	<table width="100%" class="tableList">
	<thead>
		<tr>
			
			
					<th scope="row">번호</th>
					<th scope="row">이름</th>
					<th scope="row">대상</th>
					<th scope="row">시간</th>
					<th scope="row">장소</th>
				
		</tr>
		</thead>
		
       
                    <tbody id="tbody">
                    ${bookClubArray.map(BookClubHtmlContents.club_user_item_html).join('')}
                    </tbody>    
                </table>
	`;
}

BookClubHtmlContents.club_write_form_html=function(){
	return `<img src="./img/detail.png" width=25 height=25>&nbsp&nbsp도서동아리
								> 작성
								<form id="club_write_form" name="f" method="post">
									<table class="table" style="width: 855px">
										<br>
										<tbody>
											
											
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">이름
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_name">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 130px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">카테고리
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<select name="category_no" id="category">
															<option value="100">건강/취미/레저</option>
															<option value="200">경제경영</option>
															<option value="300">고전</option>
															<option value="400">과학</option>
															<option value="500">만화</option>
															<option value="600">사회과학</option>
															<option value="700">소설/시/희곡</option>
													</select>
												</td>
											</tr>

											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">대상
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_person">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">모집인원
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_count">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">장소
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_place">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">시간
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_time">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 130px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">내용
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<textarea wrap="soft" style="width: 500px" rows="10"
														name="club_content">
															
															</textarea>
												</td>
											</tr>
											
											<tr style="height: 130px;">

												<td colspan="5">
													<button id="btn_write_action" class="w-btn w-btn-detail"
														type="button">작성</button>


													<button id="btn_list" class="w-btn w-btn-detail"
														type="button">목록</button>
													<br>
												</td>




											</tr>

										</tbody>
									</table>
								</form>
	`;
}
BookClubHtmlContents.club_modify_form_html=function(club){
	return `<img src="./img/detail.png" width=25 height=25>&nbsp&nbsp도서동아리
								> 수정
								<form id="club_modify_form" name="f" method="post">
									<input type="hidden" name="club_no" value="${club.club_no}">
									<table class="table" style="width: 855px">
										<br>
										<tbody>
											
											
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">이름
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_name" value="${club.club_name}">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">대상
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_person" value="${club.club_person}">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">모집인원
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_count" value="${club.club_count}">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">장소
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_place" value="${club.club_place}">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">시간
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_time" value="${club.club_time}">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 130px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">내용
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" style="width:500px" name="club_content" value="${club.club_content}" } >
												</td>



											</tr>
											
											<tr style="height: 130px;">

												<td colspan="5">
													<button id="btn_modify_action" class="w-btn w-btn-detail"
														type="button" >수정</button>


													<button id="btn_list" class="w-btn w-btn-detail"
														type="button">목록</button>
													<br>
												</td>




											</tr>

										</tbody>
									</table>
								</form>
	`;
}
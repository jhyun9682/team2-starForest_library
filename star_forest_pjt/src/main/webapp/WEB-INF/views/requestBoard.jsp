<%@page import="com.itwill.domain.RequestBoard" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->

<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="css/ddoyoon.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<title>커뮤니티 - 별숲도서관</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/request_html_content.js"></script>
<script type="text/javascript">
/*************************************************/
	function board_list_json(param){
	console.log(param)	   
	$.ajax({
				url:'request_list_json',
				method:'GET',
				data:param,
				success:function(jsonResult){
					var requestArray = jsonResult.data;
					var pageArray = jsonResult.pageMaker[0];
					console.log(jsonResult);
					$('#requestBoard_wrap').html(request_list_content(requestArray,pageArray));
					//$('#page_wrap').html(pageArray);
				}
			});
	}
	/***********************************************/
	$(function() {
		var param=$('#page_form').serialize();
		board_list_json(param);
		
		$(document).on('click','.page_btn a,.page_btn_next a , .page_btn_prev a', function(e){
			var pageNum=$(e.target).attr('pageNum');
			$("#page_form input[name='pageNum']").val(pageNum);
			
			param=$('#page_form').serialize();
			console.log(">>>>>>>"+param);
			board_list_json(param);
	        
			e.preventDefault();
	    });
	
		$(document).on('click','#search_btn',function(e){
			
			 //var pageNum = $("#page_form input[name='pageNum']").val();
			 //var keyword= $("input[name='keyword']").val();
			 //var type= $("#type_box option:selected").val();
			 param= $('#page_form').serialize();
			 board_list_json(param);
			
			
		});
		
		
		
		
		
		$(document).on('click','#btn_write',function(e){
			$.ajax({
			url:'login_check',
			method:'GET',
			success:function(jsonResult){
				if(jsonResult.code==2){
					
				//alert(jsonResult.msg);
				Swal.fire({
							  title: '',
							  text: jsonResult.msg,
							  icon: 'success',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '확인'
							}).then((result) => {
							  if (result.isConfirmed) {
								  location.href='user';
							  }
							})
				}else if(jsonResult.code==1){
				location.href='requestBoard_write_form';
		}
			}
		});
		});
		/*
		게시물리스트
		*/
		
		$(document).on('click','#menu_RequestBoard',function(e){
			$.ajax({
				url:'request_list_json',
				method:'GET',
				success:function(jsonResult){
					var requestArray = jsonResult.data;
					var pageArray = jsonResult.pageMaker[0];
					console.log(requestArray);
					$('#requestBoard_wrap').html(request_list_content(requestArray,pageArray));
					//$('#page_wrap').html(pageArray);
				}
			});
			e.preventDefault();
		});
		
		/*
		requestBoard 게시물 상세보기
		*/
		$(document).on('click','.request_item_a',function(e){
			var board_no=$(e.target).attr('board_no');
			var param='board_no='+board_no;
			console.log(param);
			$.ajax({
				url:'request_view_json',
				method:'GET',
				data:param,
				success:function(jsonResult){
					var item = jsonResult.data[0];
					$('#requestBoard_wrap').html(request_view(item));
				}
			});
			
			
		});
		
		
		/*
		게시물 수정
		*/
		
		$(document).on('click','#btn_request_modify_form',function(e){
			
			var board_no = $(e.target).attr('board_no');
			var param = 'board_no='+board_no;
			$.ajax({
				
				url:'request_modify_form',
				method:'POST',
				data: param,
				success:function(jsonResult){
					var item = jsonResult.data[0];
					if(jsonResult.code==1){
					$('#requestBoard_wrap').html(request_modify_form(item));
					}else if(jsonResult.code==2){
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
					}else if(jsonResult.code==0){
						Swal.fire({
							  title:'' ,
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
			
			
		});
		
		
		$(document).on('click','#btn_request_modify_action',function(e){
			var param=$('#request_modify_form').serialize();
			console.log(param);
			$.ajax({
				url:'request_modify_action',
				method:'POST',
				data:param,
				success: function(jsonResult){
					console.log(jsonResult);
					if(jsonResult.code==1){
						var param ='board_no='+$("#request_modify_form input[name='board_no']").val();
						$.ajax({
						    url:'request_view_json',
						    method:'GET',
						    dataType:'json',
						   	data:param,
						    success:function(jsonResult){
						    	$('#requestBoard_wrap').html(request_view(jsonResult.data[0]));
						    }
						});
						Swal.fire({
							  title: '',
							  text: jsonResult.msg,
							  icon: 'success',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '확인'
							}).then((result) => {
							  if (result.isConfirmed) {
							  
							    
							  }
							})
					}else if(jsonResult.code==2){
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
						//alert(jsonResult.msg);
					}else if(jsonResult.code==0){
						Swal.fire({
							  title: '',
							  text:jsonResult.msg,
							  icon: 'error',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '확인'
							}).then((result) => {
							  if (result.isConfirmed) {
							  
							    
							  }
							})
						//alert(jsonResult.msg);
					}
				}
			});
			
			
		});
		
		$(document).on('click','#btn_request_remove_action',function(e){
			var param = 'board_groupno='+$(e.target).attr('board_groupno');
			console.log(param);
			$.ajax({
				
				url:'request_remove_action',
				method:'POST',
				data: param,
				success:function(jsonResult){
					console.log(jsonResult);
					if(jsonResult.code==1){
						Swal.fire({
							  title: '',
							  text: jsonResult.msg,
							  icon: 'success',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '확인'
							}).then((result) => {
							  if (result.isConfirmed) {
							   location.href="requestBoard";
							    
							  }
							})
						//alert(jsonResult.msg);
						//$('#btn_request_list').trigger('click');
					}else if(jsonResult.code==2){
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
						//alert(jsonResult.msg);
					}else if(jsonResult.code==0){
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
						//alert(jsonResult.msg);
					}else if(jsonResult.code==3){
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
		});
		
		
		$(document).on('click','#btn_request_list',function(e){
			location.href='requestBoard';
			
		});
		
	});
</script>

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
							<h2>도서신청게시판</h2>
						</div>
					</div>
				</div>
			</div>
		</header>

		<!-- MAIN SECTION -->
		&nbsp;&nbsp;&nbsp;
		<br><br>
		<img alt="" src="img/request_notice.png" width=700px;>
			<br><br><br>
		<!-- 검색 SECTION -->
		<!--  
		<div class="search_wrap">
	        <div class="search_area">
	            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
	            <button>Search</button>
	        </div>
  	  	</div>    
		-->
		<div id="requestBoard_wrap">
		<!--  
		<table>
	
		<thead>
		<tr id="table1" align=center style="background-color:pink;">
		<td width=5% align=center class=t1><font size=2 color=#000000>번호</td>
		<td width=30% align=center class=t1><font size=2 color=#000000>제목</td>
		<td width=15% align=center class=t1><font size=2 color=#000000>작성자</td>
		<td width=10% align=center class=t1><font size=2 color=#000000>진행상태</td>
		<td width=10% align=center class=t1><font size=2 color=#000000>날짜</td>
		<td width=5% align=center class=t1><font size=2 color=#000000>조회수</td>
		</tr>
		</thead>
		
		<tbody>
			<!--requestBoard start
		<c:forEach items="${requestBoard }" var="reqeustBoard">
		<tr id="table2">
		<td width=5% align=center class=t1><font size=2 color=#000000>${requestBoard.board_no}</td>
		<td width="300" bgcolor="ffffff" style="padding-left: 10">
				<a href="#" class="request_item_a" board_no="${requestBoard.board_no}">
				${requestBoard.board_title}
				</a>
		<td width=15% align=center class=t1><font size=2 color=#000000>${requestBoard.user_id}</font></td>
		<td width=10% align=center class=t1><font size=2 color=#000000>${requestBoard.board_status}</font></td>
		<td width=10% align=center class=t1><font size=2 color=#000000>${requestBoard.board_date.substring(0,10)}</font></td>
		<td width=5% align=center class=t1><font size=2 color=#000000>${requestBoard.board_readcount}</font></td>
		</tr>
		</c:forEach>
			<!--requestBoard end
		</tbody>
		
		</table>
		<div>
		<input type="button" id="btn_write" value="희망도서 신청하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		-->
		</div>
		
			<div id="page_wrap">
			 <!-- 
				  <div class="page_area">
			<ul id="page">
			
				<!-- 이전페이지 버튼
				<c:if test="${pageMaker.prev}">
					<li class="page_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>
				
				<!-- 각 번호 페이지 버튼
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
				</c:forEach>
				
				<!-- 다음페이지 버튼
				<c:if test="${pageMaker.next}">
					<li class="page_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>	
				
			</ul>
			 -->
		</div>
			</div>
		<%-- 	<form id="moveForm" method="get">	
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
			<input type="hidden" name="type" value="${pageMaker.cri.type }">	
			</form> --%>
			
		<!-- pageContent끝 -->	
			
			
		</div>	
		<!-- .footer-navigation -->
	<!-- footer start-->
	&nbsp;
	&nbsp;
	&nbsp;
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->


  

   <script>
      // Get the current year for the copyright
      $('#year').text(new Date().getFullYear());
   
      window.onload=function(){
         //푸터 명언
         const footer_display = document.getElementById('footer-display');
         const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
         const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
         footer_display.textContent =footer_quotes[footer_getQuote];
      }
	</script>
</body>
</html>
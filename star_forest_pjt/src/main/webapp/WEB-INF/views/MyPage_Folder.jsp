<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/yeji.css">
<link rel="stylesheet" type="text/css" href="./css/faq.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<link rel="stylesheet" type="text/css" href="./css/wang_hw.css">
<link rel="stylesheet" type="text/css" href="./css/delete_btn_hw.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript" src="./js/BookClubHtmlContents.js"></script>
<script type="text/javascript" src="./js/UserHtmlContents.js"></script>
<script type="text/javascript" src="./js/UserBookHtmlContents.js"></script>
<script type="text/javascript" src="./js/FavoriteHtmlContents.js"></script>
<script type="text/javascript" src="./js/request_html_content.js"></script>
<script type="text/javascript">
/*************animate number*************/
function animateNumber(count){
	$({ val : 0 }).animate({ val : count }, {
	  duration: 2500,
	  step: function() {
	    var num = numberWithCommas(Math.floor(this.val));
	    $(".count").text(num);
	  },
	  complete: function() {
	    var num = numberWithCommas(Math.floor(this.val));
	    $(".count").text(num);
	  }
	});
	

}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/**********************************/
$(function(){
		
				
	
		/************club_list************/
		$(document).on('click','#side_user_club,#user_club_list',function(e){
			$.ajax({
				url:'club_user_list',
				method:'POST',
				success:function(jsonResult){
					if(jsonResult.code==1){
						var bookClubArray=jsonResult.data;
						$('#myPageList').html(BookClubHtmlContents.club_user_list_html(bookClubArray));
					}else if(jsonResult.code==2){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
					}
				}
			});
			e.preventDefault();
		});
		
		/***********user_view**********/
		
		$.ajax({
				url:'user_view',
				method:'POST',
				dataType:'json',
				success:function(jsonResult){
					if(jsonResult.code==1){
						$('#myPageList').html(UserHtmlContents.user_view_content(jsonResult.data[0]));
					}else if(jsonResult.code==2){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
					}
				}
			});
		$(document).on('click','#mypage,#side_mypage',function(e){
			$.ajax({
				url:'user_view',
				method:'POST',
				dataType:'json',
				success:function(jsonResult){
					if(jsonResult.code==1){
						$('#myPageList').html(UserHtmlContents.user_view_content(jsonResult.data[0]));
					}else if(jsonResult.code==2){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
					}
				}
			});
			e.preventDefault();
		});
		
		
		/*********user_rental_list***********/
		$(document).on('click','#side_userbook_status,#userbook_status',function(e){
			$.ajax({
				url:'user_rental_list',
				method:'POST',
				dataType:'json',
				success:function(jsonResult){
					if(jsonResult.code==1){
						var rentalArray=jsonResult.data;
						console.log(rentalArray);
						$('#myPageList').html(UserBookHtmlContents.user_rental_list_content(rentalArray));
						console.log($('.count').text().trim());
						animateNumber($('.count').text().replace('쪽','').trim());
					}else if(jsonResult.code==2){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
					}
				}
			});
			e.preventDefault();
		});
		
		/*********회원이 현재 대출중인 도서 리스트***********/
		$(document).on('click','#side_now_userbook_status',function(e){
			$.ajax({
				url:'user_now_rental_list',
				method:'POST',
				dataType:'json',
				success:function(jsonResult){
					if(jsonResult.code==1){
						var rentalArray=jsonResult.data;
						$('#myPageList').html(UserBookHtmlContents.user_now_rental_list_content(rentalArray));
					}else if(jsonResult.code==2){
						Swal.fire({
		                       title:'' ,  text: jsonResult.msg,
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
					}
				}
			});
			e.preventDefault();
		});
		
		/*********회원의 총 예약 리스트***********/
		$(document).on('click','#side_reservation',function(e){
			$.ajax({
				url:'reservation_list',
				method:'POST',
				//data:'user_id='+$(e.target).attr("user_id"),
				dataType:'json',
				success:function(jsonResult){
					if(jsonResult.code==1){
						var reservationArray=jsonResult.data;
						$('#myPageList').html(UserBookHtmlContents.user_reservation_list_html(reservationArray));
					}else if(jsonResult.code==2){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
					}
				}
			});
			e.preventDefault();
		});
		
		//예약삭제
		$(document).on('click','#btn_delete_res',function(e){
			$.ajax({
				url:'reservation_delete',
				method:'POST',
				data:'book_no='+$(e.target).attr('book_no'),
				success:function(jsonResult){
					if(jsonResult.code==1){
						Swal.fire({
		                       title:'',  text: jsonResult.msg,
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
						
					}else if(jsonResult.code==2){
						Swal.fire({
							  title: '',
							  text: '다시 시도하십시오.',
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
				
			})
			
			
		})
		
		
		/***********user_request_list***********/
		$(document).on('click','#side_user_request_list',function(e){
			$.ajax({
				url:'user_request_list',
				method:'POST',
				success:function(jsonResult){
					if(jsonResult.code==1){
						var requestArray=jsonResult.data;
						$('#myPageList').html(user_request_list_content(requestArray));
					}else if(jsonResult.code==0){
						Swal.fire({
		                       title: '',  text: jsonResult.msg,
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
					}
				}
			});
			e.preventDefault();
		});
		
		/************favorite_list*************/
		
		$(document).on('click','#side_favorite,#user_favorite',function(e){
			$.ajax({
				url:'favorite_list',
				method:'POST',
				success:function(jsonResult){
					var favoriteArray=jsonResult.data;
					console.log(favoriteArray);
					$('#myPageList').html(FavoriteHtmlContents.favorite_list_content(favoriteArray));
				}
			});
		e.preventDefault();
	});
		
		/**********favorite_delete************/
		$(document).on('click','#btn_delete',function(e){
			var param='favorite_no='+$(e.target).attr('favorite_no');
			console.log(param);
			$.ajax({
				url:'favorite_delete_by_no',
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
		                       }
		                     })
						$('#side_favorite').trigger('click');
						var favoriteArray=jsonResult.data;
						$('#myPageList').html(FavoriteHtmlContents.favorite_list_content(favoriteArray));
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
		
		/**********favorite_Alldelete************/
		$(document).on('click','#btn_all_delete',function(e){
			
		$.ajax({
			url:'favorite_remove',
			method:'POST',
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
					var favoriteArray=jsonResult.data;
					$('#myPageList').html(FavoriteHtmlContents.favorite_list_content(favoriteArray));
				}else{
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
		
		/*******대출정지기간 및 여부확인**********/
		$(document).on('click','#btn_rental_status',function(e){
			var param='user_id='+$(e.target).attr('user_id');
			$.ajax({
				url:'user_rental_status',
				method:'POST',
				success:function(jsonResult){
					if(jsonResult.code==-1){
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
							url:'user_view',
							method:'POST',
							dataType:'json',
							success:function(jsonResult){
								if(jsonResult.code==1){
									$('#myPageList').html(UserHtmlContents.user_view_content(jsonResult.data[0]));
								}else if(jsonResult.code==2){
									Swal.fire({
					                       title: '',  text: jsonResult.msg,
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
								}
							}
						});
					} else if(jsonResult.code==1){
						alert(jsonResult.msg);
						$.ajax({
							url:'user_view',
							method:'POST',
							dataType:'json',
							success:function(jsonResult){
								if(jsonResult.code==1){
									$('#myPageList').html(UserHtmlContents.user_view_content(jsonResult.data[0]));
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
									location.href='user';
					                       }
					                     })
								}
							}
						});
					} else if(jsonResult.code==2){
						Swal.fire({
		                       title:'',  text:  jsonResult.msg,
		                       icon: 'error',
		                       showCancelButton: false,
		                       confirmButtonColor: '#3085d6',
		                       cancelButtonColor: '#d33',
		                       confirmButtonText: '확인'
		                     }).then((result) => {
		                       if (result.isConfirmed) {
		                       }
		                     })
						$.ajax({
							url:'user_view',
							method:'POST',
							dataType:'json',
							success:function(jsonResult){
								if(jsonResult.code==1){
									$('#myPageList').html(UserHtmlContents.user_view_content(jsonResult.data[0]));
								}else if(jsonResult.code==2){
									Swal.fire({
					                       title:'',  text:  jsonResult.msg,
					                       icon: 'error',
					                       showCancelButton: false,
					                       confirmButtonColor: '#3085d6',
					                       cancelButtonColor: '#d33',
					                       confirmButtonText: '확인'
					                     }).then((result) => {
					                       if (result.isConfirmed) {
									location.href='user';
					                       }
					                     })
								}
							}
						});
					}
				}
			});
			e.preventDefault();
		});
		
		/**********대출 기간 연장 7일************/
		$(document).on('click','#btn_extend_rental',function(e){
					$(this).prop("disabled", true);
		$.ajax({
			url:'extend_rental',
			method:'POST',
			data: 'book_no='+$(e.target).attr('book_no'),
			success:function(jsonResult){
				if(jsonResult.code==1){
					Swal.fire({
	                       title: '',  text:  jsonResult.msg,
	                       icon: 'success',
	                       showCancelButton: false,
	                       confirmButtonColor: '#3085d6',
	                       cancelButtonColor: '#d33',
	                       confirmButtonText: '확인'
	                     }).then((result) => {
	                       if (result.isConfirmed) {
					$('#side_now_userbook_status').trigger('click');
	                       }
	                     })
				}else{
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
		
	
	
});		

</script>
<title>나의도서 - 별숲도서관</title>

</head>

<body class="d-flex flex-column">
	<div id="page-content">
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
	</div>
	<!-- navigation end-->
	<!-- PAGE HEADER -->
	<header id="page-header">
			<div class="darkOverlay">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<h1>나의도서</h1>
						</div>
					</div>
				</div>
			</div>
		</header>

	<!-- MAIN SECTION -->
	<section id="contact" class="py-3">
		<div class="container">
			<div class="row">
				<!-- 사이드바 -->
				<div class="col-md-3">
					<div class="sidebar  noto-serif">
						<div class="side-head">
							<h4 class="text-light" style="text-align:center; color:black !important; font-weight: 900 !important">나의도서</h4>
						</div>
						<ul class="list-group list-group-flush mb-5" id="menu">
							<li class="list-group-item"><a href="MyPage_Folder"
								id="side_favorite">내서재</a></li>
							<li class="list-group-item"><a href="MyPage_Folder"
								id="btn_mypage">마이페이지</a>
								<ul class='submenu'>
									<li><a href="MyPage_Folder" id="side_mypage">내정보</a></li>
									<li><a href="MyPage_Info" id="side_update">개인정보변경</a></li>
									<li><a href="user_qr" id="side_user_qr">나의QR</a></li>
								</ul></li>
							<li class="list-group-item"><a href="#"
								id="side_userbook_status">나의도서정보</a>
								<ul class='submenu'>
									<li><a href="#" id="side_userbook_status">대출현황</a></li>
									<li><a href="#" id="side_reservation">예약현황</a></li>
									<li><a href="#" id="side_now_userbook_status">현재대출현황</a></li>
								</ul></li>

							<li class="list-group-item"><a href="MyPage_Folder"
								id="side_user_club">동아리신청내역</a></li>
							<li class="list-group-item"><a href="MyPage_Folder"
								id="side_user_request_list">희망도서신청내역</a></li>

						</ul>
					</div>
				</div>

				<!-- 메인내용 -->
				<div class="col-md-9 fol_div">


					<div class="container-fluid">
						<div class="row">

							<div class="col-sm-6">
							</div>
						</div>
					</div>

					<div class="container">
						<div id="myPageList" class="myPage" >


						</div>
					</div>

				</div>

			</div>
		</div>
	</section>

	<!-- .footer-navigation -->
	<!-- footer start-->
	<!-- footer end-->


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
		src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

	<script type="text/javascript">
		// Get the current year for the copyright
		$('#year').text(new Date().getFullYear());

		$(function(){
			//푸터 명언
			const footer_display = document.getElementById('footer-display');
			const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
			const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
			footer_display.textContent =footer_quotes[footer_getQuote];
		});
	</script>
</body>
<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
</html>
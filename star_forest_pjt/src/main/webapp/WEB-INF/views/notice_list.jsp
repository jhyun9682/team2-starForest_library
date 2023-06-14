<%@page import="com.itwill.domain.Notice" %>
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
<style>
  a:link {
  color : black;
}
a:visited {
  color : black;
}
a:hover {
  color : black;
}
a:active {
  color : black;
}
</style>
<!-- 구글폰트 전체 기본적용 END -->

<link rel="stylesheet" href="css/style.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<title>커뮤니티 - 별숲도서관</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/request_html_content.js"></script>
<script type="text/javascript">
</script>
<script type="text/javascript">

$(function(){
	$(document).on('click', '#12331', function(){
		location.href="write"
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
							<h2>공지사항게시판</h2>
						</div>
					</div>
				</div>
			</div>
		</header>
		
   
   <!-- MAIN SECTION -->
   <div class="shortcodes_area section_padding_100">
        <div class="container">
            <div class="row">
            <!-- 사이드바 -->
	         <div class="col-md-3">
					  <div class="sidebar noto-serif">
							<div class="side-head">
								<h4 class="text-light text-center" style="color:black !important; font-weight: 900 !important">도서관소개</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
								<li class="list-group-item"><a href="howtoInfo">대출/반납</a></li>
								<li class="list-group-item active"><a href="notice_list">공지사항</a></li>
								<li class="list-group-item"><a href="faqViewpage">자주묻는질문</a></li>						
								<li class="list-group-item"><a href="addrViewpageAPI">오시는길</a></li>
							</ul>
					  </div>
					</div>
                <div class="col-md-9">
            <div class="row py-4">
               <!-- 공지사항 게시판 글쓰기버튼 관리자만 보임 -->
               <br><br>
                <img alt="" src="img/my_notice.png" width="300px;" style="margin-left:260px; margin-top:40px;">
               <c:if test="${sUserId=='admin'}">
                 <button class="btn btn-outline-success" id="12331" style="float:right; margin-left:760px;">글쓰기</button>
                 </c:if>
              <!-- 비로그인시 cust_no를 0으로 설정 -->
              <c:if test="${empty sUserId }">
                 <c:set var="cust_no" value="0"></c:set>
              </c:if>
               </div>
               <table class="tableList" style="width:100%">
                  <tr id="table1" align="center" >
                  <thead >
                     <tr>
                        <th style="width:100px"></th>
                        <th style="width:500px">제목</th>
                        <th style="width:250px">작성일</th>
                        <th style="width:200px">조회수</th>
                     </tr>
                     </thead>
                  <tbody id="notice_list_tbody">
                                
                  <!-- board start -->
                  <c:forEach var="notice" items="${noticeList.itemList}">
	              	<tr>
	                <th><img src="img/notice.png"></th>
	                <th>
	                	<a href="notice_detail?notice_no=${notice.notice_no}&pageno=${noticeList.pageMaker.curPage}">${notice.notice_title}</a>
	                </th>
	                <th style="width:300px !important;"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.notice_date}"/> </th>
	                <th>${notice.notice_readcount}</th>
	                </tr>
                   </c:forEach>
                    <!-- board end -->
                 
                                </tbody>
                            </table>
						
                        </div>
					<%-- <input type="button" class="notice_btn write_form" pageno="${pageno}" value="게시글작성" /> --%>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-12 col-lg-9">
                    <!-- Shop Pagination Area -->
                    <div class="shop_pagination_area mt-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination pagination-sm justify-content-center">

                            	<c:if test="${noticeList.pageMaker.prevPage > 0}">  
	            					<li class="page-item">
	                                    <button class="page-link" onclick="changeQnaList(${data.pageMaker.prevPage});"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
	                               	 </li>
                                </c:if>
                                <c:forEach var="no" begin="${noticeList.pageMaker.blockBegin}" end="${noticeList.pageMaker.blockEnd}">
									<c:if test="${noticeList.pageMaker.curPage == no}">
										<li class="page-item active"><button class="page-link" href="#">${no}</button></li>
									</c:if>
									<c:if test="${noticeList.pageMaker.curPage != no}">
										<li class="page-item"><button class="page-link page" onclick="changeQnaList(${no})">${no}</button></li>
									</c:if>
                                </c:forEach>
                                <c:if test="${noticeList.pageMaker.curPage < noticeList.pageMaker.totPage}">  
	                                <li class="page-item">
				                        <button class="page-link" onclick="changeQnaList(${noticeList.pageMaker.nextPage})"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
			                    	 </li>
                                </c:if>

                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            
            
            
         </div>
    </div> 
   </div>

  <!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->



  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="js/notice/notice.js" defer></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

  </script>
  <script type="text/javascript">
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
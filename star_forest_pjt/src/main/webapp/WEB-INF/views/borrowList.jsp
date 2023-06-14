<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
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
   <link rel="stylesheet" href="css/BookCart.css">
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
   <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
  <title>도서정보 - 딜리브러리</title>
 <!-- 구글폰트 전체 기본적용 -->
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
   <!-- 구글폰트 전체 기본적용 END -->
<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
<link rel="stylesheet" type="text/css" href="css/wang_hw.css">
<link rel="stylesheet" type="text/css" href="css/return_btn_YT.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
  
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"   src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
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
                 <h2>대출현황</h2>
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
         <div class="col-md-3 noto-serif">
           <div class="sidebar">
               <div class="side-head">
                  <h4 class="text-light">대출현황</h4>
               </div>
               <ul class="list-group list-group-flush mb-5">
                  <li class="list-group-item"><a href="mypage_main.do?cust_no=${cust_no }">나의도서정보</a></li>
                  <li class="list-group-item active"><a href="borrowList.do">대출현황</a></li>
                  <li class="list-group-item"><a href="return_borrowList.do">대출반납/이력</a></li>
                  <li class="list-group-item"><a href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>               
                  <li class="list-group-item"><a href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
               </ul>
           </div>
         </div>
         
         <!-- 메인내용 -->
         <div class="col-md-9">
           <div class="p-4">
            <section id="contact" class="py-3">
              <button type="button" id="manage_btn" class="noto-serif">관리</button>
                 <div class="btn" id="return_btn">
                
              <div class="btn-back">
                <p>정말 반납 하시겠습니까?</p>
                <button class="yes">Yes</button>
                <button class="no">No</button>
              </div>
              
              <div class="btn-front noto-serif">반납</div>
            </div>
              
              
               <div class="cards">
                           <c:if test="${empty b }">
                  <h3> 대여목록이 없습니다.</h3><br>
                  <h5><a href="popularBook.do"> 인기도서 페이지 목록으로 이동</a></h5><br>
               </c:if>
               


               
               <c:if test="${not empty b }">
               <c:set var="now" value="<%=new java.util.Date()%>" />
               <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now_date"/>
               <c:forEach var="b" items="${b }"> 
               <input type="hidden" value="${b.return_date }" id="return_date_ok">
               
               
               <fmt:parseDate value="${now_date}" var="strPlanDate" pattern="yyyy-MM-dd"/>
               <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
<%--                ${now } --%>
               <fmt:parseDate value="${b.return_date}" var="endPlanDate" pattern="yyyy-MM-dd"/>
               <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
<%--                ${endDate} --%>


                 <div class="card">
                   <div class="card_image-holder">
                     <img class="card_image" src="${b.b_image }" alt="wave" />
                     <div class="card-text "id="book-title">${b.b_title }</div>
                     
                   </div>
                   <div>
                     <div class="card-text">${b.b_writer }
                  <c:if test="${b.return_ok eq 'P' }">
                     <b class="btn btn-outline-warning btn-sm" style = "width: 80px; display: inline-block;">반납 대기</b>
                  </c:if>
                  <c:if test="${b.return_ok != 'P' && now<=b.return_date }" >
                     <b class="btn btn-outline-success btn-sm" style= "display: inline-block;">대여 중</b>
                  </c:if>
                     <p class="m-0">대여일 : ${b.bor_date }</p>
                    <p class="m-0">반납 예정일 : ${b.return_date }</p>
                        <input type="checkbox" name="delete_check_name" value="${b.bor_no }" style="display: none;" class="delete_check">
                    
                    <c:if test="${(endDate - strDate) < 0}">
                       <p class="m-0" style="color: red;">연체일수 : ${(endDate - strDate)*-1 }일</p>
                    </c:if>
                    <c:if test="${(endDate - strDate) >= 0}">
                       <p class="m-0">&nbsp;</p>
                    </c:if>
                   </div>
                   </div>
                 </div>
               </c:forEach>
               </c:if>
          </div>
      </section>
   </div>
   </div>
   </div>
   </div>
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


  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

   <script>
      // Get the current year for the copyright
      $('#year').text(new Date().getFullYear());

      
      $('.slider').click({
         infinite: true,
         slideToShow: 1,
         slideToScroll: 1
       });

       
      window.onload=function(){
         //푸터 명언
         const footer_display = document.getElementById('footer-display');
         const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이 제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
         const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
         footer_display.textContent =footer_quotes[footer_getQuote];
      }
      
      const date=new Date();
      const today = moment(date).format('YYYY-MM-DD');
      const return_date = document.getElementById('return_date_ok').value;
      console.log(today);
      console.log(return_date);
      if(today < return_date){
         console.log("연체 안됨");
      }else{
         console.log("연체 중");
      }
         
   </script>
</body>
</html>



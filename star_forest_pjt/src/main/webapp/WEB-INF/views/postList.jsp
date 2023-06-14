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
   <link rel="stylesheet" href="css/post.css">
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  <title>커뮤니티 - </title>
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
   

   <!-- 커뮤니티 헤더 -->
   <header id="page-header" class="noto-serif">
   <div class="page-header-overlay">
      <div class="container pt-5">
        <div class="row">
            <div class="col m-auto text-center">
              <c:if test="${group eq 10}">
                  <h2>공지사항</h2>
               </c:if>
              <c:if test="${group eq 20}">
                  <h2>창작물 게시판</h2>
               </c:if>
               <c:if test="${group eq 30}">
                  <h2>중고장터</h2>
               </c:if>
               <c:if test="${group eq 40}">
                  <h2>묻고답하기</h2>
               </c:if>
               <c:if test="${group eq 60}">
                  <h2>자유게시판</h2>
               </c:if>
            </div>
        </div>
      </div>
   </div>
   </header>
   
   <!-- MAIN SECTION -->
   <section id="contact" class="pt-3 pb-5">
      <div class="container noto-serif">
        <div class="row">
         <!-- 사이드바 -->
         <div class="col-md-3">
            <c:choose>
               <c:when test="${group eq 10 || group eq 40 }">
                  <div class="sidebar">
                     <div class="side-head">
                        <h4 class="text-light">도서관소개</h4>
                     </div>
                     <ul class="list-group list-group-flush mb-5">
                        <li class="list-group-item"><a href="howtoInfo">대출/반납/연장</a></li>
                        <li id="post10" class="list-group-item"><a href="postList?option=p_title&search=&group=10">공지사항</a></li>
                        <li class="list-group-item"><a href="faqViewpage">자주묻는질문</a></li>
                        <li class="list-group-item"><a href="QnaList?option=p_title&search=">묻고답하기</a></li>
                        <li class="list-group-item"><a href="addrViewpageAPI">오시는길</a></li>
                     </ul>
                 </div>      
               </c:when>
               <c:otherwise>
                  <div class="sidebar">
                     <div class="side-head">
                        <h4 class="text-light">커뮤니티</h4>
                     </div>
                     <ul class="list-group list-group-flush mb-5">
                        <li id="post20" class="list-group-item"><a href="postList?option=p_title&search=&group=20" class="returnAll">창작물게시판</a></li>
                        <li id="post30" class="list-group-item"><a href="postList?option=p_title&search=&group=30" class="returnAll">중고장터</a></li>
                        <li id="post60" class="list-group-item"><a href="postList?option=p_title&search=&group=60" class="returnAll">자유게시판</a></li>
                     </ul>
                 </div>
               </c:otherwise>
            </c:choose>
         </div>
         
         <!-- 메인내용 -->
         <div class="col-md-9">
            <div class="row py-4">
            <div class="col pb-4">
               <!-- 공지사항 게시판 글쓰기버튼 관리자만 보임 -->
               <c:if test="${group==10&&sUserId==1 }">
                 <button class="btn btn-outline-success" onclick="postInsert()">글쓰기</button>
                 </c:if>
               <!-- 나머지 게시판은 전부 -->
                 <c:if test="${group==20 ||group==30 ||group==60 }">
                 <button class="btn btn-outline-success" onclick="postInsert()">글쓰기</button>
                 </c:if>                     
              <!-- 비로그인시 cust_no를 0으로 설정 -->
              <c:if test="${empty sUserId }">
                 <c:set var="cust_no" value="0"></c:set>
              </c:if>
               </div>
               <div class="text-right mb-2">
                  <form action="postList" method="get" class="search form-inline">
                     <div class="form-group">
                        <p class="mr-2 mb-0">총 ${totalCount}건</p>
                     </div>
                     <div class="form-group noto-sans">
                 <select name="option" size="1" class="form-control">
                       <option value="p_title">제목</option>
                       <option value="p_writer">작성자</option>
                       <option value="p_content">내용</option>
                    </select>
                 <input type="search" name="search" class="form-control mr-2">
                 <input type="hidden" name="group" value="${group }">
                     </div>
                     <div class="form-group px-2">
                 <button class="btn btn-outline-secondary"><i class="fas fa-search"></i></button>
                     </div>
              </form>
               </div>
               <table class="table table-hover">
                  <thead class="bg-light text-center">
                     <tr>
                        <th>&nbsp;</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>첨부파일</th>
                     </tr>
                  </thead>
                  <tbody class="tbody text-center noto-sans">
                  
                     <%-- <c:forEach var="notice" items="${noticeList.itemList }">
                        <tr>
                           <td scope="row" width="5%">${p.p_no%10000 }</td>
                           <td width="40%" class="text-left">
                              <a href="postDetail?p_id=${p.p_id}&&group=${group}">
                                 <c:choose>
                                    <c:when test="${group==10 }">[공지]</c:when>
                                    <c:when test="${group==20||group==30 }">[${p.p_option}]</c:when>
                                 </c:choose>
                                 ${p.p_title }
                                 <c:if test="${group==40 }">
                                    <c:if test="${not empty p.p_option}"><i class="fas fa-check-circle"></i></c:if>
                                 </c:if>
                              </a>
                           </td>
                           <td>${p.p_writer }</td>
                           <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${p.p_regdate }" /></td>
                           <td width="10%" class="text-center">${p.p_hit }</td>
                        </tr>
                     </c:forEach> --%>
                     
                     <c:forEach var="notice" items="${noticeList.itemList}">
	                                    <tr>
	                                    <!-- 
	                                        <th scope="row">${notice.notice_no}</th>
	                                         -->
	                                         <th>
	                                         	<c:if test="${notice.setting eq '1'}">
	                                        			&nbsp;&nbsp;<img src="img/notice.png" width="20" height="20">
	                                        		</c:if>
	                                        		<c:if test="${notice.setting eq '0'}">
	                                        			&nbsp;&nbsp;<span class="badge badge-normal"></span>
	                                        		</c:if>
	                                         </th>
	                                        <td>
	                                       
	                                       
	                                        	<a href="notice_view?notice_no=${notice.notice_no}&pageno=${noticeList.pageMaker.curPage}">
	                                        		${notice.notice_title}
	                                        		
	                                        		
	                                        		 
	                                        	</a>
	                                        	
	                                        
	                                        </td>
	                                        <td>${notice.notice_date}</td>
	                                        <td>${notice.notice_readcount}</td>
	                                    </tr>
                                    </c:forEach>
			                     	<!-- board end -->
			                 
			                                </tbody>
			                            </table>
									
			                        </div>
			                    </div>
								<input type="button" class="notice_btn write_form" pageno="${pageno}" value="게시글작성" />
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
                  </tbody>
               </table>
            </div>
            <!-- 페이징처리 -->
            <%-- <nav>
            <ul class="pagination justify-content-center">
              <c:if test="${startPage > 1}">
                <li class="page-item"><a class="page-link" id="page-link" href="postList?pageNUM=${startPage-1 }&group=${group}">
                     <span>&laquo;</span>
              <span class="sr-only">이전 페이지</span>
                  </a></li>
              </c:if>
              <c:if test="${startPage == 1}">
                <li class="page-item disabled"><a class="page-link" id="page-link" href="postList?pageNUM=${startPage-1 }&group=${group}">
                     <span>&laquo;</span>
                <span class="sr-only">이전 페이지</span>
                  </a></li>
              </c:if>
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                 <li class="page-item" id="page${i }"><a class="page-link" id="page-link" href="postList?pageNUM=${i }&group=${group}">${i }</a></li>
                 </c:forEach>
              <c:if test="${endPage < totalPage}">              
                 <li class="page-item"><a class="page-link" id="page-link" href="postList?pageNUM=${endPage+1 }&group=${group}">
                     <span>&raquo;</span>
              <span class="sr-only">다음 페이지</span>
                  </a></li>
              </c:if>
              <c:if test="${endPage == totalPage}">
                  <li class="page-item disabled"><a class="page-link" id="page-link" href="postList?pageNUM=${endPage+1 }&group=${group}">
                        <span>&raquo;</span>
                <span class="sr-only">다음 페이지</span>
                     </a></li>
              </c:if>
        </nav> --%>
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
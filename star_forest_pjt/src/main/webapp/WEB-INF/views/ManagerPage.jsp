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
<title>별숲도서관</title>

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="stylesheet" href="./css/style.css">

<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>

<!-- 외부 CSS, JS 파일 링크 -->
<link rel="stylesheet" href="./css/HomeCSS.css">
<script type="text/javascript" src="./js/HomeJS.js"></script>


<style type="text/css">
#tabs {
	text-align: center;
}

#manage-area {
	margin: 0 auto;
	padding: 0;
}

.manage-table {
	margin: 0 auto;
	font-size: medium;
	text-align: center;
}

.table-wrapper {
	height: 800px;
	overflow: scroll;
}

th {
	border-bottom: 3px black solid;
}

tr {
	border-bottom: 1px black solid;
}

.radios {
	display: none;
}

label {
	cursor: pointer;
}
</style>

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

		<!-- MANAGERPAGE CONTENTS -->
		<div id="tabs" style="font-weight: bold;" class="py-3">
			<label for="cust">회원관리</label>&nbsp;&nbsp;&nbsp; <label for="book">도서관리</label>&nbsp;&nbsp;&nbsp;
			<label for="post">게시글관리</label>&nbsp;&nbsp;&nbsp; <label for="borrow">대여정보관리</label>&nbsp;&nbsp;&nbsp;

			<input type="radio" name="tab" class="radios" id="cust"
				checked="checked"> <input type="radio" name="tab"
				class="radios" id="book"> <input type="radio" name="tab"
				class="radios" id="post"> <input type="radio" name="tab"
				class="radios" id="borrow">
		</div>

		<div class="manage-area text-center">
			회원번호 : <input type="text" class="update-input" name="cust_no">
			회원명 : <input type="text" class="update-input" name="name">
			관리자구분 : <input type="text" class="update-input" name="manager">
			<button class="update-ok">수정확인</button>
			<button class="delete-ok">삭제확인</button>
			<div class="table-wrapper">
				<table class="manage-table">
					<tr>
						<th>회원번호</th>
						<th>회원명</th>
						<th>관리자구분</th>
						<th>작업</th>
					</tr>

				</table>
			</div>
		</div>

		
</body>
</html>
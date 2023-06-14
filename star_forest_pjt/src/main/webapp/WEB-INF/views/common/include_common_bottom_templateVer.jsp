<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/style.css" type="text/css">

	<footer id="new_footer" class="text-center p-4 noto-serif">
      		<div id="footer-display"></div>
          		<div id="newdiv">Copyright &copy;
            <span id="year"></span> STARFOREST</div>
  </footer>
	
 <!--<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
   <script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript"   src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script> -->


<script type="text/javascript">
	const footer_display = document.getElementById('footer-display');
	const footer_quotes = [
			'책 속에는 과거의 모든 영혼이 가로누워 있다. - 칼라일',
			'내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스',
			'A word after a word after a word is power. – Margaret Atwood',
			'책이란 넓디넓은 시간의 바다를 지나가는 배이다. - 프랜시스 베이컨',
			'목적이 없는 독서는 산보일 뿐이다. — B. 리튼',
			'사람은 책을 만들고, 책은 사람을 만든다. — 신용호',
			'Think before you speak. Read before you think. – Fran Lebowitz',
			'Books are a uniquely portable magic. – Stephen King',
			'책은 한 권 한 권이 하나의 세계다. — W. 워즈워스',
			'We read to know we are not alone. – C.S. Lewis' ];
	const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
	footer_display.textContent = footer_quotes[footer_getQuote];
</script>

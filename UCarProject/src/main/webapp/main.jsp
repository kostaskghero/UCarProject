<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>main</title>
<!-- [추가]JSon 관련 부분  150605,01h13m-->
<script type="text/javascript" src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	var xhr;
	function startRequest() {
		var searchWord = document.getElementById("word").value;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;
		/* alert(searchWord); */
		/* xhr.open("get", "search.do?command=searchMainPage&&searchWord="+searchWord, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8"); */
		xhr.open("post", "${initParam.root}/search.do", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf-8");
		xhr.send("command=searchMainPage&&searchWord=" + searchWord);

		/* xhr.send(null); */
	}
	function callback() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				document.getElementById("listdiv").innerHTML = "<c:set var='list' value='${sessionScope.option}'/>";

				location.reload();

				$('#word').val("");/* 왜 인지는 모르겠지만 이 코드가 있어야 main에서 검색시 검색어 값이 그대로 유지된다 */

			}
		}
	}

	function login() {
		location.href = "${initParam.root}/member.do?command=login&&memberId="
				+ $('#username').val() + "&&memberPw=" + $('#password').val();
	}

	function winOpenForFind() {
		window.open("${initParam.root}/member/member_Find_Id.jsp", "",
				"resizable=true, toolbar=no,width=600, height=400");

	}
	
	function winOpenForMyPage() {
		window.open("${initParam.root}/member/member.jsp", "",
				"scrollbars=yes,resizable=true, toolbar=no,width=600, height=400");

	}
</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Sweet and cheery.">
<meta name="author" content="Thomas Park">

<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<link href="${initParam.root}/css/bootstrap.min.css" rel="stylesheet">
<link href="${initParam.root}/css/bootswatch.css" rel="stylesheet">
<link href="${initParam.root}/css/login.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="${initParam.root}/js/bootstrap.min.js"></script>
<script src="${initParam.root}/js/application.js"></script>
<script src="${initParam.root}/js/bootswatch.js"></script>
<script src="${initParam.root}/js/login.js"></script>
<script src="${initParam.root}/js/jquery-canvas-sparkles.js"></script>
<script>
	$(document).ready(function() {
		// first we need an element with sparkles
		$("img").sparkle();
	});
</script>
</head>

<div class="container">
	<!-- 헤더그림 -->

	<!-- UP네비게이션 바 -->
	<div id="div1" class="bs-docs-section clearfix">
		<div id="div2" class="row">
			<div id="div3" class="col-lg-12">
				<nav id="nav5" class="navbar navbar-default">
					<div id="div5" class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-2">
						<form class="navbar-form navbar-left">
							<div class="form-group">
								<div align="center">
									<a class="btn btn-default btn-xs" href="#"><marquee
											width="200"> 공지사항입니다.JSTL넣으세여</marquee></a>
								</div>
							</div>
						</form>
						<form name="searchForm" class="navbar-form navbar-right"
							role="search">
							<div class="form-group">
								<%--                         <input type="text" class="form-control input-sm" placeholder="Search" value="${sessionScope.searchWord }"> --%>
								<input type="text" id="word" class="form-control input-sm"
									placeholder="Search" value="${sessionScope.searchWord }">


							</div>
							<!-- [수정] Ajax 추가 -->
							<button type="button" value="비동기 통신" onclick="startRequest()"
								class="btn btn-primary btn-sm">찾기</button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<c:if test="${sessionScope.memberVO == null}">
								<li id="login"><a id="login-trigger" href="#">Login▼</a>
									<div id="login-content" align="center">
										<fieldset id="inputs">
											<div align="center">

												<input class="form-control input-sm" id="username"
													type="email" name="memberId"
													placeholder="Your email address" required> <input
													class="form-control input-sm" id="password" type="password"
													name="memberPw" placeholder="Password" required> <br>
												<input type="submit" class="btn btn-primary btn-sm" id="log"
													value="로그인" onclick="login()"> <input type="submit"
													class="btn btn-primary btn-sm" id="reg" value="계정찾기"
													onclick="winOpenForFind()">

											</div>
										</fieldset>
									</div> <!-- id=login-content --></li>
								<!-- id=login -->

								<li><a
									href="${initParam.root}/member/member_Member_Register.jsp">register</a></li>
							</c:if>
							<c:if test="${sessionScope.memberVO != null}">
								<li id="logout"><a id="login-trigger"
									href="${initParam.root}/member.do?command=logout">Logout</a></li>

								<li id="mypage"><a id="login-trigger"
									onclick="winOpenForMyPage()">MyPage</a></li>


							</c:if>





						</ul>
					</div>
				</nav>
			</div>
			<!-- /example -->

		</div>
	</div>
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="${initParam.root}/img/up.jpg" id="image">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="${initParam.root}/img/up1.jpg" id="image">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="${initParam.root}/img/up2.jpg" alt="..." id="image">
				<div class="carousel-caption">...</div>
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<%-- <div>
		<jsp:include page="barmenu.jsp"></jsp:include>
	</div> --%>

	<!-- Typography
================================================== -->
	<hr>
	<section id="typography">

		<!-- -->
		<div class="row">

			<%-- <div class="col-sm-6">
				<jsp:include page="mapmain.jsp"></jsp:include>
			</div>

			<div class="col-sm-6">
				<jsp:include page="list.jsp"></jsp:include>
			</div> --%>

			<!-- 페이징처리 미구현! -->
			<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
			<c:if test="${pb.previousPageGroup}">
				<a href="board.do?command=list&no=${pb.startPageOfPageGroup-1}">
					<img src="${initParam.root}/img/left_arrow_btn.gif">
				</a>
			</c:if>


		</div>
	</section>

	<!-- Footer
      ================================================== -->
	<hr>

	<footer id="footer">
		<p class="pull-right">
			<a href="#">Back to top</a>
		</p>
		<div class="links">
			<a href="http://news.bootswatch.com"
				onclick="pageTracker._link(this.href); return false;">Blog</a> <a
				href="http://feeds.feedburner.com/bootswatch">RSS</a> <a
				href="https://twitter.com/thomashpark">Twitter</a> <a
				href="https://github.com/thomaspark/bootswatch/">GitHub</a> <a
				href="javascript:(function(e,a,g,h,f,c,b,d)%7Bif(!(f%3De.jQuery)%7C%7Cg%3Ef.fn.jquery%7C%7Ch(f))%7Bc%3Da.createElement(%22script%22)%3Bc.type%3D%22text/javascript%22%3Bc.src%3D%22http://ajax.googleapis.com/ajax/libs/jquery/%22%2Bg%2B%22/jquery.min.js%22%3Bc.onload%3Dc.onreadystatechange%3Dfunction()%7Bif(!b%26%26(!(d%3Dthis.readyState)%7C%7Cd%3D%3D%22loaded%22%7C%7Cd%3D%3D%22complete%22))%7Bh((f%3De.jQuery).noConflict(1),b%3D1)%3Bf(c).remove()%7D%7D%3Ba.documentElement.childNodes%5B0%5D.appendChild(c)%7D%7D)(window,document,%221.3.2%22,function(%24,L)%7Bif(%24(%22.bootswatcher%22)%5B0%5D)%7B%24(%22.bootswatcher%22).remove()%7Delse%7Bvar%20%24e%3D%24(%27%3Cselect%20class%3D%22bootswatcher%22%3E%3Coption%3EAmelia%3C/option%3E%3Coption%3ECerulean%3C/option%3E%3Coption%3ECosmo%3C/option%3E%3Coption%3ECyborg%3C/option%3E%3Coption%3EJournal%3C/option%3E%3Coption%3EReadable%3C/option%3E%3Coption%3ESimplex%3C/option%3E%3Coption%3ESlate%3C/option%3E%3Coption%3ESpacelab%3C/option%3E%3Coption%3ESpruce%3C/option%3E%3Coption%3ESuperhero%3C/option%3E%3Coption%3EUnited%3C/option%3E%3C/select%3E%27)%3Bvar%20l%3D1%2BMath.floor(Math.random()*%24e.children().length)%3B%24e.css(%7B%22z-index%22:%2299999%22,position:%22fixed%22,top:%225px%22,right:%225px%22,opacity:%220.5%22%7D).hover(function()%7B%24(this).css(%22opacity%22,%221%22)%7D,function()%7B%24(this).css(%22opacity%22,%220.5%22)%7D).change(function()%7Bif(!%24(%22link.bootswatcher%22)%5B0%5D)%7B%24(%22head%22).append(%27%3Clink%20rel%3D%22stylesheet%22%20class%3D%22bootswatcher%22%3E%27)%7D%24(%22link.bootswatcher%22).attr(%22href%22,%22http://bootswatch.com/%22%2B%24(this).find(%22:selected%22).text().toLowerCase()%2B%22/bootstrap.min.css%22)%7D).find(%22option:nth-child(%22%2Bl%2B%22)%22).attr(%22selected%22,%22selected%22).end().trigger(%22change%22)%3B%24(%22body%22).append(%24e)%7D%3B%7D)%3B"
				rel="tooltip" title="Drag to your bookmarks bar">Bookmarklet</a> <a
				href="https://github.com/thomaspark/bootswatch/tree/gh-pages/swatchmaker">Swatchmaker</a>
			<a href="http://news.bootswatch.com/post/22193315172/bootswatch-api">API</a>
			<a
				href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&amp;hosted_button_id=F22JEM3Q78JC2">Donate</a>
		</div>
		Made by <a href="http://thomaspark.me"
			onclick="pageTracker._link(this.href); return false;" target="_blank">Thomas
			Park</a>. Contact him <a href="mailto:hello@thomaspark.me">hello@thomaspark.me</a>.<br>
		Code licensed under the <a
			href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache
			License v2.0</a>.<br> Based on <a
			href="http://twitter.github.com/bootstrap/" target="_blank">Bootstrap</a>.
		Hosted on <a href="http://pages.github.com/" target="_blank">GitHub</a>.
		Icons from <a href="http://glyphicons.com/" target="_blank">Glyphicons</a>.
		Web fonts from <a href="http://www.google.com/webfonts"
			target="_blank">Google</a>.
	</footer>
</div>
<!-- /container -->
</body>
</html>

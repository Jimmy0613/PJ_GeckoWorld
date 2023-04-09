<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>글쓰기 new post</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css?version=${System.currentTimeMillis()}" />
</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<!-- Header Wrapper -->
		<div id="header-wrapper">
			<div class="container">
				<!-- Header -->
				<header id="header">
					<div class="inner">

						<!-- Logo -->
						<h1>
							<a href="/" id="logo">게코월드 GeckoWorld</a>
						</h1>

						<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="/">홈 Home</a></li>
								<li class="current_page_item"><a href="/board/list">게시판
										Board</a>
									<ul>
										<li><a href="/board/list">게시판 main</a></li>
										<li><a href="/board/listPhoto">게코 자랑 Photos</a></li>
									</ul>
								<li><a href="/user/mypage">회원 정보 mypage</a>
									<ul>
										<li><a href="#">개인정보수정 Edit personal info</a></li>
										<li><a href="/user/reservation">공간대여내역 reserve
												history</a></li>
										<li><a href="#">쪽지함 message box</a></li>
										<li><a href="#">알사용내역 egg history</a></li>
										<li><a href="/user/out">계정관리 account management</a></li>
									</ul></li>
							</ul>
						</nav>

					</div>
				</header>
			</div>
		</div>
		<!-- Main Wrapper -->
		<div id="main-wrapper">
			<div class="wrapper style2">
				<div class="inner">
					<div class="container">
						<div class="row">
							<!-- Sidebar -->
							<div class="col-4 col-12-medium" style="width: 25%;">
								<div id="sidebar">
									<section>
										<header class="major">
											<h2>메뉴 menu</h2>
										</header>
										<ul>
											<li><h3>
													<a href="/board/list">게시판 main</a>
												</h3></li>
											<li><h3>
													<a href="/board/listPhoto">게코 자랑 Photos</a>
												</h3></li>
										</ul>
									</section>
								</div>
							</div>
							<div class="col-8 col-12-medium imp-medium" style="width: 75%;">
								<div id="content">
									<!-- Content -->
									<article>
										<header class="major">
											<h2>답변하기</h2>
											<p>new answer</p>
										</header>
										<form action="/board/newResponse.do" method="post">
											<input type="hidden" name='pnum' value="${pnum}" /> <input
												type="hidden" name='w_id' value="${LOGIN_USER.id}" /> <input
												type="hidden" name='w_nickname'
												value="${LOGIN_USER.nickname}" />
											<h3>
												<select name='tag'
													style="width: 200px; font-weight: bolder; color: navy;">
													<option>&nbsp;답변 ANSWER</option>
												</select> <br /> <strong>'${ptitle}' 글에 대한 답변</strong> <br /> <br />&nbsp;&nbsp;<input
													name='title' value="re: ${ptitle}"
													style="width: 600px;">
											</h3>

											<p>
												<textarea name='content' spellcheck="false"
													style="width: 700px; min-height: 500px; height: auto; resize: none;"></textarea>
											</p>
											<input type="submit" value="글쓰기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
												type="button" value="취소"
												onclick="location.href='/board/post?pnum=${pnum}'">
										</form>
									</article>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer Wrapper -->
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>

	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
</body>
</html>
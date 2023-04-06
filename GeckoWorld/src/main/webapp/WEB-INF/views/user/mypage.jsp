<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>회원 정보 mypage</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css?version=${System.currentTimeMillis()}" />
</head>
<body class="no-sidebar is-preload">
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
								<li><a href="/board/list">게시판 Board</a>
									<ul>
										<li><a href="/board/list">게시판 main</a></li>
										<li class="current_page_item"><a href="/board/listPhoto">게코
												자랑 Photos</a></li>
									</ul>
								<li><a href="#">공간 대여 space rental</a></li>
								<c:choose>
									<c:when test="${LOGIN_USER != null}">
										<li class="current_page_item"><a href="/user/mypage">회원
												정보 mypage</a></li>
									</c:when>
									<c:otherwise>
										<li class="current_page_item"><a href="/user/login">로그인
												sign in</a></li>
									</c:otherwise>
								</c:choose>

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
							<div class="col-4 col-12-medium">
								<div id="sidebar">
									<!-- Sidebar -->
									<%@include file="/WEB-INF/views/user/sidebar.jsp"%>
								</div>
							</div>
							<div class="col-8 col-12-medium imp-medium">
								<div id="content">
									<!-- Content -->
									<article>
										<header class="major">
											<h2>회원 정보</h2>
											<p>my page</p>
										</header>
										로그인 유저: ${LOGIN_USER.id}
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
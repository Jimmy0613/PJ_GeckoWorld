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
				<%@include file="/WEB-INF/views/header.jsp"%>
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
									<section>
										<header class="major">
											<h2>메뉴 menu</h2>
										</header>
										<ul class="style2">
											<li><a href="#">개인정보수정</a></li>
											<li><a href="#">공간대여</a></li>
											<li><a href="#">쪽지함</a></li>
											<li><a href="#">게시판</a></li>
											<li><a href="#">알 사용 내역</a></li>
											<c:if test="${LOGIN_USER.type eq 'normal'}">
												<li><a href="/user/logout">로그아웃</a></li>
											</c:if>
											<c:if test="${LOGIN_USER.type eq 'kakao'}">
												<li><a href="/user/kakaoLogout">로그아웃</a></li>
											</c:if>
											<li><a href="#">계정관리</a></li>
										</ul>
									</section>
									<section>
										<header class="major">
											<h2>Subheading</h2>
										</header>
										<p>Phasellus quam turpis, feugiat sit amet ornare in,
											hendrerit in lectus. Praesent semper mod quis eget mi. Etiam
											eu ante risus. Aliquam erat volutpat. Aliquam luctus et
											mattis lectus sit amet pulvinar. Nam turpis nisi consequat
											etiam.</p>
										<footer>
											<a href="#" class="button icon solid fa-info-circle">Find
												out more</a>
										</footer>
									</section>
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
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
									</ul></li>
								<li class="current_page_item"><a href="/user/mypage">회원
										정보 mypage</a>
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
										<h2>계정관리</h2>
										<br />
										<p>
											회원 탈퇴시 작성하신 글, 댓글은 모두 유지되며 삭제하거나 수정할 수 없게 됩니다.<br /> 이미 예약하신
											공간 대여 내역은 유지되므로 취소를 원하시면 꼭 연락 부탁드립니다. <br /> 신중하게 고민하신 후
											결정해주세요.<br /> <br />
											<button onclick="javascript:out('${LOGIN_USER.id}');">회원탈퇴</button>
										</p>
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
	<script src="/resources/assets/js/out.js"></script>
</body>
</html>
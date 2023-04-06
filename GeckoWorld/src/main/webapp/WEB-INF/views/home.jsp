<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>GECKO WORLD</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css?version=${System.currentTimeMillis()}" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/calendar.css?version=${System.currentTimeMillis()}" />
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
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
								<li class="current_page_item"><a href="/">홈 Home</a></li>
								<li><a href="/board/list">게시판 Board</a>
									<ul>
										<li><a href="/board/list">게시판 main</a></li>
										<li><a href="/board/listPhoto">게코 자랑 Photos</a></li>
									</ul>
								<li><a href="#">공간 대여 space rental</a></li>
								<c:choose>
									<c:when test="${LOGIN_USER != null}">
										<li><a href="/user/mypage">회원 정보 mypage</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/user/login">로그인 sign in</a></li>
									</c:otherwise>
								</c:choose>

							</ul>
						</nav>

					</div>
				</header>
				<!-- Banner -->
				<div id="banner"></div>

			</div>
		</div>

		<!-- Main Wrapper -->
		<div id="main-wrapper">
			<div class="wrapper style1">
				<div class="inner">
					<!-- Feature 2 -->
					<section class="container box feature1">
						<header class="major">
							<h2>공간 대여 서비스 빠른 예약</h2>
							<p>space rental service Fast Reservation</p>
						</header>
						<div class="row">
							<div class="col-6 col-12-medium">
								<section>
									<h3>일정 선택</h3>
									<p>Schedule selection</p>
									<table class="fastReserv">
										<thead>
											<tr style="height: 30px; font-size: 1.3em;">
												<td colspan="3"><span><strong>날짜</strong>&nbsp;&nbsp;&nbsp;<input
														id="choosedDate" name='book_date' value=""
														style="width: 120px; text-align: center;" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>시간</strong>&nbsp;&nbsp;&nbsp;<select
														style="width: 120px; text-align: center;" id="timeSelect"
														name='hour' onchange="search();">
															<option value="0" selected hidden>선택</option>
															<option value="1">1시간</option>
															<option value="2">2시간</option>
															<option value="3">3시간</option>
													</select></span></td>
											</tr>
											<tr style="height: 30px;">
												<td></td>
											</tr>
										</thead>
										<tbody class="result"
											style="color: black; display: none; border: 1px solid black;">
											<tr>
												<td colspan="3"><h4>예약 시간을 선택해주세요.</h4></td>
											</tr>
											<tr
												style="cursor:pointer; height: 40px; background-color: #f2f7ff; font-weight: bolder;">
												<td id="time9">09:00</td>
												<td id="time10">10:00</td>
												<td id="time11">11:00</td>
											</tr>
											<tr
												style="cursor:pointer; height: 40px; background-color: #f2f7ff; font-weight: bolder;">
												<td id="time12">12:00</td>
												<td id="time13">13:00</td>
												<td id="time14">14:00</td>
											</tr>
											<tr
												style="cursor:pointer; height: 40px; background-color: #f2f7ff; font-weight: bolder;">
												<td id="time15">15:00</td>
												<td id="time16">16:00</td>
												<td id="time17">17:00</td>
											</tr>
											<tr
												style="cursor:pointer; height: 40px; background-color: #f2f7ff; font-weight: bolder;">
												<td id="time18">18:00</td>
												<td id="time19">19:00</td>
												<td id="time20">20:00</td>
											</tr>
										</tbody>
									</table>
									<footer>
										<a href="#"
											class="button medium icon solid fa-arrow-circle-right">예약하기
											book</a>
									</footer>
								</section>
							</div>
							<div class="col-6 col-12-medium">
								<section>
									<h3>날짜를 선택해주세요</h3>
									<p>Please Choose a Date</p>
									<table class="calendar">
										<thead>
											<tr>
												<td id="prev" onclick="prev();">&#60;</td>
												<td id="yearMonth" colspan="5"><span id="calYear"></span>년
													<span id="calMonth"></span>월</td>
												<td id="next" onclick="next();">&#62;</td>
											</tr>
											<tr id="week" style="border-bottom: 1px solid #ffedcc">
												<td style="color: red;">일</td>
												<td>월</td>
												<td>화</td>
												<td>수</td>
												<td>목</td>
												<td>금</td>
												<td style="color: blue;">토</td>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</section>
							</div>
						</div>
					</section>

				</div>
			</div>
			<div class="wrapper style2">
				<div class="inner">

					<!-- Feature 1 -->
					<section class="container box feature1">
						<div class="row">
							<div class="col-12">
								<header class="first major">
									<h2>공간 대여 서비스를 이용해보세요</h2>
									<p>Try using a space rental service</p>
								</header>
							</div>
							<div class="col-4 col-12-medium">
								<section>
									<a href="#" class="image featured"><img
										src="/resources/images/lobby.jpg" /></a>
									<header>
										<h3>로비 lobby</h3>
										<p>편안한 휴게 공간</p>
									</header>
								</section>
							</div>
							<div class="col-4 col-12-medium">
								<section>
									<a href="#" class="image featured"><img
										src="/resources/images/room_leo.jpg" /></a>
									<header>
										<h3>레오 room leo</h3>
										<p>최대 8인 수용, 프로젝터 지원</p>
									</header>
								</section>
							</div>
							<div class="col-4 col-12-medium">
								<section>
									<a href="#" class="image featured"><img
										src="/resources/images/room_cre.jpg" /></a>
									<header>
										<h3>크레 room cre</h3>
										<p>최대 4인 수용, 화이트보드 지원</p>
									</header>
								</section>
							</div>
							<div class="col-12">
								<p>위쪽의 빠른 예약 서비스에서 바로 날짜 선택 후 예약이 가능합니다. 복수 예약은 공간 대여 메뉴에서 할
									수 있습니다.</p>
							</div>
						</div>
					</section>

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
	<script src="/resources/assets/js/calendar.js"></script>

</body>
</html>

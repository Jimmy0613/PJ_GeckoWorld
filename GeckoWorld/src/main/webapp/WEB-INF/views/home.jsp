<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>ZeroFour by HTML5 UP</title>
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
				<%@include file="/WEB-INF/views/header.jsp"%>

				<!-- Banner -->
				<div id="banner">
				</div>
			</div>
		</div>

		<!-- Main Wrapper -->
		<div id="main-wrapper">
			<div class="wrapper style1">
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
										<p>최대 6인 수용, 화이트보드 지원</p>
									</header>
								</section>
							</div>
							<div class="col-12">
								<p>아래의 빠른 예약 서비스에서 바로 날짜 선택 후 예약이 가능합니다. 복수 예약은 공간 대여 메뉴에서 할
									수 있습니다.</p>
							</div>
						</div>
					</section>

				</div>
			</div>
			<div class="wrapper style2">
				<div class="inner">

					<!-- Feature 2 -->
					<section class="container box feature2">
						<div class="row">
							<div class="col-6 col-12-medium">
								<section>
									<header class="major">
										<h2>공간 대여 서비스 빠른 예약</h2>
										<p>space rental service Fast Reservation</p>
									</header>
									<%@include file="/WEB-INF/views/fastReserv.jsp"%>
									<footer>
										<a href="#"
											class="button medium icon solid fa-arrow-circle-right">예약하기
											book</a>
									</footer>
								</section>
							</div>
							<div class="col-6 col-12-medium">
								<section>
									<header class="major">
										<h2>날짜를 선택해주세요</h2>
										<p>Please Choose a Date</p>
									</header>
									<div id="calendar">
										<div id="box"
											style="min-height: 390px; width: 350px; background-color: rgba(255, 255, 255, 0.7);">
											<%@include file="/WEB-INF/views/calendar.jsp"%>
										</div>
									</div>
								</section>
							</div>
						</div>
					</section>

				</div>
			</div>
			<div class="wrapper style3">
				<div class="inner">
					<div class="container">
						<div class="row">
							<div class="col-8 col-12-medium">

								<!-- Article list -->
								<section class="box article-list">
									<h2 class="icon fa-file-alt">최신글 Recent Posts</h2>

									<!-- Excerpt -->
									<article class="box excerpt">
										<a href="#" class="image left"><img
											src="/resources/images/pic04.jpg" alt="" /></a>
										<div>
											<header>
												<span class="date">July 24</span>
												<h3>
													<a href="#">Repairing a hyperspace window</a>
												</h3>
											</header>
											<p>Phasellus quam turpis, feugiat sit amet ornare in,
												hendrerit in lectus semper mod quisturpis nisi consequat
												etiam lorem. Phasellus quam turpis, feugiat et sit amet
												ornare in, hendrerit in lectus semper mod quis eget mi
												dolore.</p>
										</div>
									</article>

									<!-- Excerpt -->
									<article class="box excerpt">
										<a href="#" class="image left"><img
											src="/resources/images/pic05.jpg" alt="" /></a>
										<div>
											<header>
												<span class="date">July 18</span>
												<h3>
													<a href="#">Adventuring with a knee injury</a>
												</h3>
											</header>
											<p>Phasellus quam turpis, feugiat sit amet ornare in,
												hendrerit in lectus semper mod quisturpis nisi consequat
												etiam lorem. Phasellus quam turpis, feugiat et sit amet
												ornare in, hendrerit in lectus semper mod quis eget mi
												dolore.</p>
										</div>
									</article>

									<!-- Excerpt -->
									<article class="box excerpt">
										<a href="#" class="image left"><img
											src="/resources/images/pic06.jpg" alt="" /></a>
										<div>
											<header>
												<span class="date">July 14</span>
												<h3>
													<a href="#">Preparing for Y2K38</a>
												</h3>
											</header>
											<p>Phasellus quam turpis, feugiat sit amet ornare in,
												hendrerit in lectus semper mod quisturpis nisi consequat
												etiam lorem. Phasellus quam turpis, feugiat et sit amet
												ornare in, hendrerit in lectus semper mod quis eget mi
												dolore.</p>
										</div>
									</article>

								</section>
							</div>
							<div class="col-4 col-12-medium">

								<!-- Spotlight -->
								<section class="box spotlight">
									<h2 class="icon fa-file-alt">화제글 Spotlight</h2>
									<article>
										<a href="#" class="image featured"><img
											src="/resources/images/pic07.jpg" alt=""></a>
										<header>
											<h3>
												<a href="#">Neural Implants</a>
											</h3>
											<p>The pros and cons. Mostly cons.</p>
										</header>
										<p>Phasellus quam turpis, feugiat sit amet ornare in,
											hendrerit in lectus semper mod quisturpis nisi consequat
											ornare in, hendrerit in lectus semper mod quis eget mi quat
											etiam lorem. Phasellus quam turpis, feugiat sed et lorem
											ipsum dolor consequat dolor feugiat sed et tempus consequat
											etiam.</p>
										<p>Lorem ipsum dolor quam turpis, feugiat sit amet ornare
											in, hendrerit in lectus semper mod quisturpis nisi consequat
											etiam lorem sed amet quam turpis.</p>
										<footer>
											<a href="#" class="button alt icon solid fa-file-alt">Continue
												Reading</a>
										</footer>
									</article>
								</section>

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
	<script src="/resources/assets/js/calendar.js"></script>

</body>
</html>

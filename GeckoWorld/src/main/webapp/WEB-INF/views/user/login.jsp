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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/login.css?version=${System.currentTimeMillis()}" />
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
											<li><a href="/user/join">회원가입</a></li>
											<li><a href="#">아이디 찾기</a></li>
											<li><a href="#">비밀번호 찾기</a></li>
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
											<h2>로그인</h2>
											<p>sign in</p>
										</header>
										<form id="form_norm_login" method="get"
											action="/user/login.do">
											<table>
												<tr>
													<td>아이디</td>
													<td colspan="2"><input style="width: 250px;" id="id"
														type="text" name='user_id'></td>
												</tr>
												<tr>
													<td>비밀번호</td>
													<td colspan="2"><input style="width: 250px;" id="pw"
														type="password" name='user_pw'></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td id="confirm">
														<!-- 로그인 안내메시지 출력 위치 -->
													</td>
												</tr>
												<tr>
													<td></td>
													<td><input id="norm_login_btn" type="button"
														value="로그인">
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td></td>
													<td><a href="/user/kakaoLogin"><img
															src="/resources/images/kakao_login_medium_narrow.png"></a></td>
												</tr>
											</table>
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
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/login.js?version=${System.currentTimeMillis()}"></script>

</body>
</html>

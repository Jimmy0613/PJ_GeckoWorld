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
				<%@include file="/WEB-INF/views/headerNotUser.jsp" %>
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
											<li><h4>
													<a href="/user/join">회원가입</a>
												</h4></li>
										</ul>
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
											<div
												style="width: 500px; display: grid; grid-template-columns: 3fr 1fr;">
												<div>
													<table>
														<tr>
															<td style="font-size: 1.1em;"><b>아이디</b></td>
															<td><input style="width: 250px;" id="id" type="text"
																name='id'></td>
														</tr>
														<tr>
															<td style="font-size: 1.1em;"><b>비밀번호</b></td>
															<td><input style="width: 250px;" id="pw"
																type="password" name='pw'></td>
														</tr>
														<tr>
															<td colspan="2" id="confirm">
																<!-- 로그인 안내메시지 출력 위치 -->
															</td>
														</tr>
													</table>
												</div>
												<div>
													<input id="norm_login_btn" type="button"
														style="height: 100px;" value="로그인">
												</div>
											</div>
											<a href="/user/kakaoLogin"><img
												src="/resources/images/kakao_login_medium_narrow.png"></a>
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

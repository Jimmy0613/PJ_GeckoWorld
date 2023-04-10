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
											<li><a href="/user/login">로그인</a></li>
										</ul>
									</section>
								</div>
							</div>
							<div class="col-8 col-12-medium imp-medium">
								<div id="content">
									<!-- Content -->
									<article>
										<header class="major">
											<h2>회원가입</h2>
											<p>sign up</p>
										</header>
										<p>카카오 계정으로 로그인을 시도하셨습니다. 간단한 가입 절차 후 바로 서비스를 이용하실 수 있습니다.</p>
										<br>
										<form id="form_kakao_join" action="/user/kakaoJoin.do"
											method="post">
											<table class="join_form">
												<tr>
													<td colspan="3"><b>이용 약관</b></td>
												</tr>
												<tr>
													<td colspan="3"><%@include
															file="/WEB-INF/views/user/tos.jsp"%></td>
												</tr>
												<tr>
													<td colspan="3"><input id="agree" type="checkbox"
														style="-webkit-appearance: checkbox;"> 약관에
														동의합니다.(필수)</td>
												</tr>
												<tr></tr>
												<tr>
													<td>* 별명</td>
													<td><input style="width: 250px;" id="user_name"
														type="text" name='nickname'
														value="${KAKAO_LOGIN.nickname}" required maxlength="6"></td>
												</tr>
												<tr>
													<td><input type="hidden" name='type' value="kakao"><input
														type="hidden" name='id' value="${KAKAO_LOGIN.id}"><input
														type="hidden" name='pw' value="${KAKAO_LOGIN.pw}"><input
														type="hidden" name='role' value="guest"><br /> <input
														id="form_kakao_join_btn" type="button" value="회원가입"></td>
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
		src="${pageContext.request.contextPath}/resources/assets/js/kakaoJoin.js?version=${System.currentTimeMillis()}"></script>

</body>
</html>
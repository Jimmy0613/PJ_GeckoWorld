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
				<%@include file="/WEB-INF/views/headerUser.jsp"%>
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
									<%@include file="/WEB-INF/views/user/sidebarUser.jsp"%>
								</div>
							</div>
							<div class="col-8 col-12-medium imp-medium">
								<div id="content">
									<!-- Content -->
									<article>
										<h2>비밀번호변경</h2>
										<table>
											<tr>
												<td style="width: 200px;">* 기존 비밀번호 <span
													style="color: green;" id="pw_check0"></span></td>
												<td><input id="oldPw" type="password" name='pw'
													placeholder="비밀번호 입력 (8 ~ 14자)" value="" required
													style="width: 250px;"
													onchange="old_pw_onchange('${LOGIN_USER.id}');"></td>
											</tr>
											<tr>
												<td style="width: 200px;">* 새로운 비밀번호 <span
													style="color: green;" id="pw_check1"></span></td>
												<td><input id="pw1" type="password" name='pw'
													placeholder="비밀번호 입력 (8 ~ 14자)" value="" required
													style="width: 250px;" onchange="pw_onchange();"></td>
											</tr>
											<tr>
												<td style="width: 200px;">* 새로운 비밀번호 확인 <span
													style="color: green;" id="pw_check2"></span></td>
												<td><input id="pw2" type="password" value="" required
													placeholder="비밀번호 재입력" style="width: 250px;"
													onchange="pw_onchange();"></td>
											</tr>
											<tr>
												<td></td>
												<td colspan="4" id="pw_msg">
													<!-- 비번 일치 여부 안내 출력 위치 -->
												</td>
											</tr>
										</table>
										<button onclick="change('${LOGIN_USER.id}');">변경</button>
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
	<script src="/resources/assets/js/pwChange.js"></script>
</body>
</html>
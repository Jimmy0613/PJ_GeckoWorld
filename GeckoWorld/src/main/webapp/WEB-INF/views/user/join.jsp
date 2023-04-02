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
											<li><a href="/user/login">로그인</a></li>
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
											<h2>회원가입</h2>
											<p>sign up</p>
										</header>
										<form id="form_join" action="/user/join.do" method="post">
											<table class="join_form">
												<tr>
													<td colspan="5"><b>이용 약관</b></td>
												</tr>
												<tr>
													<td colspan="5"><%@include
															file="/WEB-INF/views/user/tos.jsp"%></td>
												</tr>
												<tr>
													<td colspan="5"><input id="agree" type="checkbox"
														style="-webkit-appearance: checkbox;"> 약관에
														동의합니다.(필수)</td>
												</tr>
												<tr>
													<td>* 아이디 <span style="color:green;" id="id_check"></span></td>
													<td style="width: 300px;"><input id="id" onchange="id_onchange();" type="text" name='id'
														placeholder="아이디 입력 (5 ~ 12자)" value="" required style="width: 250px;"></td>
													<td colspan="3"><input type="button" id="id_confirm_btn"
														value="중복 확인" onclick="id_confirm();"></td>
												</tr>
												<tr>
													<td></td>
													<td colspan="4" id="id_msg">
														<!-- 아이디 중복 여부 안내 출력 위치 --> 
													</td>
												</tr>
												<tr>
													<td>* 비밀번호 <span style="color:green;" id="pw_check1"></span></td>
													<td colspan="4"><input id="pw1" type="password" name='pw' placeholder="비밀번호 입력 (8 ~ 14자)" 
														value="" required style="width: 250px;" onchange="pw_onchange();"></td>
												</tr>
												<tr>
													<td>* 비밀번호 확인 <span style="color:green;" id="pw_check2"></span></td>
													<td colspan="4"><input id="pw2" type="password" value="" required
														 placeholder="비밀번호 재입력" style="width: 250px;" onchange="pw_onchange();"></td>
												</tr>
												<tr>
													<td></td>
													<td colspan="4" id="pw_msg">
														<!-- 비번 일치 여부 안내 출력 위치 -->
													</td>
												</tr>
												<tr>
													<td>* 별명 <span style="color:green;" id="name_check"></span></td>
													<td colspan="4"><input id="user_name" type="text" name='nickname'
														placeholder="2 ~ 8자" value="" required maxlength="8" style="width: 250px;"></td>
												</tr>
												<tr></tr>
												<tr>
													<td style="width: 125px;"></td>
													<td colspan="4">
													<input type="hidden" name='type' value="normal"> 
													<input type="hidden" name='role' value="guest">
													<input id="form_join_btn" type="button" value="회원가입" onclick="join_confirm();">
													</td>
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
		src="${pageContext.request.contextPath}/resources/assets/js/join.js?version=${System.currentTimeMillis()}"></script>

</body>
</html>
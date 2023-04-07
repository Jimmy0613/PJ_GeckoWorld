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
										<h2>공간 대여 내역</h2>
										<br />
										<table>
											<tr>
												<td colspan="5"><hr></td>
											</tr>
											<tr>
												<td><strong>예약자명</strong></td>
												<td><strong>예약날짜</strong></td>
												<td><strong>입실시간</strong></td>
												<td><strong>퇴실시간</strong></td>
												<td><strong>예약상태</strong></td>
												<td></td>
											</tr>
											<tr>
												<td colspan="5"><hr></td>
											</tr>
											<c:if test="${book.size() == 0 }">
												<tr>
													<td colspan="5">예약 내역이 없습니다.</td>
												</tr>
												<tr>
													<td colspan="5"><hr></td>
												</tr>
											</c:if>
											<c:if test="${book.size() != 0 }">
												<c:forEach var="b" items="${book}">
													<tr>
														<td>${b.guestName}</td>
														<td>${b.bookDate}</td>
														<td>${b.startTime}:00</td>
														<td>${b.endTime}:00</td>
														<td>${b.status}</td>
														<td><c:if test="${b.status eq '예약'}">
																<button id="${b.num}" onclick="cancel(this.id);"
																	style="padding: 5px;">취소</button>
															</c:if></td>
													</tr>
													<tr>
														<td colspan="5"><hr></td>
													</tr>
												</c:forEach>
											</c:if>
											</tbody>
										</table>
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
	<script src="/resources/assets/js/reserve.js"></script>
</body>
</html>
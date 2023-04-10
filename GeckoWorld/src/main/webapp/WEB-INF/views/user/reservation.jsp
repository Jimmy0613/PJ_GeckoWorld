<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				<%@include file="/WEB-INF/views/headerUser.jsp" %>
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
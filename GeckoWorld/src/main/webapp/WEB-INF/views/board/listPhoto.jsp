<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>게시판 board</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css?version=${System.currentTimeMillis()}" />
</head>
<body class="left-sidebar is-preload">
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
							<!-- Sidebar -->
							<%@ include file="/WEB-INF/views/board/sidebar.jsp"%>
							<div class="col-8 col-12-medium imp-medium" style="width: 75%;">
								<div id="content">
									<!-- Feature 1 -->
									<section class="container box feature1">
										<div class="row">
											<div class="col-12">
												<header>
													<h2>게코 자랑</h2>
													<p>우리집 게코 사진을 올려 자랑해보세요.</p>
												</header>
												<p>
													<!--------- 글쓰기 버튼 --------->
													<a href="/board/newpostPhoto">글쓰기</a>
												</p>
											</div>
											<c:forEach var="postPhoto" items="${list}">
												<div class="col-4 col-12-medium">
													<section
														style="padding: 10px; width: 250px; height: 300px; background-color: rgb(243, 243, 240);">
														<b>${postPhoto.pdate}</b>
														<div style="height: 180px; width: 100%; display:grid; align-items:center; justify-content:center;">
															<img
																style="overflow: hidden; max-width: 230px; max-height: 180px;"
																src="${postPhoto.p1Url}" />
														</div>
														<h3>${postPhoto.title}</h3>
													</section>
												</div>
											</c:forEach>

										</div>
									</section>
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
</body>
</html>
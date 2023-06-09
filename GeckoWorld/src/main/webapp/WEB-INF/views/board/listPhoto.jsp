<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<c:if test="${LOGIN_USER ==null }">
					<%@include file="/WEB-INF/views/headerNotUser.jsp"%>
				</c:if>
				<c:if test="${LOGIN_USER !=null }">
					<%@include file="/WEB-INF/views/headerUser.jsp"%>
				</c:if>
			</div>
		</div>
		<!-- Main Wrapper -->
		<div id="main-wrapper">
			<div class="wrapper style2">
				<div class="inner">
					<div class="container">
						<div class="row">
							<!-- Sidebar -->
							<div class="col-4 col-12-medium" style="width: 25%;">
								<div id="sidebar">
									<section>
										<header class="major">
											<h2>메뉴 menu</h2>
										</header>
										<ul>
											<li><h3>
													<a href="/board/list">게시판 board</a>
												</h3></li>
											<li><h3>
													<a href="/board/listPhoto">사진게시판 gallery</a>
												</h3></li>
										</ul>
									</section>
								</div>
							</div>
							<div class="col-8 col-12-medium imp-medium" style="width: 75%;">
								<div id="content">
									<!-- Feature 1 -->
									<section class="container box feature1">
										<div class="row">
											<div class="col-12">
												<header>
													<h2>사진게시판</h2>
													<p>Gallery</p>
												</header>
												<p>
													<!--------- 글쓰기 버튼 --------->
													<c:if test="${LOGIN_USER != null}">
														<button onclick="location.href='/board/newPostPhoto'">글쓰기</button>
														<br />
														<br />
													</c:if>
												</p>
												<!-- 목록 이동 버튼  -->
												<p style="width: 100%;">
													<c:if test="${currentPage>1}">
														<button style="cursor: pointer; float: left;"
															onclick="location.href='/board/listPhoto?currentPage=${(currentPage-1)}'">《《
															이전</button>
													</c:if>
													<c:if test="${totalPage>1 && currentPage!=totalPage }">
														<button
															onclick="location.href='/board/listPhoto?currentPage=${(currentPage+1)}'"
															style="cursor: pointer; float: right;">다음 》》</button>
													</c:if>
												</p>
												<div class="col-4 col-12-medium"
													style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-template-rows: 300px 300px 300px; width: 100%; align-items: center; justify-content: center;">
													<c:if test="${list.size() == 0}">
														<b>아직 글이 없습니다.</b>
													</c:if>
													<c:if test="${list.size() != 0}">
														<c:forEach var="post" items="${list}">
															<section
																onclick="location.href='/board/postPhoto?num=${post.num}'"
																style="cursor: pointer; box-shadow: 2px 2px 4px #888; padding: 10px; margin: auto; width: 95%; height: 95%;">
																<b><fmt:formatDate value="${post.pdate}"
																		pattern="yyyy-MM-dd" /></b>
																<div
																	style="height: 70%; width: 100%; display: grid; align-items: center; justify-content: center;">
																	<img
																		style="overflow: hidden; max-width: 100%; max-height: 100%;"
																		src="${thumnailList.get(post.num)}" />
																</div>
																<hr />
																<h4>${post.title}</h4>
															</section>
														</c:forEach>
													</c:if>
												</div>
											</div>
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
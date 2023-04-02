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
							<div class="col-4 col-12-medium" style="width: 25%;">
								<div id="sidebar">
									<section>
										<header class="major">
											<h2>메뉴 menu</h2>
										</header>
										<ul>
											<li><h3>
													<a href="/board/list">게시판 main</a>
												</h3></li>
											<li><h3>
													<a href="/board/listPhoto">게코 자랑 Photos</a>
												</h3></li>
											<li><h3>
													<a href="#">게코 분양 Adoption</a>
												</h3>
												<ul>
													<li><h4>
															<a href="#">》 데려가세요 with you</a>
														</h4></li>
													<li><h4>
															<a href="#">》 데려올게요 with me</a>
														</h4></li>
													<li><h4>
															<a href="#">》 후기 review</a>
														</h4></li>
												</ul></li>
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
							<div class="col-8 col-12-medium imp-medium" style="width:75%;">
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
													<button onclick="location.href='/board/newPostPhoto'">글쓰기</button><br/><br/>
												</p>
												<!-- 목록 이동 버튼  -->
												<p style="width: 100%;">
													<c:if test="${currentPage>1}">
														<button style="cursor:pointer; float:left;" onclick="location.href='/board/listPhoto?currentPage=${(currentPage-1)}'">《《 이전 </button>
													</c:if>
													<c:if test="${totalPage>1 && currentPage!=totalPage }">
														<button onclick="location.href='/board/listPhoto?currentPage=${(currentPage+1)}'" style="cursor:pointer; float: right;">다음 》》</button>
													</c:if>
												</p>
												<div class="col-4 col-12-medium"
													style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-template-rows:300px 300px 300px; width: 100%; align-items:center; justify-content: center;">
													<c:if test="${list.size() == 0}">
														<b>아직 글이 없습니다.</b>
													</c:if>
													<c:if test="${list.size() != 0}">
														<c:forEach var="post" items="${list}">
															<section onclick="location.href='/board/postPhoto?num=${post.num}'"
																style="cursor:pointer; box-shadow: 2px 2px 4px #888; padding: 10px; margin:auto; width: 95%; height: 95%;">
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
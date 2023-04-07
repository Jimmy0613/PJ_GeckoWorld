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
	<div id="myData" data-current-page="${currentPage}"></div>
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
								<li class="current_page_item"><a href="/board/list">게시판
										Board</a>
									<ul>
										<li><a href="/board/list">게시판 main</a></li>
										<li><a href="/board/listPhoto">게코 자랑 Photos</a></li>
									</ul></li>
								<c:choose>
									<c:when test="${LOGIN_USER != null}">
										<li><a href="/user/mypage">회원 정보 mypage</a>
											<ul>
												<li><a href="#">개인정보수정 Edit personal info</a></li>
												<li><a href="/user/reservation">공간대여내역 reserve
														history</a></li>
												<li><a href="#">쪽지함 message box</a></li>
												<li><a href="#">알사용내역 egg history</a></li>
												<li><a href="/user/out">계정관리 account management</a></li>
											</ul></li>
									</c:when>
									<c:otherwise>
										<li><a href="/user/login">로그인 sign in</a></li>
									</c:otherwise>
								</c:choose>
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
										</ul>
									</section>
								</div>
							</div>
							<div class="col-8 col-12-medium imp-medium" style="width: 75%;">
								<div id="content">
									<!-- Content -->
									<article>
										<header>
											<h2>게시판</h2>
											<p>사담/정보/질문/답변</p>
										</header>

										<c:if test="${LOGIN_USER != null}">
											<p>
												<!--------- 글쓰기 버튼 --------->
												<button onclick="location.href='/board/newPost'">글쓰기</button>
											</p>
										</c:if>
										<div id="listArea">
											<table>
												<thead>
													<tr>
														<td colspan="5"><hr style="border-color: black;" /></td>
													</tr>
													<tr>
														<td style="width: 100px;">&nbsp;&nbsp;태그</td>
														<td style="width: 120px;">작성자</td>
														<td>제목</td>
														<td style="width: 50px;">조회</td>
													</tr>
													<tr>
														<td colspan="5"><hr style="border-color: black;"></td>
													</tr>
												</thead>
												<!--- 글 목록 나타나는 자리 --->
												<tbody class="tbody"></tbody>
											</table>
										</div>
										<!-- 페이지 이동 버튼 -->
										<p style="width: 100%;" id="pageArea">
											<span id="prevPage" onclick="javascript:prevPage();"
												style="cursor: pointer; text-align: left;"></span> <span
												id="nextPage" onclick="javascript:nextPage();"
												style="cursor: pointer; float: right;"></span>
										</p>
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
	<script src="/resources/assets/js/list.js"></script>

</body>
</html>
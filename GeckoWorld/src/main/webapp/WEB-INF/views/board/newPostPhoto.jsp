<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>글쓰기 new post</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css?version=${System.currentTimeMillis()}" />
<link rel="shortcut icon"
	href="/resources/assets/chevron-left-solid.svg" type="image/x-icon" />
</head>
<body class="left-sidebar is-preload">
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
								<li class="current_page_item"><a href="/board/list">게시판 Board</a>
									<ul>
										<li><a href="/board/list">게시판 main</a></li>
										<li><a href="/board/listPhoto">게코 자랑 Photos</a></li>
									</ul>
								<li><a href="#">공간 대여 space rental</a></li>
								<c:choose>
									<c:when test="${LOGIN_USER != null}">
										<li><a href="/user/mypage">회원 정보 mypage</a></li>
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
							<%@ include file="/WEB-INF/views/board/sidebar.jsp"%>
							<div class="col-8 col-12-medium imp-medium">
								<div id="content">
									<!-- Content -->
									<article>
										<header class="major">
											<h2>게코 자랑 글쓰기</h2>
											<p>new post with photo</p>
										</header>
										<form id="postForm">
											<input type="hidden" name='w_id' value="${LOGIN_USER.id}" />
											<input type="hidden" name='w_nickname'
												value="${LOGIN_USER.nickname}" />
											<h3>
												제목 title<br /> <br />&nbsp;&nbsp;<input name='title'
													required style="width: 80%;">
											</h3>
											<table class="writeForm" style="width: 100%;">
												<thead style="width: 50%;" class="thead">
													<tr class="file_">
														<td style="width: 30%;"><input type="file" id="p_1"
															accept="image/*" onchange="fileCommand(this.id)"></td>
														<td style="width: 10%;">(대표)</td>
														<td style="width: 10%;">
															<button style="padding: 5px;" id="add_1" disabled
																onclick="addTr(this.id, event);">추가</button>
														</td>
														<td style="width: 50%;"></td>
													</tr>
												</thead>
											</table>
											<div id="descBox"
												style="display: block; width: 98%; height: auto; align-items: center; justify-content: center;">
												<div id="descArea_1"
													style="display: grid; width: 100%; height: 200px; grid-template-columns: 3fr 7fr;">
													<img style="max-width: 100%; max-height: 200px;" id="img_1"
														src="" alt=" 사진을 한장 이상 올려주세요." />
													<textarea name="desc" spellcheck="false"
														placeholder="무슨 사진인가요?"
														style="min-height: 200px; resize: none;"></textarea>
												</div>
											</div>
											<h4>이곳은 사진 게시판이에요. 사진이 없으면 글이 삭제될 수 있습니다.</h4>
											<p id="contentArea">
												<textarea name='content' spellcheck="false"
													placeholder="더 하고싶은 말이 있나요?"
													style="width: 100%; min-height: 200px; height: auto; resize: none;"></textarea>
											</p>
											<button onclick="submitForm();">글쓰기</button>
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
	<script src="/resources/assets/js/newPostPhoto.js"></script>
</body>
</html>
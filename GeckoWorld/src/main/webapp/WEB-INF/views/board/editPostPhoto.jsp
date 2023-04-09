<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>수정하기 edit post</title>
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
								<li class="current_page_item"><a href="/board/list">게시판
										Board</a>
									<ul>
										<li><a href="/board/list">게시판 main</a></li>
										<li><a href="/board/listPhoto">게코 자랑 Photos</a></li>
									</ul>
								<li><a href="/user/mypage">회원 정보 mypage</a>
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
										<header class="major">
											<h2>게코 자랑 수정하기</h2>
											<p>edit post with photo</p>
										</header>
										<form id="postForm">
											<h3>
												제목 title<br /> <br />&nbsp;&nbsp;<input name='title'
													required style="width: 80%;" value="${post.title}">
											</h3>
											<h4>이곳은 사진 게시판이에요. 사진이 없으면 글이 삭제될 수 있습니다.</h4>
											<div id="descBox"
												style="display: block; width: 98%; height: auto; align-items: center; justify-content: center;">
												<c:if test="${urlList.size() > 0}">
													<div id="descArea_1"
														style="display: grid; width: 100%; height: 200px; grid-template-columns: 3fr 7fr;">
														<img style="max-width: 100%;; max-height: 200px;"
															id="img_1" src="${urlList.get(0)}"> <input
															type="file" id="p_1" accept="image/*"
															onchange="fileCommand(this.id)">
														<textarea name="desc" spellcheck="false"
															style="min-height: 200px; resize: none;">${post.desc1}</textarea>
													</div>
												</c:if>
												<c:if test="${urlList.size() > 1}">
													<div id="descArea_2"
														style="display: grid; width: 100%; height: 200px; grid-template-columns: 3fr 7fr;">
														<img style="max-width: 100%; max-height: 200px;"
															id="img_2" src="${urlList.get(1)}" />
														<textarea name="desc" spellcheck="false"
															style="min-height: 200px; resize: none;">${post.desc2}</textarea>
													</div>
												</c:if>
												<c:if test="${urlList.size() > 2}">
													<div id="descArea_3"
														style="display: grid; width: 100%; height: 200px; grid-template-columns: 3fr 7fr;">
														<img style="max-width: 100%; max-height: 200px;"
															id="img_3" src="${urlList.get(2)}" />
														<textarea name="desc" spellcheck="false"
															style="min-height: 200px; resize: none;">${post.desc3}</textarea>
													</div>
												</c:if>
												<c:if test="${urlList.size() > 3}">
													<div id="descArea_4"
														style="display: grid; width: 100%; height: 200px; grid-template-columns: 3fr 7fr;">
														<img style="max-width: 100%; max-height: 200px;"
															id="img_4" src="${urlList.get(3)}" />
														<textarea name="desc" spellcheck="false"
															style="min-height: 200px; resize: none;">${post.desc4}</textarea>
													</div>
												</c:if>
												<c:if test="${urlList.size() > 4}">
													<div id="descArea_5"
														style="display: grid; width: 100%; height: 200px; grid-template-columns: 3fr 7fr;">
														<img style="max-width: 100%; max-height: 200px;"
															id="img_5" src="${urlList.get(4)}" />
														<textarea name="desc" spellcheck="false"
															style="min-height: 200px; resize: none;">${post.desc5}</textarea>
													</div>
												</c:if>
											</div>
											<p id="contentArea">
												<textarea name='content' spellcheck="false"
													style="width: 100%; min-height: 200px; height: auto; resize: none;">${post.content}</textarea>
											</p>
											<button onclick="submitForm();">수정하기</button>
											<button
												onclick="cancelForm(event, ${post.num});">취소</button>
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
	<script src="/resources/assets/js/editPostPhoto.js"></script>
</body>
</html>
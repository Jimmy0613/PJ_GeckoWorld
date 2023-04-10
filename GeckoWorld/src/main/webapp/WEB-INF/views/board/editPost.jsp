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
</head>
<body class="left-sidebar is-preload">
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
									<!-- Content -->
									<article>
										<header class="major">
											<h2>수정하기</h2>
											<p>edit post</p>
										</header>
										<form action="/board/editPost.do" method="post">
											<h3>
												<select name='tag'
													style="width: 200px; font-weight: bolder; color: navy;">
													<c:if test="${post.tag eq 'Q'}">
														<option value="Q">&nbsp;질문 QUESTION</option>
													</c:if>
													<c:if test="${post.tag eq 'N'}">
														<option value="N" selected>&nbsp;사담 SMALL TALK</option>
														<option value="I">&nbsp;정보 INFORMATION</option>
														<option value="Q">&nbsp;질문 QUESTION</option>
													</c:if>
													<c:if test="${post.tag eq 'I'}">
														<option value="N">&nbsp;사담 SMALL TALK</option>
														<option value="I" selected>&nbsp;정보 INFORMATION</option>
														<option value="Q">&nbsp;질문 QUESTION</option>
													</c:if>
												</select> <br /> <strong>제목 title</strong> <br /> <br />&nbsp;&nbsp;<input
													name='title' value="${post.title}" required
													style="width: 600px;">
											</h3>

											<p>
												<textarea name='content' spellcheck="false"
													style="width: 700px; min-height: 500px; height: auto; resize: none;">${post.content}</textarea>
											</p>
											<input type="hidden" name='pnum' value="${post.pnum}" /> <input
												type="submit" value="글쓰기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
												type="button" value="취소"
												onclick="location.href='/board/post?pnum=${post.pnum}'">
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
</body>
</html>
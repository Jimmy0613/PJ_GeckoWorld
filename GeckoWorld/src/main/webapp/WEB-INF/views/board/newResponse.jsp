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
							<div class="col-8 col-12-medium imp-medium">
								<div id="content">
									<!-- Content -->
									<article>
										<header class="major">
											<h2>답변하기</h2>
											<p>new answer</p>
										</header>
										<form action="/board/newResponse.do" method="post">
											<input type="hidden" name='pnum' value="${pnum}" />
											<input type="hidden" name='w_id' value="${LOGIN_USER.id}" />
											<input type="hidden" name='w_nickname'
												value="${LOGIN_USER.nickname}" />
											<h3>
												<select name='tag'
													style="width: 200px; font-weight: bolder; color: navy;">
													<option>&nbsp;답변 ANSWER</option>
												</select> <br /> <strong>${pnum}번 글에 대한 답변</strong> <br />
												<br />&nbsp;&nbsp;<input name='title' readonly value="re: ${ptitle}"
													style="width: 600px;">
											</h3>

											<p>
												<textarea name='content' spellcheck="false"
													style="width: 700px; min-height: 500px; height: auto; resize: none;"></textarea>
											</p>
											<input type="submit" value="글쓰기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
												type="button" value="취소"
												onclick="location.href='/board/post?pnum=${pnum}'">
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
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
											<h2>글쓰기</h2>
											<p>new post</p>
										</header>
										<form action="/board/newpost.do" method="post">
											<input type="hidden" name='w_id' value="${LOGIN_USER.user_id}"/>
											<input type="hidden" name='w_nickname' value="${LOGIN_USER.user_nickname}"/>
											<h3>
												제목 title<br/><br/>&nbsp;&nbsp;<input name='title' required style="width: 600px;">
											</h3>
											<p style="display: flex;">
												<c:if test="${tag eq 'A'}">
													<select name='tag' style="width: 70px; font-weight: bolder; color: navy;">
														<option value="A">&nbsp;답변</option>
													</select>
												</c:if>
												<c:if test="${tag ne 'A'}">
													<select name='tag'
														style="width: 100px; font-weight: bolder; color: navy;">
														<option value="N">&nbsp;사담&nbsp;</option>
														<option value="Q">&nbsp;질문&nbsp;</option>
														<option value="I">&nbsp;정보&nbsp;</option>
													</select>
												</c:if>
											</p>
											<p>
												<textarea name='content' spellcheck="false"
													style="width: 700px; min-height: 500px; height: auto; resize: none;"></textarea>
											</p>
											<input type="submit" value="글쓰기">
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
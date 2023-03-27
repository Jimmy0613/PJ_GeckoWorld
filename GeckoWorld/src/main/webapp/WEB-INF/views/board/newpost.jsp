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
							<div class="col-4 col-12-medium">
								<div id="sidebar">
									<!-- Sidebar -->
									<section>
										<header class="major">
											<h2>메뉴 menu</h2>
										</header>
										<ul class="style2">
											<li><a href="/board/list_">게코 월드 board</a></li>
											<li><a href="#">게코 자랑 Photos</a></li>
											<li><a href="#">게코 분양 Adoption</a>
												<ul>
													<li><a href="#">데려가세요 with you</a></li>
													<li><a href="#">데려올게요 with me</a></li>
													<li><a href="#">후기 Review</a></li>
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
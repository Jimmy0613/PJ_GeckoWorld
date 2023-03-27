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
							<div class="col-4 col-12-medium">
								<div id="sidebar">
									<!-- Sidebar -->
									<section>
										<header class="major">
											<h2>메뉴 menu</h2>
										</header>
										<ul>
											<li><h3>
													<a href="/board/list_">게시판 main</a>
												</h3></li>
											<li><h3>
													<a href="#">게코 자랑 Photos</a>
												</h3></li>
											<li><h3>
													<a href="#">게코 분양 Adoption</a>
												</h3>
												<ul>
													<li><h4><a href="#">》 데려가세요 with you</a></h4></li>
													<li><h4><a href="#">》 데려올게요 with me</a></h4></li>
													<li><h4><a href="#">》 후기 review</a></h4></li>
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
										<header>
											<h2>게시판</h2>
											<p>사담/정보/질문/답변</p>
										</header>
										<div id="postArea" style="display: none;">
											<h3>
												<span id="tag" style="color: white;"></span><span id="title"></span>
											</h3>
											<strong id="writerDate"></strong>
											<hr />
											<br />
											<%-- newline 변수 설정 --%>
											<jsp:scriptlet>pageContext.setAttribute("newline", "\n");</jsp:scriptlet>
											<p id="postContent"></p>
											<hr>
											<h4>
												댓글 comment &nbsp; <span id="commentCount"></span>
											</h4>
											<form>
												<p>
													<input type="hidden" name='w_id'> <input
														type="hidden" name='w_name'> <input name='content'
														style="width: 650px;"> <input type="submit"
														value="댓글작성">
												</p>
											</form>
										</div>
										<p id="responseMsg">
											
										</p>
										<div id="responseArea">
										
										</div>
	
										<c:if test="${LOGIN_USER != null}">
											<p>
												<a href="/board/newpost">글쓰기</a>
											</p>
										</c:if>
										<div id="listArea">
											<table>
												<thead>
													<tr>
														<td colspan="5"><hr style="border-color: black;" /></td>
													</tr>
													<tr>
														<td>&nbsp;태그</td>
														<td>작성자</td>
														<td>제목</td>
														<td>조회</td>
														<td>추천</td>
													</tr>
													<tr>
														<td colspan="5"><hr style="border-color: black;"></td>
													</tr>
												</thead>
												<tbody class="tbody">
													<c:forEach var="post" items="${list}">
														<tr style="height: 30px;">
															<td style="color: white;"><c:if
																	test="${post.tag eq 'I'}">
																	&nbsp;<span style="background-color: navy">정보</span>
																</c:if> <c:if test="${post.tag eq 'N'}">
																	&nbsp;<span style="color: black">사담</span>
																</c:if> <c:if test="${post.tag eq 'Q'}">
																	&nbsp;<span style="background-color: coral">질문</span>
																</c:if> <c:if test="${post.tag eq 'A'}">
																	&nbsp;<span style="background-color: cornflowerblue">답변</span>
																</c:if></td>
															<td>${post.w_nickname}</td>
															<td style="cursor: pointer;"
																onclick="showPost(${post.num});">${post.title}</td>
															<td>${post.view_count}</td>
															<td>${post.like_count}</td>
														</tr>
														<tr>
															<td colspan="5"><hr></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<p style="width: 100%;" id="pageArea">
											<span id="prevPage" onclick="javascript:prevPage();"
												style="cursor:pointer; text-align: left;"></span>
											<span id="nextPage" onclick="javascript:nextPage();"
												style="cursor:pointer; float: right;"><c:if test="${totalPage>1}">다음 목록 불러오기</c:if></span>
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
	<script src="/resources/assets/js/post.js"></script>

</body>
</html>
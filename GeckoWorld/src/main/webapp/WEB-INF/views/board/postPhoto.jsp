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
												<div class="col-4 col-12-medium" style="width: 100%;">
													<article>
														<section style="text-align: left;">
															<h3>
																<!------ 제목 자리 ------>
																<span id="title">&nbsp;${post.title}</span>
															</h3>
															<!-- ----작성자, 날짜표시 자리--- -->
															<strong id="writerDate">${post.w_nickname}&nbsp;|&nbsp;<fmt:formatDate
																	value="${post.pdate}" pattern="yyyy-MM-dd hh:mm:ss" />&nbsp;|&nbsp;조회수&nbsp;${post.view_count}
																&nbsp; <c:if test="${LOGIN_USER != null}">
																	<c:if test="${LOGIN_USER.id eq post.w_id}">
																		&nbsp;<button onclick="deletePost('${post.num}');"
																			style="padding: 5px;">삭제</button>
																	</c:if>
																</c:if>
															</strong>
															<hr />
															<c:if test="${urlList.size() > 0}">
																<img style="max-width: 100%;" src="${urlList.get(0)}">
																<p>${post.desc1}</p>
																<br />
															</c:if>
															<c:if test="${urlList.size() > 1}">
																<img style="max-width: 100%;" src="${urlList.get(1)}">
																<p>${post.desc2}</p>
																<br />
															</c:if>
															<c:if test="${urlList.size() > 2}">
																<img style="max-width: 100%;" src="${urlList.get(2)}">
																<p>${post.desc3}</p>
																<br />
															</c:if>
															<c:if test="${urlList.size() > 3}">
																<img style="max-width: 100%;" src="${urlList.get(3)}">
																<p>${post.desc4}</p>
																<br />
															</c:if>
															<c:if test="${urlList.size() > 4}">
																<img style="max-width: 100%;" src="${urlList.get(4)}">
																<p>${post.desc5}</p>
																<br />
															</c:if>
															<p>${post.content}</p>
														</section>
														<section style="text-align: left;">
															<h4>
																<!-------- 댓글 자리-------- -->
																댓글 comment &nbsp; <span id="commentCount">${post.comment_count}</span>
															</h4>
															<hr>
															<!-- 댓글 목록 -->
															<table style="width: 100%;">
																<tbody class="commentArea" style="width: 100%;">
																	<c:forEach var="comment" items="${comment}">
																		<tr>
																			<td style="width: 15%;">&nbsp;&nbsp;${comment.w_nickname}
																			</td>
																			<td id="comment${comment.cnum}" style="width: 85%;">
																				&nbsp;&nbsp; ${comment.content} <c:if
																					test="${LOGIN_USER != null }">
																					<c:if test="${LOGIN_USER.id eq comment.w_id}">
																		&nbsp;<button onclick="editComment(${comment.cnum});"
																							style="padding: 5px;">수정</button>
																						<button onclick="deleteComment(${comment.cnum});"
																							style="padding: 5px;">삭제</button>
																					</c:if>
																				</c:if>
																			</td>
																		</tr>
																		<tr>
																			<td colspan="2"><hr></td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
															<!-- 댓글 작성 폼 -->
															<c:if test="${LOGIN_USER != null}">
																<form id="addComment" action="/board/newCommentPhoto">
																	<p style="width: 100%;">
																		<input type="hidden" name="currentPage"
																			value="${currentPage}" /> <input type="hidden"
																			name='num' value="${post.num}" /> <input
																			type="hidden" name='w_id' value="${LOGIN_USER.id}">
																		<input type="hidden" name='w_nickname'
																			value="${LOGIN_USER.nickname}"> <input
																			name='content' style="width: 80%;"> <input
																			type="submit" value="댓글작성">
																	</p>
																</form>
															</c:if>
															<c:if test="${LOGIN_USER == null }">
																<p>
																	<input style="width: 80%;"
																		placeholder="&nbsp;로그인 후 작성할 수 있습니다."> <input
																		type="submit" value="댓글작성">
																</p>
															</c:if>
														</section>
														<p>
															<!--------- 목록 버튼 --------->
															<button
																onclick="location.href='/board/listPhoto?currentPage=${currentPage}'">목록</button>
														</p>
													</article>
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
	<script src="/resources/assets/js/postPhoto.js"></script>
</body>
</html>
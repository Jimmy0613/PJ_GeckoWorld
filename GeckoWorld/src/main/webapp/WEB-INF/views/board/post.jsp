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
									</ul> <c:choose>
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
										<section>
											<header>
												<h2>게시판</h2>
												<p>사담/정보/질문/답변</p>
											</header>
											<h3>
												<!--------- --------태그 자리 --------------->
												<c:if test="${post.tag eq 'N'}">
													<span style="color: white; background-color: black;">사담</span>
												</c:if>
												<c:if test="${post.tag eq 'I'}">
													<span style="color: white; background-color: navy;">정보</span>
												</c:if>
												<c:if test="${post.tag eq 'Q'}">
													<span style="color: white; background-color: coral;">질문</span>
												</c:if>
												<!------ 제목 자리 ------>
												<span id="title">&nbsp;${post.title}</span>
											</h3>



											<!-- ----작성자, 날짜표시 자리--- -->
											<strong id="writerDate">${post.w_nickname}&nbsp;|&nbsp;<fmt:formatDate
													value="${post.pdate}" pattern="yyyy-MM-dd hh:mm:ss" />&nbsp;|&nbsp;조회수&nbsp;${post.view_count}
												&nbsp; <c:if test="${LOGIN_USER != null}">
													<c:if test="${LOGIN_USER.id eq post.w_id}">
														<button style="padding: 5px;">수정</button>&nbsp;<button onclick="deletePost('${post.pnum}');" style="padding: 5px;">삭제</button>
													</c:if>
												</c:if>
											</strong>
											<hr />
											<!----- 글 내용 자리 ---->
											<p id="postContent" style="white-space: pre-line;">
												${post.content}</p>
										</section>
										<section>
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
															<td style="width: 85%;">: &nbsp;&nbsp;
																${comment.content}</td>
														</tr>
														<tr>
															<td colspan="2"><hr></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<!-- 댓글 작성 폼 -->
											<c:if test="${LOGIN_USER != null}">
												<form id="addComment" action="/board/newComment">
													<p style="width: 100%;">
														<input type="hidden" name="currentPage"
															value="${currentPage}" /> <input type="hidden"
															name='pnum' value="${post.pnum}" /> <input type="hidden"
															name='w_id' value="${LOGIN_USER.id}"> <input
															type="hidden" name='w_nickname'
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
										<c:if test="${post.tag eq 'Q'}">
											<!-- 답변 관련 글 자리 -->
											<p id="responseMsg">
												<c:if test="${post.response_count==0}">아직 답변이 없습니다.&nbsp;&nbsp;&nbsp;</c:if>
												<c:if test="${post.response_count!=0}">${post.response_count} 개의 답변이 있습니다.&nbsp;&nbsp;&nbsp;<button
														id="resBtn" onclick="showResponse(${post.pnum});">보기</button>
												</c:if>
												<c:if test="${LOGIN_USER != null }">
													<button
														onclick="location.href='/board/newResponse?pnum=${post.pnum}&ptitle=${post.title}'">답변하기</button>
												</c:if>
											</p>
											<!-- 답변글 나타나는 자리 -->
											<table id="responseArea" style="width: 100%;">
												<thead class="resHead"></thead>
												<tbody class="resBody"></tbody>
											</table>
										</c:if>
										<p>
											<!--------- 목록 버튼 --------->
											<button
												onclick="location.href='/board/list?currentPage=${currentPage}'">목록</button>
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
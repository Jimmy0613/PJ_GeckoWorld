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
							<!-- Sidebar -->
							<%@include file="/WEB-INF/views/board/sidebar.jsp"%>
							<div class="col-8 col-12-medium imp-medium" style="width: 75%;">
								<div id="content">
									<!-- Content -->
									<article>
										<header>
											<h2>게시판</h2>
											<p>사담/정보/질문/답변</p>
										</header>
										<!-- 목록에서 제목 클릭하면 게시글 나타나는 자리 -->
										<div id="postArea" style="display: none;">
											<h3>
												<!--------- --------태그 자리 --------------->
												<!------ 제목 자리 ------>
												<span id="tag" style="color: white;"></span><span id="title"></span>
											</h3>
											<!-- ----작성자, 날짜표시 자리--- -->
											<strong id="writerDate"></strong>
											<hr />
											<br />
											<!----------------------- newline 변수 설정(줄바꿈) ------------------------>
											<jsp:scriptlet>pageContext.setAttribute("newline", "\n");</jsp:scriptlet>
											<!----- 글 내용 자리 ---->
											<p id="postContent"></p>
											<hr>
											<h4>
												<!-------- 댓글 자리-------- -->
												댓글 comment &nbsp; <span id="commentCount"></span>
											</h4>
											<!-- 댓글 작성 폼 -->
											<form id="addComment">
												<p>
													<input type="hidden" name='w_id'> <input
														type="hidden" name='w_name'> <input name='content'
														style="width: 650px;"> <input type="submit"
														value="댓글작성">
												</p>
											</form>
										</div>
										<!-- 답변 관련 글 자리 -->
										<p id="responseMsg"></p>
										<!-- 답변글 나타나는 자리 -->
										<div id="responseArea"></div>

										<c:if test="${LOGIN_USER != null}">
											<p>
												<!--------- 글쓰기 버튼 --------->
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
														<td style="width: 50px;">&nbsp;태그</td>
														<td style="width: 100px;">작성자</td>
														<td>제목</td>
														<td style="width: 50px;">조회</td>
														<td style="width: 50px;">추천</td>
													</tr>
													<tr>
														<td colspan="5"><hr style="border-color: black;"></td>
													</tr>
												</thead>
												<!--- 글 목록 나타나는 자리 --->
												<tbody class="tbody"></tbody>
											</table>
										</div>
										<p style="width: 100%;" id="pageArea">
											<span id="prevPage" onclick="javascript:prevPage();"
												style="cursor: pointer; text-align: left;"></span> <span
												id="nextPage" onclick="javascript:nextPage();"
												style="cursor: pointer; float: right;"><c:if
													test="${totalPage>1}">다음 목록 불러오기 》》</c:if></span>
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
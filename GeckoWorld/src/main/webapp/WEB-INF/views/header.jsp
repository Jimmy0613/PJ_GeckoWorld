<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/resources/assets/chevron-left-solid.svg" type="image/x-icon" />
<link rel="icon" href="/resources/assets/favicon.ico" type="image/x-icon" />
</head>
<body>
	<header id="header">
		<div class="inner">

			<!-- Logo -->
			<h1>
				<a href="/" id="logo">게코월드 GeckoWorld</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="current_page_item"><a href="/">홈 Home</a></li>
					<li><a href="/board/list">게시판 Board</a>
						<ul>
							<li><a href="/board/list">게시판 main</a></li>
							<li><a href="/board/listPhoto">게코 자랑 Photos</a></li>
							<li><a href="#">게코 분양 Adoption</a>
								<ul>
									<li><a href="#">데려가세요 with you</a></li>
									<li><a href="#">데려올게요 with me</a></li>
									<li><a href="#">분양 후기 review</a></li>
								</ul>
						</ul>
					<li><a href="#">공간 대여 space rental</a></li>
					<li><a href="#">안내사항 Info</a></li>
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
</body>
</html>
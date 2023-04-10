<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<li><a href="/">홈 Home</a></li>
					<li><a href="/board/list">게시판 Board</a>
						<ul>
							<li><a href="/board/list">게시판 board</a></li>
							<li><a href="/board/listPhoto">사진게시판 board with photo</a></li>
						</ul></li>
					<li><a href="/user/changePassword">회원 정보
							mypage</a>
						<ul>
							<li><a href="/user/changePassword">비밀번호변경 change password</a></li>
							<li><a href="/user/reservation">공간대여내역 reserve history</a></li>
							<li><a href="/user/out">계정관리 account management</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>
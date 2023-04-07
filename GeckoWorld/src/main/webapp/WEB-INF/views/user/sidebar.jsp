<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<header class="major">
			<h2>내 정보 My Info</h2>
		</header>
		<c:if test="${LOGIN_USER!=null}">
			<table>
				<tr>
					<td><h5>아이디 id</h5></td>
					<td>${LOGIN_USER.id}</td>
				</tr>
				<tr>
					<td><h5>별명 nickname</h5></td>
					<td>${LOGIN_USER.nickname}</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${LOGIN_USER!=null}">
			<footer>
				<c:if test="${LOGIN_USER.type eq 'normal'}">
					<a href="/user/logout" class="button icon solid fa-info-circle">로그아웃
						signout</a>
				</c:if>
				<c:if test="${LOGIN_USER.type eq 'kakao'}">
					<a href="/user/kakaoLogout"
						class="button icon solid fa-info-circle">로그아웃 signout</a>
				</c:if>
			</footer>
		</c:if>
	</section>
	<section>
		<ul class="style2">
			<li><h4>
					<a href="#">개인정보수정 Edit personal info</a>
				</h4></li>
			<li><h4>
					<a href="/user/reservation">공간대여내역 reserve history</a>
				</h4></li>
			<li><h4>
					<a href="#">쪽지함 message box</a>
				</h4></li>
			<li><h4>
					<a href="#">알사용내역 egg history</a>
				</h4></li>
			<li><h4>
					<a href="/user/out">계정관리 account management</a>
				</h4></li>
		</ul>
	</section>
</body>
</html>
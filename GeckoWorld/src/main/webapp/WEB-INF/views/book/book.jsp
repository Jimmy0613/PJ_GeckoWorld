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
	공간예약 팝업
	<form>
		<input type="hidden" name='guestId' value="${LOGIN_USER.id}" /> <input
			name='guestName' value="${LOGIN_USER.nickname}" /> <input
			name='bookDate' value="${bookInfo.bookDate}" /> <input
			name='startTime' value="${bookInfo.startTime}" /> <input
			name='endTime' value="${bookInfo.endTime}" />
	</form>
</body>
</html>
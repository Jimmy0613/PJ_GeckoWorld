<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="calendar">
		<thead>
			<tr>
				<td id="prev" onclick="prev();">&#60;</td>
				<td colspan="5">
				<span id="calYear"></span>년 
				<span id="calMonth"></span>월
				</td>
				<td id="next" onclick="next();">&#62;</td>
			</tr>
			<tr>
				<td>일</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				<td>토</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
</html>
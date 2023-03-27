<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="quickReserv">
		<thead>
			<tr>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">&nbsp;&nbsp;<b>인원수 headcount</b></td>
				<td rowspan="2"><input type="button" onclick="count('minus');"
					id="plus_btn" value="▼">&nbsp;</td>
				<td rowspan="2"><input id="num" name='num' value="1"
					style="width: 30px;" onchange="checkNum()" readonly></td>
				<td rowspan="2">명</td>
				<td rowspan="2">&nbsp;<input type="button"
					onclick="count('plus');" value="▲"></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: left;">&nbsp;&nbsp;<b>입실</b>
					check in &nbsp;&nbsp;
				</td>

				<td colspan="3" style="text-align: left;">&nbsp;&nbsp;<b>퇴실</b>
					check out&nbsp;&nbsp;
				</td>
			<tr>
				<td colspan="3" style="text-align: right;"><input
					id="startDate" name='start_date' value=""
					style="width: 100px; text-align: center;" readonly></td>
				<td colspan="3" style="text-align: right;"><input id="endDate"
					name='end_date' value="" style="width: 100px; text-align: center;"
					readonly></td>
				<td colspan="2">&nbsp;&nbsp;<input type="button" value="검색">&nbsp;&nbsp;<input
					type="button" onclick="reset()" value="다시 선택"></td>
			</tr>
		</tbody>
	</table>
</body>
</html>
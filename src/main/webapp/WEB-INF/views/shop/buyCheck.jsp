<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매목록</title>
</head>
<body>
	구매가 완료되었습니다~ㅋ
	${msg }
<!-- 	
		<table border="1">
		<tr>
			<td colspan="2" align="center"><font size="+1"><b>주문자 정보</b></font></td>
		</tr>
		<tr>
			<td width="200">성 명</td>
			<td width="400">${BUList.name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${BUList.email}</td>
		</tr>
		<tr>
			<td>주  소</td>
			<td>${BUList.address}</td>
		</tr>
		<tr>
			<td>결제계좌(무통장입금)</td>
			<td>
				<select name="account">
					<c:forEach var="bank" items="${bank}" varStatus="i">
						<option>${bank.bank}: ${bank.account} ${bank.name}</option>
					</c:forEach>		
				</select>
			</td>
		</tr>
	</table>
	<br>
	배송지 정보
	<table border="1">
		<tr>
			<td colspan="2" align="center"><font size="+1"><b>배송지정보</b></font></td>
		</tr>
		<tr>
			<td width="200">성 명</td>
			<td width="400">
				<input type="text" name="delivery_name" placeholder="배송 받는 분 성함">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="delivery_tel" placeholder="전화번호 입력">
			</td>
		</tr>
		<tr>
			<td>주  소</td>
			<td>
				<input type="text" name="delivery_address" placeholder="주소 입력">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="구매확인" onclick="<%=request.getContextPath()%>/shop/buyCheck'">&nbsp;&nbsp;
				<input type="button" value="구매취소" onclick="<%=request.getContextPath()%>/shop/cartList'">&nbsp;&nbsp;
				<input type="button" value="메인으로" onclick="<%=request.getContextPath()%>/squart/main2'">
			</td>
		</tr>
	</table>
	 -->
</body>
</html>
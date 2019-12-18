<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/mainStyle.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/shopStyle.css" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>구매페이지</title>
</head>
<body>
	<jsp:include page="../squart/top.jsp" flush = "false"/>
	<div class="container">
	<div class="row justify-content-md-center">
	
	<h3><b>구 매 목 록</b></h3>
	*50,000원 이상 구매시 배송비는 무료입니다.
	<form method="post" action="buyCheckList" name="buyinput">	
		<table id="buyTable" class="table nanum">
			<tr class="dark">
				<th width="100">이미지</th>
				<th width="300">상품명</th>
				<th width="100">상품가격</th>
				<th width="50">수량</th>
				<th width="150">구매금액</th>
			</tr>
			<c:forEach var="bcdto" items="${BCList}" varStatus="i">
				<tr>
					<td>
						<input type="hidden" name="cart_id" value="${bcdto.cart_id}">
						<img src="<%=request.getContextPath()%>/images/${bcdto.product_image}" width="100" height="100">					
					</td>
					<td>${bcdto.product_title}</td>
					<td style="width: 80px">
						<fmt:formatNumber pattern="###,###,###" value="${bcdto.product_price}" /> 원
					</td>
					<td width="40px">
						${bcdto.buy_count}개
						<input type="hidden" name="buy_count" value="${bcdto.buy_count}">
						<input type="hidden" name="product_id" value="${bcdto.product_id}">
			 			<input type="hidden" name="product_title" value="${bcdto.product_title}">
			 			<input type="hidden" name="product_image" value="${bcdto.product_image}">
				 		<input type="hidden" name="product_price" value="${bcdto.product_price}">
				 		<input type="hidden" name="buy_price" value="${bcdto.buy_price}">
						
					</td>
					<td style="width: 100px">
						<fmt:formatNumber pattern="###,###,###" value="${bcdto.buy_price}" /> 원				
					</td>
				</tr>
			</c:forEach>
			<tr>								
				<td colspan="5" align="right">
					배송비 : ${map.fee} 원
				</td>
			</tr>
			<tr class="secondary">
				<td colspan="5" align="right">
					<b>총 구매금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/> 원</b>
				</td> 
			</tr>
		</table>
	<br>
	<br>
	<br>
	<!-- 주문자 정보 출력 -->
		<table class="table table-striped nanum">
			<tr class="dark">
				<td colspan="2" align="center">
					<font size="+1"><b>주문자 정보</b></font>
				</td>
			</tr>
			<tr>
				<td>성 명</td>
				<td>${BUList.name}</td>
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
		<!-- 배송지 정보 -->
		<table class="table table-striped nanum">
			<tr class="dark">
				<td colspan="2" align="center"><font size="+1"><b>배송지정보</b></font></td>
			</tr>
			<tr>
				<td width="200px">성 명</td>
				<td width="400px">
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
					<input type="submit" value="구매확인" onclick="location.href='<%=request.getContextPath()%>/squart/main2'">&nbsp;&nbsp;
					<input type="button" value="구매취소" onclick="location.href='<%=request.getContextPath()%>/shop/cartList'">
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
	<jsp:include page="../squart/bottom.jsp" flush = "false"/>
</body>
</html>

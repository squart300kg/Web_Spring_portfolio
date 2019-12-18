<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.shopping.dao.ShopProductDaoImpl"%>
<%@ page import="com.shopping.service.ShopProductServiceImpl"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/mainStyle.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/shopStyle.css" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>장바구니</title>
<!-- 
<script type="text/javascript">
	function shopList() {
		location.href="< %=request.getContextPath() %>/shop/shoplist";
	}
</script>
 -->
</head>
<body>
	<jsp:include page="../squart/top.jsp" flush = "false"/>
	<div class="container" id="cartContainer">
	<div class="row justify-content-md-center">
	
	<a href="<%=request.getContextPath()%>/shop/shoplist" style="text-decoration:none">상품목록으로 돌아가기</a>

	<h2> 장바구니</h2><br>
	<c:choose>
		<c:when test="${map.count == 0}">
			장바구니가 비어있습니다.
        </c:when>
		<c:otherwise>
			<form name="form1" id="form1" method="post" action="updateCart">
				<table id="cartTable" class="table nanum table-hover">			
					<tr class="dark">
						<th width="150">이미지<br><br></th>
						<th width="100">상품명<br><br></th>
						<th width="100">상품가격<br><br></th>
						<th width="100">수량<br><br></th>
						<th width="100">구매금액<br><br></th>
						<th width="100">상품 삭제<br><br></th>
					</tr>
					<c:forEach var="cdto" items="${cList}" varStatus="i">
						<tr margin="20px">
						
							<td>
								<img src="<%=request.getContextPath()%>/images/${cdto.product_image}" width="120" height="120">					
								<input type="hidden" name="product_image" value="${cdto.product_image}">
							</td>
							<td>
								${cdto.product_title}
								<input type="hidden" name="product_id" value="${cdto.product_id}">
								<input type="hidden" name="product_title" value="${cdto.product_title}">
								
							</td>
							<td style="width: 80px" align="right">
								<fmt:formatNumber pattern="###,###,###" value="${cdto.product_price}" /> 원
								<input type="hidden" name="product_price" value="${cdto.product_price}">
							</td>
							<td>
								<input type="number" style="width: 40px" name="buy_count" value="${cdto.buy_count}" min="1">
							</td>
							<td style="width: 100px" align="right">
								<fmt:formatNumber pattern="###,###,###" value="${cdto.buy_price}" /> 원
								<input type="hidden" name="buy_price" value="${cdto.buy_price}">
							 	<input type="hidden" name="cart_id" value="${cdto.cart_id}">
							</td>
							<td><a href="deleteCart?cart_id=${cdto.cart_id}">&nbsp;&nbsp;<삭제></a></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6" id="cartTd">
							배송료 : <fmt:formatNumber pattern="###,###,###" value="${map.fee}"/> 원<br>
							장바구니 총금액 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/> 원<br>
							전체 주문 금액  : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/> 원<br><br>
							<button type="submit">수정</button>&nbsp;
							<input type="button" value="구매하기" onclick="location.href='<%=request.getContextPath()%>/shop/buyInputList?buyer=${cdto.buyer}'">
						</td>
					</tr>
				</table>
				<input type="hidden" name="count" value="${map.count}">
			</form>
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	<jsp:include page="../squart/bottom.jsp" flush = "false"/>
<!-- 	<button type="button" onclick="shopList()">상품목록</button> -->
</body>
</html>


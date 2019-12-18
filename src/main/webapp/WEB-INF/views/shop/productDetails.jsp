<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="com.shopping.dao.ShopProductDaoImpl" %>
<%@ page import="com.shopping.service.ShopProductServiceImpl" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/mainStyle.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/shopStyle.css" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>상품 상세 페이지</title>
</head>
<body>
	<jsp:include page="../squart/top.jsp" flush = "false"/>

	<div class="container" id="detailContainer">
	<a href="<%=request.getContextPath() %>/shop/shoplist" style="text-decoration:none">메인으로</a>
	<form name="insertCart" action="cartList" method="post">
		<table class="table">
			<tr>
				<td rowspan="6" width="500">
					<img src="<%=request.getContextPath()%>/images/${dto.product_image}" border="0" width="450" height="450">					
				</td>
			</tr>
			<tr height="30">
				<td width="500"><font size="+1"><b>[${dto.brand}] ${dto.product_title}</b></font><br>등록일 : ${dto.reg_date}<br></td>
			</tr>
			<tr>
				<td>
					정  가 : <fmt:formatNumber value="${dto.product_price}" pattern="###,###,###"/>원<br>
			                  수  량 : <select name="buy_count">
                  	   <c:forEach begin="1" end="10" var="i">
                    	  <option value="${i}">${i}</option>
                       </c:forEach>
                    </select>&nbsp;개&nbsp;
					<input type="hidden" name=product_id value="${dto.product_id}">
					<input type="hidden" name=product_title value="${dto.product_title}">
					<input type="hidden" name=buy_price value="${dto.product_price}">
					<input type="hidden" name=product_price value="${dto.product_price}">
					<input type="hidden" name=buy_count value="${i}">
					<input type="hidden" name=product_kind value="${dto.product_kind}">
					<input type="hidden" name=product_image value="${dto.product_image}">
					<input type="submit" value="장바구니에 담기">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="left">
					제품 상세 정보 : <br>
					${dto.product_content}
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../squart/bottom.jsp" flush = "false"/>
</body>
</html>
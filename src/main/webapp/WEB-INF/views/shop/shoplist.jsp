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
  	
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/shopStyle.css" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/mainStyle.css" />
	<title>상품 목록</title>
</head>
<body>
	<jsp:include page="../squart/top.jsp" flush = "false"/>
	<div class="container"  id="container">
	<div class="row justify-content-md-center">
	   <c:set var="i" value="0" />
	   <c:set var="j" value="4" />
	   <table class="table" id="sListTable">
	      <c:forEach items="${list}" var="ProductDto" >
	      <c:if test="${i%j == 0 }">
	       <tr>
	       </c:if>
	           <td>
	           	<a href="productDetail?product_id=${ProductDto.product_id}" >
	               <img width="200px" height="200px" src="<%=request.getContextPath()%>/images/${ProductDto.product_image}" /><br>
	            </a>
	           	<!-- productDetail 리퀘스트맵핑 밸류 값 -->
				<a href="productDetail?product_id=${ProductDto.product_id}" style="text-decoration:none">${ProductDto.product_title}</a><br>
	                           가격: <fmt:formatNumber value="${ProductDto.product_price}" pattern="###,###,###"/>
	           </td>
	       <c:if test="${i%j == j-1 }">
	  		</tr>
	       </c:if>
	       <c:set var="i" value="${i+1 }" />
	       </c:forEach>
	   </table>
	</div>
	</div>
	<jsp:include page="../squart/bottom.jsp" flush = "false"/>
</body>
</html>
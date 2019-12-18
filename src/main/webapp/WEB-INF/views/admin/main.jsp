<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@include file="/WEB-INF/include/bootstrapRef.jsp" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<!--  
<link rel="stylesheet" href="/workout/resources/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/workout/resources/bootstrap/css/bootstrap-theme.css" />
<script src="/workout/resources/bootstrap/js/bootstrap.min.js"></script>
-->
<link rel="stylesheet" type="text/css" href="/workout/resources/css/style.css" />
	<style>
      
	body {
		position:relative;
	}
	.affix {
		top:0;
		width:100%;	
		z-index:9999 !important;
	}
	.navbar {
		margin-bottom:0px;
	}
	.affix ~ .container-fluid {
		position:relative;
		top:50px;
	}
	
	</style>
<title>관리자 페이지</title>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!-- 상단의 로고부문 -->
<div class="container-fluid" style="background-color:#6E6E6E;
	color:#FFF; height:150px; margin:auto;">
	<h1 align="center">쇼핑몰 관리자 페이지</h1>
	<h3 align="center">쇼핑몰 매니저 관리 메뉴</h3>
</div>

<!-- 메인메뉴부분 -->
<nav class="navbar navbar-inverse" data-spy="affix"
	data-offset-top="197">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle"
			data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button> 
			<a class="navbar-brand" href="#">BookShop</a>
		</div>
		<div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						 상품관리 <span class="caret"></span></a>
						 <ul class="dropdown-menu">						 
						 	<li><a href="productProcess/productRegisterForm">상품등록</a>
						 	<li><a href="productProcess/productList?product_kind=all">상품수정/삭제</a>
						 </ul>
					</li>
					
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						 판매관리 <span class="caret"></span></a>
						 <ul class="dropdown-menu">
						 	<li><a href="orderedProduct/orderedList.jsp">판매리스트</a></li>
						 </ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						 배송관리 <span class="caret"></span></a>
						<ul class="dropdown-menu">
						 	<li><a href="delivery/deliveryList.jsp">배송리스트</a></li>
						 </ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						 통계관리 <span class="caret"></span></a>
						 <ul class="dropdown-menu">
						 	<li><a href="statistic/monthStatsForm.jsp">월별 판매 리스트(꺾은 선)</a></li>
						 	<li><a href="statistic/monthBarForm.jsp">월별 판매 리스트(막대)</a></li>
						 	<li><a href="statistic/bookKindStatsForm.jsp">도서 종류 별 연간 판매 비율</a></li>
						 </ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						 회원관리 <span class="caret"></span></a>
						 <ul class="dropdown-menu">
						 	<li><a href="userMgr/userList.jsp?mode=0">회원등록(수정/삭제)</a></li>
						 </ul>
					</li>
					<li>
						<a href="logon/managerLogout.jsp">로그아웃</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</nav>


</body>
</html>
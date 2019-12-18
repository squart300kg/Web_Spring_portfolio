<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8">
	<title>회원목록</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1,
		user-scalable=no' name='viewport'>
	<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" type="text/css"/>
</head>
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>

<body>
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
		</header>
	</div>
	
	<div class="content-wrapper">
	
		<section class="content-header">
			<h1>
			회 원 관 리
			</h1>
		
		
		<button type="submit" class="btn btn-primary" id="bo">글작성</button>
		
		</section>


	<script>
		
			$(document).ready(function(){
			
				$("#bo").on("click",function(){
					self.location = "<%=request.getContextPath()%>/board/insert";
				});
				
			});
		
		
		</script>
				

























<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix= "spring" uri="http://www.springframework.org/tags" %>    
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>정보수정</title>
	<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" type="text/css">
</head>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>
<!--<script src="zcontroller/resources/js/jquery-2.1.4"></script>-->



<body>
<jsp:include page="../squart/top.jsp" flush = "false"/>
<div class = "container">
	<div class="container">
		<form role="form" method="post">
			<input type="hidden" name="num" value="${boardVO.num}">
			
		
		
		<div class="box-body">
			<div class="form-group">
				<label>제 목</label>
				<input type="text" name="subject" class="form-control"
					value="${boardVO.subject}">
			</div>
		</div>
		
		<div class="box-body">
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" name="content" rows="20"
					>${boardVO.content}</textarea>
			</div>
		</div>
		<div class="box-body">
			<div class="form-group">
				<label>글쓴이</label>
				<input type="text" name="writer" class="form-control"
					value="${boardVO.writer}" readonly="readonly" >
			</div>
		</div>
		</form>
		<div class="box-footer">
			<button type="submit" class="btn btn-warning">저장</button>
			<button type="submit" class="btn btn-danger">취소</button>
		
		
		</div>
		
		<script>
		
			$(document).ready(function(){
				var formObj = $("form[role='form']");
				console.log(formObj);
				
				$(".btn-warning").on("click",function(){
					formObj.submit();
				});
				$(".btn-danger").on("click",function(){
					self.location = "<%=request.getContextPath()%>/board/list";
				});
			});
		
		
		</script>
				
				
		
		
		
		
	</div>

</div>
<jsp:include page="../squart/bottom.jsp" flush = "false"/>
</body>
</html>
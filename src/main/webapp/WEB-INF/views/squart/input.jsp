<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css">
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/function.js"></script>
<title>회원 가입</title>
</head>
<body>
<div class = "container">
	<form:form class="form-horizontal" action = "inputPro" method = "post" id = "commandForm">
	<div class = "form-group">
		<div class = "col-sm-3"></div>
		<div class = "col-sm-6">
			<h2 align = "center">회원가입</h2>
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">아이디</label>
		<div class = "col-sm-4">
			<input type = "text" class="form-control" id="id" name="id" maxlength="20" placeholder="ID" value = "${command.id }">
			<form:errors path = "id"/>
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">비밀번호</label>
		<div class = "col-sm-4">
			<input type = "password" class="form-control" id="password" name="password" maxlength="20" placeholder="Password" value = "${command.password }">
			<form:errors path = "password"/>
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">비밀번호 확인</label>
		<div class = "col-sm-4">
			<input type = "password" class="form-control" name = "confirmPassword"id = "confirmPassword" maxlength="20" placeholder="confirmPassword"value = "${command.confirmPassword }">
			<form:errors path = "confirmPassword"/>
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">이름</label>
		<div class = "col-sm-4">
			<input type = "text" class="form-control" name = "name"id = "name" placeholder = "name" value = "${command.name }">
			<form:errors path = "name"/>
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">주소</label>
		<div class = "col-sm-4">
			<input type = "text" class="form-control" name = "address"id = "address" placeholder = "address" value = "${command.address }">
			<form:errors path = "address"/>
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">이메일</label>
		<div class = "col-sm-4">
			<input type = "email" class="form-control" name = "email" id = "email" placeholder = "email" value = "${command.email }">
			<form:errors path = "email"/>
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">자동가입방지</label>
		<div class = "col-sm-4">
			<img src="<%=request.getContextPath() %>/captcha" id="captchaImg" alt="captcha img">
			<button onclick="imgRefresh()" id="refreshBtn">새로고침</button>
			<input type="text" class="form-control" name= "captcha" id="captcha" placeholder="보안문자를 입력하세요" autocomplete="off" >
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<div class = "col-sm-offset-5 col-sm-10">
			<button type = "button" onclick = "inputCheck(this.form);" class="btn btn-primary">회원 가입</button>
			<button type = "reset" class="btn btn-danger">다시 작성</button>
		</div>
	</div>
	</form:form>
</div>



</body>
</html>
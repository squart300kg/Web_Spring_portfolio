<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function imgRefresh(){
	$("#captchaImg").attr("src", "/captcha?id=" + Math.random());
}
</script>
</head>
<body>
<!-- 비번 찾기 정보를 입력한 후 script의 alert정보를 띄워준 후 메인으로 이동 -->
<h1></h1>

<div class = "container">
<form class="form-horizontal" method = "post">
	<div class = "form-group">
		<div class = "col-sm-3"></div>
		<div class = "col-sm-6">
			<h2 align = "center">비밀번호 찾기</h2>
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">아이디</label>
		<div class = "col-sm-4">
			<input type = "text" class="form-control" name = "id" maxlength="35" placeholder="ID" value = "${id }"><br/>
			${noId }
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">이메일</label>
		<div class = "col-sm-4">
			<input type = "email" class="form-control" name = "email" maxlength="35" placeholder="EMAIL" value = ${email }><br/>
			${noMatchingEmail }
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">이름</label>
		<div class = "col-sm-4">
			<input type = "text" class="form-control" name = "name" maxlength="35" placeholder="NAME" value = ${name }><br/>
			${noMatchingName }
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<label class = "control-label col-sm-2">자동가입 방지</label>
		<div class = "col-sm-4">
			<img src="<%=request.getContextPath() %>/captcha" id="captchaImg" alt="captcha img">
			<button onclick="imgRefresh()" id="refreshBtn">새로고침</button>
			<input type="text" class="form-control" name= "captcha" id="captcha" placeholder="보안문자를 입력하세요" autocomplete="off" >
			${check }
		</div>
	</div>
	<div class = "form-group">
	<div class = "col-sm-2"></div>
		<div class = "col-sm-offset-5 col-sm-10">
			<button type = "submit" class = "btn btn-primary">입력 완료</button>
			<button type = "reset" class = "btn btn-danger">다시 작성</button>
		</div>
	</div>

</form>
</div>
</body>
</html>
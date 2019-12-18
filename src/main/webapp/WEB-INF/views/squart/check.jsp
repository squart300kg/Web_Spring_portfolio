<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 약관동의  </title>
	<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="<%=request.getContextPath() %>/resources/js/jquery-2.2.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h1 class = "col-sm-offset-2">약관동의</h1>

<form method = "post" class = "form-horizontal">
	<div class = "alert alert-info col-sm-offset-2 col-sm-4">
	<strong>[ Squart의 약관동의 ]</strong>
	<p>
		<label>
			<textarea rows="4" cols="50" readonly="readonly">1.나는 앞으로 스쿼트를 하겠다</textarea><br/>
			<input type = "checkbox" name = "agree1" value = "true">약관동의&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			${msg }
		</label>
	</p>
	<p>
		<label>
			<textarea rows="4" cols="50" readonly="readonly">1.나는 앞으로 스트레칭을 하겠다</textarea><br/>
			<input type = "checkbox" name = "agree2" value = "true">약관동의&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			${msg }
		</label>
	</p>
	<p>
		<label><input type = "submit" value = "동의">[Squart]의 약관에 동의합니다.</label>	
	</p>
	</div>
</form>
 

</body>
</html>
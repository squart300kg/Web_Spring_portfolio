<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드 테스트 폼</title>
</head>
<body>
<form action="/getFile" method="post" enctype="multipart/form-data">
    <input type="file" name="product_image" />
    <input type="submit" value="서버전달"/>
</form>

</body>
</html>
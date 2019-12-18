<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="com.spring.mybatisSetting2.dto.SquartDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/mainStyle.css" />
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<title>이메일 인증</title>

</head>
<body>
<jsp:include page="./top.jsp" flush="false"/>

	<h3 align="center">${email }로 아이디를 발송해 드렸습니다!<br/>다음부턴 까먹지 마세요! ^.^</h3><br/>
	<img src = "<%=request.getContextPath() %>\resources\image\childSquart.jpg" class = "childSquart" style = "margin-left : 35%">
		

<br><br>

<jsp:include page="./bottom.jsp" flush="false"/>

</body>
</html>
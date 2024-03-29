<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="com.spring.mybatisSetting2.dto.SquartDto" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Squart, 당신의 젊음을 재창조하라!</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/mainStyle.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>

<jsp:include page="./top.jsp" flush="false"/>

<jsp:include page="./middle.jsp" flush="false"/>

<jsp:include page="./bottom.jsp" flush="false"/>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 모름 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->


<!-- 부트스트랩 -->
<%@ include file="/WEB-INF/views/admin/include/bootstrapRef.jsp" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>관리자 페이지</title>
    
    <!-- bootstrap 선언문 
	<//%@include file="/WEB-INF/include/bootstrapRef.jsp" %>로 사용-->
	
	
	
	<!-- 스크립트 -->
	
    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/bootstrap/js/umd/popper.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath() %>/resources/js/sb-admin.min.js" type="text/javascript"></script>
    
    <!-- Page level plugin JavaScript-->
    <script src="<%=request.getContextPath() %>/resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/datatables/dataTables.bootstrap4.js"></script>
    
    
   
    <!-- CSS -->
    
    <!-- Bootstrap core CSS-->
    <link href="<%=request.getContextPath() %>/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/vendor/bootstrap/css/bootstrap-theme.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath() %>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    
    <!-- Page level plugin CSS-->
    <link href="<%=request.getContextPath() %>/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath() %>/resources/css/sb-admin.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
    

</head>
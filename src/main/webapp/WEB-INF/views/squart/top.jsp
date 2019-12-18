<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="com.spring.mybatisSetting2.dto.SquartDto" %>


<div class="jumbotron" id="jumbotron">
  <div class="container text-center">
	   	 <img src = "<%=request.getContextPath() %>\resources\image\Squart-logo.png">
  </div>
</div>
<div>
<%
SquartDto squartDto = (SquartDto)session.getAttribute("User");
if(squartDto != null){
%>
<li><a href = "<%=request.getContextPath() %>/squart/logout" style="text-decoration:none"><span class="glyphicon glyphicon-user"></span>로그아웃</a>|<a href = "<%=request.getContextPath() %>/squart/changeUserInfo" style="text-decoration:none">회원정보 변경</a>|<a href = "<%=request.getContextPath() %>/shop/cartList" style="text-decoration:none">장바구니</a></li>

<%
}else{
%>
<li><a href="<%=request.getContextPath()%>/squart/login1" style="text-decoration:none"><span class="glyphicon glyphicon-user"></span> 로그인</a> | <a href="<%=request.getContextPath()%>/squart/check" style="text-decoration:none"> 회원가입</a> | <a href = "<%=request.getContextPath() %>/squart/searchId" style="text-decoration:none">아이디 찾기</a>|<a href = "<%=request.getContextPath() %>/squart/searchPassword" style="text-decoration:none">비밀번호 찾기</a></li>
<%
}
%>


</div>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="<%=request.getContextPath()%>/squart/main2">Home</a></li>
        <li><a href="<%=request.getContextPath()%>/shop/shoplist">쇼핑몰</a> </li>
        <li><a href="<%=request.getContextPath()%>/board1/list">운동의 이해</a>
        </li>
        <li><a href="<%=request.getContextPath()%>/board2/list">관절의 이해</a>
        </li>    <!-- 필요에 따라 변경 -->
        <li><a href="<%=request.getContextPath()%>/board3/list">체중 관리</a>
        </li>   <!-- 필요에 따라 변경 -->
      	<li><a href="<%=request.getContextPath()%>/board4/list">질문</a>
      	</li>
      	<li><a href="<%=request.getContextPath()%>/board5/list">자유 토론</a>
      	</li>
      	<li><a href="<%=request.getContextPath()%>/board6/list">공지사항</a></li>
      </ul>
    <form class="navbar-form navbar-right" action="/action_page.php" style="margin-right:10px;">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    </div>
  </div>
</nav>

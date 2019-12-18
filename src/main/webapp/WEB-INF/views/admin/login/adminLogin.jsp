<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>관리자 로그인페이지</title>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var aid = $("#aid").val();
			var apw = $("#apw").val();
			if(aid == ""){
				alert("아이디를 입력하세요.");
				$("#aid").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if(apw == ""){
				alert("아이디를 입력하세요.");
				$("#apw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form.action="${path}/admin/login/adminLoginCheck"
			// 제출
			document.form.submit();
		});
	});
</script>
</head>
<body>
  <body class="bg-dark">

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">관리자 로그인</div>
        <div class="card-body">
          <form name="form" method="post">
            <div class="form-group">
              <div class="form-label-group">
                <input name="aid" id="aid" type="text" class="form-control" placeholder="아이디" required="required" autofocus="autofocus">
                <!--<label for="inputId">ID</label>-->
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input name="apw" id="apw" type="password" class="form-control" placeholder="비밀번호" required="required">
                  <!--  <label for="inputPassword">Password</label>-->
              </div>
            </div>
            <div>
            <button type="button" id="btnLogin" style="display: block; margin: 0 auto;">로그인</button>
            	<c:if test="${msg == 'failure'}">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${param.msg == 'nologin'}">
					<div style="color: red">
						관리자 로그인 후 사용이 가능합니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout'}">
					<div style="color: red">
						로그아웃되었습니다.
					</div>
				</c:if>
			</div>
          </form>
        </div>
      </div>
    </div>


  </body>

<!--  
<h2>관리자 로그인</h2>
	<form name="form" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="aid" id="aid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="apw" id="apw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
				<c:if test="${msg == 'failure'}">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${param.msg == 'nologin'}">
					<div style="color: red">
						관리자 로그인 후 사용이 가능합니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout'}">
					<div style="color: red">
						로그아웃되었습니다.
					</div>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
-->	
	
</body>

</html>
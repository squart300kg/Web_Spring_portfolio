<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
       String publicKeyModulus = (String) request.getAttribute("modulus");
       String publicKeyExponent = (String) request.getAttribute("exponent");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 페이지</title>
		<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<script src="<%=request.getContextPath() %>/resources/js/jquery-2.2.0.min.js"></script>
		<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
		<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js"></script>
		<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rsa.js"></script>
		<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/prng4.js"></script>
		<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rng.js"></script>
		<script type="text/javascript">
		function validateEncryptedForm() {
		    var username = document.getElementById("username").value;
		    var password = document.getElementById("password").value;
		    if (!username || !password) {
		        alert("ID/비밀번호를 입력해주세요.");
		        return false;
		    }

		    try {
		        var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
		        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
		        submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent);
		    } catch(err) {
		        alert(err);
		    }
		    return false;
		}

		function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
		    var rsa = new RSAKey();
		    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

		    // 사용자ID와 비밀번호를 RSA로 암호화한다.
		    var securedUsername = rsa.encrypt(username);
		    var securedPassword = rsa.encrypt(password);

		    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
		    var securedLoginForm = document.getElementById("securedLoginForm");
		    securedLoginForm.securedUsername.value = securedUsername;
		    securedLoginForm.securedPassword.value = securedPassword;
		    securedLoginForm.submit();
		}
		</script>
		
	</head>
<body>
<div class="container" >
	<form class="form-horizontal" style = "margin-top : 15%">
	<div class="form-group">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
        <h2 align=center>사용자 로그인</h2>
        <p align=center>${needAuth }</p>
        </div>
    </div>
	<div class="form-group">
	<div class = "col-sm-2"></div>
		<label class="control-label col-sm-2" for="username">아이디</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="username" name="username" maxlength="20" placeholder="Enter Admin id" value = ${id }>
			${ noId}
		</div>
	</div>
	
	<div class="form-group">
	<div class = "col-sm-2"></div>
		<label class="control-label col-sm-2" for="password">비밀번호</label>
		<div class="col-sm-4"> 
			<input type="password" class="form-control" id="password" name="password" maxlength="20" placeholder="Enter password">
			${noMatchingPassword }
		</div>
	</div>
	
 	<div class="form-group">        
		<div class="col-sm-offset-5 col-sm-10">
			<a href="<%=request.getContextPath()%>/squart/login1" onclick="validateEncryptedForm(); return false;"> 
	        	<button type = "button" class="btn btn-primary">로그인</button>
	        </a>
	        <a href="<%=request.getContextPath()%>/squart/input"> 
	        	<button type = "button" class="btn btn-success">회원가입</button>
	        </a>
		</div>
		
	</div>
	<input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus%>" />
	<input type="hidden" id="rsaPublicKeyExponent" value="<%=publicKeyExponent%>" />
    </form>
     <form id="securedLoginForm" name="securedLoginForm" method="post" action = "login1" style="display: none;">
	        <input type="hidden" name="securedUsername" id="securedUsername" value="" />
	        <input type="hidden" name="securedPassword" id="securedPassword" value="" />
	 </form>

</div>	
	
	    
	</body>
</html>
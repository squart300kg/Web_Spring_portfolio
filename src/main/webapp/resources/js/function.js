function imgRefresh(){
	$("#captchaImg").attr("src", "/captcha?id=" + Math.random());
}

function inputCheck(commandForm){
	var id 				= commandForm.id.value;
	var password 		= commandForm.password.value;
	var confirmPassword = commandForm.confirmPassword.value;
	var name 			= commandForm.name.value;
	var email 			= commandForm.email.value;
	var address 		= commandForm.address.value;
	var captcha			= commandForm.captcha.value;
	
	if(!id){
		alert("아이디를 입력해 주세요");
		document.commandForm.id.focus();
		return false;
	}
	if(!password){
		alert("비밀번호를 입력해 주세요");
		document.commandForm.password.focus();
		return false;
	}
	if(!confirmPassword){
		alert("비밀번호 확인을 입력해 주세요");
		document.commandForm.confirmPassword.focus();
		return false;
	}
	if(!name){
		alert("이름을 입력해 주세요");
		return false;
	}
	if(!email){
		alert("이메일을 입력해 주세요");
		return false;
	}
	if(!address){
		alert("주소를 입력해 주세요");
		return false;
	}
	if(!captcha){
		alert("자동가입방지문자를 입력해 주세요");
		return false;
	}
	if(password.length < 8 || password.length > 20){
		alert("비밀번호는 8자리 이상 20자리 이하여야 합니다.");
		document.commandForm.password.focus();
		return false;
	}
	if(id.length < 4 || id.length > 20){
		alert("아이디는 4자리 이상 20자리 이하여야 합니다.");
		docuemtn.commandForm.id.focus();
		return false;
	}
	if(id == password){
		alert("아이디와 같은 비밀번호 설정은 불가합니다.");
		return false;
	}
	if(password != confirmPassword){
		alert("비밀번호와 비밀번화 확인이 같지 않습니다.");
	}
	//document.commandForm.submit();
	commandForm.submit();
	//commandForm.action = "inputPro";
}
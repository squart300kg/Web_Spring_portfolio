/**
 * 
 */
//상품 등록 체크함수
function checkForm(writeform) {
	if(!writeform.product_kind.value) {
		alert("상품의 분류를 선택하십시오.");
		writeform.product_kind.focus();
		return false;
	}
	if(!writeform.product_title.value) {
		alert("상품의 제목을 입력하십시오.");
		writeform.product_title.focus();
		return false;
	}
	if(!writeform.product_price.value) {
		alert("상품의 가격을 입력하십시오.");
		writeform.product_price.focus();
		return false;
	}
	if(!writeform.product_count.value) {
		alert("상품의 수량을 입력하십시오.");
		writeform.product_count.focus();
		return false;
	}
	if(!writeform.brand.value) {
		alert("브랜드명을 입력하십시오.");
		writeform.publishing_com.focus();
		return false;
	}
	if(!writeform.product_content.value) {
		alert("상품의 설명을 입력하십시오.");
		writeform.product_content.focus();
		return false;
	}
	if(!writeform.discount_rate.value) {
		alert("할인율을 입력하십시오.");
		writeform.discount_rate.focus();
		return false;
	}
	writeform.action = "productRegisterPro";
	writeform.submit();
} // End - checkForm(writeform)

/*상품정보 수정 검사
function updateCheckForm(writeform) {
	if(!writeform.product_kind.value) {
		alert("상품의 분류를 선택하십시오.");
		writeform.product_kind.focus();
		return false;
	}
	if(!writeform.product_title.value) {
		alert("상품의 제목을 입력하십시오.");
		writeform.product_title.focus();
		return false;
	}
	if(!writeform.product_price.value) {
		alert("상품의 가격을 입력하십시오.");
		writeform.product_price.focus();
		return false;
	}
	if(!writeform.product_count.value) {
		alert("상품의 수량을 입력하십시오.");
		writeform.product_count.focus();
		return false;
	}
	if(!writeform.publishing_com.value) {
		alert("브랜드명을 입력하십시오.");
		writeform.brand.focus();
		return false;
	}
	/*
	if(!writeform.product_content.value) {
		alert("상품의 설명을 입력하십시오.");
		writeform.product_content.focus();
		return false;
	}
	
	writeform.action = "";
	writeform.submit();
} // End - updateCheckForm(writeform)*/
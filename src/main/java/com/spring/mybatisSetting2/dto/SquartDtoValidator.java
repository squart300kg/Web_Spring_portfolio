package com.spring.mybatisSetting2.dto;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class SquartDtoValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return SquartDto.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		SquartDto dto = (SquartDto)target;
		
		
		if(dto.getId().length() < 4 && dto.getId().length() < 20) {
			errors.rejectValue("id", "idLengthError");
		}
		
		if(dto.getPassword().length() < 8 && dto.getPassword().length() > 20) {
			errors.rejectValue("password", "passwordLengthError");
		}
		
		if(!(dto.getPassword().equals(dto.getConfirmPassword()))){
			errors.rejectValue("password", "notMatchingPassword");
		}

		String specialCharacter[] = "! @ # $ % ^ & * ( ) - _ = + | , . /".split(" ");
		
		int specVal = 0;
		for(int i = 0 ; i < specialCharacter.length; i ++) {
			String spec = specialCharacter[i];
			if(dto.getPassword().contains(new StringBuffer(spec))) {
				specVal += 1;
			}
		}
		if(specVal == 0) {
			errors.rejectValue("password", "passwordSpecCheck");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");	
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "required");
	}

}

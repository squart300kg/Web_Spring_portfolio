package com.spring.mybatisSetting2.controller;

import java.security.PrivateKey;
import java.security.spec.InvalidKeySpecException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mybatisSetting2.dto.RSA;
import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.mybatisSetting2.dto.SquartDtoValidator;
import com.spring.mybatisSetting2.secure.RSAUtil;
import com.spring.mybatisSetting2.secure.SecureSHA256;
import com.spring.mybatisSetting2.service.SquartService;

import te.pr.service.BoardService1;
import te.pr.service.BoardService2;
import te.pr.service.BoardService3;
import te.pr.service.BoardService4;
import te.pr.service.BoardService5;
import te.pr.service.BoardService6;

@Controller
@RequestMapping("/squart")
public class SquartController {
	
	@Inject
	private SquartService service;
	
	@Inject 
	private BoardService1 bservice1;
	
	@Inject 
	private BoardService2 bservice2;
	
	@Inject 
	private BoardService3 bservice3;
	
	@Inject 
	private BoardService4 bservice4;
	
	@Inject 
	private BoardService5 bservice5;
	
	@Inject 
	private BoardService6 bservice6;
	
	
	@RequestMapping("/top")
	public String top() {
		return "squart/top";
	}
	
	//회원가입할때
	@RequestMapping("/input")
	public String input(@ModelAttribute("command")SquartDto squartDto,HttpSession session, Model model) {
		//1.공개키는 뷰페이지로 보낸다.
		//2.비밀키는 세션에 저장시킨다.
		
		return "squart/input";
	}
	
	//회원가입하기, 회원가입시 각종 아이디 검사
	@RequestMapping(value = "/inputPro", method=RequestMethod.POST)
	public String inputPro(@ModelAttribute("command")SquartDto squartDto,Errors errors,HttpSession session, RedirectAttributes rttr) throws Exception {
		new SquartDtoValidator().validate(squartDto, errors);
		/*1.회원가입 검사를 위한 데이터가 들어온다
		 * 1.1.암호화해서 들어온 데이터들을 복호화해서 검사를 한다.
		 * 1.2.검사 조건에 맞지 않으면 squart/input으로 리다이렉트시킨다.
		 * 1.3.리다이렉트되면 새로운 개인키와 공개키를 발급받는다.
		 * 1.4.발급받은 공개키는 다시 JSP페이지로 전송하고, 개인키는 세션에 저장한다.
		 *2.회원가입이 완료된 데이터가 들어온다. 
		 * 2.1.암호화돼서 들어온 데이터들을 복호화한다.
		 * 2.2.복호화된 데이터들이 모든 검사를 통과한다.
		 * 2.3.복호화된 데이터들을 DB에 입력한다.
		 * 2.4.복호화된 이메일로 
		 * */
		
		
		//자동 가입 방지 확인
		String captchaValue = (String) session.getAttribute("captcha");

		if (squartDto.getCaptcha() == null || !captchaValue.equals(squartDto.getCaptcha())) {
		        return "squart/input"; //자동가입방지 문자가 틀리다면
		}
		 
		 //아이디 중복 확인
		if(service.idDuplicateCheck(squartDto.getId()) != null) {
			errors.rejectValue("id", "duplicateId");
			return "squart/input";
		}
		
		
		//이메일 중복 확인
		if(service.emailCheck(squartDto.getEmail()) != null) {
			errors.rejectValue("email", "duplicateEmail");	
			return "squart/input";
		}
		
		
		//각 항목들이 공백이거나, 아이디, 비밀번호의 자릿수가 맞지않으면 에러발생.
		if(errors.hasErrors()) {
			return "squart/input";
		}
		
		//비밀번호 특수문자를 검사하기 위함
		String specialCharacter[] = "! @ # $ % ^ & * ( ) - _ = + | , . /".split(" ");
		
		int specVal = 0;
		for(int i = 0 ; i < specialCharacter.length; i ++) {
			String spec = specialCharacter[i];
			if(squartDto.getPassword().contains(new StringBuffer(spec))) {
				specVal += 1;
			}
		}
		
		if(specVal == 0) {
			rttr.addFlashAttribute("passwordSpecCheck", "비밀번호에는 특수문자가 포함되어야 합니다.");
			return "squart/input";
		}
		
		//회원 등록 완료.
		service.insert(squartDto);
		
		//회원 등록 후, 이메일 보내기
		service.create(squartDto);
		return "squart/emailConfirm1";
	}
	
	
	
	
	
	
	
	
	
		//로그인폼을 호출
		@RequestMapping(value = "/login1", method = RequestMethod.GET)
		public String login1(HttpSession session, Model model) throws InvalidKeySpecException {
			//1.공개키(exponent, modulus)를 JSP페이지로 전달
			//2.비밀키를 세션에 저장
			
			//공개키와 비밀키를 생성을 위한 객체 생성
			RSAUtil rsaUtil = new RSAUtil();
			
			
			//원래 존재하던 비밀키 파쇄
			PrivateKey key = (PrivateKey)session.getAttribute("RSAprivateKey");
			if(key != null) {
				session.removeAttribute("RSAprivateKey");
			}
			
			//공개키와 비밀키를 생성하여 RSA이름의 DTO에 저장
			RSA rsa = rsaUtil.createRSA();
		
			//공개키는 JSP페이지로 보내고
			model.addAttribute("modulus",rsa.getModulus());
			model.addAttribute("exponent",rsa.getExponent());
			//그리고 비밀키는 세션에 저장한다.
			session.setAttribute("RSAprivateKey",rsa.getPrivateKey());
			return "squart/login1";
		}
		
		
		
		//아이디, 비밀번호를 복호화 하여 로그인 로직 수행
		@RequestMapping(value = "/login1", method = RequestMethod.POST)
		public String login2(HttpServletRequest request,RedirectAttributes rttr,Model model,HttpSession session) throws Exception {
			RSAUtil rsaUtil = new RSAUtil();
			SecureSHA256 sha256 = new SecureSHA256();
			
			//공개키로 암호화된 데이터(아이디, 비밀번호)를 전달받는다.
			String id = request.getParameter("securedUsername");
			String password = request.getParameter("securedPassword");
			
			//세션에 저장되어 있던 비밀키를 가져옴과 동시에 파쇄.
			PrivateKey key = (PrivateKey)session.getAttribute("RSAprivateKey");
			if(key == null) {
				rttr.addFlashAttribute("resultMsg","개인키의 부재");
				return "redirect:/squart/login1";
			}
			session.removeAttribute("RSAprivateKey");
			
			id = rsaUtil.getDecryptText(key, id);
			
			//전달받은 PW를 비밀키로 복호화함과 동시에 해쉬값으로 변환
			password = sha256.encryptionSHA256(rsaUtil.getDecryptText(key, password));
			
			//복호화 완료. 로그인 검사 수행.
			SquartDto squartDto = new SquartDto();
			squartDto = service.getOneUser(id);
			
			//아이디가 존재한다면
			if(squartDto != null) {
				//비밀번호가 같다면
				if(squartDto.getPassword().equals(password)) {
					//이메일 인증이 되어 있다면
					if(squartDto.getAuthKey().equals("1")) {
						//모든 정보 빙고! 로그인하기! 세션 저장!
						session.setAttribute("User",squartDto);
						
						return "redirect:/squart/main2";
					}else {
						rttr.addFlashAttribute("needAuth","이메일 인증이 되지 않았습니다. 인증후 로그인해 주세요.");
						return "redirect:/squart/login1";
					}
				}else {
					rttr.addFlashAttribute("id", squartDto.getId());
					rttr.addFlashAttribute("noMatchingPassword","아이디와 비밀번호가 맞지않습니다.");
					return "redirect:/squart/login1";
				}
			}else {
				rttr.addFlashAttribute("noId","아이디가 존재하지 않습니다. 확인 후 이용해 주세요.");
				return "redirect:/squart/login1";
			}
		}
	
	
	
	
	
		//회원의 이메일 인증 후 authKey값을 변경함으로써 아이디 활성화
	@RequestMapping(value = "/emailConfirm2", method = RequestMethod.GET)
	public String emailConfirm2(HttpServletRequest request) throws Exception{
		String authKey = request.getParameter("authKey");
		String id 	   = request.getParameter("id");
		
		if(!(authKey.equals("1"))) {
			service.updateAuth(id);			
		}
		
		return "/squart/emailConfirm2";
	}
	
	//메인페이지로 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() throws Exception{
		
		return "/squart/main";
	}
	
	//회원가입 전 약관체크 페이지로 이동
	@RequestMapping(value = "/check")
	public String check1() {
		return "/squart/check";
	}
	
	//회원가입 전 약관 체크여부 확인
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String check2(@RequestParam(value = "agree1", defaultValue = "false")Boolean agree1,@RequestParam(value = "agree2", defaultValue = "false")Boolean agree2, RedirectAttributes rttr) {
		if(agree1 != true || agree2 != true) {
			rttr.addFlashAttribute("msg", "약관에 모두 동의해 주시길 바랍니다.");
			return "redirect:/squart/check";
		}
		
		return "/squart/input";
	}
	
	//로그아웃하기
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/squart/main2";
	}
	
	//아이디 찾기
	@RequestMapping("/searchId")
	public String searchId1() {
		return "squart/searchId";
	}
	
	@RequestMapping(value = "/searchId", method = RequestMethod.POST)
	public String searchId21(HttpServletRequest request, HttpSession session,RedirectAttributes rttr,Model model) throws Exception {
		//1.이메일이 존재하는지 확인
		//2.이메일이 존재한다면 이름이 맞는지 확인
		//3.이름이 맞다면 자동가입문자 방지가 맞는지 확인
		String captch = request.getParameter("captcha");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String captchaValue = (String) session.getAttribute("captcha");
		System.out.println("넘겨받은 이름 : " + name);
		System.out.println("넘겨받은 이메일 : " + email);
		System.out.println("넘겨받은 캡차 : " + captch);
		
		SquartDto squartDto = new SquartDto();
		squartDto = service.emailCheck(email);
		if(squartDto == null)System.out.println("응 널이야");
		if(squartDto != null) {
			System.out.println("이메일 중복은 아님");
			if(squartDto.getName().equals(name)) {
				System.out.println("해당 이메일에 아이디 맞음");
				if (captch == null || !captchaValue.equals(captch)) {
					//자동가입방지문자가 틀리다면!
					System.out.println("캡차번호가 틀림");
					rttr.addFlashAttribute("check","자동가입방지문자가 올바르지 않습니다 다시 입력해 주세요.");
					rttr.addFlashAttribute("name", name);
					rttr.addFlashAttribute("email",email);
					 return "redirect:/squart/searchId"; //아이디 찾기 작성 페이지로 이동
				}else {
					System.out.println("모두다 빙고 이메일로 아이디 쏴주기");
					//이름, 이메일, 자동가입 방지문자까지 모두 빙고! => 해당 이메일로 아이디를 보내준다.
					service.sendToEmailId(squartDto);
					
					model.addAttribute("email", squartDto.getEmail());
					return "/squart/searchIdSuccess";
				}
			}else {
				//해당 이메일에 존재하는 이름이 없습니다.
				rttr.addFlashAttribute("email",email);
				rttr.addFlashAttribute("noMatchingName","해당 이메일에 존재하는 이름이 없습니다.");
				return "redirect:/squart/searchId";
			}
		}else {
			//이메일이 존재하지 않습니다.
			rttr.addFlashAttribute("noEmail","이메일이 존재하지 않습니다.");
			return "redirect:/squart/searchId";
		}
	}
	
	//비밀번호 찾기
	@RequestMapping("/searchPassword")
	public String searchPassword1() {
		return "squart/searchPassword";
	}
	
	@RequestMapping(value = "/searchPassword", method = RequestMethod.POST)
	public String searchPassword2(HttpServletRequest request, HttpSession session,RedirectAttributes rttr) throws Exception {
		//1.해당 아이디가 존재하는지 확인
		//2.아이디가 존재한다면 아이디의 이메일이 맞는지 확인
		//3.이메일이 맞다면 해당 이메일의 이름이 맞는지 확인
		//4.모든 정보들이 일치한다면 자동가입 방지문자가 맞는지 확인
		String captcha = request.getParameter("captcha");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String captchaValue = (String) session.getAttribute("captcha");
		
		SquartDto squartDto = new SquartDto();
		squartDto = service.getOneUser(id);
		if(squartDto != null) {
			if(email.equals(squartDto.getEmail())) {
				if(name.equals(squartDto.getName())) {
					if(captcha == null || !captchaValue.equals(captcha)) {
						//자동가입방지문자가 올바르지 않습니다. 다시 입력해 주세요.
						rttr.addFlashAttribute("id",squartDto.getId());
						rttr.addFlashAttribute("name",squartDto.getName());
						rttr.addFlashAttribute("email",squartDto.getEmail());
						rttr.addFlashAttribute("check","자동가입방지문자가 올바르지 않습니다. 다시 입력해 주세요.");
						return "redirect:/squart/searchPassword";
					}else {
						//모든 정보 다 빙고! => 기재된 이메일에 해당 아이디의 비밀번호를 전송해 준다.
						service.sendToEmailPassword(squartDto);
						request.setAttribute("email", squartDto.getEmail());
						return "/squart/searchPasswordSuccess";
					}	
				}else {
					//아이디에 해당하는 이름이 존재하지 않습니다. 확인 후 이용해 주세요
					rttr.addFlashAttribute("email",squartDto.getEmail());
					rttr.addFlashAttribute("id",squartDto.getId());
					rttr.addFlashAttribute("noMatchingName","아이디에 해당하는 이름이 존재하지 않습니다. 확인 후 이용해 주세요");
					return "redirect:/squart/searchPassword";
				}
			}else {
				//아이디에 해당하는 이메일이 존재하지 않습니다. 확인 후 이용해 주세요
				rttr.addFlashAttribute("id",squartDto.getId());
				rttr.addFlashAttribute("noMatchingEmail","아이디에 해당하는 이메일이 존재하지 않습니다. 확인 후 이용해 주세요");
				return "redirect:/squart/searchPassword";
			}
		}else {
			//아이디가 존재하지 않습니다. 확인후 이용해 주세요
			rttr.addFlashAttribute("noId","아이디가 존재하지 않습니다. 확인후 이용해 주세요");
			return "redirect:/squart/searchPassword";
		}
	}
	
	@RequestMapping("/changeUserInfo")
	public String changeUserInfo(Model model,HttpSession session) {
		SquartDto squartDto = new SquartDto();
		squartDto = (SquartDto)session.getAttribute("User");
		model.addAttribute("command", squartDto);
		return "/squart/changeUserInfo";
	}
	
	@RequestMapping(value = "/changeUserInfo", method = RequestMethod.POST)
	public String changeUserInfoPro(HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		//1.아이디에 해당하는 현재 비밀번호가 맞는지 확인한다.
		//2.맞다면 새 비밀번호와 확인이 일치하는지 확인한다.
		//3.이름과 주소가 NULL이면 안된다.
		//4.자동가입방지문자를 올바르게 썼는지?
		HttpSession session = request.getSession();
		String captchaValue = (String) session.getAttribute("captcha");
		SecureSHA256 sha256 = new SecureSHA256();
		String id 					= request.getParameter("id");
		String oldPassword 			= sha256.encryptionSHA256(request.getParameter("oldPassword"));
		String newPassword 			= sha256.encryptionSHA256(request.getParameter("newPassword"));
		String confirmNewPassword 	= sha256.encryptionSHA256(request.getParameter("confirmNewPassword"));
		String name 				= request.getParameter("name");
		String address 				= request.getParameter("address");
		String captcha				= request.getParameter("captcha");
		
		SquartDto squartDto = service.getOneUser(id);
		
		if(squartDto.getPassword().equals(oldPassword)) {
			if(newPassword.equals(confirmNewPassword)) {
				if(name != null && address != null) {
					if(captcha.equals(captchaValue)) {
						squartDto.setPassword(newPassword);
						squartDto.setName(name);
						squartDto.setAddress(address);
						service.updateUserInfo(squartDto);
						return "squart/changeUserInfoSuccess";						
					}else {
						rttr.addFlashAttribute("captcha","자동가입방지문자를 올바르게 입력해 주세요");
						return "redirect/squart/changeUserInfo";
					}
						
				}else {
					rttr.addFlashAttribute("required1","필수항목입니다.");
					rttr.addFlashAttribute("required2","필수항목입니다.");
					return "redirect/squart/changeUserInfo";
				}
				
			}else {
				//비밀번호 확인이 일치하지 않습니다. 다시 입력해 주세요
				rttr.addFlashAttribute("noMatchingPassword", "비밀번호 확인이 일치하지 않습니다. 다시 입력해 주세요");
				return "redirect:/squart/changeUserInfo";
			}
		}else {
			//현재 비밀번호 입력이 틀립니다. 확인후 이용해 주세요
			rttr.addFlashAttribute("noMatchingOldPassword", "현재 비밀번호가 일치하지 않습니다. 확인후 이용해 주세요");
			return "redirect:/squart/changeUserInfo";
		}
		
	}
	
	@RequestMapping(value = "/main2", method = {RequestMethod.GET, RequestMethod.POST})
	public String main2(Model model) throws Exception  {

		model.addAttribute("bservice1", bservice1.listAll());
		model.addAttribute("bservice2", bservice2.listAll());
		model.addAttribute("bservice3", bservice3.listAll());
		model.addAttribute("bservice4", bservice4.listAll());
		model.addAttribute("bservice5", bservice5.listAll());
		model.addAttribute("bservice6", bservice6.listAll());
		
		return "squart/main2";
	}
	
	@RequestMapping("/emailConfirm1")
	public String emailConfirm1(){
		
		
		return "squart/emailConfirm1";
	}

}

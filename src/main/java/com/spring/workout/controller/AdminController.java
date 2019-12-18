package com.spring.workout.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.mybatisSetting2.secure.SecureSHA256;
import com.spring.workout.dto.AdminLoginDto;
import com.spring.workout.dto.BuyDto;
import com.spring.workout.dto.ProductDto;
import com.spring.workout.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
		
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private AdminService service;

	
	//////////////////////////////////////////////////////////////////////////////////////////
	/*@RequestMapping("/input")
	public String input() {
		return "squart/input";
	}
	
	@RequestMapping(value = "/inputPro", method=RequestMethod.POST) /*value로 쓸 때는 두 개를 쓸 때
	public String inputPro(@ModelAttribute("command")ProductDto squartDto) throws Exception {
		dao.insert(squartDto);
		
		return "squart/input2";
	}*/
	
	////////////////////////////////////////////////////////////////////////////////////////////
	//관리자  로그인페이지 매핑
	@RequestMapping("/login/adminLogin")
	public String adminLogin(){
		return "admin/login/adminLogin";
	}
	
	//관리자  로그인 체크 
	@RequestMapping("/login/adminLoginCheck")
	public ModelAndView adminLoginCheck(HttpSession session, AdminLoginDto adminLoginDto, ModelAndView mav, RedirectAttributes rattr){
		String name = service.adminLoginCheck(adminLoginDto);
		// 로그인 성공
		if(name != null) {
			session.setAttribute("aid", adminLoginDto.getAid());
			session.setAttribute("aid", name);
			mav.setViewName("redirect:/admin/adminMain"); // 관리자 페이지 이동
			//mav.addObject("msg", "success"); //adminMain?msg=success 띄우기
			rattr.addFlashAttribute("msg", "SUCCESS"); //adminMain?msg=success 사라지게하기
			System.out.println();
		// 로그인 실패
		} else { 
			mav.setViewName("admin/login/adminLogin"); // 로그인 페이지 이동
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	//관리자 로그아웃
	@RequestMapping("/login/adminLogout")
	public ModelAndView adminLogout(HttpSession session){
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminLogin");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////
	//메인 페이지
	@RequestMapping(value="/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////
//	//상품 리스트 페이지
//	@RequestMapping(value="/productProcess/productList")
//	public String productList(Model model) throws Exception{
//		model.addAttribute("productList", service.productList());
//		
//		return "admin/productProcess/productList";
//	}
	
	//상품 리스트 페이지
	@RequestMapping("/productProcess/productList")
	// @RequestParam(defaultValue="") ==> 기본값 할당
	public ModelAndView productList(@RequestParam(defaultValue="product_title") String searchOption,
	                        @RequestParam(defaultValue="") String keyword) throws Exception{
	    
		
		List<ProductDto> list = service.productList(searchOption, keyword);
	    
	    // 레코드의 갯수
	    int count = service.countProduct(searchOption, keyword);
	    // ModelAndView - 모델과 뷰
	    ModelAndView mav = new ModelAndView();
	    
	    /*mav.addObject("list", list); // 데이터를 저장
	    mav.addObject("count", count);
	    mav.addObject("searchOption", searchOption);
	    mav.addObject("keyword", keyword);*/
	    
	    // 데이터를 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("pList", list); // list
	    map.put("pCount", count); // 레코드의 갯수
	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
	    mav.setViewName("admin/productProcess/productList"); // 뷰를 list.jsp로 설정
	    return mav; // list.jsp로 List가 전달된다.
	}

	
	
	//상품 등록 페이지
	@GetMapping(value="/productProcess/productRegister")
	public void productRegister(ProductDto productDto, Model model) {			
		//return "admin/productProcess/productRegister";
	}
	
	
	//상품 등록 DB 넘기기
	@PostMapping("/productProcess/productRegister") 
	public String productRegister(ProductDto productDto, MultipartHttpServletRequest request, RedirectAttributes rattr) throws Exception {
		
		service.productInsert(productDto, request);
		rattr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/productProcess/productList";
	}
	
	
	//상품 삭제
	@RequestMapping("/productProcess/productDelete")
	public String productDelete(@RequestParam("product_id") int product_id, RedirectAttributes rttr) throws Exception{
		service.productDelete(product_id);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/productProcess/productList";
	}
	
	//상품 수정 페이지 가기
	@GetMapping("/productProcess/productUpdate")
	public String productUpdateGET(@RequestParam("product_id") int product_id, Model model) throws Exception {
		model.addAttribute(service.productRead(product_id));
		return "admin/productProcess/productUpdate";
	}
	
	//상품 수정
	@PostMapping("/productProcess/productUpdate")
	public String productUpdatePOST(ProductDto productDto, MultipartHttpServletRequest request, RedirectAttributes rttr) throws Exception {
		System.out.println("before method : " + productDto);
		service.productUpdate(productDto, request);
		System.out.println("after method : " + productDto);		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/productProcess/productList";
	}	
	
	/////////////////////////////////////////////////////////////////////////////////////////////
//	//주문 리스트 페이지
//	@RequestMapping(value="/orderedProduct/orderedList")
//	public String orderedList(Model model) throws Exception{
//		model.addAttribute("orderedList", service.orderedList());
//		
//		return "admin/orderedProduct/orderedList";
//	}
	
	//주문 리스트 페이지
	@RequestMapping("/orderedProduct/orderedList")
	// @RequestParam(defaultValue="") ==> 기본값 할당
	public ModelAndView orderedList(@RequestParam(defaultValue="buyer") String searchOption,
	                        @RequestParam(defaultValue="") String keyword) throws Exception{
	    		
		List<BuyDto> list = service.orderedList(searchOption, keyword);
	    
	    // 레코드의 갯수
	    int count = service.countOrder(searchOption, keyword);
	    // ModelAndView - 모델과 뷰
	    ModelAndView mav = new ModelAndView();
	    
	    /*mav.addObject("list", list); // 데이터를 저장
	    mav.addObject("count", count);
	    mav.addObject("searchOption", searchOption);
	    mav.addObject("keyword", keyword);*/
	    
	    // 데이터를 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("oList", list); // list
	    map.put("oCount", count); // 레코드의 갯수
	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
	    mav.setViewName("admin/orderedProduct/orderedList"); // 뷰를 list.jsp로 설정
	    return mav; // list.jsp로 List가 전달된다.
	}
	
	
	//주문 상황 수정, 삭제 페이지 가기
	@GetMapping("/orderedProduct/orderUpDel")
	public String orderUpDel(@RequestParam("buy_id") int buy_id, Model model) throws Exception {
		model.addAttribute(service.orderRead(buy_id));
		return "admin/orderedProduct/orderUpDel";
	}
	
	//주문 상황 수정	
	@PostMapping("/orderedProduct/orderUpdate")
	public String orderUpdate(BuyDto buyDto, RedirectAttributes rttr) throws Exception {
		service.orderUpdate(buyDto);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/orderedProduct/orderedList";
	}
	
	//주문 취소
	@RequestMapping("/orderedProduct/orderDelete")
	public String orderDelete(@RequestParam("buy_id") int buy_id, RedirectAttributes rttr) throws Exception{
		System.out.println("컨트롤러 전..." + buy_id);
		service.orderDelete(buy_id);
		System.out.println("컨트롤러 후..." + buy_id);
		

		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/orderedProduct/orderedList";
	}
	/////////////////////////////////////////////////////////////////////////////////////////////
	
	
	//회원 리스트 페이지
	@RequestMapping("/userManage/userList")
	// @RequestParam(defaultValue="") ==> 기본값 할당
	public ModelAndView userList(@RequestParam(defaultValue="id") String searchOption,
			@RequestParam(defaultValue="") String keyword) throws Exception{
		
		List<SquartDto> list = service.userList(searchOption, keyword);
		
		// 레코드의 갯수
		int count = service.countUser(searchOption, keyword);
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		
		/*mav.addObject("list", list); // 데이터를 저장
	    mav.addObject("count", count);
	    mav.addObject("searchOption", searchOption);
	    mav.addObject("keyword", keyword);*/
		
		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uList", list); // list
		map.put("uCount", count); // 레코드의 갯수
		map.put("searchOption", searchOption); // 검색옵션
		map.put("keyword", keyword); // 검색키워드
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("admin/userManage/userList"); // 뷰를 list.jsp로 설정
		return mav; // list.jsp로 List가 전달된다.
	}
	
	
	//회원 정보 수정, 삭제 페이지 읽기
	@GetMapping("/userManage/userUpDel")
	public String userUpDel(@RequestParam("num") int num, Model model, SquartDto userDto) throws Exception {
		
		model.addAttribute(service.userRead(num));
		return "admin/userManage/userUpDel";
	}
	
	//회원 정보 수정	
	@PostMapping("/userManage/userUpdate")
	public String userUpdate(SquartDto squartDto, RedirectAttributes rttr) throws Exception {
		System.out.println("before controller..." + squartDto.getName());
		SecureSHA256 sha256 = new SecureSHA256();
		squartDto.setPassword(sha256.encryptionSHA256(squartDto.getPassword()));
		service.userUpdate(squartDto);
		System.out.println("after controller..." + squartDto.getName());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/userManage/userList";
	}
	
	//회원 삭제
	@RequestMapping("/userManage/userDelete")
	public String userDelete(@RequestParam("num") int num, RedirectAttributes rttr) throws Exception{
		service.userDelete(num);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/userManage/userList";
	}
	/////////////////////////////////////////////////////////////////////////////////////////////
	

}

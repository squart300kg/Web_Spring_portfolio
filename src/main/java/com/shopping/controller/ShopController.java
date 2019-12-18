package com.shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.dto.BankDto;
import com.shopping.dto.CartDto;
import com.shopping.service.ShopProductService;
import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.workout.dto.BuyDto;
import com.spring.workout.dto.ProductDto;


@Controller
@RequestMapping("/shop/*")
public class ShopController {
	
	@Inject
	ShopProductService service;

	
	// 상품 전체 목록
	@RequestMapping(value = "/shoplist", method=RequestMethod.GET)
	public String shopList(Model model) throws Exception {
		List<ProductDto> productDto = service.listProduct();	
		model.addAttribute("list", productDto);
		System.out.println("/shopMainList");
		return "shop/shoplist";
	}
	
	 // 상품 상세보기
	@RequestMapping(value = "/productDetail", method=RequestMethod.GET)
	public String productDetail(@RequestParam("product_id") int product_id, Model model) throws Exception {
		model.addAttribute("dto", service.detailProduct(product_id));
		System.out.println("/productDetails");
		return "shop/productDetails";
	}

/*	////////////////////////////////////////////////////////////////////////////////////////
	장바구니
*/	////////////////////////////////////////////////////////////////////////////////////////
	
	
	// 장바구니 추가
	@RequestMapping(value = "/cartList", method=RequestMethod.POST)
	public String cListPOST(CartDto cdto, HttpSession session) throws Exception {
		SquartDto sdto = new SquartDto();
		sdto = (SquartDto)session.getAttribute("User");
		if(sdto == null) {
			return "redirect:/squart/main2";
		}
		String buyer = sdto.getId(); // session에 저장된 userId
		
		int count = service.countCart(cdto.getProduct_id(), buyer);
		
		cdto.setBuyer(buyer);

//		System.out.println("/listCart post");
//		System.out.println("product_title" + cdto.getProduct_title());
		
		if(count == 0) {
			service.insertCart(cdto);
		} else {
			service.updateCart(cdto);
		}
		return "redirect:/shop/cartList";
	}	

	// 장바구니 목록
	// CartDto 객체 생성 후 cdto buyer에 세션 User를 담아야함.
	@RequestMapping(value = "/cartList", method=RequestMethod.GET)
	public String cList(HttpSession session, Model model) throws Exception {
		SquartDto sdto = new SquartDto();
		Map<String, Object> map = new HashMap<String, Object>();
		sdto = (SquartDto)session.getAttribute("User");
		String buyer = sdto.getId();
		
		List<CartDto> cList = service.listCart(buyer); // 장바구니 정보 
		int sumMoney = 0; // 장바구니 전체 금액 호출
		for (int i = 0; i < cList.size(); i++) {
			sumMoney += cList.get(i).getBuy_price();
		}
			
		int fee = sumMoney >= 50000 ? 0 : 2500;
		map.put("cList", cList);				// 장바구니 정보를 map에 저장
		map.put("count", cList.size());		// 장바구니 상품의 유무
		map.put("sumMoney", sumMoney);		// 장바구니 전체 금액
		map.put("fee", fee); 				// 배송금액
		map.put("allSum", sumMoney+fee);	// 주문 상품 전체 금액 
		model.addAttribute("cList", service.listCart(buyer));
		model.addAttribute("map", map);			// map 변수 저장
		
		//System.out.println("/listCart");
		return "shop/cartList";
	}	

	
	// 장바구니 삭제
	@RequestMapping(value = "/deleteCart", method=RequestMethod.GET)
	public String deleteCart(@RequestParam("cart_id") int cart_id) throws Exception {
		service.deleteCart(cart_id);
		return "redirect: /workout_login2_RealFinal_190130/shop/cartList";
	}
	
	// 장바구니 수량 수정
	@RequestMapping(value = "/updateCart", method=RequestMethod.POST)
	public String modifyCart(@RequestParam byte[] buy_count, @RequestParam int[] cart_id, CartDto cdto) throws Exception {
		
//		System.out.println("product_id는" + cart_id);
//		System.out.println("buy_count는" + buy_count);
		for (int i = 0; i < cart_id.length; i++) {
		cdto.setBuy_count(buy_count[i]);
		cdto.setCart_id(cart_id[i]);
		service.modifyCart(cdto);
		}
		return "redirect: /workout_login2_RealFinal_190130/shop/cartList";
	}	

	

/*	////////////////////////////////////////////////////////////////////////////////////////
	결제(구매하기)
*/	////////////////////////////////////////////////////////////////////////////////////////

	
	// 구매하기
	@RequestMapping("/buyInputList")
	public String buyList(@RequestParam("buyer") String buyer, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		SquartDto sdto = new SquartDto();
		sdto = (SquartDto)session.getAttribute("User");
		buyer = sdto.getId();
				
		List<CartDto> BCList = service.buyListCart(buyer);
		List<BankDto> bank = service.bank();

		int sumMoney = 0; // 장바구니 전체 금액 호출
		for (int i = 0; i < BCList.size(); i++) {
			sumMoney += BCList.get(i).getBuy_price();
		}
			
		int fee = sumMoney >= 50000 ? 0 : 2500;
		
		map.put("sumMoney", sumMoney);		
		map.put("fee", fee); 				
		map.put("allSum", sumMoney+fee);	
		model.addAttribute("map", map);			
		model.addAttribute("bank", bank);
		model.addAttribute("BCList", BCList);
		model.addAttribute("BUList", service.buyListUser(buyer));
		
		return "shop/buyList";
	}
	
	
	// 구매 확인(주문 정보 추가)
	@RequestMapping(value = "/buyCheckList", method=RequestMethod.POST)
	public String bListPOST(@RequestParam int[] cart_id, @RequestParam int[] product_id, @RequestParam String[] product_title, @RequestParam int[] buy_price,
							@RequestParam byte[] buy_count, @RequestParam String[] product_image, @RequestParam int[] product_price, BuyDto bdto, HttpSession session) throws Exception {
		
		SquartDto sdto = new SquartDto();
		sdto = (SquartDto)session.getAttribute("User");
		String buyer = sdto.getId(); // session에 저장된 userId
		bdto.setBuyer(buyer);
		
		
		for (int i = 0; i < cart_id.length; i++) {
			System.out.println("cart_id 숫자" + cart_id.length);
		bdto.setProduct_id(product_id[i]);
		bdto.setProduct_title(product_title[i]);
		bdto.setBuy_price(buy_price[i]);
		bdto.setBuy_count(buy_count[i]);
		bdto.setProduct_image(product_image[i]);
		bdto.setProduct_price(product_price[i]);
//		System.out.println("/listCart wjswjsjws");
//		System.out.println("product_title" + bdto.getProduct_title());
//		System.out.println("product_id" + bdto.getProduct_id());
//		System.out.println("product_price" + bdto.getProduct_price());
//		System.out.println("product_image" + bdto.getProduct_image());
//		System.out.println("getBuy_price" + bdto.getBuy_price());
		service.insertDelivery(bdto);
		}
		
//		System.out.println("/listCart 후후");
//		System.out.println("product_title" + bdto.getProduct_title());
//		System.out.println("product_id" + bdto.getProduct_id());
//		System.out.println("product_price" + bdto.getProduct_price());
//		System.out.println("product_image" + bdto.getProduct_image());
//		System.out.println("getBuy_price" + bdto.getBuy_price());
		
		return "redirect:/squart/main2";
	}	
	
	
	// 구매확인(버튼) => 구매목록
	@RequestMapping(value = "/buyCheckList", method=RequestMethod.GET)
	public String buyCheck() {
		return "squart/main2";
	}
	
//	// 구매목록
//	@RequestMapping(value = "/buyCheck", method=RequestMethod.GET)
//	public String mainToBuyCheck(Model model) {
//		model.addAttribute("msg", "SUCCESS");
//		return "shop/buyCheck";
//	}
	
}














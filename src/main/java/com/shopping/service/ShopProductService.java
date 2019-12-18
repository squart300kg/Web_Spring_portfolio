package com.shopping.service;

import java.util.List;

import com.shopping.dto.BankDto;
import com.shopping.dto.CartDto;
import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.workout.dto.BuyDto;
import com.spring.workout.dto.ProductDto;

public interface ShopProductService {
	
	// 상품목록
	public List<ProductDto> listProduct() throws Exception;

	// 상품상세
	public ProductDto detailProduct(int product_id) throws Exception;

	
	
/*	////////////////////////////////////////////////////////////////////////////////////////
	장바구니
*/	////////////////////////////////////////////////////////////////////////////////////////
	
	
	// 장바구니추가
	public void insertCart(CartDto cdto) throws Exception;
	
	// 장바구니 목록
	public List<CartDto> listCart(String buyer) throws Exception;
	
	// 장바구니 삭제
	public void deleteCart(int cart_id) throws Exception;
	
	// 장바구니 수정
	public void modifyCart(CartDto cdto) throws Exception;
	
	// 장바구니 상품확인
	public int countCart(int product_id, String buyer) throws Exception;
	
	// 장바구니 상품수량 변경
	public void updateCart(CartDto cdto) throws Exception;
	
	
/*	////////////////////////////////////////////////////////////////////////////////////////
	구매
*/	////////////////////////////////////////////////////////////////////////////////////////

	// 장바구니 데이터 불러오기
	public List<CartDto> buyListCart(String buyer) throws Exception;

	// 구매 고객 정보 불러오기
	public SquartDto buyListUser(String buyer) throws Exception;
	
	// 무통장입금 계좌 불러오기
	public List<BankDto> bank() throws Exception;

	// 구매 확인(주문 정보 추가)
	public BuyDto insertDelivery(BuyDto bdto) throws Exception;
	
	
}

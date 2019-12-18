package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.dao.ShopProductDao;
import com.shopping.dto.BankDto;
import com.shopping.dto.CartDto;
import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.workout.dto.BuyDto;
import com.spring.workout.dto.ProductDto;

@Service
public class ShopProductServiceImpl implements ShopProductService {

	@Inject
	ShopProductDao dao;
	
	// 01. 상품목록
	@Override
	public List<ProductDto> listProduct() throws Exception {
		return dao.listProduct();
	}
	
	// 02. 상품상세
	@Override
	public ProductDto detailProduct(int product_id) throws Exception {
		return dao.detailProduct(product_id);
	}

	
/*	////////////////////////////////////////////////////////////////////////////////////////
	장바구니
*/	////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	// 장바구니 추가
	@Override
	public void insertCart(CartDto cdto) throws Exception {
		dao.insertCart(cdto);
	}
	// 장바구니 목록
	@Override
	public List<CartDto> listCart(String buyer) throws Exception {
		return dao.listCart(buyer);
	}
	// 장바구니 삭제
	@Override
	public void deleteCart(int cart_id) throws Exception {
		dao.deleteCart(cart_id);
	}
	// 장바구니 수정
	@Override
	public void modifyCart(CartDto cdto) throws Exception {
		dao.modifyCart(cdto);
	}
	// 장바구니 상품확인
	@Override
	public int countCart(int product_id, String buyer) throws Exception {
		return dao.countCart(product_id, buyer);
	}
	// 장바구니 상품수량 변경
	@Override
	public void updateCart(CartDto cdto) throws Exception {
		dao.updateCart(cdto);
	}

	
	
/*	////////////////////////////////////////////////////////////////////////////////////////
	구매
*/	////////////////////////////////////////////////////////////////////////////////////////

	// 구매하기
	
	// 장바구니 데이터 불러오기
	@Override
	public List<CartDto> buyListCart(String buyer) throws Exception {
		return dao.buyListCart(buyer);
	}

	// 구매 고객 정보 불러오기
	@Override
	public SquartDto buyListUser(String buyer) throws Exception {
		return dao.buyListUser(buyer);
	}
	
	// 무통장입금 계좌 불러오기
	public List<BankDto> bank() throws Exception {
		return dao.bank();
	}

	// 구매 확인(주문 정보 추가)
	public BuyDto insertDelivery(BuyDto bdto) throws Exception {
		return dao.insertDelivery(bdto);
		
	}

}

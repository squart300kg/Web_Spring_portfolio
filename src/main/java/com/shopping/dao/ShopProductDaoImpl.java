package com.shopping.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.dto.BankDto;
import com.shopping.dto.CartDto;
import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.workout.dto.BuyDto;
import com.spring.workout.dto.ProductDto;

@Repository
public class ShopProductDaoImpl implements ShopProductDao {
	
	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "product";
	
	
	// 01. 상품목록
	@Override
	public List<ProductDto> listProduct() throws Exception {
		return sqlSession.selectList(namespace + ".listProduct");
	}

	// 02. 상품상세
	@Override
	public ProductDto detailProduct(int product_id) throws Exception {
		return sqlSession.selectOne(namespace + ".detailProduct", product_id);
	}
	

/*	////////////////////////////////////////////////////////////////////////////////////////
	장바구니
*/	////////////////////////////////////////////////////////////////////////////////////////

	
	// 장바구니 추가
	@Override
	public void insertCart(CartDto cdto) throws Exception {
		sqlSession.insert(namespace + ".insertCart", cdto);
	}
	// 장바구니 목록
	@Override
	public List<CartDto> listCart(String buyer) throws Exception {
		return sqlSession.selectList(namespace + ".listCart", buyer);
	}
	// 장바구니 삭제
	@Override
	public void deleteCart(int cart_id) throws Exception {
		sqlSession.delete(namespace + ".deleteCart", cart_id);
	}
	// 장바구니 수정
	@Override
	public void modifyCart(CartDto cdto) throws Exception {
		sqlSession.update(namespace + ".modifyCart", cdto);
	}

	// 장바구니 상품확인
	@Override
	public int countCart(int product_id, String buyer) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("buyer", buyer);
		return sqlSession.selectOne(namespace + ".countCart", map);
	}
	// 장바구니 상품수량 변경
	@Override
	public void updateCart(CartDto cdto) throws Exception {
		sqlSession.update(namespace + ".updateCart", cdto);
	}
	
	
	
/*	////////////////////////////////////////////////////////////////////////////////////////
	구매
*/	////////////////////////////////////////////////////////////////////////////////////////

	
	// 장바구니 데이터 불러오기
	public List<CartDto> buyListCart(String buyer) throws Exception {
		return sqlSession.selectList(namespace + ".buyListCart", buyer);
	}

	// 구매 고객 정보 불러오기
	public SquartDto buyListUser(String buyer) throws Exception {
		return sqlSession.selectOne(namespace + ".buyListUser", buyer);
	}

	// 무통장입금 계좌 불러오기
	public List<BankDto> bank() throws Exception {
		return sqlSession.selectList(namespace + ".bank");
	}

	// 구매 확인(주문 정보 추가)
	public BuyDto  insertDelivery(BuyDto bdto) throws Exception {
		 sqlSession.insert(namespace + ".insertDelivery", bdto);
		 return bdto;
	}
	
}

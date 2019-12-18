package com.spring.workout.dao;

import java.util.List;

import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.workout.dto.AdminLoginDto;
import com.spring.workout.dto.BuyDto;
import com.spring.workout.dto.ProductDto;

public interface AdminDao {
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	//관리자 로그인체크
	public String adminLoginCheck(AdminLoginDto adminLoginDto);
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
//	상품 리스트
//	public List<ProductDto> productList() throws Exception;
	
	//상품 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<ProductDto> productList(String searchOption, String keyword) throws Exception;
	
	//상품 레코드 갯수 메서드 추가
	public int countProduct(String searchOption, String keyword) throws Exception;
	
	//상품 등록
	public void productInsert(ProductDto productDto) throws Exception;
	
	//상품 수정 페이지 읽기
	public ProductDto productRead(Integer product_id) throws Exception;
	
    //상품 수정
    public void productUpdate(ProductDto productDto) throws Exception;
  	
	//상품 삭제
	public void productDelete(Integer product_id) throws Exception;
    
	//////////////////////////////////////////////////////////////////////////////////////////
    
 	//주문 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<BuyDto> orderedList(String searchOption, String keyword) throws Exception;
	
	//주문 레코드 갯수 메서드 추가
	public int countOrder(String searchOption, String keyword) throws Exception;

	//주문 상황 페이지 읽기
	public BuyDto orderRead(Integer buy_id) throws Exception;
	
    //주문 상황 수정
    public void orderUpdate(BuyDto buyDto) throws Exception;
    	
	//주문 취소
	public void orderDelete(Integer buy_id) throws Exception;
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	//회원 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<SquartDto> userList(String searchOption, String keyword) throws Exception;
	
	//회원 레코드 갯수 메서드 추가
	public int countUser(String searchOption, String keyword) throws Exception;
	
	//회원 정보 페이지 읽기
	public SquartDto userRead(Integer num) throws Exception;
	
	//회원 정보 수정
	public void userUpdate(SquartDto squartDto) throws Exception;
	
	//회원 정보 삭제
	public void userDelete(Integer num) throws Exception;
	

}

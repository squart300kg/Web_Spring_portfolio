package com.spring.workout.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.workout.dto.AdminLoginDto;
import com.spring.workout.dto.BuyDto;
import com.spring.workout.dto.ProductDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.spring.workout.mapper.AdminMapper";
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//관리자 로그인 체크
	@Override
	public String adminLoginCheck(AdminLoginDto adminLoginDto) {
		return session.selectOne(namespace + ".adminLoginCheck", adminLoginDto);
	}

	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
//	//상품 리스트
//	@Override
//	public List<ProductDto> productList() throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace + ".productList");
//	}
	
	//상품 전체 목록
	@Override
	public List<ProductDto> productList(String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return session.selectList(namespace + ".productList", map);
	}
	
	//상품 레코드 갯수
	@Override
	public int countProduct(String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    int count = session.selectOne(namespace + ".countProduct", map);
	    return count;
	
	}
	
	//상품 등록
	@Override
	public void productInsert(ProductDto productDto) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".productInsert", productDto);
	}
	
	//상품 수정 읽기
	@Override
	public ProductDto productRead(Integer product_id) throws Exception{
		return session.selectOne(namespace + ".productRead", product_id);
	}
	
	//상품 수정 
    @Override
    public void productUpdate(ProductDto productDto) throws Exception{
    	session.update(namespace + ".productUpdate", productDto);
    }
    
	//상품 삭제
	@Override
	public void productDelete(Integer product_id) throws Exception{
		session.delete(namespace + ".productDelete", product_id);
	}
    
	/////////////////////////////////////////////////////////////////////////////////////////////////////
    

	//주문 리스트
	@Override
	public List<BuyDto> orderedList(String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return session.selectList(namespace + ".orderedList", map);
	}
	
	//주문 레코드 갯수
	@Override
	public int countOrder(String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	     int count = session.selectOne(namespace + ".countOrder", map);
	     return count;
	
	}
	
	
	//주문 상황 읽기
	@Override
	public BuyDto orderRead(Integer buy_id) throws Exception{
		return session.selectOne(namespace + ".orderRead", buy_id);
	}

	//주문 상황 수정
	@Override
	public void orderUpdate(BuyDto buyDto) throws Exception{
		session.update(namespace + ".orderUpdate", buyDto);
	}
	
	
	//주문 취소
	@Override
	public void orderDelete(Integer buy_id) throws Exception{
		System.out.println("DAO.." + buy_id);
		session.delete(namespace + ".orderDelete", buy_id);
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//회원 리스트
	@Override
	public List<SquartDto> userList(String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return session.selectList(namespace + ".userList", map);
	}
	
	//회원 레코드 갯수
	@Override
	public int countUser(String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		int count = session.selectOne(namespace + ".countUser", map);
		return count;
		
	}
	
	
	//회원 정보 읽기
	@Override
	public SquartDto userRead(Integer num) throws Exception{
		return session.selectOne(namespace + ".userRead", num);
	}
	
	//회원 정보 수정
	@Override
	public void userUpdate(SquartDto squartDto) throws Exception{
		System.out.println("before Dao..." + squartDto.getName());
		session.update(namespace + ".userUpdate", squartDto);
		System.out.println("after Dao..." + squartDto.getName());
	}
	
	
	//회원 삭제
	@Override
	public void userDelete(Integer num) throws Exception{
		session.delete(namespace + ".userDelete", num);
	}

}

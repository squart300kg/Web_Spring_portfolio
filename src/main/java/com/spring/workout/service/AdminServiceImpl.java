package com.spring.workout.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.workout.dao.AdminDao;
import com.spring.workout.dto.AdminLoginDto;
import com.spring.workout.dto.BuyDto;
import com.spring.workout.dto.ProductDto;
import com.spring.workout.util.FileUtils;

@Service
public class AdminServiceImpl implements AdminService {
	
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Inject
	private AdminDao dao;

	
	
	////////////////////////////////////////////////////////////////////////////////////
	
	// 관리자 로그인체크
	@Override
	public String adminLoginCheck(AdminLoginDto adminLoginDto) {
		return dao.adminLoginCheck(adminLoginDto);
	}

	////////////////////////////////////////////////////////////////////////////////////

	
//	//상품 리스트
//	@Override
//	public List<ProductDto> productList() throws Exception{
//		return dao.productList();
//	};
	
	//상품 전체 목록 dao.productList메서드 호출
	@Override
	public List<ProductDto> productList(String searchOption, String keyword) throws Exception {
	    return dao.productList(searchOption, keyword);
	}

	//상품 레코드 갯수 dao.countArticle메서드 
	@Override
	public int countProduct(String searchOption, String keyword) throws Exception {
	    return dao.countProduct(searchOption, keyword);
	}

	
	//상품 등록
	@Override
	public void productInsert(ProductDto productDto, MultipartHttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		//dao.insert(productDto);
		
		String product_image = fileUtils.parseInsertFileInfo(request);
		productDto.setProduct_image(product_image);
		dao.productInsert(productDto);
       // dao.insertFile(product_image);

	}
	
	
	//상품 수정 읽기
	@Override
	public ProductDto productRead(Integer product_id) throws Exception{
		return dao.productRead(product_id);
	}

                                               	
	//상품 수정
	@Override
	public void productUpdate(ProductDto productDto, MultipartHttpServletRequest request) throws Exception{
		String product_image = fileUtils.parseInsertFileInfo(request);
		productDto.setProduct_image(product_image);
		dao.productUpdate(productDto);
       // dao.insertFile(product_image);
	};
	
	
	//상품 삭제
	@Override
	public void productDelete(Integer product_id) throws Exception{
		dao.productDelete(product_id);
	}
	
	
	
	////////////////////////////////////////////////////////////////////////////////////
	
	//주문 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	@Override
	public List<BuyDto> orderedList(String searchOption, String keyword) throws Exception{
	    return dao.orderedList(searchOption, keyword);
	};
	
	//주문 레코드 갯수 dao.countOrder메서드 
	@Override
	public int countOrder(String searchOption, String keyword) throws Exception {
	    return dao.countOrder(searchOption, keyword);
	}

	
	//주문 상황 읽기
	@Override
	public BuyDto orderRead(Integer buy_id) throws Exception{
		return dao.orderRead(buy_id);
	}
	
	//주문 상황 수정
	@Override
	public void orderUpdate(BuyDto buyDto) throws Exception{
		dao.orderUpdate(buyDto);
	};
	
	
	//주문 취소
	@Override
	public void orderDelete(Integer buy_id) throws Exception{
		System.out.println("서비스...." + buy_id);
		dao.orderDelete(buy_id);
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////
	
	//회원 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	@Override
	public List<SquartDto> userList(String searchOption, String keyword) throws Exception{
		return dao.userList(searchOption, keyword);
	};
	
	//회원 레코드 갯수 dao.countOrder메서드 
	@Override
	public int countUser(String searchOption, String keyword) throws Exception {
		return dao.countUser(searchOption, keyword);
	}
	
	
	//회원 정보 읽기
	@Override
	public SquartDto userRead(Integer num) throws Exception{
		return dao.userRead(num);
	}
	
	//회원 정보 수정
	@Override
	public void userUpdate(SquartDto squartDto) throws Exception{
		System.out.println("before Service..." + squartDto.getName());
		dao.userUpdate(squartDto);
		System.out.println("after Service..." + squartDto.getName());

	};
	
	
	//회원 정보 삭제
	@Override
	public void userDelete(Integer num) throws Exception{
		dao.userDelete(num);
	}
	

}

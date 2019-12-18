package com.shopping.dto;

public class CartDto {
	private int cart_id;	// 장바구니 번호
	private String buyer;	// 구매자(사용자 아이디)
	private int product_id;	// 제품 번호
	private String product_title;	// 제품명
	private int buy_price;	// 구매가격
	private byte buy_count;	// 구매 수량
	private String product_image;	// 이미지
	private int product_price; // 단가
	
	// productPrice 상품 단가
	// money 상품 가격
	
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public byte getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(byte buy_count) {
		this.buy_count = buy_count;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	@Override
	public String toString() {
		return "CartDto [cart_id=" + cart_id + ", buyer=" + buyer + ", product_id=" + product_id + ", product_title="
				+ product_title + ", buy_price=" + buy_price + ", buy_count=" + buy_count + ", product_image="
				+ product_image + ", product_price=" + product_price + "]";
	}
	
}

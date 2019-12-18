package com.spring.workout.dto;

import java.sql.Timestamp;

public class BuyDto {
	
	private int			buy_id;				//구매 고유번호
	private String		buy_num;			//주문 번호
	private	String		buyer;				//구매자
	private	int			product_id;			//구매된 상품 아이디
	private	String		product_title;		//구매된 상품 제목
	private	int			buy_price;			//구매가격
	private	byte		buy_count;			//구매수량

	private	String		product_image;		//상품이미지명
	private	Timestamp	buy_date;			//구매일자
	private	String		account;			//결제계좌
	private	String		delivery_name;		//배송지
	private	String		delivery_tel;		//배송지 전화번호
	private	String		delivery_address;	//배송지 주소
	private	String		sanction;			//배송상황
	private int			product_price;
	
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	public String getBuy_num() {
		return buy_num;
	}
	public void setBuy_num(String buy_num) {
		this.buy_num = buy_num;
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
	public Timestamp getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDelivery_name() {
		return delivery_name;
	}
	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}
	public String getDelivery_tel() {
		return delivery_tel;
	}
	public void setDelivery_tel(String delivery_tel) {
		this.delivery_tel = delivery_tel;
	}
	public String getDelivery_address() {
		return delivery_address;
	}
	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}
	public String getSanction() {
		return sanction;
	}
	public void setSanction(String sanction) {
		this.sanction = sanction;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	
	@Override
	public String toString() {
		return "BuyDto [buy_id=" + buy_id + ", buy_num=" + buy_num + ", buyer=" + buyer + ", product_id=" + product_id
				+ ", product_title=" + product_title + ", buy_price=" + buy_price + ", buy_count=" + buy_count
				+ ", product_image=" + product_image + ", buy_date=" + buy_date + ", account=" + account
				+ ", delivery_name=" + delivery_name + ", delivery_tel=" + delivery_tel + ", delivery_address="
				+ delivery_address + ", sanction=" + sanction + ", product_price=" + product_price + "]";
	}
	
	
	
	
	
	
}

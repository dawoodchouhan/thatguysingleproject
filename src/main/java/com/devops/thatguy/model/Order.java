package com.devops.thatguy.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table

public class Order implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	private int orderId ;
	private Double cartPrice ;
	private int userID;
	
	private ShippingAddress shippingAddress ;
	private BillingAddress billingAddress ;
	private List<Cart> cartList ;
private CardDetail cardDetail ;


public int getUserID() {
	return userID;
}
public void setUserID(int userID) {
	this.userID = userID;
}
public int getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}

public Double getCartPrice() {
	return cartPrice;
}
public void setCartPrice(Double cartPrice) {
	this.cartPrice = cartPrice;
}
public ShippingAddress getShippingAddress() {
	return shippingAddress;
}
public void setShippingAddress(ShippingAddress shippingAddress) {
	this.shippingAddress = shippingAddress;
}
public BillingAddress getBillingAddress() {
	return billingAddress;
}
public void setBillingAddress(BillingAddress billingAddress) {
	this.billingAddress = billingAddress;
}
public List<Cart> getCartList() {
	return cartList;
}
public void setCartList(List<Cart> cartList) {
	this.cartList = cartList;
}
public CardDetail getCardDetail() {
	return cardDetail;
}
public void setCardDetail(CardDetail cardDetail) {
	this.cardDetail = cardDetail;
}



}

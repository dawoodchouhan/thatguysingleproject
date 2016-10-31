package com.devops.thatguy.dao;

import java.util.List;

import com.devops.thatguy.model.Order;

public interface OrderDAO {

	public List<Order> orderListofUser(String userId) ;
	public void saveorupdate(Order order) ;
	public void update(Order order) ;

	public Order get(String userId);
public Long getCartPrice(String userId);
}

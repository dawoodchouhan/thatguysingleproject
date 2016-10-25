package com.devops.thatguy.dao;

import java.util.List;

import com.devops.thatguy.model.OrderDetail;

public interface OrderDetailDAO {

	void saveOrUpdate(OrderDetail orderDetail);

	void delete(String orderDetailId);

	List<OrderDetail> listOrderDetails();
}

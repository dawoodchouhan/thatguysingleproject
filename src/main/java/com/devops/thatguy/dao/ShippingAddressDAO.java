package com.devops.thatguy.dao;

import com.devops.thatguy.model.ShippingAddress;

public interface ShippingAddressDAO {
void saveOrUpdate(ShippingAddress shippingAddress);
	
	void deleteShippingAddress(String shippingAddressId);
	
	ShippingAddress getShippingAddress(String shippingAddressId);

}

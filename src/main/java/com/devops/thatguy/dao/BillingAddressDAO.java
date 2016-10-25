package com.devops.thatguy.dao;

import com.devops.thatguy.model.BillingAddress;

public interface BillingAddressDAO {
	
	void saveOrUpdate(BillingAddress billingAddress);

	void deleteBillingAddress(String billingAddressId);

	BillingAddress getBillingAddress(String billingAddressId);
}

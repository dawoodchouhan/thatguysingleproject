package com.devops.thatguy.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.devops.thatguy.model.ShippingAddress;



@Repository("shippingAddressDAO")
public class ShippingAddressDAOImpl implements ShippingAddressDAO {

	@Autowired
	SessionFactory sessionFactory;

	public ShippingAddressDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
@Transactional
	public void saveOrUpdate(ShippingAddress shippingAddress) {
		sessionFactory.getCurrentSession().saveOrUpdate(shippingAddress);

	}

@Transactional
	public void deleteShippingAddress(String shippingAddressId) {
	ShippingAddress shippingAddressToDelete = new ShippingAddress();
	shippingAddressToDelete.setShippingAddressId(shippingAddressId);
	sessionFactory.getCurrentSession().delete(shippingAddressToDelete);

	}

@Transactional
	public ShippingAddress getShippingAddress(String shippingAddressId) {
		
		return sessionFactory.getCurrentSession().get(ShippingAddress.class, shippingAddressId);
	}

}
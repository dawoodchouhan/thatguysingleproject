package com.devops.thatguy.dao;

import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.devops.thatguy.model.Order;

@Repository("orderDAO")
@Transactional
public class OrderDAOImpl implements OrderDAO{
	@Autowired
	SessionFactory sessionFactory ;
	
	
	
	public OrderDAOImpl(SessionFactory sessionFactory) {
		
		this.sessionFactory = sessionFactory;
	}

	public List<Order> orderListofUser(String userId) {
		String hql = "from Order where userId = " + "'" + userId + "'  and status =  " + "' N '" ;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Order> orderListOfUser = query.list();
		
		return orderListOfUser;
	}

	public void save(Order order) {
		sessionFactory.getCurrentSession().save(order);
		
	}

	public void update(Order order) {
		sessionFactory.getCurrentSession().update(order);
		
	}

	public String delete(int orderId) {
		Order order = new Order();
		order.setOrderId(orderId);
		try {
			sessionFactory.getCurrentSession().delete(order);
		} catch (HibernateException e) {
			
			e.printStackTrace();
			return e.getMessage();
		}
		return null;
	}

	public Order get(String userId) {
		String hql = "from Order where userId = "+"'" +userId +"' and status = " + "'N '" ;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Order> orderListOfUser = (List<Order>)query.list();
		if(orderListOfUser!=null && !orderListOfUser.isEmpty()) return orderListOfUser.get(0);
		return null;
	}

	public Long getTotalRs(String userId) {
		String hql = "select sum(price)from Order where userId = " + "'" + userId + " ' " + " and status = " + "'N'" ;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		Long sum = (Long)query.uniqueResult();
		return sum;
	}

	public void saveorupdate(Order order) {
		sessionFactory.getCurrentSession().saveOrUpdate(order);
		
	}
}



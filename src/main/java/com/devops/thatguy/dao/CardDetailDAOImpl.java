package com.devops.thatguy.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.devops.thatguy.model.CardDetails;



@Repository("cardDetailDAO")
public class CardDetailDAOImpl implements CardDetailDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public CardDetailDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public void saveOrUpdate(CardDetails cardDetail) {
	sessionFactory.getCurrentSession().saveOrUpdate(cardDetail);

	}

}

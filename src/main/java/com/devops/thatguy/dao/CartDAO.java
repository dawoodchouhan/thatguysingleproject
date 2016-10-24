package com.devops.thatguy.dao;

import java.util.List;

import com.devops.thatguy.model.Cart;

public interface CartDAO {
public List<Cart> list();
public List<Cart> get(int userId);
public Cart getitem(int cartId);
public void saveOrUpdate(Cart cart);
public void delete(int userId);
public long CartPrice(int userId);	
public Cart getitem(int prodId,int userId);

//public int cartsize(int userId);
public long cartsize(int userId);

public void pay(int userId);
public List<Cart> AdminReport();
}

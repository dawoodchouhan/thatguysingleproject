package com.devops.thatguy.dao;

import java.util.List;

import com.devops.thatguy.model.Cart;

import com.devops.thatguy.model.UserDetails;

public interface CartDAO {
public List<Cart> list();
public List<Cart> get(int userId);
public Cart getitem(int cartId);
public void saveOrUpdate(Cart cart);
public void delete(int userId);
public void updateCart(String userId);
public long CartPrice(int userId);	
public Cart getitem(int prodId,int userId);

//public int cartsize(int userId);
public long cartsize(int userId);
public UserDetails getCartByUserId(String userId);
public void pay(int userId);
public List<Cart> AdminReport();
}

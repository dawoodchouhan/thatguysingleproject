package com.devops.thatguy.dao;

import java.util.List;

import com.devops.thatguy.model.Supplier;

public interface SupplierDAO {

public List<Supplier> list();
public Supplier get(int id);
	//public Supplier getSupplier(String id);
public void saveOrUpdate(Supplier supplier);
public void delete(int id);

}

package com.devops.thatguy.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.devops.thatguy.dao.SupplierDAO;
import com.devops.thatguy.model.Supplier;

public class SupplierTest {
	public static void main(String[] args){
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		//we have to specify in which package the classes are there
		context.scan("com.devops");
		context.refresh();
		SupplierDAO supplierDAO=(SupplierDAO) context.getBean("supplierDAO");
		Supplier supplier=(Supplier) context.getBean("supplier");
		supplier.setId(0);
		supplier.setName("Akshay");
		supplier.setAddress("hyderabad");
		supplierDAO.saveOrUpdate(supplier);
		System.out.println("objects are created successfully");
}
}

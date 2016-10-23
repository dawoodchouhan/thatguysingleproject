package com.devops.thatguy.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.devops.thatguy.dao.UserDetailsDAO;
import com.devops.thatguy.model.UserDetails;

public class UserTest {
	public static void main(String[] args){
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		//we have to specify in which package the classes are there
		context.scan("com.devops");
		context.refresh();
		UserDetailsDAO userDetailsDAO=(UserDetailsDAO) context.getBean("userDetailsDAO");
		UserDetails user=(UserDetails) context.getBean("user");
		
		user.setEmail("dawood@gmail.com");
		user.setEnabled("TRUE");
		user.setMobile("8125329711");
		user.setUserName("dawood");
		user.setName("Dawood Ibrahim");
		user.setPassword("987654321");
		user.setRole("ROLE_USER");
		
		userDetailsDAO.saveOrUpdate(user);
		System.out.println("objects are created successfully");
}
}

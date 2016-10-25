package com.devops.thatguy.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devops.thatguy.dao.CartDAO;
import com.devops.thatguy.dao.CategoryDAO;
import com.devops.thatguy.dao.ProductDAO;
import com.devops.thatguy.dao.SupplierDAO;
import com.devops.thatguy.dao.UserDetailsDAO;
import com.devops.thatguy.model.Product;
import com.devops.thatguy.model.UserDetails;


@Controller
public class LoginController {

	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	UserDetailsDAO userDetailsDAO;
	@Autowired
	CartDAO cartDAO;
	
	@RequestMapping(value = "login")
	public String DisplayLogin(Model mv) {
		mv.addAttribute("userDetails", new UserDetails());
		/*mv.addAttribute("categoryList", categoryDAO.list());
		mv.addAttribute("productList", productDAO.list());*/
		mv.addAttribute("IfLoginClicked", "true");
		mv.addAttribute("HideOthers","true");
		return "Welcome";
	}

	@RequestMapping(value = "Register")
	public String DisplayRegister(Model mv) {
		mv.addAttribute("userDetails", new UserDetails());
/*		mv.addAttribute("categoryList", categoryDAO.list());
		mv.addAttribute("productList", productDAO.list());*/
		mv.addAttribute("IfRegisterClicked", "true");
		mv.addAttribute("HideOthers","true");
		mv.addAttribute("HideOthers","true");
		
		return "Welcome";
	}

	@RequestMapping(value = "adduser", method = RequestMethod.POST)
	public String UserRegister(@ModelAttribute("userDetails") UserDetails userDetails,RedirectAttributes attributes) {
		userDetails.setEnabled("TRUE");
		userDetails.setRole("ROLE_USER");
		System.out.println("1");
		userDetailsDAO.saveOrUpdate(userDetails);
		System.out.println("2");
		attributes.addFlashAttribute("SuccessMessage","Registration Successfull");
		return "redirect:Register";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login_session_attributes")
	public String login_session_attributes(HttpSession session,Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		UserDetails user = userDetailsDAO.get(username);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("name", user.getName());
		session.setAttribute("LoggedIn", "true");

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
		.getAuthentication().getAuthorities();
		String role="ROLE_USER";
		for (GrantedAuthority authority : authorities) 
		{
		  
		     if (authority.getAuthority().equals(role)) 
		     {
		    	

		    	 session.setAttribute("UserLoggedIn", "true");
		    	 session.setAttribute("cartsize",cartDAO.cartsize((Integer)session.getAttribute("userId")));
		     }
		     else 
		     {
		    	 session.setAttribute("Administrator", "true");
		    	 model.addAttribute("product",  new Product());
		    	 model.addAttribute("ProductPageClicked", "true");
		    	 model.addAttribute("supplierList",supplierDAO.list());
		    	 model.addAttribute("categoryList",categoryDAO.list());
			 }
		}
		return "Welcome";
	}

	@RequestMapping(value="pay")
	public String pay(HttpSession session)
	{
		cartDAO.pay(((Integer)session.getAttribute("userId")));
		session.setAttribute("cartsize",cartDAO.cartsize((Integer)session.getAttribute("userId")));
		return "redirect:/Welcome";
}
}
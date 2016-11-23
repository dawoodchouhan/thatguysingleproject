package com.devops.thatguy.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devops.thatguy.dao.CartDAO;
import com.devops.thatguy.dao.ProductDAO;
import com.devops.thatguy.dao.UserDetailsDAO;
import com.devops.thatguy.model.BillingAddress;
import com.devops.thatguy.model.Cart;

import com.devops.thatguy.model.Product;
import com.devops.thatguy.model.UserDetails;


@Controller
public class CartController {

	@Autowired
	private CartDAO cartDAO;
	

	@Autowired
	private ProductDAO productDAO;


	
	
	@RequestMapping("addtoCart/{userId}/{id}")
	public String addToCart(@PathVariable("id") int Productid, @PathVariable("userId") int userId,
			@RequestParam("quantity") int q, HttpSession session) throws Exception {
		
		if (cartDAO.getitem(Productid, userId) != null) {
			Cart item = cartDAO.getitem(Productid, userId);
			item.setQuantity(item.getQuantity() + q);
			Product p = productDAO.get(item.getProductid());
			item.setPrice(item.getPrice() + (q * p.getPrice()));
			cartDAO.saveOrUpdate(item);
			session.setAttribute("cartsize", cartDAO.cartsize( (Integer) session.getAttribute("userId")));
			return "redirect:/view/"+p.getCategoryid();
		} else {
			Cart item = new Cart();
			Product product = productDAO.get(Productid);
			item.setProductname(product.getName());
			item.setUserid(userId);
			item.setQuantity(q);
			item.setPrice(q * product.getPrice());
			item.setStatus("C");
			item.setProductid(Productid);
			cartDAO.saveOrUpdate(item);
			session.setAttribute("cartsize", cartDAO.cartsize((Integer) session.getAttribute("userId")));
			return "redirect:/view/"+product.getCategoryid();
		}

	}

	@RequestMapping("editorder/{cartid}")
	public String editorder(@PathVariable("cartid") int cartid, @RequestParam("quantity") int q, HttpSession session) {
		Cart cart = cartDAO.getitem(cartid);
		Product p = productDAO.get(cart.getProductid());
		cart.setQuantity(q);
		cart.setPrice(q * p.getPrice());
		cartDAO.saveOrUpdate(cart);
		session.setAttribute("cartsize", cartDAO.cartsize((Integer) session.getAttribute("userId")));
		return "redirect:/viewcart";
	}

	@RequestMapping("deleteitem/{id}")
	public String deleteorder(@PathVariable("id") int id, HttpSession session) {
		cartDAO.delete(id);
		session.setAttribute("cartsize", cartDAO.cartsize((Integer) session.getAttribute("userId")));
		return "redirect:/viewcart";
	}

	@RequestMapping("viewcart")
	public String viewCart(Model model, HttpSession session) {
		int userId = (Integer) session.getAttribute("userId");
		model.addAttribute("CartList", cartDAO.get(userId));
		if (cartDAO.cartsize((Integer) session.getAttribute("userId")) != 0) {
			model.addAttribute("CartPrice", cartDAO.CartPrice(userId));
		} else {
			model.addAttribute("EmptyCart", "true");
		}
		model.addAttribute("IfViewCartClicked", "true");
		model.addAttribute("HideOthers", "true");
		return "Welcome";
	}
//To view History of the items bought
	
	/*@RequestMapping(value="/view/orderedItems",method=RequestMethod.GET)
	public List<OrderedItems> listOfOrderedItems(Principal principal){
		List<OrderedItems> listofOrderedItems =  cartDAO.listOrderedItems(userDetailsDAO.getUserDetailsByUserName
				(principal.getName()).getUserId());
		if(listofOrderedItems!=null&&!listofOrderedItems.isEmpty())
		{
			return listofOrderedItems;
		}
		return null;
	}

	
	// To get the listOf ordered items
		@RequestMapping("/user/cart/history")
		public ModelAndView listOrderedItems(Principal principal, Model model) {
			ModelAndView mv = new ModelAndView("index");
			mv.addObject("isViewHistoryclicked", "true");
			userDetails = userDetailsDAO.getUserDetailsByUserName(principal.getName());

			List<OrderedItems> listofOrderedItems = cartDAO.listOrderedItems(UserDetails.getUserId());
			if (listofOrderedItems != null && !listofOrderedItems.isEmpty()) {
				model.addAttribute("listOfOrderedItems", listofOrderedItems);
			} else {
				model.addAttribute("noProductsinHistory", "No products ordered till now");
			}
			mv.addObject("activeNavMenu", "viewCart");
			return mv;

	}
	*/
	
	
	
	@RequestMapping(value="checkout")
	public ModelAndView goToBillingAddress(@ModelAttribute("billingAddress") BillingAddress billingAddress) {
		ModelAndView modelAndView = new ModelAndView("redirect:/checkout");
		return modelAndView;
	}
	
	
	@RequestMapping("placeorder")
	public String placeorder(Model model) {
		model.addAttribute("IfPaymentClicked", "true");
		model.addAttribute("HideOthers", "true");
		return "Welcome";
	}

	@RequestMapping("Payment")
	public String payment(HttpSession session) {
		cartDAO.pay((Integer) session.getAttribute("userId"));
		return "redirect:/Welcome";
}
}
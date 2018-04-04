package com.mvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.model.Product;
import com.mvc.model.User;
import com.mysql.jdbc.Blob;

@Controller
public class CartController {
	/*
	@RequestMapping(value = "/cart",  method = RequestMethod.GET)
    public @ResponseBody
    String renew() {
	
		return null;  
    }
	*/
	
	
	@RequestMapping(value = "/cart")
	public ModelAndView showCart(@ModelAttribute("user") User user, @RequestParam(required = false) Integer id,
			@RequestParam(required = false) String add, @ModelAttribute("product") Product product,
			@RequestParam(required = false) String category, @RequestParam(required = false) Blob b,
			@RequestParam(required = false) String delete, HttpSession session, HttpServletRequest req,
			SessionStatus status, @RequestParam(required = false) String logout, Model model) {
		session.getAttribute("loggedUser");
		session.getAttribute("sum");
		session.getAttribute("product");

		DBWorker db = new DBWorker(new SQLDBCDriverConnectionSimple().setConnect());
		Map<Product, Integer> cart;
		session = req.getSession();

		if (session.getAttribute("cart") == null) {
			cart = new HashMap<Product, Integer>();
			session.setAttribute("cart", cart);
		} else {
			cart = (Map<Product, Integer>) session.getAttribute("cart");
		}
		System.out.println("Products in cart   " + session.getAttribute("cart"));

		if (add != null) {
			product = null;
			product = db.getProduct(id);
			System.out.println("Product   " + product);
			if (cart != null) {
				Integer q = cart.get(product);
				System.out.println(q);
				q++;
				cart.put(product, q);

			} else {
				System.out.println("ERROR");
			}
		}

		if (delete != null) {
			product = null;
			product = db.getProduct(id);
			Integer q = cart.get(product);
			System.out.println(q);
			System.out.println(cart.containsKey(product));
			System.out.println(cart.containsValue(q));

			if (cart.containsValue(q)) {

				if (q > 1) {
					q--;
					cart.put(product, q);
				} else {
					cart.remove(product, q);
				}

			} else {
				System.out.println("ERROR");

			}
		}
		session.getAttribute("loggedUser");
		if (logout != null) {
			session.invalidate();
			status.setComplete();
		}

		model.addAttribute("cart", cart);
		ModelAndView view1 = new ModelAndView("cart");
		return view1;
	}
}

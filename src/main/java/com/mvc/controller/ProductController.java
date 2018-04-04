package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import com.mvc.model.Product;
import com.mvc.model.User;


@Controller
public class ProductController {
	@RequestMapping(value = "/product")
	public ModelAndView addProduct(@ModelAttribute("user") User user, @ModelAttribute("product") Product product,
			HttpServletResponse response, @RequestParam(required = false) String id,
			@RequestParam(required = false) String buy,
			@RequestParam(required = false) String category, HttpSession session, SessionStatus status,
			HttpServletRequest req, @RequestParam(required = false) String logout, Model model)
			throws SQLException, IOException {
		session.getAttribute("loggedUser");
		DBWorker db = new DBWorker(new SQLDBCDriverConnectionSimple().setConnect());
		Map<Product, Integer> cart;
		List<Product> products=null;
		session = req.getSession();
	
		if (req.getParameter("category") != null) {
			products = db.getProducts(req.getParameter("category"));
		} else {
			products = db.getProducts();
		}

		if (session.getAttribute("cart") == null) {
			cart = new HashMap<Product, Integer>();
			session.setAttribute("cart", cart);
		} else {
			cart = (Map<Product, Integer>) session.getAttribute("cart");
		}
		if (buy != null) {
			product = null;
			product = db.getProduct(Integer.parseInt(id));
			if (cart.containsKey(product)) {
				Integer i = cart.get(product);
				i++;
				cart.put(product, i);

			} else {
				cart.put(product, 1);

			}
		}

		
		if (logout != null) {
			session.invalidate();
			status.setComplete();
		}

		model.addAttribute("cart", cart);
		model.addAttribute("products", products);
		ModelAndView view1 = new ModelAndView("product");
		return view1;
	}
}

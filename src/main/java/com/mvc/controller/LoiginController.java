package com.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import com.mvc.model.User;

@Controller
public class LoiginController {

	@RequestMapping(value = "/login")
	public ModelAndView verifyLogin(@ModelAttribute("user") User user, @RequestParam(required = false) String userId,
			@RequestParam(required = false) String password, @RequestParam(required = false) String loginError,
			SessionStatus status, HttpSession session, HttpServletRequest req, Model model) {
		DBWorker db = new DBWorker(new SQLDBCDriverConnectionSimple().setConnect());

		if (user != null) {
			session.invalidate();
			status.setComplete();
		}
		ModelAndView view;
		user = db.login(userId, password);
		if (user == null) {
			// model.addAttribute("loginError", "Error logging in. Please try again");
			view = new ModelAndView("login");
		} else {
			//session.setAttribute("loggedUser", user);
			model.addAttribute("loggedUser", user);
			view = new ModelAndView("hello");

		}

		return view;
	}

}

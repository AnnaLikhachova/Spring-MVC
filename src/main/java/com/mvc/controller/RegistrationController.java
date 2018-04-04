package com.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import com.mvc.model.User;

@Controller
public class RegistrationController {
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public ModelAndView getAdmissionForm() {
		ModelAndView view = new ModelAndView("registration");
		return view;
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@Valid @ModelAttribute("user") User user, BindingResult result,
			HttpServletRequest req, HttpSession session, @RequestParam(required = false) String login,
			@RequestParam(required = false) String psw, @RequestParam(required = false) String name,
			SessionStatus status, @RequestParam(required = false) String gender,
			@RequestParam(required = false) String area, Model model) {
		ModelAndView view;

		if (user != null) {
			session.invalidate();
			status.setComplete();
		}
		DBWorker db = new DBWorker(new SQLDBCDriverConnectionSimple().setConnect());
		db.enterData(login, psw, name, gender, area);
		session = req.getSession();
		if (result.hasErrors()) {
			view = new ModelAndView("registration");
			return view;
		} else {
			session.setAttribute("loggedUser", user);
		}

		view = new ModelAndView("hello");

		model.addAttribute("loggedUser", user);

		return view;
	}
}


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
public class MainPageController {

	@RequestMapping(value = "/hello")
	public ModelAndView welcomeMessage(@ModelAttribute("user") User user, HttpSession session, SessionStatus status,
			HttpServletRequest req, @RequestParam(required = false) String logout) {
		session = req.getSession();
		session.getAttribute("loggedUser");
		
		if (logout != null) {
			session.invalidate();
			status.setComplete();
		}
		ModelAndView view = new ModelAndView("hello");
		return view;
	}
	

	@ModelAttribute
	public void addingCommonObjects(Model model1) {
		model1.addAttribute("headerMessage", "Christmas presents");
	}	
}

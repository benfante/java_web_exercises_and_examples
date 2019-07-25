package com.javacourse.springmvc.examples.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("login")
public class LoginController {
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
		
	@GetMapping
	public String login() {
		return "login";
	}
}

package com.javacourse.springmvc.examples.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class WelcomeController {
	private static final Logger log = LoggerFactory.getLogger(WelcomeController.class);
	
	@GetMapping
	public String welcome() {
		return "welcome";
	}
}

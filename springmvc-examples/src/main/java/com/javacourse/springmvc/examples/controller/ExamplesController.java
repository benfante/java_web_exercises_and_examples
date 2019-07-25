package com.javacourse.springmvc.examples.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javacourse.springmvc.examples.model.FormExample;
import com.javacourse.springmvc.examples.model.Item;
import com.javacourse.springmvc.examples.model.Province;
import com.javacourse.springmvc.examples.model.ProvinceEditor;

@Controller
@RequestMapping("examples")
public class ExamplesController {
	private static final Logger log = LoggerFactory.getLogger(ExamplesController.class);

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Province.class, new ProvinceEditor());
	}
	
	@GetMapping("/jstl/core")
	public String jstlCoreExamples(Model model) {
		model.addAttribute("aString", "A value");
		model.addAttribute("anInt", 3);
		model.addAttribute("controllerTitle", "Title from the controller");
		Collection<Item>items = new ArrayList<>();
		items.add(new Item("Pizza margherita", new BigDecimal("4.00"), 1));
		items.add(new Item("Merendine", new BigDecimal("2.50"), 1));
		items.add(new Item("Burro", new BigDecimal("1.25"), 1));
		items.add(new Item("Latte", new BigDecimal("1.10"), 1));
		items.add(new Item("Acqua naturale", new BigDecimal("2.00"), 1));
		model.addAttribute("items", items);
		return "examples/jstl/core";
	}
	
	
	@GetMapping("/html_forms")
	public String htmlFormExamples() {
		return "examples/htmlForms";
	}
	
	@RequestMapping(path="/form_submit", method= {RequestMethod.GET, RequestMethod.POST})
	public String formSubmit(HttpServletRequest req) {
		Enumeration<String> parameterNames = req.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String parameterName = parameterNames.nextElement();
			String[] values = req.getParameterValues(parameterName);
			log.info("{} = {}", parameterName, Arrays.toString(values));
		}

		String[] selectedWorkingProvinces = req.getParameterValues("workingProvince");
		for (String s : selectedWorkingProvinces) {
			req.setAttribute(s+"selected", true);			
		}
		String[] selectedWorkingProvinces2 = req.getParameterValues("workingprovince2");
		for (String s : selectedWorkingProvinces2) {
			req.setAttribute(s+"selected2", true);			
		}
		
		// Validazione
		String fullName = req.getParameter("fullName");
		if (fullName == null || "".equals(fullName)) {
			return "examples/htmlForms";
		}
		
		return "redirect:"+req.getServletContext().getContextPath()+"/";
	}

	@GetMapping("/spring_forms")
	public String springFormExamples(Model model, HttpServletRequest req) {
		FormExample formExample = new FormExample();
		formExample.setFullName(req.getUserPrincipal().getName());
		model.addAttribute("formExample", formExample);
		return "examples/springForms";
	}

	@RequestMapping(path="/spring_form_submit", method= {RequestMethod.GET, RequestMethod.POST})
	public String springSubmit(@Valid @ModelAttribute("formExample") FormExample formExample,
			BindingResult result,
			Model model,
			HttpServletRequest req) {
		log.info(formExample.toString());
//		if (formExample.getFullName() == null || "".equals(formExample.getFullName())) {
//			result.rejectValue("fullName", "notEmpty", "The full name is mandatory.");
//		}
		if (result.hasErrors()) {
			return "examples/springForms";			
		}
		return "redirect:"+req.getServletContext().getContextPath()+"/";
	}
	
	@ModelAttribute
	public List<Province> getProvinces() {
		List<Province> result = new ArrayList<>();
		result.add(new Province("MI", "Milano"));
		result.add(new Province("TO", "Torino"));
		result.add(new Province("RM", "Roma"));
		result.add(new Province("VR", "Verona"));
		result.add(new Province("VE", "Venezia"));
		return result;
	}
}

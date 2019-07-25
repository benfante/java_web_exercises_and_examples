package com.javacourse.springmvc.examples.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.validator.constraints.ParameterScriptAssert;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javacourse.springmvc.examples.model.Item;

@Controller
@RequestMapping("/items")
public class ItemsController {
	
	private static final String ITEM_VIEW = "items/item";
	private static final String USER_ITEMS_ATTRIBUTE = "userItems";

	@GetMapping
	public String list() {
		return "items/list";
	}
	
	@GetMapping("/new")
	public String showAddItem(Model model) {
		Item item = new Item(null, null, 1);
		model.addAttribute("command", item);
		return ITEM_VIEW;
	}

	@PostMapping("/add")
	public String addItem(@Valid @ModelAttribute(name = "command") Item item, BindingResult result, HttpSession session, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return ITEM_VIEW;
		}
		getUserItems(session).add(item);
		redirectAttributes.addFlashAttribute("message", "message.itemAdded");
		return "redirect:"+session.getServletContext().getContextPath()+"/items";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id, HttpSession session) {
		List<Item> items = (List<Item>) getUserItems(session);
		items.remove(id);
		return "redirect:"+session.getServletContext().getContextPath()+"/items";		
	}

	private Collection<Item> getUserItems(HttpSession session) {
		Collection<Item> items = (Collection<Item>) session.getAttribute(USER_ITEMS_ATTRIBUTE);
		if (items == null) {
			items = new ArrayList<>();
			items.add(new Item("Pizza margherita", new BigDecimal("4.00"), 1));
			items.add(new Item("Merendine", new BigDecimal("2.50"), 2));
			items.add(new Item("Burro", new BigDecimal("1.25"), 3));
			items.add(new Item("Latte", new BigDecimal("1.10"), 2));
			items.add(new Item("Acqua naturale", new BigDecimal("2.00"), 1));
			session.setAttribute(USER_ITEMS_ATTRIBUTE, items);
		}
		return items;
	}
	
	@ModelAttribute("items")
	public Collection<Item> getItem(HttpSession session) {
		return getUserItems(session);
	}
}

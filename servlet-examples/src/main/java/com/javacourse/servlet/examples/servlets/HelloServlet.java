package com.javacourse.servlet.examples.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javacourse.servlet.examples.model.Item;

/**
 * Servlet implementation class HelloServlet
 */
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HelloServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		if (name != null && !name.trim().equals("")) {
			session.setAttribute("greetingName", name);
		} else {
			if (session.getAttribute("greetingName") == null) {
				session.setAttribute("greetingName", "World");
			}
		}

		String filter = request.getParameter("filter");

		Collection<Item> items = getUserItems(request);

		Collection<Item> filteredItems = filterItems(filter, items);

		request.setAttribute("items", filteredItems);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/hello.jsp");
		dispatcher.forward(request, response);
	}

	private Collection<Item> filterItems(String filter, Collection<Item> items) {
		Collection<Item> filteredItems = new ArrayList<>();
		if (filter != null) {
			for (Item item : items) {
				if (item.getDescription().contains(filter)) {
					filteredItems.add(item);
				}
			}
		} else {
			filteredItems.addAll(items);
		}
		return filteredItems;
	}

	private Collection<Item> getUserItems(HttpServletRequest request) {
		Collection<Item> items = null;

		HttpSession session = request.getSession();
		items = (Collection<Item>) session.getAttribute("userItems");

		if (items == null) {
			items = new ArrayList<>();
			items.add(new Item("Pizza margherita", new BigDecimal("4.00"), 1));
			items.add(new Item("Merendine", new BigDecimal("2.50"), 1));
			items.add(new Item("Burro", new BigDecimal("1.25"), 1));
			items.add(new Item("Latte", new BigDecimal("1.10"), 1));
			items.add(new Item("Acqua naturale", new BigDecimal("2.00"), 1));
			session.setAttribute("userItems", items);
		}
		return items;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.javacourse.servlet.examples.servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javacourse.servlet.examples.model.Item;

/**
 * Servlet implementation class ItemManagementServlet
 */
public class ItemManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ItemManagementServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/addItem.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String description = request.getParameter("description");
		String cost = request.getParameter("cost");
		String priority = request.getParameter("priority");

		if (description == null || "".equals(description)) {
			request.getRequestDispatcher("/WEB-INF/jsp/addItem.jsp").forward(request, response);
		} else {

			BigDecimal bdCost = new BigDecimal(cost);
			int iPriority = Integer.parseInt(priority);

			Item item = new Item(description, bdCost, iPriority);

			Collection<Item> items = (Collection<Item>) request.getSession().getAttribute("userItems");
			if (items == null) {
				items = new ArrayList<>();
				request.getSession().setAttribute("userItems", items);
			}
			items.add(item);

			response.sendRedirect(request.getContextPath() + "/hello");
		}
	}

}

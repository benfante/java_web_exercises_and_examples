package com.javacourse.servlet.examples.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javacourse.servlet.examples.model.Item;

/**
 * Servlet implementation class DeleteItemServlet
 */
public class DeleteItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		List<Item> items = (List<Item>) request.getSession().getAttribute("userItems");
		if (items != null && items.size() > id) {
			items.remove(id);
		}
		
		response.sendRedirect(request.getContextPath()+"/hello");
	}

}

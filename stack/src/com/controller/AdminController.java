package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.EventService;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("uname", request.getParameter("username"));
		session.setAttribute("pass", request.getParameter("password"));
		EventService service = new EventService();
		try {
			String flag = service.validateAdminService(request.getParameter("username"),
					request.getParameter("password"));
			PrintWriter p = response.getWriter();
			if (flag != null) {
				session.setAttribute("admin_id", flag);
				p.println("<script type=\"text/javascript\">");
				p.println("alert('Login Successfully')");
				p.println("location='registrationchart.jsp'");
				p.println("</script>");
//				response.sendRedirect("registrationchart.jsp");
			} else {
				p.println("<script type=\"text/javascript\">");
				p.println("alert('Invalid Login Details')");
				p.println("location='admin.jsp'");
				p.println("</script>");
//				response.sendRedirect("admin.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

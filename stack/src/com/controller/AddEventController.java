package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Event;
import com.service.EventService;

/**
 * Servlet implementation class AddEventController
 */
@WebServlet("/AddEventController")
public class AddEventController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEventController() {
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
		DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
		Date dateobj = new Date();
		HttpSession session = request.getSession(false);
		String admin_id = (String) session.getAttribute("admin_id");
		EventService service = new EventService();
		Event event = new Event();
		String eve_id = (df.format(dateobj).replaceAll(":", ""));
		event.setEvent_id(eve_id.replaceAll("\\s+", ""));
		event.setEvent_name(request.getParameter("eventname"));
		System.out.println(request.getParameter("eventdatetime"));
		String eventdate = request.getParameter("eventdatetime");
		String[] arrOfStr = eventdate.split("-", 2);
		event.setEvent_start(arrOfStr[0].trim());
		event.setEvent_end(arrOfStr[1].trim());
//		event.setEvent_time_date(request.getParameter("eventdatetime"));
		event.setEvent_capacity(Integer.parseInt(request.getParameter("availabletickets")));
		event.setEvent_registered_date(df.format(dateobj));
		event.setEvent_registered_by(admin_id);
		event.setEvent_organized_by(request.getParameter("eventorganizer"));
		event.setEvent_description(request.getParameter("eventdescription"));

		try {
			PrintWriter p = response.getWriter();
			boolean flag = service.addEventService(event);
			if (flag) {
				System.out.println("added event");
				p.println("<script type=\"text/javascript\">");
				p.println("alert('Event Added Successfully')");
				p.println("location='registrationchart.jsp'");
				p.println("</script>");
			} else {
				System.out.println("not added event");
				p.println("<script type=\"text/javascript\">");
				p.println("alert('Event Not Added please try again')");
				p.println("location='addevent.jsp'");
				p.println("</script>");
//				response.sendRedirect("addevent.jsp");
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

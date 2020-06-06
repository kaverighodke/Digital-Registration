package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bean.User;
import com.service.EventService;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:\\Users\\User\\eclipse-workspace\\stack\\WebContent\\images\\";
	public int totaltickets;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("inside");

		User user = new User();
		EventService service = new EventService();

		DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
		Date dateobj = new Date();

		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						String name = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
						user.setUser_id_card(name);
					} else {
						String name = item.getFieldName();
						String value = item.getString();

						if (name.equals("eventid")) {
							user.setEvent_id(value);
						}
						if (name.equals("fullname")) {
							user.setUser_full_name(value);
						}
						if (name.equals("email")) {
							user.setUser_email_id(value);
						}
						if (name.equals("mobile")) {
							user.setUser_mobile_no(value);
						}
						if (name.equals("regtype")) {
							user.setUser_registration_type(value);
						}
						if (name.equals("tickets")) {
							user.setNo_of_tickets(Integer.parseInt(value));
							totaltickets = Integer.parseInt(value);
						}

					}
				}

				user.setUser_registraion_date(df.format(dateobj));

				String reg_id = (user.getEvent_id() + user.getUser_registraion_date()).replaceAll(":", "");
				user.setUser_registration_id(reg_id.replaceAll("\\s+", ""));

				// File uploaded successfully
//				request.setAttribute("message", "File Uploaded Successfully");
			} catch (Exception ex) {
				System.out.println(ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}

		try {
			PrintWriter out = response.getWriter();

			int count = service.getTicketsCountService(user.getEvent_id());
			if (count > 0) {
				System.out.println(count + " Tickets Available You can Register For Event");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('" + count + " Tickets Available You Can Register For Event')");
				out.println("</script>");

				if (user.getNo_of_tickets() <= count) {

					boolean flag = service.addUserService(user);
					if (flag) {
						System.out.println("Added");
						boolean update = service.updateTicketCountService(user.getEvent_id(),
								count - user.getNo_of_tickets());
//						JOptionPane.showMessageDialog(null, "You Successfully Registered for the Event");
						out.println("<script type=\"text/javascript\">");
						out.println("alert('You Successfully Registered for the Event');");
						out.println("location='event.jsp'");
						out.println("</script>");

//						response.sendRedirect("event.jsp");
					} else {
						System.out.println("not added");
//						JOptionPane.showMessageDialog(null, "Event not Registered plz register again");
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Event not Registered plz register again');");
						out.println("location='event.jsp'");
						out.println("</script>");
//						response.sendRedirect("event.jsp");
					}

				} else {
//					JOptionPane.showMessageDialog(null, "Sorry we dont have" + user.getNo_of_tickets()
//							+ " tickets we have" + count + "tickets remaining");
					System.out.println("Sorry we dont have" + user.getNo_of_tickets() + " tickets we have" + count
							+ "tickets remaining");
					out.println("<script type=\"text/javascript\">");
					String msg = "Sorry we dont have " + user.getNo_of_tickets() + " tickets we have " + count
							+ " tickets remaining";
					out.println("alert('" + msg + "');");
					out.println("location='event.jsp'");
					out.println("</script>");
//					response.sendRedirect("event.jsp");
				}
			} else {
//				JOptionPane.showMessageDialog(null, "No More Tickets Available");
				System.out.println("No More Tickets Available");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No More Tickets Available');");
				out.println("location='event.jsp'");
				out.println("</script>");
//				response.sendRedirect("event.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

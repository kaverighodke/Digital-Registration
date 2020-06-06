package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Chart;
import com.bean.Event;
import com.bean.User;
import com.util.DatabaseUtil;

public class EventDao {

	Connection con = null;
	PreparedStatement ps = null;
	boolean flag = false;

	public ArrayList<Event> getEventDetailsDao() throws SQLException {
		// TODO Auto-generated method stub
		ResultSet result = null;
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement("SELECT * FROM stackhack.event");
		result = ps.executeQuery();
		ArrayList<Event> eventList = new ArrayList<Event>();
		while (result.next()) {
			Event evt = new Event();
			evt.setEvent_id(result.getString("event_id"));
			System.out.println(result.getString("event_id"));
			evt.setEvent_name(result.getString("event_name"));
			evt.setEvent_start(result.getString("event_start"));
			evt.setEvent_end(result.getString("event_end"));
			evt.setEvent_capacity(result.getInt("event_capacity"));
			evt.setEvent_registered_date(result.getString("event_registered_date"));
			evt.setEvent_registered_by(result.getString("event_registered_by"));
			evt.setEvent_organized_by(result.getString("event_organized_by"));
			evt.setEvent_description(result.getString("event_description"));
			evt.setRemaining_tickets(result.getInt("remaining_event_capacity"));

			eventList.add(evt);
			System.out.println(eventList.toString());
		}

		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);

		for (Event a : eventList) {
			System.out.println("service" + a.getEvent_id());
		}

		return eventList;
	}

	public boolean addUserDao(User user) throws SQLException {
		// TODO Auto-generated method stub
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement(
				"INSERT INTO stackhack.user(user_registration_id,user_full_name,user_email_id,user_mobile_no,user_id_card,user_registration_type,no_of_tickets,user_registered_date,event_id)VALUES(?,?,?,?,?,?,?,?,?)");

		ps.setString(1, user.getUser_registration_id());
		ps.setString(2, user.getUser_full_name());
		ps.setString(3, user.getUser_email_id());
		ps.setString(4, user.getUser_mobile_no());
		ps.setString(5, user.getUser_id_card());
		ps.setString(6, user.getUser_registration_type());
		ps.setInt(7, user.getNo_of_tickets());
		ps.setString(8, user.getUser_registraion_date());
		ps.setString(9, user.getEvent_id());

		int result = ps.executeUpdate();
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList getRegistrationDataDao() throws SQLException {
		// TODO Auto-generated method stub
		ResultSet result = null;
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement(
				"select 'Group' as 'user_registration_type',user.event_id,sum(user.no_of_tickets) as 'no_of_tickets' from stackhack.user where user.user_registration_type=\"Group\" group by user.event_id\r\n"
						+ "union\r\n"
						+ "select 'Self' as 'user_registration_type',user.event_id,sum(user.no_of_tickets) as 'no_of_tickets' from stackhack.user where user.user_registration_type=\"Self\" group by user.event_id\r\n"
						+ "union\r\n"
						+ "select 'Corporate' as 'user_registration_type',user.event_id,sum(user.no_of_tickets) as 'no_of_tickets' from stackhack.user where user.user_registration_type=\"Corporate\" group by user.event_id\r\n"
						+ "union\r\n"
						+ "select 'Others' as 'user_registration_type',user.event_id,sum(user.no_of_tickets) as 'no_of_tickets' from stackhack.user where user.user_registration_type=\"Others\" group by user.event_id");
		result = ps.executeQuery();
		ArrayList<Chart> total = new ArrayList<Chart>();
		while (result.next()) {

		}
		return null;
	}

	public String validateAdminDao(String uname, String pass) throws SQLException {
		// TODO Auto-generated method stub
		ResultSet result = null;
		con = DatabaseUtil.getConnection();
		String query = "select * from stackhack.admin where username='" + uname + "' and password='" + pass + "'";
		ps = con.prepareStatement(query);

		result = ps.executeQuery();
		if (result.next()) {
			String id = result.getString("admin_id");
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			return id;
		} else {

			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			return null;
		}
	}

	public boolean addEventDao(Event event) throws SQLException {
		// TODO Auto-generated method stub
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement(
				"INSERT INTO stackhack.event(event_id,event_name,event_start,event_end,event_capacity,event_registered_date,event_registered_by,Event_organized_by,event_description,remaining_event_capacity) VALUES(?,?,?,?,?,?,?,?,?,?)");

		ps.setString(1, event.getEvent_id());
		ps.setString(2, event.getEvent_name());
		ps.setString(3, event.getEvent_start());
		ps.setString(4, event.getEvent_end());
		ps.setInt(5, event.getEvent_capacity());
		ps.setString(6, event.getEvent_registered_date());
		ps.setString(7, event.getEvent_registered_by());
		ps.setString(8, event.getEvent_organized_by());
		ps.setString(9, event.getEvent_description());
		ps.setInt(10, event.getEvent_capacity());

		int result = ps.executeUpdate();
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	public int getTicketsCountDao(String eventid) throws SQLException {
		// TODO Auto-generated method stub
		ResultSet result = null;
		con = DatabaseUtil.getConnection();
		String query = "SELECT remaining_event_capacity FROM stackhack.event where event_id='" + eventid + "'";

		ps = con.prepareStatement(query);

		result = ps.executeQuery();
		int count = -1;
		if (result.next()) {
			count = result.getInt("remaining_event_capacity");
		}
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return count;
	}

	public boolean updateTicketCountDao(String event_id, int update_ticket_count) throws SQLException {
		// TODO Auto-generated method stub
		con = DatabaseUtil.getConnection();
		String query = "UPDATE stackhack.event SET remaining_event_capacity =" + update_ticket_count
				+ " WHERE event_id ='" + event_id + "'";
		ps = con.prepareStatement(query);

		int result = ps.executeUpdate();
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList retriveUserTableEventDetailsDao() throws SQLException {
		// TODO Auto-generated method stub
		ResultSet result = null;
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement("SELECT * FROM stackhack.user");
		result = ps.executeQuery();
		ArrayList<User> userList = new ArrayList<User>();
		while (result.next()) {
			User user = new User();
			user.setUser_registration_id(result.getString("user_registration_id"));
			user.setUser_full_name(result.getString("user_full_name"));
			user.setUser_email_id(result.getString("user_email_id"));
			user.setUser_mobile_no(result.getString("user_mobile_no"));
			user.setUser_id_card(result.getString("user_id_card"));
			user.setUser_registration_type(result.getString("user_registration_type"));
			user.setNo_of_tickets(Integer.parseInt(result.getString("no_of_tickets")));
			user.setUser_registraion_date(result.getString("user_registered_date"));
			user.setEvent_id(result.getString("event_id"));
			
			userList.add(user);
			System.out.println(userList.toString());
		}

		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);

//		for (User a : userList) {
//			System.out.println("service" + a.getEvent_id());
//		}

		return userList;
	}
}

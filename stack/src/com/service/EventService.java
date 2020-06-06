package com.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Event;
import com.bean.User;
import com.dao.EventDao;

public class EventService {
	EventDao dao = new EventDao();

	public ArrayList<Event> retriveTableEventDetails() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Event> arr = new ArrayList<Event>();

		arr = dao.getEventDetailsDao();
//		for (Event a : arr) {
//			System.out.println("service" + a.getEvent_id());
//		}
		return arr;
	}

	public boolean addUserService(User user) throws SQLException {
		// TODO Auto-generated method stub
		return dao.addUserDao(user);
	}

	public ArrayList getRegistrationDataService() throws SQLException {

		return dao.getRegistrationDataDao();
	}

	public String validateAdminService(String uname, String pass) throws SQLException {
		// TODO Auto-generated method stub
		return dao.validateAdminDao(uname, pass);
	}

	public boolean addEventService(Event event) throws SQLException {
		// TODO Auto-generated method stub
		return dao.addEventDao(event);
	}

	public int getTicketsCountService(String eventid) throws SQLException {
		// TODO Auto-generated method stub
		return dao.getTicketsCountDao(eventid);
	}

	public boolean updateTicketCountService(String event_id, int update_ticket_count) throws SQLException {
		// TODO Auto-generated method stub
		return dao.updateTicketCountDao(event_id, update_ticket_count);
	}
	
	public ArrayList retriveUserTableEventDetailsService() throws SQLException {
		
		return dao.retriveUserTableEventDetailsDao();
	}
}

package com.bean;

public class Event {
	private String event_id;
	private String event_name;
	private String event_start;
	private String event_end;
	private int event_capacity;
	private String event_registered_date;
	private String event_registered_by;
	private String event_organized_by;
	private String event_description;
	private int remaining_tickets;
	private String event_time_date;

	public String getEvent_time_date() {
		return event_time_date;
	}

	public void setEvent_time_date(String event_time_date) {
		this.event_time_date = event_time_date;
	}

	public String getEvent_id() {
		return event_id;
	}

	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}

	public int getRemaining_tickets() {
		return remaining_tickets;
	}

	public void setRemaining_tickets(int remaining_tickets) {
		this.remaining_tickets = remaining_tickets;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public String getEvent_start() {
		return event_start;
	}

	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}

	public String getEvent_end() {
		return event_end;
	}

	public void setEvent_end(String event_end) {
		this.event_end = event_end;
	}

	public int getEvent_capacity() {
		return event_capacity;
	}

	public void setEvent_capacity(int event_capacity) {
		this.event_capacity = event_capacity;
	}

	public String getEvent_registered_date() {
		return event_registered_date;
	}

	public void setEvent_registered_date(String event_registered_date) {
		this.event_registered_date = event_registered_date;
	}

	public String getEvent_registered_by() {
		return event_registered_by;
	}

	public void setEvent_registered_by(String event_registered_by) {
		this.event_registered_by = event_registered_by;
	}

	public String getEvent_organized_by() {
		return event_organized_by;
	}

	public void setEvent_organized_by(String event_organized_by) {
		this.event_organized_by = event_organized_by;
	}

	public String getEvent_description() {
		return event_description;
	}

	public void setEvent_description(String event_description) {
		this.event_description = event_description;
	}

}

package com.bean;

public class Chart {
	private String event_id;
	private int group;
	private int self;
	private int corporate;
	private int other;

	public String getEvent_id() {
		return event_id;
	}

	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
	}

	public int getSelf() {
		return self;
	}

	public void setSelf(int self) {
		this.self = self;
	}

	public int getCorporate() {
		return corporate;
	}

	public void setCorporate(int corporate) {
		this.corporate = corporate;
	}

	public int getOther() {
		return other;
	}

	public void setOther(int other) {
		this.other = other;
	}

}

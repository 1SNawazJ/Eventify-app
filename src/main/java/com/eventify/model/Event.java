package com.eventify.model;

public class Event {
 private Integer event_id;
 private Integer user_id;
 private String event_type;
 private String venue;
 private Integer guest_count;
 private String paymentstatus;
 public Integer getEvent_id() {
	return event_id;
 }
 public void setEvent_id(Integer event_id) {
	this.event_id = event_id;
 }
 public Integer getUser_id() {
	return user_id;
 }
 public void setUser_id(Integer user_id) {
	this.user_id = user_id;
 }
 public String getEvent_type() {
	return event_type;
 }
 public void setEvent_type(String event_type) {
	this.event_type = event_type;
 }
 public String getVenue() {
	return venue;
 }
 public void setVenue(String venue) {
	this.venue = venue;
 }
 public Integer getGuest_count() {
	return guest_count;
 }
 public void setGuest_count(Integer guest_count) {
	this.guest_count = guest_count;
 }
 public String getPaymentstatus() {
	return paymentstatus;
 }
 public void setPaymentstatus(String paymentstatus) {
	this.paymentstatus = paymentstatus;
 }
 @Override
 public String toString() {
	return "Event [event_id=" + event_id + ", user_id=" + user_id + ", event_type=" + event_type + ", venue=" + venue
			+ ", guest_count=" + guest_count + ", paymentstatus=" + paymentstatus + "]";
 }
 public Event(Integer event_id, Integer user_id, String event_type, String venue, Integer guest_count,
		String paymentstatus) {
	super();
	this.event_id = event_id;
	this.user_id = user_id;
	this.event_type = event_type;
	this.venue = venue;
	this.guest_count = guest_count;
	this.paymentstatus = paymentstatus;
 }
 
}

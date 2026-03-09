package com.eventify.model;

public class Vendor {

	private Integer vendor_id;
	private String vendor_name;
	private String category;
	private String description;
	private Double price;
	private Double rating;
	private String approval_status;
	private String contact_email;
	private Integer contact_phone;
	public Integer getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(Integer vendor_id) {
		this.vendor_id = vendor_id;
	}
	public String getVendor_name() {
		return vendor_name;
	}
	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public String getContact_email() {
		return contact_email;
	}
	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}
	public Integer getContact_phone() {
		return contact_phone;
	}
	public void setContact_phone(Integer contact_phone) {
		this.contact_phone = contact_phone;
	}
	@Override
	public String toString() {
		return "Vendor [vendor_id=" + vendor_id + ", vendor_name=" + vendor_name + ", category=" + category
				+ ", description=" + description + ", price=" + price + ", rating=" + rating + ", approval_status="
				+ approval_status + ", contact_email=" + contact_email + ", contact_phone=" + contact_phone + "]";
	}
	public Vendor(Integer vendor_id, String vendor_name, String category, String description, Double price,
			Double rating, String approval_status, String contact_email, Integer contact_phone) {
		super();
		this.vendor_id = vendor_id;
		this.vendor_name = vendor_name;
		this.category = category;
		this.description = description;
		this.price = price;
		this.rating = rating;
		this.approval_status = approval_status;
		this.contact_email = contact_email;
		this.contact_phone = contact_phone;
	}

}

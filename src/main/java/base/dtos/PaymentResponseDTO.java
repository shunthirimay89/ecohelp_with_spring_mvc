package base.dtos;

import java.sql.Date;

public class PaymentResponseDTO {

	private int id;
	private String paymentType;
	private Double amount;
	private Date donationDate;
	private int donateplace_id;
	private String donateplace_name;
	private int user_id;
	private String user_name;
	private int paymentmethod_id;
	private String paymentmethod_name;
	private String user_address;
	public PaymentResponseDTO() {
		
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Date getDonationDate() {
		return donationDate;
	}

	public void setDonationDate(Date donationDate) {
		this.donationDate = donationDate;
	}

	public int getDonateplace_id() {
		return donateplace_id;
	}

	public void setDonateplace_id(int donateplace_id) {
		this.donateplace_id = donateplace_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getPaymentmethod_id() {
		return paymentmethod_id;
	}

	public void setPaymentmethod_id(int paymentmethod_id) {
		this.paymentmethod_id = paymentmethod_id;
	}
	public String getDonateplace_name() {
		return donateplace_name;
	}
	public void setDonateplace_name(String donateplace_name) {
		this.donateplace_name = donateplace_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPaymentmethod_name() {
		return paymentmethod_name;
	}
	public void setPaymentmethod_name(String paymentmethod_name) {
		this.paymentmethod_name = paymentmethod_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	
}

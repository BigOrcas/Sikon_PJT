package com.sikon.service.domain;

import java.sql.Date;

import com.sikon.service.domain.Product;
import com.sikon.service.domain.User;


public class Purchase {
	
	private int tranNo;
	private Product purchaseProd;
	private User buyer;
	private String serialNo;
	private String usedCoupon;
	private String receiverName;
	private String receiverPhone;
	private String receiverEmail;
	private String divyAddr;
	private String divyMessage;
	private int purchaseQuantity;
	private Date orderDate;
	private String invoiceNum;
	private int usedPoint;
	private int earnPoint;
	private int divyFee;
	private String paymentOpt;
	private String divyStatus;
	private String reviewStatus;
	private String impNumber;
	


	
	
	public Purchase(){
	}
	
	

	public String getSerialNo() {
		return serialNo;
	}



	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}



	public int getTranNo() {
		return tranNo;
	}



	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}



	public Product getPurchaseProd() {
		return purchaseProd;
	}



	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}



	public User getBuyer() {
		return buyer;
	}



	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}



	public String getUsedCoupon() {
		return usedCoupon;
	}



	public void setUsedCoupon(String usedCoupon) {
		this.usedCoupon = usedCoupon;
	}



	public String getReceiverName() {
		return receiverName;
	}



	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}



	public String getReceiverPhone() {
		return receiverPhone;
	}



	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}



	public String getReceiverEmail() {
		return receiverEmail;
	}



	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}



	public String getDivyAddr() {
		return divyAddr;
	}



	public void setDivyAddr(String divyAddr) {
		this.divyAddr = divyAddr;
	}



	public String getDivyMessage() {
		return divyMessage;
	}



	public void setDivyMessage(String divyMessage) {
		this.divyMessage = divyMessage;
	}



	public int getPurchaseQuantity() {
		return purchaseQuantity;
	}



	public void setPurchaseQuantity(int purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}



	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}



	public String getInvoiceNum() {
		return invoiceNum;
	}



	public void setInvoiceNum(String invoiceNum) {
		this.invoiceNum = invoiceNum;
	}



	public int getUsedPoint() {
		return usedPoint;
	}



	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}



	public int getEarnPoint() {
		return earnPoint;
	}



	public void setEarnPoint(int earnPoint) {
		this.earnPoint = earnPoint;
	}


	public String getPaymentOpt() {
		return paymentOpt;
	}



	public void setPaymentOpt(String paymentOpt) {
		this.paymentOpt = paymentOpt;
	}

	


	public String getDivyStatus() {
		return divyStatus;
	}



	public void setDivyStatus(String divyStatus) {
		this.divyStatus = divyStatus;
	}



	public int getDivyFee() {
		return divyFee;
	}



	public void setDivyFee(int divyFee) {
		this.divyFee = divyFee;
	}



	public String getReviewStatus() {
		return reviewStatus;
	}



	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}


	public String getImpNumber() {
		return impNumber;
	}



	public void setImpNumber(String impNumber) {
		this.impNumber = impNumber;
	}



	@Override
	public String toString() {
		return "Purchase [tranNo=" + tranNo + ", purchaseProd=" + purchaseProd + ", buyer=" + buyer + ", serialNo="
				+ serialNo + ", usedCoupon=" + usedCoupon + ", receiverName=" + receiverName + ", receiverPhone="
				+ receiverPhone + ", receiverEmail=" + receiverEmail + ", divyAddr=" + divyAddr + ", divyMessage="
				+ divyMessage + ", purchaseQuantity=" + purchaseQuantity + ", orderDate=" + orderDate + ", invoiceNum="
				+ invoiceNum + ", usedPoint=" + usedPoint + ", earnPoint=" + earnPoint + ", divyFee=" + divyFee
				+ ", paymentOpt=" + paymentOpt + ", divyStatus=" + divyStatus + ", reviewStatus=" + reviewStatus
				+ ", impNumber=" + impNumber + "]";
	}




}
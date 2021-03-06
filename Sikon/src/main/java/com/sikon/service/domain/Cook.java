package com.sikon.service.domain;

import java.sql.Date;

public class Cook {

	private int cookNo;
	private String cookName;
	private String cookFilename;
	private String cookBrief;	
	private String cookDifficuty;
	private int cookPrice;			
	private String cookTheme;		
	private String aplstarTime; 	
	private String aplendTime;	
	private int cookRecruit;	
	private String startTime;		
	private String endTime;		
	private String cookLocation;	
	private Date cookRegdate ; 
	private String cookVideo;	
	private int cookStock  ; 
	private int hearthit;		
	private int heartCount;		
	private String cookContent;
	private User mentor;
	private String userNickname;
	private Recipe recipe;
	private String userId;
	private int loveCheck;
	
	
	public Cook(){
	}


	public int getCookNo() {
		return cookNo;
	}


	public void setCookNo(int cookNo) {
		this.cookNo = cookNo;
	}


	public String getCookName() {
		return cookName;
	}


	public void setCookName(String cookName) {
		this.cookName = cookName;
	}


	public String getCookFilename() {
		return cookFilename;
	}


	public void setCookFilename(String cookFilename) {
		this.cookFilename = cookFilename;
	}


	public String getCookBrief() {
		return cookBrief;
	}


	public void setCookBrief(String cookBrief) {
		this.cookBrief = cookBrief;
	}


	public String getCookDifficuty() {
		return cookDifficuty;
	}


	public void setCookDifficuty(String cookDifficuty) {
		this.cookDifficuty = cookDifficuty;
	}


	public int getCookPrice() {
		return cookPrice;
	}


	public void setCookPrice(int cookPrice) {
		this.cookPrice = cookPrice;
	}


	public String getCookTheme() {
		return cookTheme;
	}


	public void setCookTheme(String cookTheme) {
		this.cookTheme = cookTheme;
	}


	public String getAplstarTime() {
		return aplstarTime;
	}


	public void setAplstarTime(String aplstarTime) {
		this.aplstarTime = aplstarTime;
	}


	public String getAplendTime() {
		return aplendTime;
	}


	public void setAplendTime(String aplendTime) {
		this.aplendTime = aplendTime;
	}


	public int getCookRecruit() {
		return cookRecruit;
	}


	public void setCookRecruit(int cookRecruit) {
		this.cookRecruit = cookRecruit;
	}


	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public String getCookLocation() {
		return cookLocation;
	}


	public void setCookLocation(String cookLocation) {
		this.cookLocation = cookLocation;
	}


	public Date getCookRegdate() {
		return cookRegdate;
	}


	public void setCookRegdate(Date cookRegdate) {
		this.cookRegdate = cookRegdate;
	}


	public String getCookVideo() {
		return cookVideo;
	}


	public void setCookVideo(String cookVideo) {
		this.cookVideo = cookVideo;
	}


	public int getCookStock() {
		return cookStock;
	}


	public void setCookStock(int cookStock) {
		this.cookStock = cookStock;
	}


	public int getHearthit() {
		return hearthit;
	}


	public void setHearthit(int hearthit) {
		this.hearthit = hearthit;
	}


	public int getHeartCount() {
		return heartCount;
	}


	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}


	public String getCookContent() {
		return cookContent;
	}


	public void setCookContent(String cookContent) {
		this.cookContent = cookContent;
	}


	public User getMentor() {
		return mentor;
	}


	public void setMentor(User mentor) {
		this.mentor = mentor;
	}


	public String getUserNickname() {
		return userNickname;
	}


	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}


	public Recipe getRecipe() {
		return recipe;
	}


	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getLoveCheck() {
		return loveCheck;
	}


	public void setLoveCheck(int loveCheck) {
		this.loveCheck = loveCheck;
	}


	@Override
	public String toString() {
		return "Cook [cookNo=" + cookNo + ", cookName=" + cookName + ", cookFilename=" + cookFilename + ", cookBrief="
				+ cookBrief + ", cookDifficuty=" + cookDifficuty + ", cookPrice=" + cookPrice + ", cookTheme="
				+ cookTheme + ", aplstarTime=" + aplstarTime + ", aplendTime=" + aplendTime + ", cookRecruit="
				+ cookRecruit + ", startTime=" + startTime + ", endTime=" + endTime + ", cookLocation=" + cookLocation
				+ ", cookRegdate=" + cookRegdate + ", cookVideo=" + cookVideo + ", cookStock=" + cookStock
				+ ", hearthit=" + hearthit + ", heartCount=" + heartCount + ", cookContent=" + cookContent + ", mentor="
				+ mentor + ", userNickname=" + userNickname + ", recipe=" + recipe + ", userId=" + userId
				+ ", loveCheck=" + loveCheck + "]";
	}




}

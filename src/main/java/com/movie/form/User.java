package com.movie.form;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="Users")
public class User implements Serializable {
	@Id
	@GeneratedValue
    private long id;
	@Column(name="user_type")
    private int type;
    @Column(name="userName")
    private String username;
    @Column(name="password")
    private String password;
    @Column(name="firstName")
    private String fname;
    @Column(name="lastName")
    private String lname;
    @Column(name="dateJoined")
    private Date dateJoined;
    @Column(name="email")
    private String email;
    @Column(name="zicode")
    private String zipcode;
    @Column(name="news")
    private boolean news;
    @Column(name="money")
    private int money;
	public boolean isNews() {
		return news;
	}
	public void setNews(boolean news) {
		this.news = news;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Date getDateJoined() {
		return dateJoined;
	}
	public void setDateJoined(Date dateJoined) {
		this.dateJoined = dateJoined;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
    
}

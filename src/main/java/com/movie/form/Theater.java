package com.movie.form;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="Theaters")
public class Theater implements Serializable {
	@Id
	@GeneratedValue
  	private int id;
	@Column(name="placeId")
    private String placeId;
	@Column(name="zipcode")
    private int zipcode;
	@Column(name="address")
    private String address;
	@Column(name="name")
    private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlaceId() {
		return placeId;
	}
	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}

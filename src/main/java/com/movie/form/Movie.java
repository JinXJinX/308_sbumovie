package com.movie.form;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="Movies")
public class Movie implements Serializable {
	@Id
	@GeneratedValue
  	private int id;
	@Column(name="name")
    private String title;
	@Column(name="releaseDate")
    private Date releaseDate;
	@Column(name="length")
    private Integer length;
	@Column(name="synopsis", length=20000)
    private String synopsis;
	@Column(name="fanRating")
    private double fanRating;
	@Column(name="numFanRatings")
    private int numFanRatings;
	@Column(name="imdbId")
    private String imdbId;
    @Column(name="mainImagePath")
    private String mainImagePath;
    @Column(name="trailerPath")
    private String trailerPath;
	@Column(name="language")
    private String language;
    @Column(name="genre")
    private String genre;
    @Column(name="showing")
    private int showing;
    public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int isShowing() {
		return showing;
	}
	public void setShowing(int showing) {
		this.showing = showing;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public Integer getLength() {
		return length;
	}
	public void setLength(Integer length) {
		this.length = length;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public double getFanRating() {
		return fanRating;
	}
	public void setFanRating(Double fanRating) {
		this.fanRating = fanRating;
	}
	public void setFanRating(double fanRating) {
		this.fanRating = fanRating;
	}
	public int getNumFanRatings() {
		return numFanRatings;
	}
	public void setNumFanRatings(int numFanRatings) {
		this.numFanRatings = numFanRatings;
	}
	public String getImdbId() {
		return imdbId;
	}
	public void setImdbId(String imdbId) {
		this.imdbId = imdbId;
	}
	public String getMainImagePath() {
		return mainImagePath;
	}
	public void setMainImagePath(String mainImagePath) {
		this.mainImagePath = mainImagePath;
	}
    public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}

}

package com.movie.dao.api;


import java.util.List;

import com.movie.form.Movie;
import com.movie.form.MovieAlert;
import com.movie.form.MovieLike;
import com.movie.form.TheaterLike;

public interface MovieDao {
	public List<Movie> getMovieByDataTime(String date);
	public List<Movie> getMovieByVisit();
	public List<Movie> getMovieByKeyWord(String keyword);
	public List<Movie> getMovieByKeyWordPage(String keyword,int page,int pageSize);
	public List<Movie> getMovieByGenre(String genre);
	public Movie getMovieById(int id);
	public boolean updateMovie(Movie movie);
	public boolean adddMovie(Movie movie);
	public boolean deleteMovie(Movie movie);
	public boolean addMovieLike(int movieId, int userId);
	public boolean addMovieAlert(int movieId, int userId);
	public boolean addTheaterLike(int theaterId, int userId);
	public MovieLike getMovieLike(int movieId, int userId);
	public MovieAlert getMovieAlert(int movieId, int userId);
	public TheaterLike getTheaterLike(int theaterId, int userId);
	public long getMovieCount(String keyword);
	
}

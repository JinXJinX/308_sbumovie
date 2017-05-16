package com.movie.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.movie.dao.api.MovieDao;
import com.movie.form.Movie;
import com.movie.form.MovieAlert;
import com.movie.form.MovieLike;
import com.movie.form.TheaterLike;

import util.Constant;
@Transactional
@Repository(value = "movieDaoImpl")
public class MovieDaoImpl implements MovieDao{
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	
	public List<Movie> getMovieByDataTime(String date) {
		Session session = sessionFactory.getCurrentSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Query query = null;
		try {
//			query = session.createQuery(
//					"from Movie movie where movie.releaseDate<=:releaseDate order by movie.releaseDate desc").setParameter(
//					"releaseDate", sdf.parse(date)).setMaxResults(30);
			query = session.createQuery("from Movie");
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
//		catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		@SuppressWarnings("unchecked")
		List<Movie> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	
	public List<Movie> getMovieByVisit() {
		return null;
	}

	public boolean updateMovie(Movie movie) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(movie);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}

	public boolean adddMovie(Movie movie) {
		return false;
	}

	public boolean deleteMovie(Movie movie) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.delete(movie);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}

	public Movie getMovieById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Movie movie where movie.id=:id").setParameter("id", id);
		List<Movie> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}

	public List<Movie> getMovieByKeyWord(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Query query = null;
		try {
			query = session.createQuery(
					"from Movie movie where movie.title like :keyword or synopsis like :keyword");
			query.setParameter("keyword", "%"+keyword+"%");
			query.setParameter("keyword", "%"+keyword+"%");
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Movie> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	public List<Movie> getMovieByKeyWordPage(String keyword,int page,int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Query query = null;
		try {
			query = session.createQuery(
					"from Movie movie where movie.title like :keyword or synopsis like :keyword");
			query.setParameter("keyword", "%"+keyword+"%");
			query.setParameter("keyword", "%"+keyword+"%");
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Movie> resultList = query.setFirstResult((page - 1) * pageSize).setMaxResults(pageSize).list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	public List<Movie> getMovieByGenre(String genre) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		try {
			if(genre.equals("upcoming")){
				query = session.createQuery(
						"from Movie movie where movie.showing=:showing").setParameter(
						"showing", Constant.UPCOMING);
			}else if(genre.equals("now")){
				query = session.createQuery(
						"from Movie movie where movie.showing=:showing").setParameter(
						"showing", Constant.SHOWING);
			}else if(genre.equals("box")){
				//TODO
			}else{
				query = session.createQuery(
						"from Movie movie where movie.genre =:genre");
				query.setParameter("genre", genre);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Movie> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	public long getMovieCount(String keyword){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Movie movie where movie.title like :keyword or synopsis like :keyword ");
		query.setParameter("keyword", "%"+keyword+"%");
		query.setParameter("keyword", "%"+keyword+"%");
		return (Long) query.iterate().next();
	}

	public boolean addMovieLike(int movieId, int userId) {
		Session session = sessionFactory.getCurrentSession();
		MovieLike ml = getMovieLike(movieId, userId);
		if(ml == null){
			ml = new MovieLike();
		}else{
			session.delete(ml);//dislike
			return false;
		}
		ml.setMovieId(movieId);
		ml.setUserId(userId);
		System.out.println(movieId + " movieid, " + userId + " userId");
		try {
			session.save(ml);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean addMovieAlert(int movieId, int userId) {
		Session session = sessionFactory.getCurrentSession();
		MovieAlert ma = getMovieAlert(movieId, userId);
		if(ma == null){
			ma = new MovieAlert();
		}else{
			session.delete(ma);//dislike
			return false;
		}
		ma.setMovieId(movieId);
		ma.setUserId(userId);
		System.out.println(movieId + " movieid, " + userId + " userId");
		try {
			session.save(ma);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean addTheaterLike(int theaterId, int userId) {
		Session session = sessionFactory.getCurrentSession();
		TheaterLike tl = getTheaterLike(theaterId, userId);
		if(tl == null){
			tl = new TheaterLike();
		}else{
			session.delete(tl);//dislike
			return false;
		}
		tl.setTheaterId(theaterId);
		tl.setUserId(userId);
		try {
			session.save(tl);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public MovieLike getMovieLike(int movieId, int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from MovieLike movieLike where movieLike.movieId=:movieId and movieLike.userId=:userId");
		query.setParameter("movieId", movieId);
		query.setParameter("userId", userId);
		List<MovieLike> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}

	public MovieAlert getMovieAlert(int movieId, int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from MovieAlert movieAlert where movieAlert.movieId=:movieId and movieAlert.userId=:userId");
		query.setParameter("movieId", movieId);
		query.setParameter("userId", userId);
		List<MovieAlert> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}

	public TheaterLike getTheaterLike(int theaterId, int userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from TheaterLike theaterLike where theaterLike.theaterId=:theaterId and theaterLike.userId=:userId");
		query.setParameter("theaterId", theaterId);
		query.setParameter("userId", userId);
		List<TheaterLike> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}
}

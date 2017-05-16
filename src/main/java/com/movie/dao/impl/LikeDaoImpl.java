package com.movie.dao.impl;

import com.movie.dao.api.LikeDao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.movie.dao.api.MovieDao;
import com.movie.form.Movie;
import com.movie.form.MovieAlert;
import com.movie.form.MovieLike;
import com.movie.form.Review;
import com.movie.form.ReviewLike;
import com.movie.form.TheaterLike;
@Transactional
@Repository(value = "likeDaoImpl")
public class LikeDaoImpl implements LikeDao {
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	
	public boolean likeMovie(int userId, int movieId) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean likeThreater(int userId, int threaterId) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean likeReview(int userId, int reviewId, int status) {
		Session session = sessionFactory.getCurrentSession();
		ReviewLike rl = getReviewLike(userId, reviewId);
		if(rl != null){
			session.delete(rl);
			return false;
		}else{
			rl = new ReviewLike();
			rl.setUserId(userId);
			rl.setReviewId(reviewId);
			rl.setStatus(status);
			try{
				session.save(rl);
			}catch(HibernateException e){
				return false;
			}
	    }
		return true;
	}
	
	public ReviewLike getReviewLike(int userId, int reviewId){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from ReviewLike reviewLike where reviewLike.reviewId=:reviewId and reviewLike.userId=:userId");
		query.setParameter("reviewId", reviewId);
		query.setParameter("userId", userId);
		List<ReviewLike> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}

	public boolean checklikeMovie(int userId, int movieId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from MovieLike movieLike where movieLike.userId=:userId and movieLike.movieId=:movieId");
		query.setParameter("movieId", movieId);
		query.setParameter("userId", userId);
		List<MovieLike> resultList = query.list();
		if (resultList.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	public boolean checklikeThreater(int userId, int theaterId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from TheaterLike theaterLike where theaterLike.userId=:userId and theaterLike.theaterId=:theaterId");
		query.setParameter("theaterId", theaterId);
		query.setParameter("userId", userId);
		List<TheaterLike> resultList = query.list();
		if (resultList.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	public int checklikeReview(int userId, int reviewId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from ReviewLike reviewLike where reviewLike.userId=:userId and reviewLike.reviewId=:reviewId");
		query.setParameter("reviewId", reviewId);
		query.setParameter("userId", userId);
		List<ReviewLike> resultList = query.list();
		if (resultList.isEmpty()) {
			return 0;
		} else {
			return resultList.get(0).getStatus();
		}
	}

	public boolean checkalertMovie(int userId, int movieId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from MovieAlert movieAlert where movieAlert.userId=:userId and movieAlert.movieId=:movieId");
		query.setParameter("movieId", movieId);
		query.setParameter("userId", userId);
		List<MovieAlert> resultList = query.list();
		if (resultList.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	public int checklikeReviewS(String userIdS, String reviewIdS) {
		int userId = Integer.parseInt(userIdS);
		int reviewId = Integer.parseInt(reviewIdS);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from ReviewLike reviewLike where reviewLike.userId=:userId and reviewLike.reviewId=:reviewId");
		query.setParameter("reviewId", reviewId);
		query.setParameter("userId", userId);
		List<ReviewLike> resultList = query.list();
		if (resultList.isEmpty()) {
			return 0;
		} else {
			return resultList.get(0).getStatus();
		}
	}

}

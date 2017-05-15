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
import com.movie.form.Review;
import com.movie.form.ReviewLike;
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

	public boolean likeReview(ReviewLike reviewlike) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.save(reviewlike);
		}catch(HibernateException e){
			return false;
		}
		return true;
	}

}

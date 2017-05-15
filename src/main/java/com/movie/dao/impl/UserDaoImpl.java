package com.movie.dao.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import util.Constant;

import com.movie.dao.api.UserDao;
import com.movie.form.Actor;
import com.movie.form.Giftcard;
import com.movie.form.Movie;
import com.movie.form.Support;
import com.movie.form.Theater;
import com.movie.form.User;

@Transactional
@Repository(value = "userDaoImpl")
public class UserDaoImpl implements UserDao {

	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;

	public User getUserByUserName(String userName,String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(
				"from User user where user.username=:username and user.password =:password");
		query.setParameter("username", userName);
		query.setParameter("password", password);
		@SuppressWarnings("unchecked")
		List<User> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}
	public User getUserByEmail(String email,String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(
				"from User user where user.email=:email and user.password =:password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		@SuppressWarnings("unchecked")
		List<User> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}

	public int saveUser(User user) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(user);
		} catch (Exception e) {
			return Constant.FAIL;
		}
		return Constant.SUCCESS;
	}
	
	public User getUserByUserId(long userId) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class, userId);
		return user;
	}

	public int updateUser(User user) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(user);
			return Constant.SUCCESS;
		} catch (Exception e) {
			return Constant.FAIL;
		}
	}

	public List<User> getAllUser() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(
				"from User user");
		@SuppressWarnings("unchecked")
		List<User> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	
	public boolean submitSupport(Support support){
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(support);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public boolean saveGiftcard(Giftcard giftcard){
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(giftcard);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public boolean updateGiftcard(Giftcard giftcard){
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(giftcard);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public Giftcard getGiftcard(int cardId){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(
				"from Giftcard giftcard where giftcard.cardId=:cardId");
		query.setParameter("cardId", cardId);
		@SuppressWarnings("unchecked")
		List<Giftcard> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}
	
	public Theater getTheater(int theaterId){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(
				"from Theater theater where theater.id=:theaterId");
		query.setParameter("theaterId", theaterId);
		@SuppressWarnings("unchecked")
		List<Theater> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}
	
	public List<Theater> getAllTheater() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(
				"from Theater theater");
		@SuppressWarnings("unchecked")
		List<Theater> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	
	public List<Theater> getTheaterByKey(String keyword){
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		try {
			query = session.createQuery(
					"from Theater theater where theater.address like :keyword or theater.zipcode like :keyword");
			query.setParameter("keyword", "%"+keyword+"%");
			query.setParameter("keyword", "%"+keyword+"%");
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Theater> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
}

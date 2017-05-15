package com.movie.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.dao.api.LikeDao;
import com.movie.dao.api.MovieDao;
import com.movie.dao.api.ReviewDao;
import com.movie.dao.api.UserDao;
import com.movie.dao.impl.UserDaoImpl;
import com.movie.form.Movie;
import com.movie.form.Review;
import com.movie.form.ReviewLike;
import com.movie.form.User;
import util.Constant;

@Controller
//@RequestMapping
public class UserController {
	
	@Resource(name = "userDaoImpl")
	UserDao userDao;
	@Resource(name="movieDaoImpl")
	MovieDao movieDao;
	@Resource(name="likeDaoImpl")
	LikeDao likeDao;
	@Resource(name="reviewDaoImpl")
	ReviewDao reviewDao;
	@RequestMapping(value="login.do",method={RequestMethod.POST,RequestMethod.GET})
	public String loginView(HttpServletRequest request, HttpServletResponse response) {
		return "profile";
	}
	@RequestMapping(value="logout.do",method={RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("user");
		return "redirect:index.do";
	}
	@RequestMapping(value="reviewlike.do",method={RequestMethod.POST,RequestMethod.GET})
	public String reviewlike(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if( request.getSession().getAttribute("user") == null){
			return "profile";
		}
		int userId = (int) ((User) request.getSession().getAttribute("user")).getId();
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		int status = Integer.parseInt(request.getParameter("status"));
		System.out.println(status);
		ReviewLike reviewlike = new ReviewLike();
		reviewlike.setUserId(userId);
		reviewlike.setReviewId(reviewId);
		reviewlike.setStatus(status);
		boolean r = likeDao.likeReview(reviewlike);
		Review review = reviewDao.getReviewById(reviewId);
		review.setNumLike(review.getNumLike() + status);
		reviewDao.updateReview(review);
		return "redirect:movieDetail.do?movieId="+review.getMovieId();
	}
	
	@RequestMapping(value="index.do")
	public String indexAction(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(System.currentTimeMillis());
		calendar.setTime(date);
		calendar.add(Calendar.YEAR, -1);
		date = calendar.getTime();
		List<Movie> movies = movieDao.getMovieByDataTime(sdf.format(date));
		request.setAttribute("movies", movies);
		return "index";
	}
	@RequestMapping(value="loginAction.do")
	public String loginAction(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(username+password);
		User user = userDao.getUserByUserName(username, password);
		request.getSession().setAttribute("user", user);
		if(user==null){
			request.setAttribute("info", "用户名或密码错误");
			return "profile";
		}else if(user.getType()==Constant.USER){//表示普通用户
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
	        Date date = new Date(System.currentTimeMillis());
	        calendar.setTime(date);
	        calendar.add(Calendar.YEAR, -1);
	        date = calendar.getTime();
			List<Movie> movies = movieDao.getMovieByDataTime(sdf.format(date));
			request.setAttribute("movies", movies);
			return "index";
		}else if(user.getType()==Constant.ADMIN){//表示管理员
			//List<Movie> movies = movieDao.getMovieByKeyWord("");
			List<User> users = userDao.getAllUser();
			request.setAttribute("users", users);
			return "controll";
		}
		return "profile";
	}
	@RequestMapping(value="register.do")
	public String register(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String email = request.getParameter("Email");
		String userName = request.getParameter("userid");
		String password = request.getParameter("password");
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setDateJoined(new Date());
		user.setUsername(userName);
		user.setFname(request.getParameter("firstName"));
		user.setLname(request.getParameter("lastName"));
		user.setZipcode(request.getParameter("zipcode"));
		user.setType(Constant.USER);
		userDao.saveUser(user);
		return "register";
	}

	@RequestMapping(value="search.do")
	public String search(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String query = request.getParameter("query").trim();
		System.out.println(query+" // ");
		List<Movie> movies = movieDao.getMovieByKeyWord(query);
		request.setAttribute("movies", movies);
		request.setAttribute("query", query);
		return "search";
	}
}

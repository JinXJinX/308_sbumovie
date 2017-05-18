package com.movie.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.alibaba.fastjson.JSONArray;

import com.movie.dao.api.LikeDao;
import com.movie.dao.api.MovieDao;
import com.movie.dao.api.ReviewDao;
import com.movie.dao.api.UserDao;
import com.movie.dao.impl.UserDaoImpl;
import com.movie.form.Actor;
import com.movie.form.Article;
import com.movie.form.Giftcard;
import com.movie.form.Movie;
import com.movie.form.MovieAlert;
import com.movie.form.Performs;
import com.movie.form.Review;
import com.movie.form.ReviewLike;
import com.movie.form.Support;
import com.movie.form.Theater;
import com.movie.form.User;
import util.Constant;
import util.Email;

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

	@RequestMapping(value="index.do")
	public String indexAction(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(System.currentTimeMillis());
		calendar.setTime(date);
		calendar.add(Calendar.YEAR, -1);
		date = calendar.getTime();
		List<Movie> movies = movieDao.getMovieByDataTime(sdf.format(date));
		List<Article> articles = userDao.getArticles();
		request.setAttribute("movies", movies);
		request.getSession().setAttribute("articles", articles);
		return "index";
	}
	@RequestMapping(value="loginAction.do")
	public String loginAction(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		// System.out.println(username+password);
		User user = userDao.getUserByUserName(username, password);
		if(user == null){
			user = userDao.getUserByEmail(username, password);
		}
		request.getSession().setAttribute("user", user);
		if(user==null){
			request.setAttribute("info", "Wrong!");
			return "profile";
		}else {
			request.getSession().setAttribute("user", user);
			return "redirect:index.do";
		}
		return "profile";
	}
	@RequestMapping(value="register.do")
	public String register(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		User user;
		boolean newUser = false;
		user = (User) request.getSession().getAttribute("user");
		if(user==null){
			user = new User();
			newUser = true;
		}
		String email = request.getParameter("Email");
		String userName = request.getParameter("userid");
		String password = request.getParameter("password");
		user.setEmail(email);
		user.setPassword(password);
		user.setDateJoined(new Date());
		user.setUsername(userName);
		user.setFname(request.getParameter("firstName"));
		user.setLname(request.getParameter("lastName"));
		user.setZipcode(request.getParameter("zipcode"));
		if(request.getParameter("newsletter") != null){
			user.setNews(true);
		}else{
			user.setNews(false);
		}
//		user.setType(Constant.USER);
		if(newUser){
			userDao.saveUser(user);
		}else{
			userDao.updateUser(user);
		}
		request.getSession().setAttribute("user", user);
		return "redirect:index.do";
	}

	@RequestMapping(value="search.do")
	public String search(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String query = request.getParameter("query").trim();
		// System.out.println(query+" // ");
		List<Movie> movies = movieDao.getMovieByKeyWord(query);
		List<Theater> theater = userDao.getTheaterByKey(query);
		request.setAttribute("movies", movies);
		request.setAttribute("query", query);
		request.setAttribute("theater", theater);
		return "search";
	}

	@RequestMapping(value="searchTheater.do")
	public String searchTheater(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		List<Theater> theater = userDao.getAllTheater();
		request.setAttribute("theater", theater);
		request.setAttribute("query", "All Theater");
		return "search";
	}

	@RequestMapping(value="searchGenre.do")
	public String searchGenre(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String genre = request.getParameter("genre").trim();
		System.out.println(genre+" // ");
		List<Movie> movies = movieDao.getMovieByGenre(genre);
		request.setAttribute("movies", movies);
		request.setAttribute("query", genre);
		return "search";
	}

	@RequestMapping(value="controll.do")
	public String controll(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		List<User> users = userDao.getAllUser();
		request.setAttribute("users", users);
		return "controll";
	}

	@RequestMapping(value="support.do")
	public String support(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String email = request.getParameter("email");
		String question = request.getParameter("question");
		Support support = new Support();
		support.setEmail(email);
		support.setQuestion(question);
		System.out.println("get question:" + question + " email: " + email);
		userDao.submitSupport(support);
		return "supportResult";
	}

	@RequestMapping(value="giftcard.do")
	public String giftcard(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		User buyer = (User) request.getSession().getAttribute("user");
		String email = request.getParameter("email").trim();
		String message = request.getParameter("message");
		int amount = Integer.parseInt(request.getParameter("amount"));
		Random rnd = new Random();
		int n = 100000 + rnd.nextInt(900000); // 6 digit
		Giftcard gc = new Giftcard();
		gc.setAmount(amount);
		if(buyer != null){
			gc.setBuyerId(buyer.getId());
		}else{
			gc.setBuyerId(1);
		}
		gc.setUsed(false);
		gc.setCardId(n);
		userDao.saveGiftcard(gc);
		//send card message to receiver email
		Email myEmail = new Email();
		String subject = Constant.GIFTCARD_SUBJECT;
		String text = Constant.GIFTCARD_TEXT
				.replace("XintX", ""+gc.getCardId())
				.replace("XmoneyX", ""+gc.getAmount())
				.replace("XheX", buyer.getEmail())
				.replace("XmsgX", message);
		myEmail.sentEmail(email, subject,text);
//		System.out.println("gift id is: " + n);
		return "giftcardResult";
	}

	@RequestMapping(value="redeemGiftcard.do")
	public String redeemGiftcard(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		int card = 0;
		try{
			card = Integer.parseInt(request.getParameter("card"));
		}catch(Exception e){

		}
		Giftcard gc = userDao.getGiftcard(card);
		if(gc == null || gc.isUsed() == true){
			return "register";
		}
		user.setMoney(user.getMoney() + gc.getAmount());
		userDao.updateUser(user);
		gc.setUsed(true);
		userDao.updateGiftcard(gc);
		return "register";
	}

	@RequestMapping(value="theater.do")
	public String theater(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int theaterId = Integer.parseInt(request.getParameter("theaterId"));
		Theater theater = userDao.getTheater(theaterId);
		User user = (User) request.getSession().getAttribute("user");
		boolean like = false;
		if(user != null){
			like = likeDao.checklikeThreater(user.getId(), theaterId);
		}
		request.setAttribute("like", like);
		request.setAttribute("theater", theater);
		return "theater";
	}

	@RequestMapping(value="testAjax.do")
	public void testAjax(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int actorId = Integer.parseInt(request.getParameter("actorId"));
		System.out.println("actorId"+actorId);
		result.put("statue", "success");
		response.getWriter().write(result.toString());
	}

	@RequestMapping(value="news.do")
	public void news(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String content = request.getParameter("content");
		User user = (User) request.getSession().getAttribute("user");
		Email email = new Email();
		if(user == null){
			System.out.println("return success");
			result.put("statue", "login");
		}else{
			List<User> users = userDao.getNewsUser();
			String subject = Constant.NEWS_SUBJECT;
			String text = content;
			for(User u :users){
				email.sentEmail(u.getEmail(), subject,text);
			}
		}
		result.put("statue", "success");
		response.getWriter().write(result.toString());
	}
	@RequestMapping(value="getSupport.do")
	public String getSupport(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		List<Support> supports = userDao.getSupports();
		request.setAttribute("supports", supports);
		return "viewSupport";
	}
}

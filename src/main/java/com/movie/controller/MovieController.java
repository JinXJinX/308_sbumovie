package com.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.movie.dao.api.ActorDao;
import com.movie.dao.api.LikeDao;
import com.movie.dao.api.MovieDao;
import com.movie.dao.api.PerformDao;
import com.movie.dao.api.ReviewDao;
import com.movie.dao.api.UserDao;
import com.movie.form.Actor;
import com.movie.form.Movie;
import com.movie.form.MovieAlert;
import com.movie.form.Performs;
import com.movie.form.Review;
import com.movie.form.User;

import util.Constant;
import util.Email;

@Controller
public class MovieController {
	@Resource(name="movieDaoImpl")
	MovieDao movieDao;
	@Resource(name="performDaoImpl")
	PerformDao performDao;
	@Resource(name="actorDaoImpl")
	ActorDao actorDao;
	@Resource(name="reviewDaoImpl")
	ReviewDao reviewDao;
	@Resource(name="userDaoImpl")
	UserDao userDao;
	@Resource(name="likeDaoImpl")
	LikeDao likeDao;
	@RequestMapping(value="movieDetail.do")
	public String movieDetail(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		Movie movie = movieDao.getMovieById(movieId);
		request.setAttribute("movie", movie);
		List<Performs> performs = performDao.getPerformByMoiveId(movieId);
		List<Actor> actors = new ArrayList<Actor>();
		List<Review> reviews = reviewDao.getReviewByMovieId(movieId);
		if(performs!=null){
			for(Performs p:performs){
				actors.add(actorDao.getActorById(p.getActorId()));
			}
		}
		boolean like, alert;
		int status = 0;
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			like = false;
			alert = false;
		}else{
			like = likeDao.checklikeMovie(user.getId(), movieId);
			alert = likeDao.checkalertMovie(user.getId(), movieId);
			if(reviews != null){
				status = likeDao.checklikeReview(user.getId(), reviews.get(0).getId());
			}
		}
		request.setAttribute("actors", actors);
		request.setAttribute("reviews", reviews);
		request.setAttribute("like", like);
		request.setAttribute("alert", alert);
		request.setAttribute("s", status);
		return "movie";
	}
	@RequestMapping(value="deleteMovie.do")
	public void allMoviePaging(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		System.out.println("movieId"+movieId);
		//级联删除
		Movie m = new Movie();
		m.setId(movieId);
		List<Performs> performs = performDao.getPerformByMoiveId(movieId);
		List<Review> reviews = reviewDao.getReviewByMovieId(movieId);
		if(performs!=null){
			for(Performs p:performs){
				performDao.deletePerform(p);
			}
		}
		if(reviews!=null){
			for(Review r:reviews){
				reviewDao.deleteReview(r);
			}
		}
		if(movieDao.deleteMovie(m)){
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		response.getWriter().write(result.toString());
	}
	@RequestMapping(value="movieUpdatePre.do")
	public String movieUpdatePre(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		Movie movie = movieDao.getMovieById(movieId);
		request.setAttribute("movie", movie);
		return "movieUpdate";
	}
	@RequestMapping(value="movieUpdate.do")
	public String movieUpdate(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String title = request.getParameter("title");
		String length = request.getParameter("length");
		String synopsis = request.getParameter("synopsis");
		String imagePath = request.getParameter("imagePath");
		String trailerPath = request.getParameter("trailerPath");	
		Movie movie = movieDao.getMovieById(movieId);
		movie.setTitle(title);
		movie.setLength(Integer.parseInt(length));
		movie.setSynopsis(synopsis);
		movie.setMainImagePath(imagePath);
		movie.setTrailerPath(trailerPath);
		if(movieDao.updateMovie(movie)){
			request.setAttribute("statue", "success");
		}else{
			request.setAttribute("statue", "fail");
		}
		return "movieUpdateResult";
	}
	
	@RequestMapping(value="movieLike.do")
	public void movieLike(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			System.out.println("return success");
			result.put("statue", "login");
		}else if(movieDao.addMovieLike(movieId, user.getId())){
			System.out.println("return success");
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value="movieAlert.do")
	public void movieAlert(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			System.out.println("return success");
			result.put("statue", "login");
		}else if(movieDao.addMovieAlert(movieId, user.getId())){
			System.out.println("return success");
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value="sentAlert.do")
	public void sentAlert(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		User user = (User) request.getSession().getAttribute("user");
		Email email = new Email();
		if(user == null){
			System.out.println("return success");
			result.put("statue", "login");
		}else{
			List<MovieAlert> mas = userDao.getAlertUser(movieId);
			Movie movie = movieDao.getMovieById(movieId);
			String subject = Constant.ALERT_SUBJECT.replace("XnameX", movie.getTitle());
			String text = Constant.ALERT_TEXT.replace("XnameX",  movie.getTitle()).replace("XidX", ""+movieId);
			for(MovieAlert ma :mas){
				User tmp = userDao.getUserByUserId(ma.getUserId());
				email.sentEmail(tmp.getEmail(), subject,text);
			}
		}
		result.put("statue", "success");
		response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value="theaterLike.do")
	public void theaterLike(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int theaterId = Integer.parseInt(request.getParameter("theaterId"));
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			System.out.println("return success");
			result.put("statue", "login");
		}else if(movieDao.addTheaterLike(theaterId, user.getId())){
			System.out.println("return success");
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		response.getWriter().write(result.toString());
	}
}

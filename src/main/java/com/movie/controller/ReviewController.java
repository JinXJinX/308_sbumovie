package com.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.movie.dao.api.ActorDao;
import com.movie.dao.api.LikeDao;
import com.movie.dao.api.MovieDao;
import com.movie.dao.api.PerformDao;
import com.movie.dao.api.ReviewDao;
import com.movie.form.Actor;
import com.movie.form.Movie;
import com.movie.form.Performs;
import com.movie.form.Review;
import com.movie.form.ReviewLike;
import com.movie.form.User;

@Controller
public class ReviewController {
	@Resource(name="actorDaoImpl")
	ActorDao actorDao;
	@Resource(name="movieDaoImpl")
	MovieDao movieDao;
	@Resource(name="performDaoImpl")
	PerformDao performDao;
	@Resource(name="reviewDaoImpl")
	ReviewDao reviewDao;
	@Resource(name="likeDaoImpl")
	LikeDao likeDao;
	
	@RequestMapping(value="addReview.do")
	public String addReview(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			return "redirect:login.do";
		}
		System.out.println("***"+request.getParameter("userId"));
		System.out.println(request.getParameter("movieId"));
		int userId = Integer.parseInt(request.getParameter("userId")==null||request.getParameter("userId").equals("")?"1":request.getParameter("userId"));
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		Review review = new Review();
		review.setMovieId(movieId);
		review.setUserId(userId);
		review.setContent(content);
		review.setTitle(title);
		review.setTime(new Date());
		review.setNumLike(0);
		if(reviewDao.addReview(review)){
			request.setAttribute("statue", "success");
		}else{
			request.setAttribute("statue", "error");
		}
		return "redirect:movieDetail.do?movieId="+movieId;
	}
	
	@RequestMapping(value="allReviewPaging.do")
	public void allReviewPaging(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		System.out.println(page+" "+pageSize);
		JSONArray arr = new JSONArray();
		List<Review> reviews = reviewDao.getReviewByKeyWordPage("", page, pageSize);
		for(Review r:reviews){
			arr.add(r);
		}
		result.put("info2", arr);
		result.put("currentpage", page);
		result.put("totalpage", Math.ceil(reviewDao.getReviewCount("")/pageSize));
		response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value="deleteR.do")
	public String deleteR(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		Review review = reviewDao.getReviewById(reviewId);
		int movieId = review.getMovieId();
		reviewDao.deleteReview(review);
		return "redirect:movieDetail.do?movieId="+movieId;
	}
	
	@RequestMapping(value="deleteReview.do")
	public void deleteReview(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		System.out.println("reviewId"+reviewId);
		Review review = new Review();
		review.setId(reviewId);
		if(reviewDao.deleteReview(review)){
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value="reviewLike.do",method={RequestMethod.POST,RequestMethod.GET})
	public void reviewlike(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		int status = Integer.parseInt(request.getParameter("status"));
		System.out.println("get reivew Id " + reviewId + "   status:" + status);
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			result.put("statue", "login");
		}else if(likeDao.likeReview(user.getId(), reviewId, status)){
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		Review review = reviewDao.getReviewById(reviewId);
		review.setNumLike(review.getNumLike() + status);
		reviewDao.updateReview(review);
		response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value="reviewUpdatePre.do")
	public String reviewUpdatePre(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		Review review = reviewDao.getReviewById(reviewId);
		request.setAttribute("review", review);
		return "reviewUpdate";
	}
	@RequestMapping(value="reviewUpdate.do")
	public String reviewUpdate(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		Review review = reviewDao.getReviewById(reviewId);
		review.setContent(request.getParameter("content"));
		review.setTitle(request.getParameter("title"));
		review.setTime(new Date());
		if(reviewDao.updateReview(review)){
			request.setAttribute("statue", "success");
		}else{
			request.setAttribute("statue", "fail");
		}
		return "reviewUpdateResult";
	}
}

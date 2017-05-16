package com.movie.dao.api;

import com.movie.form.ReviewLike;

public interface LikeDao {
	public boolean likeMovie(int userId, int movieId);
	public boolean checklikeMovie(int userId, int movieId);
	public boolean checkalertMovie(int userId, int movieId);
	public boolean likeThreater(int userId, int theaterId);
	public boolean checklikeThreater(int userId, int theaterId);
	public boolean likeReview(int userId, int reviewId, int status);
	public int checklikeReview(int userId, int reviewId);
	public int checklikeReviewS(String userIdS, String reviewIdS);
	public ReviewLike getReviewLike(int userId, int reviewId);
}

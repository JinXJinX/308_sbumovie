package com.movie.dao.api;

import com.movie.form.ReviewLike;

public interface LikeDao {
	public boolean likeMovie(int userId, int movieId);
	public boolean likeThreater(int userId, int threaterId);
	public boolean likeReview(ReviewLike reviewlike);
}

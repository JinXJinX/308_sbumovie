package com.movie.dao.api;

import java.util.List;

import com.movie.form.Giftcard;
import com.movie.form.Support;
import com.movie.form.User;

public interface UserDao {
	public User getUserByUserName(String userName,String password);
	public User getUserByEmail(String email,String password);
	public List<User> getAllUser();
	public User getUserByUserId(long userId);
	public boolean submitSupport(Support support);
	public boolean updateGiftcard(Giftcard giftcard);
	public boolean saveGiftcard(Giftcard giftcard);
	public Giftcard getGiftcard(int cardId);
	public int saveUser(User user);

	public int updateUser(User user);
}

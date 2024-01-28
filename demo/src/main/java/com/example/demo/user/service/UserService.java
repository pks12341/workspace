package com.example.demo.user.service;

import java.util.List;

public interface UserService {
	public UserVO getUser(String mid);
	public List<UserVO> getUserList();
}

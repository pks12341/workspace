package com.example.demo.user.mapper;


import java.util.List;

import com.example.demo.user.service.UserVO;

public interface UserMapper {
	public UserVO getUser(String mid);
	public List<UserVO> getUserList();
}

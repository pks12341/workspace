package com.example.demo.user.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.user.mapper.UserMapper;
import com.example.demo.user.service.UserDetailVO;
import com.example.demo.user.service.UserService;
import com.example.demo.user.service.UserVO;


@Service
public class UserServiceImpl implements UserService,UserDetailsService{

	@Autowired
	UserMapper userMapper;
	
	@Override
	public UserVO getUser(String mid) {
		return userMapper.getUser(mid);
	}

	@Override
	public List<UserVO> getUserList() {
		return null;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO vo = userMapper.getUser(username);
		if(vo==null) {
			throw new UsernameNotFoundException("no name");
		}
		return new UserDetailVO(vo);
	}

}

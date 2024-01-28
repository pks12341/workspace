package com.example.demo.user.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class UserDetailVO implements UserDetails {
	
	final UserVO userVO;
//	public UserDetailVO() {}
//	
//	public UserDetailVO(UserVO userVO) {
//		this.userVO = userVO;
//	}
//	
//	public void setUserVO(UserVO userVO) {
//		this.userVO = userVO;
//	}

	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> list = new ArrayList<>();
		list.add(new SimpleGrantedAuthority(userVO.getResponsibility()));
		return list;
	}

	@Override
	public String getPassword() {
		return userVO.getPass();
	}

	@Override
	public String getUsername() {
		return userVO.getMid();
	}

	@Override	//탈퇴한 회원 제한
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override	//일정기간 제한
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
}

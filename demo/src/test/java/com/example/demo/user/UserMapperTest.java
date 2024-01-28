package com.example.demo.user;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.user.mapper.UserMapper;
import com.example.demo.user.service.UserVO;


@SpringBootTest
public class UserMapperTest {
	
	@Autowired
	UserMapper userMapper;
	
	@Test
	public void 회원정보() {
		String id = "M001";
		UserVO vo = userMapper.getUser(id);
		System.out.println(vo);
		assertThat(vo.getMid()).isEqualTo(id);
	}

	@Test
	public void list() {
		List<UserVO> list = userMapper.getUserList();
		System.out.println(list);
		assertThat(list.isEmpty()).isEqualTo(false);
	}
}
package com.test.user;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.world.gecko.domain.UserVo;
import com.world.gecko.mapper.UserMapper;
import com.world.gecko.service.UserService;

import lombok.Setter;

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class UserSelectTest {

	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

	@Test
	public void get_user_test() {
		// given
		String id = "admin";

		// when
		UserVo savedUser = userMapper.getUserById(id);
		
		// then
		assertNotNull(savedUser);
		
	}
	
	@Test
	public void user_null() {
		// given
		String user_id = "xxxxxx";
//		UserVo expectedUser = new UserVo();
//		expectedUser.setUser_id(user_id);
		
		// when
		UserVo savedUser = userMapper.getUserById(user_id);
		
		// then
		assertNull(savedUser);
	}
}

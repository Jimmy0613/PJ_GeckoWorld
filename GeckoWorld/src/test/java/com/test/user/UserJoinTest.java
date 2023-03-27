package com.test.user;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.world.gecko.domain.UserVo;
import com.world.gecko.service.UserService;

import lombok.Setter;

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class UserJoinTest {

	@Setter(onMethod_ = @Autowired)
	private UserService userService;

	@Test
	public void user_id_success() {
		// given
		// id 조건 만족한거
		UserVo input1 = new UserVo("abc123","aA1~!@#$%^&*","name","normal","guest");
		
		// when
		userService.userJoin(input1);

		// then
		assertTrue(userService.userJoin(input1));
	}

	@Test
	public void user_id_fail() {
		// given
		// 소문자 없으면 안됨
		UserVo input1 = new UserVo("12345", "aA1~!@#$%^&*", "name", "normal", "guest");
		// 숫자 없으면 안됨
		UserVo input2 = new UserVo("abcde", "aA1~!@#$%^&*", "name", "normal", "guest");
		// 대문자 있으면 안됨
		UserVo input3 = new UserVo("abcdA", "aA1~!@#$%^&*", "name", "normal", "guest");
		// 특수문자 있으면 안됨
		UserVo input4 = new UserVo("a1~`@.", "aA1~!@#$%^&*", "name", "normal", "guest");
		// 글자수 5글자 미만이면 안됨
		UserVo input5 = new UserVo("ab12", "aA1~!@#$%^&*", "name", "normal", "guest");
		// 글자수 12글자 초과면 안됨
		UserVo input6 = new UserVo("abcdef123456", "aA1~!@#$%^&*", "name", "normal", "guest");

		// when
		userService.userJoin(input1);
		userService.userJoin(input2);
		userService.userJoin(input3);
		userService.userJoin(input4);
		userService.userJoin(input5);
		userService.userJoin(input6);
		
		// then
		assertNull(userService.getUserById(input1.getUser_id()));
		assertNull(userService.getUserById(input2.getUser_id()));
		assertNull(userService.getUserById(input3.getUser_id()));
		assertNull(userService.getUserById(input4.getUser_id()));
		assertNull(userService.getUserById(input5.getUser_id()));
		assertNull(userService.getUserById(input6.getUser_id()));
	}
}

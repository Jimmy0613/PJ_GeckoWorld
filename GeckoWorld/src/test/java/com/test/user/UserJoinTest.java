package com.test.user;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.world.gecko.domain.User;
import com.world.gecko.service.UserService;

import lombok.Setter;

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class UserJoinTest {

	@Setter(onMethod_ = @Autowired)
	private UserService userService;

	@Test
	public void user_join_success() {
		// given
		// 모든 조건 만족한거
		User input = new User("abc123","name", "aA1~!@#$%^&*","normal","guest");
		
		// when
		userService.userJoin(input);

		// then
		assertNotNull(input);
	}

	@Test
	public void user_id_fail() {
		// given
		// 소문자 없으면 안됨
		User input1 = new User("12345", "name", "aA1~!@#$%^&*", "normal", "guest");
		// 숫자 없으면 안됨
		User input2 = new User("abcde", "name", "aA1~!@#$%^&*", "normal", "guest");
		// 대문자 있으면 안됨
		User input3 = new User("abcdA", "name", "aA1~!@#$%^&*", "normal", "guest");
		// 특수문자 있으면 안됨
		User input4 = new User("a1~`@.", "name", "aA1~!@#$%^&*", "normal", "guest");
		// 글자수 5글자 미만이면 안됨
		User input5 = new User("ab12", "name", "aA1~!@#$%^&*", "normal", "guest");
		// 글자수 12글자 초과면 안됨
		User input6 = new User("abcdef1234567", "name", "aA1~!@#$%^&*", "normal", "guest");

		// when
		userService.userJoin(input1);
		userService.userJoin(input2);
		userService.userJoin(input3);
		userService.userJoin(input4);
		userService.userJoin(input5);
		userService.userJoin(input6);
		
		// then
		assertNull(userService.getUserById(input1.getId()));
		assertNull(userService.getUserById(input2.getId()));
		assertNull(userService.getUserById(input3.getId()));
		assertNull(userService.getUserById(input4.getId()));
		assertNull(userService.getUserById(input5.getId()));
		assertNull(userService.getUserById(input6.getId()));
	}
}

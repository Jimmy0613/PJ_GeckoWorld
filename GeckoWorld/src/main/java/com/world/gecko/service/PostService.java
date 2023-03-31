package com.world.gecko.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.PageVo;
import com.world.gecko.domain.Post;
import com.world.gecko.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository repo;

	public Post getPost(int num) {
		Post post = repo.findByNum(num);
		return post;
	}

	public void newPost(Post post) {
		repo.save(post);
	}

	public Map<String, Object> getList(int currentPage) {
		Map<String, Object> map = new HashMap<>();
		PageRequest pr = PageRequest.of(currentPage - 1, 7, Sort.by(Sort.Direction.DESC, "num"));
		Page<Post> page = repo.findAll(pr);
		int number = page.getNumber(); //0부터 시작
		int totalPage = page.getTotalPages();
		List<Post> list = page.getContent();
		map.put("postList", list);
		map.put("totalPage", totalPage);
		return map;
	}
}


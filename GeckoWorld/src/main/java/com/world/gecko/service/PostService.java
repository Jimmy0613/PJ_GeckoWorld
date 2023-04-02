package com.world.gecko.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.Post;
import com.world.gecko.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository repo;

	public Post getPostByPnum(int pnum) {
		Post post = repo.findByPnum(pnum);
		post.setView_count(post.getView_count() + 1);
		repo.save(post);
		return post;
	}

	public void newPost(Post post) {
		if(post.getPnum()!=0) {
			Post qPost = repo.findByPnum(post.getPnum());
			qPost.setResponse_count(qPost.getResponse_count()+1);
			repo.save(qPost);
		}
		repo.save(post);
	}

	public Map<String, Object> getList(int currentPage) {
		Map<String, Object> map = new HashMap<>();
		PageRequest pr = PageRequest.of(currentPage - 1, 7, Sort.by(Sort.Direction.DESC, "pnum"));
		Page<Post> page = repo.findAll(pr);
		List<Post> list = page.getContent();
		int totalPage = page.getTotalPages();
		map.put("postList", list);
		map.put("totalPage", totalPage);
		return map;
	}
}

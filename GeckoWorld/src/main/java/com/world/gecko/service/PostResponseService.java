package com.world.gecko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.Post;
import com.world.gecko.domain.PostResponse;
import com.world.gecko.repository.PostRepository;
import com.world.gecko.repository.PostResponseRepository;

@Service
public class PostResponseService {

	@Autowired
	private PostResponseRepository repo;
	
	@Autowired
	private PostRepository repoPost;
	
	public List<PostResponse> findListByPnum(int pnum) {
		return repo.findListByPnum(pnum);
	}

	public void newResponse(PostResponse response) {
		Post post = repoPost.findByPnum(response.getPnum());
		post.setResponse_count(post.getResponse_count()+1);
		repoPost.save(post);
		repo.save(response);
	}

	public void like(int rnum) {
		PostResponse response = repo.findByRnum(rnum);
		response.setLike_count(response.getLike_count() + 1);
		repo.save(response);
	}
}

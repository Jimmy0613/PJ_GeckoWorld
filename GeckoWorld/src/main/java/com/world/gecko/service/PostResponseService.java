package com.world.gecko.service;

import java.util.List;
import java.util.Optional;

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

	public PostResponse findByRnum(int rnum) {
		return repo.findByRnum(rnum);
	}

	public void editResponse(PostResponse edit) {
		Optional<PostResponse> res = Optional.ofNullable(repo.findByRnum(edit.getRnum()));
		if(res.isPresent()) {
			PostResponse response = res.get();
			response.setTitle(edit.getTitle());
			response.setContent(edit.getContent());
			repo.save(response);
		}
	}
	public void deleteResponse(int rnum) {
		Optional<PostResponse> res = Optional.ofNullable(repo.findByRnum(rnum));
		if (res.isPresent()) {
			Post post = repoPost.findByPnum(res.get().getPnum());
			post.setResponse_count(post.getResponse_count() - 1);
			repoPost.save(post);
			repo.delete(res.get());
		}
	}

	public void newResponse(PostResponse response) {
		Post post = repoPost.findByPnum(response.getPnum());
		post.setResponse_count(post.getResponse_count() + 1);
		repoPost.save(post);
		repo.save(response);
	}

	public void like(int rnum) {
		PostResponse response = repo.findByRnum(rnum);
		response.setLike_count(response.getLike_count() + 1);
		repo.save(response);
	}
}

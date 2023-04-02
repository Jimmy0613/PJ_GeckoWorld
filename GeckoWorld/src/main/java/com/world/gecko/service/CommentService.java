package com.world.gecko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.Comment;
import com.world.gecko.domain.Post;
import com.world.gecko.repository.CommentRepository;
import com.world.gecko.repository.PostRepository;

@Service
public class CommentService {

	@Autowired
	private CommentRepository repo;

	@Autowired
	private PostRepository repoPost;

	public List<Comment> getList(int pnum) {
		return repo.findListByPnum(pnum);
	}

	public void newComment(Comment comment) {
		Post post = repoPost.findByPnum(comment.getPnum());
		post.setComment_count(post.getComment_count() + 1);
		repoPost.save(post);
		repo.save(comment);
	}
}

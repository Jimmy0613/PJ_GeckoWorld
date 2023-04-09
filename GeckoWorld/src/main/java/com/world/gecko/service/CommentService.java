package com.world.gecko.service;

import java.util.List;
import java.util.Optional;

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

	public Comment findByCnum(int cnum) {
		return repo.findByCnum(cnum);
	}

	public void editComment(Comment edit) {
		Comment comment = repo.findByCnum(edit.getCnum());
		comment.setContent(edit.getContent());
		repo.save(comment);
	}
	public void newComment(Comment comment) {
		Post post = repoPost.findByPnum(comment.getPnum());
		post.setComment_count(post.getComment_count() + 1);
		repoPost.save(post);
		repo.save(comment);
	}
	
	public void deleteComment(int cnum) {
		Optional<Comment> comment = Optional.ofNullable(repo.findByCnum(cnum));
		if(comment.isPresent()) {
			Post post = repoPost.findByPnum(comment.get().getPnum());
			post.setComment_count(post.getComment_count() - 1);
			repoPost.save(post);
			repo.delete(comment.get());
		}
	}
}

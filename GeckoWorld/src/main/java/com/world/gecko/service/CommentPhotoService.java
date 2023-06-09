package com.world.gecko.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.Comment;
import com.world.gecko.domain.CommentPhoto;
import com.world.gecko.domain.Post;
import com.world.gecko.domain.PostPhoto;
import com.world.gecko.repository.CommentPhotoRepository;
import com.world.gecko.repository.PostPhotoRepository;

@Service
public class CommentPhotoService {

	@Autowired
	private CommentPhotoRepository repo;

	@Autowired
	private PostPhotoRepository repoPost;
	
	public List<CommentPhoto> getList(int num) {
		return repo.findListByNum(num);
	}
	public CommentPhoto findByCnum(int cnum) {
		return repo.findByCnum(cnum);
	}
	
	public void editComment(CommentPhoto edit) {
		CommentPhoto comment = repo.findByCnum(edit.getCnum());
		comment.setContent(edit.getContent());
		repo.save(comment);
	}
	
	public void newCommentPhoto(CommentPhoto comment) {
		PostPhoto post = repoPost.findByNum(comment.getNum());
		post.setComment_count(post.getComment_count()+1);
		repoPost.save(post);
		repo.save(comment);
	}
	
	public void deleteComment(int cnum) {
		Optional<CommentPhoto> comment = Optional.ofNullable(repo.findByCnum(cnum));
		if(comment.isPresent()) {
			PostPhoto post = repoPost.findByNum(comment.get().getNum());
			post.setComment_count(post.getComment_count() - 1);
			repoPost.save(post);
			repo.delete(comment.get());
		}
	}
}

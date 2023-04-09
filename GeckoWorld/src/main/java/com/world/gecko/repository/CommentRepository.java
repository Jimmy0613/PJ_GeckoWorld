package com.world.gecko.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.world.gecko.domain.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {
	List<Comment> findListByPnum(int pnum);
	
	Comment findByCnum(int cnum);
}

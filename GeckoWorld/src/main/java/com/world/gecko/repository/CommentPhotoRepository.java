package com.world.gecko.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.world.gecko.domain.CommentPhoto;

@Repository
public interface CommentPhotoRepository extends JpaRepository<CommentPhoto, Integer> {
	List<CommentPhoto> findListByNum(int num);
}

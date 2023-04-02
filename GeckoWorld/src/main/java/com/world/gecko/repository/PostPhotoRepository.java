package com.world.gecko.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.world.gecko.domain.PostPhoto;

@Repository
public interface PostPhotoRepository extends JpaRepository<PostPhoto, Integer> {

	Page<PostPhoto> findAll(Pageable pageable);

	PostPhoto findByNum(int num);

}

package com.world.gecko.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.world.gecko.domain.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {

	Page<Post> findAll(Pageable pageable);

	Post findByNum(int num);

}
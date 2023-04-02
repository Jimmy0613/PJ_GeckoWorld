package com.world.gecko.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.world.gecko.domain.PostResponse;

@Repository
public interface PostResponseRepository extends JpaRepository<PostResponse, Integer>{

	List<PostResponse> findListByPnum(int pnum);
	
	PostResponse findByRnum(int rnum);

}

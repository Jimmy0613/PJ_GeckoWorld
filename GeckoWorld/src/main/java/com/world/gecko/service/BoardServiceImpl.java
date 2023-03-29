package com.world.gecko.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.PageVo;
import com.world.gecko.domain.PostPhotoVo;
import com.world.gecko.domain.PostVo;
import com.world.gecko.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	public PostVo getPostByNum(int num) {
		return mapper.getPostByNum(num);
	}

	public void newPost(PostVo post) {
		mapper.newPost(post);
	}
	
	public void newPostPhoto(PostPhotoVo post) {
		mapper.newPostPhoto(post);
	}

	public List<PostVo> getResponse(int pnum) {
		return mapper.getResponse(pnum);
	}

	public List<PostVo> postList(int startIndex) {
		return mapper.postList(startIndex);
	}

	public PageVo getPage() {
		return mapper.getPage();
	}

	public void view(int num) {
		mapper.view(num);
	}

	public int latestPost() {
		return mapper.latestPost();
	}
	public List<PostPhotoVo> getListPhoto(){
		return mapper.getListPhoto();
	}
}
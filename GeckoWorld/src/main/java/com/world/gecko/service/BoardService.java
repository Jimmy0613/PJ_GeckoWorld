package com.world.gecko.service;

import java.util.HashMap;
import java.util.List;


import com.world.gecko.domain.PageVo;
import com.world.gecko.domain.PostPhotoVo;
import com.world.gecko.domain.PostVo;

public interface BoardService {
	public PostVo getPostByNum(int num);

	public List<PostVo> getResponse(int pnum);
	
	public void newPost(PostVo post);

	public void newPostPhoto(PostPhotoVo post);
	
	public List<PostVo> postList(int startIndex);

	public PageVo getPage();

	public void view(int num);

	public int latestPost();

	public List<PostPhotoVo> getListPhoto();
}
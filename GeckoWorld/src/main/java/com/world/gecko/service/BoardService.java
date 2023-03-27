package com.world.gecko.service;

import java.util.List;


import com.world.gecko.domain.PageVo;
import com.world.gecko.domain.PostVo;

public interface BoardService {
	public PostVo getPostByNum(int num);

	public void newPost(PostVo post);

	public List<PostVo> postList(int startIndex);

	public PageVo getPage();

	public void view(int num);

	public int latestPost();

}
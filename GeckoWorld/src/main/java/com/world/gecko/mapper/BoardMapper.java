package com.world.gecko.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.world.gecko.domain.PageVo;
import com.world.gecko.domain.PostVo;

public interface BoardMapper {

	public PostVo getPostByNum(@Param("num") int num);

	public void newPost(PostVo post);

	public List<PostVo> postList(@Param("startIndex") int startIndex);

	public PageVo getPage();

	public void view(@Param("num") int num);

	public int latestPost();
}
package com.world.gecko.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.PostPhoto;
import com.world.gecko.repository.PostPhotoRepository;
import com.world.gecko.util.ImageUtils;

@Service
public class PostPhotoService {

	@Autowired
	private PostPhotoRepository repo;

	public PostPhoto getPostByNum(int num) {
		return repo.findByNum(num);
	}

	public void newPostPhoto(PostPhoto postPhoto, String[] url, String[] desc, HttpServletRequest request)
			throws Exception {
		String resourceSrc = request.getServletContext().getRealPath("/resources");
		String filePath = resourceSrc + "\\images\\upload\\";
		for (int i = 0; i < url.length; i++) {
			if (url[i].length() != 0) {
				byte[] postByte = ImageUtils.imageToByteArray(filePath + url[i]);
				if (i == 0) {
					postPhoto.setPhoto1(postByte);
					postPhoto.setDesc1(desc[i]);
				} else if (i == 1) {
					postPhoto.setPhoto2(postByte);
					postPhoto.setDesc2(desc[i]);
				} else if (i == 2) {
					postPhoto.setPhoto3(postByte);
					postPhoto.setDesc3(desc[i]);
				} else if (i == 3) {
					postPhoto.setPhoto4(postByte);
					postPhoto.setDesc4(desc[i]);
				} else {
					postPhoto.setPhoto5(postByte);
					postPhoto.setDesc5(desc[i]);
				}
			}
		}
		repo.save(postPhoto);
	}

	public Map<String, Object> getList(int currentPage) {
		Map<String, Object> map = new HashMap<>();
		PageRequest pr = PageRequest.of(currentPage - 1, 6, Sort.by(Sort.Direction.DESC, "num"));
		Page<PostPhoto> page = repo.findAll(pr);

		Map<Integer, String> thumnailList = new HashMap<>();
		for (PostPhoto p : page.getContent()) {
			String thumnailUrl = "";
			if (p.getPhoto1() != null) {
				thumnailUrl = ImageUtils.byteToImageUrl(p.getPhoto1());
			}
			// 글번호와 함께 저장
			thumnailList.put(p.getNum(), thumnailUrl);
		}

		// 사진글 리스트
		map.put("list", page.getContent());
		// 사진글에서 썸네일 사진(photo1)을 url로 바꾼 imgurl map
		map.put("thumnailList", thumnailList);
		map.put("totalPage", page.getTotalPages());
		return map;
	}

	public Map<String, Object> getPost(int num) {
		Map<String, Object> map = new HashMap<>();
		PostPhoto postPhoto = repo.findByNum(num);
		postPhoto.setView_count(postPhoto.getView_count() + 1);
		repo.save(postPhoto);
		
		List<String> urlList = new ArrayList<>();
		if (postPhoto.getPhoto1() != null) {
			urlList.add(ImageUtils.byteToImageUrl(postPhoto.getPhoto1()));
		}
		if (postPhoto.getPhoto2() != null) {
			urlList.add(ImageUtils.byteToImageUrl(postPhoto.getPhoto2()));
		}
		if (postPhoto.getPhoto3() != null) {
			urlList.add(ImageUtils.byteToImageUrl(postPhoto.getPhoto3()));
		}
		if (postPhoto.getPhoto4() != null) {
			urlList.add(ImageUtils.byteToImageUrl(postPhoto.getPhoto4()));
		}
		if (postPhoto.getPhoto5() != null) {
			urlList.add(ImageUtils.byteToImageUrl(postPhoto.getPhoto5()));
		}
		// 사진글
		map.put("post", postPhoto);
		// 사진글에서 사진들을 url로 urlList 
		map.put("urlList", urlList);
		return map;
	}

}

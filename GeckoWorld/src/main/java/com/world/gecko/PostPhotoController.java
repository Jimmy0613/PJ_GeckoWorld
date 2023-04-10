package com.world.gecko;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.world.gecko.domain.CommentPhoto;
import com.world.gecko.domain.PostPhoto;
import com.world.gecko.service.CommentPhotoService;
import com.world.gecko.service.PostPhotoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/board/*")
public class PostPhotoController {

	@Autowired
	private PostPhotoService servicePhoto;

	@Autowired
	private CommentPhotoService serviceCommentPhoto;

	@GetMapping({ "/newPostPhoto" })
	public void getView(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		model.addAttribute("currentPage", currentPage);
	}

	@GetMapping({ "/listPhoto" })
	public void getListPhoto(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		Map<String, Object> map = servicePhoto.getList(currentPage);
		model.addAttribute("list", (List<PostPhoto>) map.get("list"));
		model.addAttribute("thumnailList", (Map<Integer, String>) map.get("thumnailList"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", map.get("totalPage"));
	}

	@GetMapping("/postPhoto")
	public String getPostPhoto(@RequestParam(value = "num", defaultValue = "0") int num,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		if (num == 0) {
			return "redirect:/board/listPhoto";
		} else {
			Map<String, Object> map = servicePhoto.getPost(num);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("post", (PostPhoto) map.get("post"));
			model.addAttribute("urlList", (List<String>) map.get("urlList"));
			model.addAttribute("comment", (List<CommentPhoto>) serviceCommentPhoto.getList(num));
			return "/board/postPhoto";
		}
	}

	@PostMapping("/newPostPhoto.do")
	public String newpostPhoto_do(HttpServletRequest request, PostPhoto post, @RequestParam(value = "url") String[] url,
			@RequestParam(value = "desc") String[] desc) throws Exception {
		servicePhoto.newPostPhoto(post, url, desc, request);
		return "redirect:/board/listPhoto";
	}

	@GetMapping("/deletePostPhoto")
	public String deletePostPhoto(@RequestParam("num") int num) {
		servicePhoto.deletePostPhoto(num);
		return "redirect:/board/listPhoto";
	}

}

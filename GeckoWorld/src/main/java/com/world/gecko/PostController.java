package com.world.gecko;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.gecko.domain.Post;
import com.world.gecko.service.CommentService;
import com.world.gecko.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/board/*")
public class PostController {

	@Autowired
	private PostService service;
	@Autowired
	private CommentService serviceComment;

	@GetMapping({ "/list" })
	public void getView(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		model.addAttribute("currentPage", currentPage);
	}

	@GetMapping("/getList")
	@ResponseBody
	public Map<String, Object> newList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			Model model) {
		Map<String, Object> result = service.getList(currentPage);
		result.put("currentPage", currentPage);
		return result;
	}

	@GetMapping("/post")
	public String getPost(@RequestParam(value = "pnum", defaultValue = "0") int pnum,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		if (pnum == 0) {
			return "redirect:/board/list";
		} else {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("post", service.getPostByPnum(pnum));
			model.addAttribute("comment", serviceComment.getList(pnum));
			return "/board/post";
		}
	}

	@GetMapping("/newPost")
	public void newpost() {
	}

	@GetMapping("/editPost")
	public void editPost(@RequestParam("pnum") int pnum, Model model) {
		model.addAttribute("post", service.getPostByPnum(pnum));
	}

	@PostMapping("/newPost.do")
	public String newpost_do(Post post) {
		service.newPost(post);
		return "redirect:/board/list";
	}

	@PostMapping("/editPost.do")
	public String editPost_do(Post edit, Model model) {
		service.editPost(edit);
		return "redirect:/board/post?pnum=" + edit.getPnum();
	}

	@GetMapping("/deletePost")
	public String deletePost(@RequestParam("pnum") int pnum) {
		service.deletePost(pnum);
		return "redirect:/board/list";
	}

}

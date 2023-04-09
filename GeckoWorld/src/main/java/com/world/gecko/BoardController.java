package com.world.gecko;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.gecko.domain.Comment;
import com.world.gecko.domain.CommentPhoto;
import com.world.gecko.domain.Post;
import com.world.gecko.domain.PostPhoto;
import com.world.gecko.domain.PostResponse;
import com.world.gecko.domain.User;
import com.world.gecko.service.CommentPhotoService;
import com.world.gecko.service.CommentService;
import com.world.gecko.service.PostPhotoService;
import com.world.gecko.service.PostResponseService;
import com.world.gecko.service.PostService;
import com.world.gecko.util.SessionUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private PostService service;

	@Autowired
	private PostPhotoService servicePhoto;

	@Autowired
	private CommentService serviceComment;

	@Autowired
	private CommentPhotoService serviceCommentPhoto;

	@Autowired
	private PostResponseService serviceResponse;

	@GetMapping({ "/newPostPhoto", "/list" })
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

	@GetMapping({ "/listPhoto" })
	public void getListPhoto(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		Map<String, Object> map = servicePhoto.getList(currentPage);
		model.addAttribute("list", (List<PostPhoto>) map.get("list"));
		model.addAttribute("thumnailList", (Map<Integer, String>) map.get("thumnailList"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", map.get("totalPage"));
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

	@GetMapping("/getResponse")
	@ResponseBody
	public Map<String, Object> getResponse(@RequestParam(value = "pnum") int pnum, HttpServletRequest request) {
		List<PostResponse> list = serviceResponse.findListByPnum(pnum);
		User loginUser = (User) SessionUtils.getObject(request, "LOGIN_USER");
		Map<String, Object> data = new HashMap<>();
		data.put("list", list);
		data.put("LOGIN_USER", loginUser);
		return data;
	}

	@GetMapping("/like")
	@ResponseBody
	public void like(@RequestParam(value = "rnum") int rnum) {
		serviceResponse.like(rnum);
	}

	@GetMapping("/newPost")
	public void newpost() {
	}

	@GetMapping("/editPost")
	public void editPost(@RequestParam("pnum") int pnum, Model model) {
		model.addAttribute("post", service.getPostByPnum(pnum));
	}

	@GetMapping("/editPostPhoto")
	public void editPostPhoto(@RequestParam("num") int num, Model model) {
		Map<String, Object> map = servicePhoto.getPost(num);
		model.addAttribute("post", (PostPhoto) map.get("post"));
		model.addAttribute("urlList", (List<String>) map.get("urlList"));
	}

	@GetMapping("/newResponse")
	public void newResponse(@RequestParam(value = "pnum") int pnum, @RequestParam(value = "ptitle") String ptitle,
			Model model) {
		model.addAttribute("pnum", pnum);
		model.addAttribute("ptitle", ptitle);
	}

	@GetMapping("/editResponse")
	public void editResponse(@RequestParam("rnum") int rnum, @RequestParam("pnum") int pnum, Model model) {
		Post post = service.getPostByPnum(pnum);
		model.addAttribute("ptitle", post.getTitle());
		model.addAttribute("res", serviceResponse.findByRnum(rnum));
	}

	@GetMapping("/newComment")
	public String newComment(Comment comment, @RequestParam(value = "pnum") int pnum,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		serviceComment.newComment(comment);
		return "redirect:/board/post?currentPage=" + currentPage + "&pnum=" + pnum;
	}

	@GetMapping("/editComment")
	@ResponseBody
	public Comment editComment(@RequestParam("cnum") int cnum) {
		return serviceComment.findByCnum(cnum);
	}

	@GetMapping("/editCommentPhoto")
	@ResponseBody
	public CommentPhoto editCommentPhoto(@RequestParam("cnum") int cnum) {
		return serviceCommentPhoto.findByCnum(cnum);
	}

	@GetMapping("/newCommentPhoto")
	public String newCommentPhoto(CommentPhoto comment, @RequestParam(value = "num") int num,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		serviceCommentPhoto.newCommentPhoto(comment);
		return "redirect:/board/postPhoto?currentPage=" + currentPage + "&num=" + num;
	}

	@PostMapping("/editCommentPhoto.do")
	public String editCommentPhoto_do(CommentPhoto edit) {
		serviceCommentPhoto.editComment(edit);
		return "redirect:/board/postPhoto?num=" + edit.getNum();
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

	@PostMapping("/editResponse.do")
	public String editResponse_do(PostResponse edit, Model model) {
		serviceResponse.editResponse(edit);
		return "redirect:/board/post?pnum=" + edit.getPnum();
	}

	@PostMapping("/editComment.do")
	public String editComment_do(Comment edit, Model model) {
		serviceComment.editComment(edit);
		return "redirect:/board/post?pnum=" + edit.getPnum();
	}

	@PostMapping("/newResponse.do")
	public String newResponse_do(PostResponse response) {
		serviceResponse.newResponse(response);
		return "redirect:/board/post?pnum=" + response.getPnum();
	}

	@PostMapping("/newPostPhoto.do")
	public String newpostPhoto_do(HttpServletRequest request, PostPhoto post, @RequestParam(value = "url") String[] url,
			@RequestParam(value = "desc") String[] desc) throws Exception {
		servicePhoto.newPostPhoto(post, url, desc, request);
		return "redirect:/board/listPhoto";
	}

	@GetMapping("/deletePost")
	public String deletePost(@RequestParam("pnum") int pnum) {
		service.deletePost(pnum);
		return "redirect:/board/list";
	}

	@GetMapping("/deletePostPhoto")
	public String deletePostPhoto(@RequestParam("num") int num) {
		servicePhoto.deletePostPhoto(num);
		return "redirect:/board/listPhoto";
	}
	
	@GetMapping("/deleteResponse")
	public String deleteResponse(@RequestParam("rnum") int rnum) {
		int pnum = serviceResponse.findByRnum(rnum).getPnum();
		serviceResponse.deleteResponse(rnum);
		return "redirect:/board/post?pnum=" + pnum;
	}

	@GetMapping("/deleteComment")
	public String deleteComment(@RequestParam("cnum") int cnum) {
		int pnum = serviceComment.findByCnum(cnum).getPnum();
		serviceComment.deleteComment(cnum);
		return "redirect:/board/post?pnum=" + pnum;
	}

	@GetMapping("/deleteCommentPhoto")
	public String deleteCommentPhoto(@RequestParam("cnum") int cnum) {
		int num = serviceCommentPhoto.findByCnum(cnum).getNum();
		serviceCommentPhoto.deleteComment(cnum);
		return "redirect:/board/postPhoto?num=" + num;
	}

}

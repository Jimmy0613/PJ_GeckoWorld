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
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.gecko.domain.Comment;
import com.world.gecko.domain.CommentPhoto;
import com.world.gecko.domain.Post;
import com.world.gecko.domain.PostPhoto;
import com.world.gecko.domain.PostResponse;
import com.world.gecko.service.CommentPhotoService;
import com.world.gecko.service.CommentService;
import com.world.gecko.service.PostPhotoService;
import com.world.gecko.service.PostResponseService;
import com.world.gecko.service.PostService;

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
	public void getView(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
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
	public void getPost(@RequestParam(value = "pnum") int pnum,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("post", service.getPostByPnum(pnum));
		model.addAttribute("comment", serviceComment.getList(pnum));
	}

	@GetMapping("/postPhoto")
	public void getPostPhoto(@RequestParam(value="num") int num, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		Map<String, Object> map = servicePhoto.getPost(num);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("post", (PostPhoto)map.get("post"));
		model.addAttribute("urlList", (List<String>)map.get("urlList"));
		model.addAttribute("comment", (List<CommentPhoto>)serviceCommentPhoto.getList(num));
	}
	
	@GetMapping("/getResponse")
	@ResponseBody
	public List<PostResponse> getResponse(@RequestParam(value="pnum") int pnum){
		return serviceResponse.findListByPnum(pnum);
	}
	
	@GetMapping("/like")
	@ResponseBody
	public void like(@RequestParam(value="rnum") int rnum) {
		serviceResponse.like(rnum);
	}
	
	@GetMapping("/newPost")
	public void newpost() {
	}

	@GetMapping("/newResponse")
	public void newResponse(@RequestParam(value="pnum")int pnum, @RequestParam(value="ptitle") String ptitle, Model model) {
		model.addAttribute("pnum", pnum);
		model.addAttribute("ptitle", ptitle);
	}
	
	@GetMapping("/newComment")
	public String newComment(Comment comment, @RequestParam(value = "pnum") int pnum,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		serviceComment.newComment(comment);
		return "redirect:/board/post?currentPage=" + currentPage + "&pnum=" + pnum;
	}
	
	@GetMapping("/newCommentPhoto")
	public String newCommentPhoto(CommentPhoto comment, @RequestParam(value = "num") int num,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		serviceCommentPhoto.newCommentPhoto(comment);
		return "redirect:/board/postPhoto?currentPage=" + currentPage + "&num=" + num;
	}

	@PostMapping("/newPost.do")
	public String newpost_do(Post post) {
		service.newPost(post);
		return "redirect:/board/list";
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
	public String deletePost(@RequestParam("pnum")int pnum) {
		service.deletePost(pnum);
		return "redirect:/board/list";
	}

}

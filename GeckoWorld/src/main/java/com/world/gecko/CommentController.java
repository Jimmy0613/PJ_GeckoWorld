package com.world.gecko;

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
import com.world.gecko.service.CommentPhotoService;
import com.world.gecko.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/board/*")
public class CommentController {

	@Autowired
	private CommentService serviceComment;

	@Autowired
	private CommentPhotoService serviceCommentPhoto;

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

	@PostMapping("/editComment.do")
	public String editComment_do(Comment edit, Model model) {
		serviceComment.editComment(edit);
		return "redirect:/board/post?pnum=" + edit.getPnum();
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

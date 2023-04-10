package com.world.gecko;

import java.util.HashMap;
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

import com.world.gecko.domain.Post;
import com.world.gecko.domain.PostResponse;
import com.world.gecko.domain.User;
import com.world.gecko.service.PostResponseService;
import com.world.gecko.service.PostService;
import com.world.gecko.util.SessionUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/board/*")
public class ResponseController {

	@Autowired
	private PostService service;

	@Autowired
	private PostResponseService serviceResponse;

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

	@PostMapping("/editResponse.do")
	public String editResponse_do(PostResponse edit, Model model) {
		serviceResponse.editResponse(edit);
		return "redirect:/board/post?pnum=" + edit.getPnum();
	}

	@PostMapping("/newResponse.do")
	public String newResponse_do(PostResponse response) {
		serviceResponse.newResponse(response);
		return "redirect:/board/post?pnum=" + response.getPnum();
	}

	@GetMapping("/deleteResponse")
	public String deleteResponse(@RequestParam("rnum") int rnum) {
		int pnum = serviceResponse.findByRnum(rnum).getPnum();
		serviceResponse.deleteResponse(rnum);
		return "redirect:/board/post?pnum=" + pnum;
	}

}

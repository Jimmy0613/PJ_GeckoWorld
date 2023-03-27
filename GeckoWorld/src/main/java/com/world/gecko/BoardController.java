package com.world.gecko;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.gecko.domain.PageVo;
import com.world.gecko.domain.PostVo;
import com.world.gecko.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/board/*")
public class BoardController {

	private BoardService service;

	@GetMapping({ "/list_" })
	public void getList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		int startIndex = (currentPage - 1) * PageVo.PER_PAGE_POST;
		PageVo pvo = service.getPage();
		int totalPage = pvo.getTotalPage();
		model.addAttribute("list", service.postList(startIndex));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
	}

	@GetMapping("/movePage")
	@ResponseBody
	public Map<String,Object> newList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		int startIndex = (currentPage - 1) * PageVo.PER_PAGE_POST;
		List<PostVo> postList = service.postList(startIndex);
		PageVo pvo = service.getPage();
		int totalPage = pvo.getTotalPage();
		Map<String, Object> result = new HashMap<>();
		result.put("currentPage", currentPage);
		result.put("totalPage", totalPage);
		result.put("postList", postList);
		return result;
	}

	@GetMapping("/getPost")
	@ResponseBody
	public PostVo getPost(@RequestParam(value = "num") int num) {
		service.view(num);
		return service.getPostByNum(num);
	}

	@GetMapping("/newpost")
	public void newpost(@RequestParam(value = "tag", defaultValue = "N") String tag, Model model) {
		model.addAttribute("tag", tag);
	}

	@PostMapping("/newpost.do")
	public String newpost_do(PostVo post) {
		service.newPost(post);
		return "redirect:/board/list_";
	}

}
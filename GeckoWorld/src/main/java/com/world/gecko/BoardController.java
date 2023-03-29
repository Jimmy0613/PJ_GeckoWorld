package com.world.gecko;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.net.URL;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.exceptions.ExceptionInterceptor;
import com.mysql.cj.jdbc.Blob;
import com.world.gecko.domain.PageVo;
import com.world.gecko.domain.PostPhotoVo;
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

	@GetMapping({ "/list", "/newpostPhoto" })
	public void getView() {
	}

	@GetMapping("/getList")
	@ResponseBody
	public Map<String, Object> newList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			Model model) {
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

	@GetMapping({ "/listPhoto" })
	public void getListPhoto(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		List<PostPhotoVo> photoList = service.getListPhoto();
		for(PostPhotoVo p: photoList) {
			if(p.getP1()!=null) {
				p.setP1Url(byteToImageUrl(p.getP1()));
			}
			if(p.getP2()!=null) {
				p.setP2Url(byteToImageUrl(p.getP2()));
			}
			if(p.getP3()!=null) {
				p.setP3Url(byteToImageUrl(p.getP3()));
			}
			if(p.getP4()!=null) {
				p.setP4Url(byteToImageUrl(p.getP4()));
			}
			if(p.getP5()!=null) {
				p.setP5Url(byteToImageUrl(p.getP5()));
			}
		}
		model.addAttribute("list", photoList);
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
		return "redirect:/board/list";
	}

	@PostMapping("/newpostPhoto.do")
	public String newpostPhoto_do(HttpServletRequest request, PostPhotoVo post, @RequestParam(value="p1", defaultValue="") String p1Path) throws Exception {
		String filePath = "D:\\00_miji\\03_eclipse_spring\\sts-bundle\\sts-3.9.18.RELEASE\\test\\";
		String p1FilePath = filePath + p1Path;
		byte[] p1 = imageToByteArray(p1FilePath);
		post.setP1(p1);
		service.newPostPhoto(post);
		return "redirect:/board/listPhoto";
	}

	public String byteToImageUrl(byte[] byteData) {
		String base64 = Base64.getEncoder().encodeToString(byteData);
		String url = "data:application/octet-stream;base64," + base64;
		return url;
	}
	public static byte[] imageToByteArray(String filePath) throws Exception {
		byte[] returnValue = null;
		ByteArrayOutputStream baos = null;
		FileInputStream fis = null;

		try {
			baos = new ByteArrayOutputStream();
			fis = new FileInputStream(filePath);

			byte[] buf = new byte[1024];
			int read = 0;

			while ((read = fis.read(buf, 0, buf.length)) != -1) {
				baos.write(buf, 0, read);
			}

			returnValue = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (baos != null) {
				baos.close();
			}
			if (fis != null) {
				fis.close();
			}
		}
		return returnValue;
	}
}

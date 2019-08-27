package com.care.WebPage.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.WebPage.DTO.Board;
import com.care.WebPage.IService.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("selectBoard")
	public String selectBoard(Model model, 
			@RequestParam(value="curPage", required=false, defaultValue="1") String curPage,
			@RequestParam(value="selectOpt", required=false, defaultValue="") String selectOpt,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord
			) {
		model.addAttribute("boardLst", boardService.selectBoard(curPage, selectOpt, searchWord));
		model.addAttribute("navi", boardService.getNavi(curPage, selectOpt,searchWord));
		
		return "forward:/`boardForm";
	}

	@RequestMapping("detailRead")
	public String detailRead(@RequestParam("writeNo") String writeNo, Model model) {
		model.addAttribute("boardInfo", boardService.detailRead(Integer.parseInt(writeNo)));		
		return "forward:/viewForm";
	}
	@RequestMapping("deleteBoard")
	public String deleteBoard(@RequestParam("deleteNo") String deleteNo, Model model) {
		boardService.deleteBoard(deleteNo);
		return "redirect:/board/selectBoard";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(Board board, Model model) {
		boardService.insertProc(board);
		return "redirect:/board/selectBoard";
	}
}

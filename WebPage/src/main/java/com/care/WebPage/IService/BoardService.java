package com.care.WebPage.IService;

import java.util.List;

import com.care.WebPage.DTO.Board;

public interface BoardService {
	public List<Board> selectBoard(String curPage, String searchOpt, String searchWord);
	public Board detailRead(int no);
	public String getNavi(String curPage, String searchOpt, String searchWord);
	public void deleteBoard(String delNo);
	public void insertProc(Board board);
}

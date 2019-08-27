package com.care.WebPage.Service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.WebPage.Common.BoardTools;
import com.care.WebPage.DTO.Board;
import com.care.WebPage.IDao.BoardDao;
import com.care.WebPage.IService.BoardService;
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;
	
	private final int BLOCKSIZE = 2;
	private final String NAVIURL="/WebPage/board/selectBoard?";

	@Override
	public List<Board> selectBoard(String curPage, String searchOpt, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		int pageNum = Integer.parseInt(curPage)-1;
			
		map.put("start", pageNum*BLOCKSIZE);
		map.put("end", (pageNum+1)*BLOCKSIZE);
		map.put("searchOpt", searchOpt);
		map.put("searchWord", searchWord);
		return boardDao.selectBoard(map);
	}
	@Override
	public Board detailRead(int no) {
		return boardDao.detailRead(no);
	}
	@Override
	public String getNavi(String curPage, String searchOpt, String searchWord) {
		Map<String, String> map = new HashMap<String, String>();
		int pageNum = Integer.parseInt(curPage);
		map.put("searchOpt", searchOpt);
		map.put("searchWord", searchWord);
		
		return BoardTools.getNavi(pageNum, BLOCKSIZE, boardDao.selectBoardCnt(map), 
				NAVIURL+"selectOpt="+searchOpt+"&searchWord="+URLEncoder.encode(searchWord)+"&curPage=");
	}
	@Override
	public void deleteBoard(String delNo) {	
		boardDao.deleteBoard(delNo.split(" "));	
	}
	@Override
	public void insertProc(Board board) {
		boardDao.insertProc(board);		
	}
}

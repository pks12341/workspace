package com.yedam.app.board.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	

	@Override
	public List<BoardVO> getBoardAll() {
		return boardMapper.selectBoardList();
	}

	@Override
	public BoardVO getBoardInfo(BoardVO boardVO) {
		return boardMapper.selectBoard(boardVO);
	}

	@Override
	public int insertBoardInfo(BoardVO boardVO) {
		int result = boardMapper.insertBoard(boardVO);
		return result == 1 ? boardVO.getBno() : -1  ; //-1은 의미없고 bno가 가질수없는값 넣으면됨
		
	}

	@Override
	public Map<String, Object> updateBoardInfo(BoardVO boardVO) {
		Map<String,Object> map = new HashMap<>();
		boolean isSuccessed = false;
		int result = boardMapper.updateBoard(boardVO);
		if(result == 1) {
			isSuccessed = true;
		}
		map.put("result",isSuccessed);
		map.put("target", boardVO);
		return map;
	}

	@Override
	public boolean deleteBoardInfo(int boardNo) {
		int result = boardMapper.deleteBoard(boardNo);
		return result == 1 ? true : false;
	}
	
}

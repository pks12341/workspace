package com.yedam.app.board.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;



@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	//전체 조회 : URI - boardList/ return : board/boardList
	@GetMapping("boardList")
	public String getBoardList(Model model) {
		List<BoardVO> list = boardService.getBoardAll();
		model.addAttribute("boardList",list);
		return "board/boardList";
	}
	//개별조회 : uri : boardInfo / parameter : boardVO / return board/boardInfo
	@GetMapping("boardInfo")
	public String getBoardInfo(BoardVO boardVO, Model model) {
		BoardVO findVO = boardService.getBoardInfo(boardVO);
		model.addAttribute("boardInfo",findVO);
		return "board/boardInfo";
	}
	
	//게시글 등록 - 페이지 : uri - boardInsert / return - board/boardInsert
	@GetMapping("boardInsert")
	public String boardInsertForm() {
		return "board/boardInsert";
	}
	
	//게시글 등록 - 처리 : uri : boardInsert / parameter - boardVO / return : 전체조회 다시 호출
	@PostMapping("boardInsert")
	public String BoardInsertProcess(BoardVO boardVO) {//매개변수 따로 안필요함
		boardService.insertBoardInfo(boardVO);
		return "redirect:boardList";
	}
	
	//게시글수정 - 별도 페이지 : URI : boardUpdate / parameter : BoardVO / Return : board/boardUpdate
	@PostMapping("boardUpdate")
	@ResponseBody
	public Map<String, Object> boardUpdateProcess(BoardVO boardVO){
		return boardService.updateBoardInfo(boardVO);
	}
	
	//게시글수정 - 처리 : uri : boardUpdate / parameter : BoardVO / return : 수정결과 데이터(Map)
	
	@PostMapping("boardUpdateAjax")
	@ResponseBody
	public Map<String, Object> boardUpdateAjaxProcess(@RequestBody BoardVO boardVO){
		return boardService.updateBoardInfo(boardVO);
	}	
	
	//게시글삭제 
	@GetMapping("boardDelete")
	public String boardDelete(@RequestParam Integer bno) {
		boardService.deleteBoardInfo(bno);
		return "redirect:boardList";
		
	}
}

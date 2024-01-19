package com.yedam.java.book.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.java.book.service.BookService;
import com.yedam.java.book.service.BookVO;





@Controller
public class BookController {
	@Autowired
	BookService bookService;

	//전체 조회 : URI - boardList/ return : board/boardList
	@GetMapping("bookList")
	public String getBookList(Model model) {
		List<BookVO> list = bookService.getBookAll();
		model.addAttribute("bookList",list);
		return "book/bookList";
	}

	
	//등록 
	@GetMapping("bookInsert")
	public String bookInsertForm() {
		return "book/bookInsert";
	}
	
	//등록처리
	@PostMapping("bookInsert")
	public String BoardInsertProcess(BookVO bookVO) {
		bookService.insertBookInfo(bookVO);
		return "redirect:bookList";
	}
	
	//대여 조회 : URI - boardList/ return : board/boardList
		@GetMapping("borrowList")
		public String getBorrowList(Model model) {
			List<BookVO> list = bookService.getBorrowBook();
			model.addAttribute("borrowList",list);
			return "book/borrowList";
		}
	


}

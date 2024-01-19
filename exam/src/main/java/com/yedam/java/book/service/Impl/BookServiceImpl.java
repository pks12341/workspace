package com.yedam.java.book.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.java.book.mapper.BookMapper;
import com.yedam.java.book.service.BookService;
import com.yedam.java.book.service.BookVO;

@Service
public class BookServiceImpl implements BookService{

	@Autowired
	BookMapper bookMapper;
//전체조회
	@Override
	public List<BookVO> getBookAll() {
		return bookMapper.getBookList();
	}
	
//등록
	@Override
	public int insertBookInfo(BookVO bookVO) {
		int result = bookMapper.insertBook(bookVO);
		return result == 1 ? bookVO.getBookNo() : -1 ;
	}
//대여조회
	@Override
	public List<BookVO> getBorrowBook() {
		return bookMapper.getBorrowList();
	}
	
}

package com.yedam.java.book.service;

import java.util.List;

public interface BookService {
	//전체조회
	public List<BookVO> getBookAll();
	
	//등록
	public int insertBookInfo(BookVO bookVO);
	
	//대여현황조회
	public List<BookVO> getBorrowBook();
}


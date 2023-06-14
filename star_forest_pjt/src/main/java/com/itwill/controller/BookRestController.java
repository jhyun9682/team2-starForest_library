package com.itwill.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.domain.Book;
import com.itwill.mapper.BookMapper;
import com.itwill.service.BookService;

@RestController
public class BookRestController {

	@Autowired(required = true)
	private BookService bookService;

	@RequestMapping("/rest_book_detail")
	public Book book_detail(@RequestParam(value = "book_no", required = false) String book_noStr, Model model) throws Exception {

		Book book = bookService.selectBookDetail(Integer.parseInt(book_noStr));
		
		return book;
	}
	
	
	@PostMapping("/admin_newbook_insert_action")
	public Map admin_newbook_action(@ModelAttribute Book book,@RequestParam("book_img_src") MultipartFile book_img_src, HttpSession session) {
		Map resultMap = new HashMap();
		
		int code=2;
		String url="";
		String msg="";
		List<Book> resultList = new ArrayList<Book>();
		try {
			int rowCount = bookService.insertBook(new Book(0, book.getIsbn(), book.getBook_title(), book.getBook_author(), 
															book.getBook_publisher(), book.getBook_summary(), book.getBook_publish_date(), 
															null, book.getBook_image(), book.getBook_image_src(), book.getBook_page(), 
															3, 0, 0, book.getCategory_no()));
			if(rowCount==1) {
				
				code=1;
				url="";
				msg="신착도서가 등록되었습니다.";
				resultList.add(book);
				
				
			}
		}catch (Exception e) {
			code=2;
			url="";
			msg="에러로 도서가 등록되지 않았습니다.";
			e.printStackTrace();
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		
		return resultMap;
	}

}
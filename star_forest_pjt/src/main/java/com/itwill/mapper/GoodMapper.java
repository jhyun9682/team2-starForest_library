package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.Good;

//분야 번호 추천
@Mapper
public interface GoodMapper {


	@Select("select * from (select b.book_no, b.isbn, b.book_title,b.book_author,b.book_publisher,b.book_image, bc.category_no,bc.category_name from book b join book_category bc on b.category_no =bc.category_no where bc.category_no=#{category_no} order by dbms_random.value) where rownum < 11")
	public List<Good> GoodList(int category_no);

}

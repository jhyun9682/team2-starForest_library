package com.itwill.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.Notice;

@Mapper
public interface NoticeMapper {
	public class simpleDateFormatEx {

		   public static void main(String[] args) {
		      Date sysdate = new Date();
		      System.out.println("포맷 지정 전 : " + sysdate);
		      
		        
		      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		           //원하는 데이터 포맷 지정
		      String strNowDate = simpleDateFormat.format(sysdate); 
		           //지정한 포맷으로 변환 
		      System.out.println("포맷 지정 후 : " + strNowDate);
		      
		   }

		}
	
	public List<Notice> selectAll(int pageStart, int pageEnd) throws Exception;
	
	@Insert("insert into notice values(SEQ_notice_notice_no.nextval,#{notice_title},sysdate,#{notice_content},1)")
	public int create(Notice notice) throws Exception;
	
	@Update("update notice set notice_title=#{notice_title},notice_content=#{notice_content} "
			+ "where notice_no=#{notice_no}")
	public int update(Notice notice) throws Exception;
	
	@Update("update notice set notice_readcount=notice_readcount+1 where notice_no=#{notice_no}")
	public int updateCount(int notice_no) throws Exception;
	
	@Delete("delete from notice where notice_no=#{notice_no}")
	public int delete(int notice_no) throws Exception;
	
	@Select("select count(*) from notice")
	public int noticeCount() throws Exception;
	
	@Select("select * from notice where notice_no=#{notice_no}")
	public Notice selectByNo(int notice_no);
	
}

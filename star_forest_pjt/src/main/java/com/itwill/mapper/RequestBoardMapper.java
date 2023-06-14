package com.itwill.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.RequestBoard;
import com.itwill.util.Criteria;
import com.itwill.domain.BookCategory;

@Mapper
public interface RequestBoardMapper {
	
	public class simpleDateFormatEx {

		   public static void main(String[] args) {
		      Date nowDate = new Date();
		      System.out.println("포맷 지정 전 : " + nowDate);
		      
		        
		      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		           //원하는 데이터 포맷 지정
		      String strNowDate = simpleDateFormat.format(nowDate); 
		           //지정한 포맷으로 변환 
		      System.out.println("포맷 지정 후 : " + strNowDate);
		      
		   }

		}
	//게시물생성
	@Insert("insert into request_board values(#{board_no},#{board_title},\r\n"
			+ "									 sysdate,#{board_content},0,'신청접수',1,0,1,\r\n"
			+ "									 SEQ_REQUEST_BOARD_BOARD_NO.currval,#{category_name},#{user_id})")
	@SelectKey(statement = "select SEQ_REQUEST_BOARD_BOARD_NO.nextval from dual",
	   keyColumn = "board_no",
	   keyProperty = "board_no",
	   before = true,
	   resultType = Integer.class
		)
	public int create(RequestBoard requestBoard);
	@Insert("insert into request_board (board_no,board_title,board_date,board_content,board_readcount,board_status,board_type_no,board_depth,board_step,board_groupno,user_id)values(#{board_no},#{board_title},\r\n"
			+ "									 sysdate,#{board_content},0,#{board_status},0,0,1,\r\n"
			+ "									 SEQ_REQUEST_BOARD_BOARD_NO.currval,#{user_id})")
	@SelectKey(statement = "select SEQ_REQUEST_BOARD_BOARD_NO.nextval from dual",
	   keyColumn = "board_no",
	   keyProperty = "board_no",
	   before = true,
	   resultType = Integer.class
		)
	public int create_notice(RequestBoard requestBoard);
	
	//답글생성
	
	@Insert("insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval ,#{board_title},sysdate,\r\n"
			+ "									 #{board_content},0,#{board_status},1,#{board_depth}+1,#{board_step}+1,\r\n"
			+ "									 #{board_groupno},#{category_name},#{user_id})\r\n")
	public int createReply(RequestBoard requestBoard);
	/*
	@Update("update request_board set board_step = board_step+1 where board_step>#{board_step} and groupno=#{groupno}")
	public int addStep(RequestBoard requestBoard);
	*/
	@Update("update request_board set board_step=board_step+1 where board_step > #{board_step} and board_groupno=#{board_groupno}")
	public int addStep(RequestBoard requestBoard);
	
	//내가 쓴 게시물들 확인
	@Select("select board_title,board_date,board_content,board_status,category_name \r\n"
			+ "	from request_board\r\n"
			+ "	where user_id = #{user_id}")
	public List<RequestBoard> findUserBoard(String user_id);
	
	//게시물 존재 여부  ..?
	@Select("SELECT count(*) FROM request_board WHERE board_groupno = #{board_groupno} AND board_depth > 0 AND board_step > 1 ORDER BY board_step,board_depth ASC")
	public boolean isExisted(int board_groupno);
	
	
	//게시물 삭제(게시판번호)
	@Delete("delete from request_board where board_no=#{board_no}")
	public int delete(int board_no);
	
	//게시물 삭제(게시판 그룹번호)
	@Delete("delete from request_board where board_groupno=#{board_groupno}")
	public int deleteByGroupno(int board_groupno);
	
	//게시물 수정
	
	 @Update("update request_board set board_title=#{board_title}, board_content=#{board_content},board_status=#{board_status},\r\n"
	 + "							 category_name=#{category_name}\r\n" +
	 "							 where board_no=#{board_no}")
	 public int update(RequestBoard requestBoard);
	 
	
	//조회수 증가
	@Update("update request_board set board_readcount = board_readcount+1 \r\n"
			+ "	where board_no=#{board_no}")
	public int addReadCount(int board_no);
	

	
	//게시물 검색 총 갯수
	public int countAll(Criteria cri);
	
	//게시물 상세보기
	@Select("select *\r\n"
			+ "	from request_board\r\n"
			+ "	where board_no=#{board_no}")
	public RequestBoard selectOne(int board_no);
	
	@Select("select *\r\n"
			+ "	from request_board\r\n"
			+ "	where board_groupno=#{board_groupno}")
	public RequestBoard selectBygroupNo(int board_groupno);
	
	//페이지에 있는 게시물 시작번호 / 끝번호
	
	public List<RequestBoard> list(Map map);
	
}
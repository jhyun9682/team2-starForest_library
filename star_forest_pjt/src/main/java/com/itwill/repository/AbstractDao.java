package com.itwill.repository;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

public class AbstractDao {
	
	protected Log log = LogFactory.getLog(AbstractDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String user_id) {
		
		if(log.isDebugEnabled()) {
			log.debug("\t QueryId \t: " + user_id);
		}
		
	}
	 
	@SuppressWarnings("unchecked")
	public Object selectPagingList(String user_id, Object params) {
		printQueryId(user_id);
		Map<String, Object> map = (Map<String, Object>)params;
		
		String strPageIndex = (String)map.get("PAGE_INDEX");
		String strPageRow = (String)map.get("PAGE_ROW");
		int nPageIndex=0;
		int nPageRow=15;
		
		if(StringUtils.isEmpty(strPageIndex) == false){
	        nPageIndex = Integer.parseInt(strPageIndex)-1;
	    }
	    if(StringUtils.isEmpty(strPageRow) == false){
	        nPageRow = Integer.parseInt(strPageRow);
	    }
	    map.put("START", (nPageIndex * nPageRow) + 1);
	    map.put("END", (nPageIndex * nPageRow) + nPageRow);
	    map.put("KEYWORD", (String)map.get("KEYWORD"));
	     
	    return sqlSession.selectList(user_id, map);
	}
	
	
	
	public List<Map<String,Object>> bestGoodsList(String user_id, Object params) { 
		printQueryId(user_id);
		return sqlSession.selectList(user_id,params);
	}
	
	// 최신 상품 리스트
	public List<Map<String,Object>> newGoodsList(String user_id, Object params) { 
		printQueryId(user_id);
		return sqlSession.selectList(user_id,params);
	}

	//장바구니 리스트
	public List<Map<String,Object>> selectList(String user_id, Object params) {
		printQueryId(user_id);
		return sqlSession.selectList(user_id,params);
	}
	//수정
	public Object update(String user_id, Object params) {
		printQueryId(user_id);
		return sqlSession.update(user_id,params);
	}
	//수정2
	public Object update(String user_id) {
		printQueryId(user_id);
		return sqlSession.update(user_id);
	}
	//삭제
	public Object delete(String user_id, Object params) {
		printQueryId(user_id);
		return sqlSession.delete(user_id,params);
	}
	
	/*
	 * public Object selectOne(String queryId, Object params) {
	 * printQueryId(queryId); return sqlSession.selectOne(queryId,params); }
	 */
	
	
		// 특정 레코드 한줄 출력
		public Object selectOne(String user_id) {
			printQueryId(user_id);
			return sqlSession.selectOne(user_id);
		}
		
		// 특정 레코드 한줄 출력
		public Object selectOne(String user_id, Object params) {
			printQueryId(user_id);
			return sqlSession.selectOne(user_id, params);
		}
		
		// 레코드 추가
		public Object insert(String user_id, Object params) {
			printQueryId(user_id);
			return sqlSession.insert(user_id, params);
		}

	

	      
	      
	      
	      
	      
		// 마이 페이지 (메인)
		public List<Map<String,Object>> orderList(String user_id, Object params) { //  
			printQueryId(user_id);
			return sqlSession.selectList(user_id,params);
		}
		
		// 상품명, 상품속성번호
		public List<Map<String,Object>> orderList2(String user_id, Object params) { //  
			printQueryId(user_id);
			return sqlSession.selectList(user_id,params);
		}


		@SuppressWarnings("rawtypes")
		public List selectList(String user_id) {
			printQueryId(user_id);
			return sqlSession.selectList(user_id);
		}
		
		
		@SuppressWarnings("unchecked")
		public Object selectPagingList1(String user_id, Object params){
			printQueryId(user_id);
			Map<String,Object> map = (Map<String,Object>)params;
			
			String strPageIndex = (String)map.get("PAGE_INDEX");
			String strPageRow = (String)map.get("PAGE_ROW");
			int nPageIndex = 0;
			int nPageRow = 20;
			
			if(StringUtils.isEmpty(strPageIndex) == false){
				nPageIndex = Integer.parseInt(strPageIndex)-1;
			}
			if(StringUtils.isEmpty(strPageRow) == false){
				nPageRow = Integer.parseInt(strPageRow);
			}
			map.put("START", (nPageIndex * nPageRow) + 1);
			map.put("END", (nPageIndex * nPageRow) + nPageRow);
			
			return sqlSession.selectList(user_id, map);
		}
		

}

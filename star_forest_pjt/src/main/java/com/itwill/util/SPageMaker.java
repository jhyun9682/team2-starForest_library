package com.itwill.util;


public class SPageMaker {
	public static final int BLOCK_SCALE = 10; //화면당 페이지 수
	private int curPage;    // 현재 페이지
	private int curBlock;   // 현재 페이지 블록
	private int pageBegin;  // #{start}
	private int pageEnd;    // #{end}
	/* 시작 페이지 */
	private int startPage;
	
	/* 끝 페이지 */
	private int endPage;
	
	/* 이전 페이지, 다음 페이지 존재유무 */
	private boolean prev, next;
	
	/*전체 게시물 수*/
	private int total;
	/*전체 페이지 수*/
	private int totPage;
	private int totBlock;
	/* 현재 페이지, 페이지당 게시물 표시수 정보 */
	private SCriteria cri;	
	
	/* 생성자 */
	public SPageMaker(SCriteria cri, int total) {
		this.curBlock = 1;              // 현재 페이지 블록 번호
	    this.curPage = cri.getPageNum();         // 현재 페이지 설정 
		this.cri = cri;
		this.total = total;
		
		this.totPage = (int) Math.ceil(total*1.0 / cri.getAmount());
		this.totBlock = (int)Math.ceil(total / BLOCK_SCALE);
		this.curBlock = (int)Math.ceil((cri.getPageNum()-1) / BLOCK_SCALE)+1;
		
		
	    /* 시작 페이지 */
		this.startPage = (curBlock-1)*BLOCK_SCALE+1;
		/* 마지막 페이지 */
		this.endPage = startPage+BLOCK_SCALE-1;
		
		/* 전체 마지막 페이지 (=총페이지 수 계산)*/
		int realEnd = (int) Math.ceil(total*1.0 / cri.getAmount());
		
		/* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		/* 시작 페이지(startPage)값이 1보다 큰 경우 true */
		this.prev = this.startPage > 1;
		
		/* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
		this.next = this.endPage < realEnd;
		

		pageBegin = (curPage-1)*cri.getAmount()+1;
	    // 끝번호 = 시작번호+페이지당 게시물수 -1
	    pageEnd = pageBegin+cri.getAmount()-1;
	    
		
		
	    
		 System.out.println("***************페이지정보***************");
			System.out.println("01.화면당 페이지 수\t\t:"+BLOCK_SCALE);
			System.out.println("02.한페이지당 게시물 수\t\t:"+cri.getAmount());
			System.out.println("03.현재(요청)페이지번호\t\t:"+cri.getPageNum());
			System.out.println("04.전체게시물수\t\t\t:"+total);
			System.out.println("05.전체페이지수\t\t\t:"+totPage);
			System.out.println("06.현재(요청)페이지블록번호\t:"+curBlock);
			System.out.println("07.현재(요청)페이지블록시작번호\t:"+startPage);
			System.out.println("08.현재(요청)페이지블록끝번호\t:"+endPage);
			System.out.println("11.이전페이지번호\t\t:"+prev);
			System.out.println("12.다음페이지번호\t\t:"+next);
			System.out.println("13.DB에서select할게시물시작번호 :"+pageBegin);
			System.out.println("14.DB에서select할게시물끝번호   :"+pageEnd);
			System.out.println("**************************************");
	
	}
	
	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public SCriteria getCri() {
		return cri;
	}

	public void setCri(SCriteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}

	
	
	


	
	
	
}
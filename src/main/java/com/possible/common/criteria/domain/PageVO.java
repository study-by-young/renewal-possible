package com.possible.common.criteria.domain;

import lombok.Data;

@Data
public class PageVO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;				//전체 레코드 건수
	private Criteria cri;			//pageNum, amount

	public PageVO() {
	}

	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if (realEnd<this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;			//이전페이지있는지
		this.next = this.endPage < realEnd; 	//다음페이지있는지
	}
}

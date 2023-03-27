package com.world.gecko.domain;

import lombok.Data;

@Data
public class PageVo {
	public final static int PER_PAGE_POST = 7;
	private Long count;

	public int getTotalPage() {
		if (this.count == 0) {
			return 1;
		} else if (this.count % PER_PAGE_POST == 0) {
			return (int) (this.count / PER_PAGE_POST);
		} else {
			return (int) (this.count / PER_PAGE_POST) + 1;
		}
	}
}
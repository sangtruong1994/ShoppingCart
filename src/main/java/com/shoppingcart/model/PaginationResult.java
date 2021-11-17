package com.shoppingcart.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.ScrollMode;
import org.hibernate.ScrollableResults;

public class PaginationResult<E> {

	private int totalRecords;

	private int currentPage;

	private List<E> list;

	private int maxResult;

	private int totalPages;

	private int maxNavigationPages;

	private List<Integer> navigationPages;

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public int getMaxResult() {
		return maxResult;
	}

	public void setMaxResult(int maxResult) {
		this.maxResult = maxResult;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getMaxNavigationPages() {
		return maxNavigationPages;
	}

	public void setMaxNavigationPages(int maxNavigationPages) {
		this.maxNavigationPages = maxNavigationPages;
	}

	public List<Integer> getNavigationPages() {
		return navigationPages;
	}

	public void setNavigationPages(List<Integer> navigationPages) {
		this.navigationPages = navigationPages;
	}

	public PaginationResult(Query query, int page, int maxResult, int maxNavigationPage) {
		int pageIndex = page - 1 < 0 ? 0 : page - 1;
		int fromRecordIndex = pageIndex * maxResult;
		int maxRecordIndex = fromRecordIndex + maxResult;

		ScrollableResults resultsScroll = query.scroll(ScrollMode.SCROLL_INSENSITIVE);

		List<E> results = new ArrayList<E>();

		boolean hasResult = resultsScroll.first();
		if (hasResult) {
			hasResult = resultsScroll.scroll(fromRecordIndex);
			if (hasResult) {
				do {
					E record = (E) resultsScroll.get(0);
					results.add(record);
				} while (resultsScroll.next() && resultsScroll.getRowNumber() >= fromRecordIndex
						&& resultsScroll.getRowNumber() < maxRecordIndex);
			}
			resultsScroll.last();
		}
		this.totalRecords = resultsScroll.getRowNumber() + 1;
		this.currentPage = pageIndex + 1;
		this.list = results;
		this.maxResult = maxResult;

		this.totalPages = (this.totalRecords / this.maxResult) + 1;
		this.maxNavigationPages = maxNavigationPage;

		if (maxNavigationPage < this.totalPages) {
			this.maxNavigationPages = maxNavigationPage;
		}
		this.calcNavigationPages();
	}

	private void calcNavigationPages() {

		this.navigationPages = new ArrayList<Integer>();

		int current = this.currentPage > this.totalPages ? this.totalPages : this.currentPage;

		int begin = current - this.maxNavigationPages / 2;
		int end = current + this.maxNavigationPages / 2;

		this.navigationPages.add(1);
		if (begin > 2) {
			this.navigationPages.add(-1);
		}
		for (int i = begin; i < end; i++) {
			if (i > 1 && i < this.totalPages) {
				this.navigationPages.add(i);
			}
		}
		if (end < this.totalPages - 2) {
			this.navigationPages.add(-1);
		}
		this.navigationPages.add(this.totalPages);
	}
}

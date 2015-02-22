package com.hrm.pm;

public class Sorter {
	private SortingStrategy sorter;
	
	public void setSorter(SortingStrategy sorter) {
		this.sorter = sorter;
	}
	
	public SortingStrategy getSorter() {
		return sorter;
	}
}

package com.hrm.pm;

import java.util.Comparator;
import java.util.List;

public class Sorter {
	private SortingStrategy sorter;
	
	public void setSorter(SortingStrategy sorter) {
		this.sorter = sorter;
	}
	
	public <T> void sort(List<T> list, Comparator<? super T> c) {
		sorter.sort(list, c);
	}
}

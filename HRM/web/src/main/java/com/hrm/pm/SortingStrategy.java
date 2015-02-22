package com.hrm.pm;

import java.util.Comparator;
import java.util.List;

public interface SortingStrategy {
	public <T> void sort(List<T> list, Comparator<? super T> c);
}

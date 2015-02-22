package com.hrm.pm;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.ListIterator;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class MergeSort implements SortingStrategy {
	
	public <T> void sort(List<T> list, Comparator<? super T> c) {
		Object[] a = list.toArray();
        Arrays.sort(a, (Comparator)c);
        ListIterator i = list.listIterator();
        for (int j=0; j<a.length; j++) {
            i.next();
            i.set(a[j]);
        }
	}
}
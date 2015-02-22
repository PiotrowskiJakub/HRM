<%@ page import="java.util.*"%>
<%@page import="com.hrm.db.dao.impl.AdminDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%!public static boolean isNumeric(String str) {
		if (str == null || str.isEmpty()) {
			return false;
		} else {
			return str.matches("-?\\d+(\\.\\d+)?"); //match a number with optional '-' and decimal.
		}
}%>

<%
	String time = request.getParameter("time");
	String timeConverted = "";
	boolean isDataLoaded = true;
	
	if(isNumeric(time)) {
		long t = Integer.valueOf(time) * 1000 * 60 * 60;
		timeConverted = Long.toString(t);
	} else {
		isDataLoaded = false;	
	}
%>
    
<jsp:useBean id="formHandler" class="com.hrm.pm.TaskManagement" scope="request">
	<jsp:setProperty name="formHandler" property="*" />
	<jsp:setProperty name="formHandler" property="time" value="<%= timeConverted %>" />
</jsp:useBean>

<%
if(isDataLoaded) {
	Boolean isOperationSuccessful = formHandler.editTask();
	if(isOperationSuccessful) {
		session.setAttribute("getAlert", "No");
		response.sendRedirect("pmTaskPanel.jsp");
	} else {
		session.setAttribute("getAlert", "Yes");
		response.sendRedirect("editTaskPanel.jsp");
	}
} else {
	session.setAttribute("getAlert", "Yes");
	response.sendRedirect("editTaskPanel.jsp");
}
%>
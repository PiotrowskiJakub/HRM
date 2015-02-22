<%@ page import="java.util.*"%>
<%@ page import="com.hrm.db.dao.impl.AdminDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%!public static boolean isNumeric(String str) {
		if (str == null || str.isEmpty()) {
			return false;
		} else {
			return str.matches("-?\\d+(\\.\\d+)?"); //match a number with optional '-' and decimal.
		}
}%>

<%
	String hoursString = request.getParameter("wloHours");
	String minutesString = request.getParameter("wloMinutes");
	String wloTime = "";
	boolean isDataLoaded = true;
	
	if(isNumeric(hoursString) && isNumeric(minutesString)) {
		double hoursInt = Double.valueOf(hoursString) * 1000 * 60 * 60;
		double minutesInt = Double.valueOf(minutesString) * 1000 * 60;
		int time = (int)hoursInt + (int)minutesInt;
		wloTime = Integer.toString(time);
	} else {
		isDataLoaded = false;	
	}
%>

<jsp:useBean id="formHandler" class="com.hrm.pm.WorklogManagement" 
	scope="request">
	<jsp:setProperty name="formHandler" property="*" />
	<jsp:setProperty name="formHandler" property="wloTime" value="<%= wloTime %>" />
</jsp:useBean>
`
<%
if(isDataLoaded) {
	Boolean isOperationSuccessful = formHandler.addWorklog();
	if(isOperationSuccessful) {
		session.setAttribute("getAlert", "No");
		response.sendRedirect("pmTaskPanel.jsp");
	} else {
		session.setAttribute("getAlert", "Yes");
		response.sendRedirect("addWorklogForm.jsp");
	}
} else {
	session.setAttribute("getAlert", "Yes");
	response.sendRedirect("addWorklogForm.jsp");
}
%>
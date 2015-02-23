<%@page import="com.hrm.observer.ActionDone"%>
<%@page import="com.hrm.singleton.Singelton"%>
<%@page import="com.hrm.db.model.User" %>
<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="workLogManager" class="com.hrm.user.WorkLogManager" >
	 <jsp:setProperty name="workLogManager" property="userId" value='<%=(String)request.getParameter("userId")%>'/>
	 <jsp:setProperty name="workLogManager" property="taskId" value='<%=(String)request.getParameter("taskId") %>'/>
	 <jsp:setProperty name="workLogManager" property="hours" value='<%=(String)request.getParameter("hours") %>'/>
	  <jsp:setProperty name="workLogManager" property="minutes" value='<%=(String)request.getParameter("minutes") %>'/>
	 <jsp:setProperty name="workLogManager" property="comment" value='<%=(String)request.getParameter("comment") %>'/>
</jsp:useBean>

<%
System.out.println("minutes: " + (String)request.getParameter("minutes")+ (String)request.getParameter("taskId"));
workLogManager.createEmployeeManager();
workLogManager.createWorkLog();


Singelton.getInstance().dataChanged(workLogManager.getUser(), ActionDone.addWorkLog);

%>
true 

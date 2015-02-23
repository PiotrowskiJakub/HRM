<%@page import="com.hrm.observer.ActionDone"%>
<%@page import="com.hrm.singleton.Singelton"%>
<%@page import="com.hrm.db.model.User" %>
<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="commentHandler" class="com.hrm.user.CommentManager" >
	 <jsp:setProperty name="commentHandler" property="commentValue" value='<%=(String)request.getParameter("commentValue") %>'/>
	 <jsp:setProperty name="commentHandler" property="idTask" value='<%=(String)request.getParameter("idTask") %>'/>
	 <jsp:setProperty name="commentHandler" property="idUser" value='<%=(String)session.getAttribute("userid") %>'/>
</jsp:useBean>

<%
commentHandler.createEmployeeManager();
commentHandler.createComment();
System.out.println((String)request.getParameter("commentValue"));

Singelton.getInstance().dataChanged(commentHandler.getUser(), ActionDone.addComment);
//response.setStatus(200);
// response.getWriter().write("true");
%>
true


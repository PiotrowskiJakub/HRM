<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% 
	switch(Integer.parseInt(request.getParameter("type"))){
	case 1:
		session.setAttribute("userid", request.getParameter("userid"));
		response.sendRedirect("pmpanel.jsp");
		break;
	case 2:
		session.setAttribute("userid", request.getParameter("userid"));
		response.sendRedirect("pmEmployeesPanel.jsp");
		break;
	case 3:
		session.setAttribute("userid", request.getParameter("userid"));
		session.setAttribute("projectid", request.getParameter("projectid"));
		response.sendRedirect("pmProjectPanel.jsp");
		break;
	case 4:
		session.setAttribute("userid", request.getParameter("userid"));
		session.setAttribute("taskid", request.getParameter("taskid"));
		response.sendRedirect("pmTaskPanel.jsp");
		break;
	case 5:
		session.setAttribute("userid", request.getParameter("userid"));
		session.setAttribute("taskid", request.getParameter("taskid"));
		response.sendRedirect("pmpanel.jsp");
		break;
		
	}
%>
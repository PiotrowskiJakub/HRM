<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="formHandler" class="com.hrm.login.CheckLogin"
	scope="request">
	<jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
	if (formHandler.validate()) {
		if (formHandler.checkUser()) {
			if(formHandler.isActive()){
				session.setAttribute("userid", formHandler.getLoginName());
	
				switch(formHandler.getRole()){
				case 1:
					response.sendRedirect("userpanel.jsp");
					break;
				case 2:
					response.sendRedirect("adminpanel.jsp");
					break;
				case 3:
					response.sendRedirect("pmpanel.jsp");
					break;
				default:
					response.sendRedirect("errorpage.jsp");
					break;
				}
			}else{
				response.sendRedirect("index.jsp?active=false");	
			}
	 	} else {
			response.sendRedirect("retryLogin.jsp");
		}
	} else {
		response.sendRedirect("retryLogin.jsp");
	}
%>
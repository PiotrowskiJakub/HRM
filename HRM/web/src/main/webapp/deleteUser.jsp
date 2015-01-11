<%@ page import="java.util.*"%>
<%@page import="com.hrm.db.dao.impl.AdminDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="formHandler" class="com.hrm.admin.UserManagement" scope="request">
<jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>

<%
formHandler.deleteUser();
response.sendRedirect("adminpanel.jsp");
%>
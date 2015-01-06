<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="formHandler" class="com.hrm.login.checkLogin" scope="request">
<jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<% 
   if (formHandler.validate()) {
	 %>
	   <jsp:forward page="doneLogin.jsp"/>
	   <%
   }else{
		%>
	   <jsp:forward page="retryLogin.jsp"/>
   <%
   }
      
%>
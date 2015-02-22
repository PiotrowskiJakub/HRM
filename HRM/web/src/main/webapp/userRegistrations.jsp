<%@page import="com.hrm.admin.ActivityManagement"%>
<%@ page import="java.util.*"%>
<%@page import="com.hrm.db.model.Section, com.hrm.admin.UserManagement, com.hrm.admin.UserRegistration, java.util.List, com.hrm.db.dao.AdminDao, com.hrm.db.model.User, com.hrm.db.model.Role"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
	String userId = "";
	if (session.getAttribute("userid") == null || ((String)session.getAttribute("userid")).equals("")) {
		response.sendRedirect("index.jsp?login=false");	
	} else {
		userId = (String) session.getAttribute("userid");
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wpisy wybranego uzytkownika</title>
<link href="editUserForm.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#score').load('reload-window.jsp').fadeIn("slow");
     }, 1000); // refresh every 5000 milliseconds
</script>

<!-- Changes the opacity of sidebar while menu list is displayed -->
<script>
	function lowOpacity(x) {
		document.getElementById("sidebar").style.opacity = "0.2";
		document.getElementyById("menu").style.position = "absolute";
	}

	function normalOpacity(x) {
		document.getElementById("sidebar").style.opacity = "1.0";
	}
</script>
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#">HRM<sup><font class="uppercase">ADMIN</font></sup></a></h1>
		<h2><div id="score"></div></h2>
	</div>
	<div id="menu">
			<ul>
				<li><a href="#">Strona Startowa</a></li>
				<li onmouseover="lowOpacity()" onmouseout="normalOpacity()"><a href="#">Uzytkownicy</a>
					<ul>
						<li><a href="addUserForm.jsp">Dodaj uzytkownika</a></li>
						<li><a href="userRegistrations.jsp">Sprawdz wpisy uzytkownika</a></li>
					</ul></li>
				<li><a href="#">Zarzadzaj projektami</a></li>
				<li><a href="logout.jsp">Wyloguj</a></li>
			</ul>

			
	</div>
</div>
<!-- end header -->


<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
	
	<form id="formCheck" action="userRegistrations.jsp" method="POST">
		<table>
			<tr>
				<td>Pracownik: </td>
				<td><input type=text name="user" value="Wybierz pracownika" list=users><datalist id=users>
					<%
					UserManagement userManagement = new UserManagement();
					List<User> users = userManagement.getAllUsers();
					for(User usr : users) {
					%>
					<option value="<%=usr.getUsrLogin()%>">
					<% } %></datalist>
				</td>
			</tr>
		</table>
	</form>
	<br />
	<br />
		
	<%
	  String registrationTitle;
	  String registrationContent;
	  boolean isWorklog;
	  ActivityManagement activityManagemenent = new ActivityManagement();
	  List<UserRegistration> registrations = activityManagemenent.getAllUserRegistrations("kuba");
	  System.out.println(registrations.size());
	  for(UserRegistration registr : registrations){
		  registrationTitle = registr.getRegistrationTitle();
		  registrationContent = registr.getContent();%>
		  
		<c:set var="registrationTitle" value="<%= registrationTitle %>" />
		<c:set var="registrationContent" value="<%= registrationContent %>" />

		<t:registration>
		<jsp:attribute name="registrationTitle">
			${registrationTitle}
		</jsp:attribute>
		<jsp:attribute name="registrationContent">
			${registrationContent}
		</jsp:attribute>
		</t:registration>
		<br></br>
	<% } %>	
	</div>
	<!-- end content -->

	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->
<!-- start footer -->
<div id="footer">
	<div class="wrap">
		<div id="fbox1" class="box2">
			<h2><b>COMPANY</b></h2>
			<p><a href="#">Overview</a></p>
			<p><a href="#">About us</a></p>
			<p><a href="#">Contact</a></p>
		</div>
	</div>
</div>
<!-- end footer -->


</body>
</html>
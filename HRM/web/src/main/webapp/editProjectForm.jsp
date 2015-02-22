<%@ page import="java.util.*"%>
<%@page import="com.hrm.admin.ProjectManagement, java.util.List, com.hrm.db.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String userId = "";
	if (session.getAttribute("userid") == null || ((String)session.getAttribute("userid")).equals("")) {
		response.sendRedirect("index.jsp?login=false");	
	} else {
		userId = (String) session.getAttribute("userid");
	}
%>
    
<jsp:useBean id="formHandler" class="com.hrm.admin.ProjectManagement" scope="request">
<jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formularz edycji uzytkownika</title>
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
				<li><a href="adminpanel.jsp">Strona Startowa</a></li>
				<li onmouseover="lowOpacity()" onmouseout="normalOpacity()"><a href="#">Uzytkownicy</a>
					<ul>
						<li><a href="addUserForm.jsp">Dodaj uzytkownika</a></li>
						<li><a href="userRegistrations.jsp">Sprawdz wpisy uzytkownika</a></li>
					</ul></li>
				<li onmouseover="lowOpacity()" onmouseout="normalOpacity()"><a href="#">Zarzadzaj projektami</a>
					<ul>
						<li><a href="allProjectsForm.jsp">Pokaz projekty</a></li>
						<li><a href="addProjectForm.jsp">Dodaj projekt</a></li>
					</ul>
				</li>
				<li><a href="logout.jsp">Wyloguj</a></li>
			</ul>

			
	</div>
</div>
<!-- end header -->

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="editForm">
			<h1>Edytowanie projektu</h1>
			<form id="formCheck" action="editProject.jsp" method="POST">
			<table>
				<tr>
					<td>Nazwa projektu: </td> <td><input type="text" readonly="readonly" name="projectName" value="<%=formHandler.getProjectName() %>"></td>
				</tr>
				<tr>
					<td>Opis: </td> <td> <textarea name="description" rows="10" cols="70" ><%=formHandler.getDecription() %></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:right;"><input type="submit" value="Zapisz" /></td>
				</tr>
			</table>
			</form>
		</div>
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
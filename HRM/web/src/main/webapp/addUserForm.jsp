<%@ page import="java.util.*"%>
<%@page import="com.hrm.db.model.Section, com.hrm.admin.UserManagement, java.util.List, com.hrm.db.dao.AdminDao, com.hrm.db.model.User, com.hrm.db.model.Role"%>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formularz dodawania uzytkownika</title>
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
			<h1>Nowy uzytkownik</h1>
			<form id="formCheck" action="addUser.jsp" method="POST">
			<table>
				<tr>
					<td>Login: </td> <td><input type="text" name="loginName"></td>
				</tr>
				<tr>
					<td>Imie: </td> <td> <input type="text" name="name"></td>
				</tr>
				<tr>
					<td>Nazwisko: </td> <td> <input type="text" name="surname"/></td>
				</tr>
				<tr>
					<td>E-mail: </td> <td> <input type="text" name="email"/></td>
				</tr>
				<tr>
					<td>Pracuje jako:</td><td><input type=text name="role" list=roles><datalist id=roles>
					<%
					UserManagement userManagement = new UserManagement();
				 	List<Role> roles = userManagement.getAllRoles();
				 	for(Role role : roles) {
				 	%>
						<option value="<%=role.getRolName()%>">
					<% } %></datalist></td>
				</tr>
				<tr>
					<td>Dzial:</td><td><input type=text name="section" list=sections><datalist id=sections>
					<%
				 	List<Section> sections = userManagement.getAllSection();
				 	for(Section section : sections) {
				 	%>
						<option value="<%=section.getSecName()%>">
					<% } %></datalist></td>
				</tr>
				<tr>
					<td>Przelozony:</td><td><input type=text name="boss" value="Brak" list=bosses><datalist id=bosses>
					<%
				 	List<User> bosses = userManagement.getAllUsers();
				 	for(User boss : bosses) {
				 	%>
						<option value="<%=boss.getUsrLogin()%>">
					<% } %></datalist></td>
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
</div>
<!-- end footer -->


</body>
</html>
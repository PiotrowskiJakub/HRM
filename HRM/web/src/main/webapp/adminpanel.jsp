<%@page import="com.hrm.db.dao.impl.AdminDaoImpl"%>
<%@page import="com.hrm.admin.UserManagement, java.util.List, com.hrm.db.dao.AdminDao, com.hrm.db.model.User"%>
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
<title>Panel administratora</title>
<link href="admin.css" rel="stylesheet" type="text/css" />

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
					</ul>
				</li>
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

<div id="page">
	<!-- start content -->
	<div id="content">
				<table title="users">
				  <tr>
				    <th>Login</th>
				    <th>Imie</th> 
				    <th>Nazwisko</th>
				    <th>E-mail</th>
				    <th>Sektor</th> 
				    <th>Rola</th>
				    <th>Przelozony</th>
				    <th>Data utworzenia</th> 
				    <th>Stan konta</th>
				    <th></th>
				    <th></th>
				    
				  </tr>
				  <%
					UserManagement userManagement = new UserManagement();
				 	List<User> users = userManagement.getAllUsers();
				 	String boss;
				 	for(User usr : users) {
				 		if(usr.getUser() != null){
				 			boss = usr.getUser().getUsrName() + " " + usr.getUser().getUsrSurname();
				 		} else{
				 			boss = "Prezes";
				 		}
				 	%>
					  <tr>
					    <td><%=usr.getUsrLogin() %></td>
					    <td><%=usr.getUsrName() %></td> 
					    <td><%=usr.getUsrSurname() %></td>
					    <td><%=usr.getUsrEmail() %></td>
					    <td><%=usr.getSection().getSecName() %></td>
					    <td><%=usr.getRole().getRolName() %></td>
					    <td><%=boss %></td>
					    <td><%=usr.getUsrDateCreation().toString() %></td>
					    <%if(usr.isUsrActive()){%>
					    	<td><form id="formCheck" action="changeUserStatus.jsp" method="POST"><input type="hidden" name="loginName" value="<%=usr.getUsrLogin() %>"><input type="submit" name="submit" value="Aktywne" /></form></td>
					   	<%}else{ %>
					   		<td><form id="formCheck" action="changeUserStatus.jsp" method="POST"><input type="hidden" name="loginName" value="<%=usr.getUsrLogin() %>"><input type="submit" name="submit" value="Nieaktywne" /></form></td>
					    <% } %>
					    <td><form id="formCheck" action="editUserForm.jsp" method="POST"><input type="hidden" name="loginName" value="<%=usr.getUsrLogin() %>"><input type="submit" name="submit" value="Edytuj" /></form></td>
					    <td><form id="formCheck" action="deleteUser.jsp" method="POST"><input type="hidden" name="loginName" value="<%=usr.getUsrLogin() %>"><input type="submit" name="submit" value="Usun" /></form></td>
					  </tr>
					<% } %>
				</table>
	</div>
	<p id="demo"></p>
	<!-- start sidebar 
	<div id="sidebar">
		<ul>
			<li id="search">
				<form method="get" action="">
					<fieldset>
					<input type="text" id="s" name="s" value="" />
					<input type="submit" id="x" value="Szukaj" />
					</fieldset>
				</form>
			</li>
			<li>
				<h2><b>Twoje zadania</b></h2>
				<ul>
					<li><a href="#">HRM-132</a> Zadanie 1</li>
					<li><a href="#">HRM-236</a> Zadanie 2</li>
					<li><a href="#">HRM-52</a> Zadanie 3</li>
					<li><a href="#">HRM-564</a> Zadanie 4</li>
					<li><a href="#">HRM-122</a> Zadanie 5</li>
					<li><a href="#">HRM-345</a> Zadanie 6</li>
					
				</ul>
			</li>
		</ul>
	</div>
	end sidebar -->
	<div style="clear: both;">&nbsp;</div>
 </div>
 
 <!-- start footer -->
<div id="footer">
	<div class="wrap">
		<div id="fbox1" class="box2">
			<h2><b>PRODUCTS</b></h2>
			<p><a href="#">HRM</a></p>
			<p><a href="#">HRM Service Desk</a></p>
			<p><a href="#">Data Center</a></p>
			<p><a href="#">Marketplace</a></p>
		</div>
		<div id="fbox2" class="box2">
			<h2><b>RESOURCES</b></h2>
			<p><a href="#">Help</a></p>
			<p><a href="#">Premier Support</a></p>
			<p><a href="#">Purchasing FAQ</a></p>
			<p><a href="#">Documentation</a></p>
			<p><a href="#">Downloads</a></p>
		</div>
		<div id="fbox2" class="box2">
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
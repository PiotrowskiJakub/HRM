<%@page import="com.hrm.admin.UserManagement, java.util.List, com.hrm.db.dao.AdminDao, com.hrm.db.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
				<li><a href="#">Strona Startowa</a></li>
				<li onmouseover="lowOpacity()" onmouseout="normalOpacity()"><a href="#">Zarz&#261;dzaj</a>
					<ul>
						<li><a href="#">Drupal</a></li>
						<li><a href="#">WordPress</a></li>
						<li><a href="#">Concrete 3</a></li>
						<li><a href="#">Concrete 4</a></li>
						<li><a href="#">Concrete 5</a></li>
						<li><a href="#">Concrete 6</a></li>
						<li><a href="#">Concrete 7</a></li>
						<li><a href="#">Concrete 8</a></li>
						<li><a href="#">Concrete 9</a></li>
						<li><a href="#">Concrete 10</a></li>
						<li><a href="#">Concrete 11</a></li>
						<li><a href="#">Concrete 12</a></li>
						<li><a href="#">Concrete 13</a></li>
					</ul></li>
					<li><a href="#">Moje Projekty</a></li>
			</ul>

			
		</div>
</div>
<!-- end header -->

<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="post">
			<div class="entry">
				<table title="users" style="width:100%">
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
				    
				  </tr>
				  <%
					UserManagement userManagement = new UserManagement();
				 	List<User> users = userManagement.show();
				 	String login, email;
				 	for(User usr : users) {
				 		login = usr.getUsrLogin();
				 		email = usr.getUsrEmail();
				 	%>
					  <tr>
					    <td><%=usr.getUsrLogin() %></td>
					    <td><%=usr.getUsrName() %></td> 
					    <td><%=usr.getUsrSurname() %></td>
					    <td><%=usr.getUsrEmail() %></td>
					    <td><%=usr.getSection().getSecName() %></td>
					    <td><%=usr.getRole().getRolName() %></td>
					    <td><%=usr.getUser().getUsrName() + " " + usr.getUser().getUsrSurname() %></td>
					    <td><%=usr.getUsrDateCreation().toString() %></td>
					    <%if(usr.isUsrActive()){%>
					    	<td><button type="button">Aktywne</button></td>
					   	<%}else{ %>
					   		<td><button type="button">Nieaktywne</button></td>
					    <% } %>
					    <td><img src="images/admin/edit.png" alt="Edit" style="width:30px;height:30px"></td>
					    <td><img src="images/admin/delete.png" alt="Delete" style="width:30px;height:30px"></td>
					  </tr>
					<% } %>
				</table>
			</div>
		</div>
	</div>
	
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
<%@page import="com.hrm.db.dao.impl.AdminDaoImpl"%>
<%@page import="com.hrm.admin.ProjectManagement, java.util.List, com.hrm.db.dao.AdminDao, com.hrm.db.model.Project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	//String userId = "";
	//if (session.getAttribute("userid") == null || ((String)session.getAttribute("userid")).equals("")) {
	//	response.sendRedirect("index.jsp?login=false");	
	//} else {
	//	userId = (String) session.getAttribute("userid");
	//}
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

<div id="page">
	<!-- start content -->
	<div id="content">
				<table title="users">
				  <tr>
				    <th>Nazwa Projektu</th>
				    <th>Opis </th>  
				    <th>Status</th>
				    <th></th>
				    <th></th>
				    
				  </tr>
				  <%
				  	ProjectManagement projectManagement = new ProjectManagement();
				 	List<Project> projects = projectManagement.getAllProjects();
				 	for(Project proj : projects) {
				 		
				 	%>
					  <tr>
					    <td><%=proj.getPrjName() %></td>
					    <td><%=proj.getPrjDescription() %></td> 
					    <%if(proj.getPrjFinished()){%>
					    	<td><form id="formCheck" action="changeProjectStatus.jsp" method="POST"><input type="hidden" name="projectName" value="<%=proj.getPrjName() %>"><input type="submit" name="submit" value="Zakonczone" /></form></td>
					   	<%}else{ %>
					   		<td><form id="formCheck" action="changeProjectStatus.jsp" method="POST"><input type="hidden" name="projectName" value="<%=proj.getPrjName() %>"><input type="submit" name="submit" value="Trwa" /></form></td>
					    <% } %>
					    <td><form id="formCheck" action="editProjectForm.jsp" method="POST"><input type="hidden" name="projectName" value="<%=proj.getPrjName() %>"><input type="submit" name="submit" value="Edytuj" /></form></td>
					    <td><form id="formCheck" action="deleteProject.jsp" method="POST"><input type="hidden" name="projectName" value="<%=proj.getPrjName() %>"><input type="submit" name="submit" value="Usun" /></form></td>
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
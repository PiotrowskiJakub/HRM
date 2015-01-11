<%@ page import="java.util.*"%>
<%@page import="com.hrm.db.model.Section, com.hrm.admin.UserManagement, java.util.List, com.hrm.db.dao.AdminDao, com.hrm.db.model.User, com.hrm.db.model.Role"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="formHandler" class="com.hrm.admin.UserManagement" scope="request">
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

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="editForm">
			<h1>Edytowanie uzytkownika</h1>
			<form id="formCheck" action="editUser.jsp" method="POST">
			<table>
				<tr>
					<td>Login: </td> <td><input type="text" readonly="readonly" name="loginName" value="<%=formHandler.getLoginName() %>"></td>
				</tr>
				<tr>
					<td>Imie: </td> <td> <input type="text" name="name" value="<%=formHandler.getName() %>"></td>
				</tr>
				<tr>
					<td>Nazwisko: </td> <td> <input type="text" name="surname" value="<%=formHandler.getSurname() %>" /></td>
				</tr>
				<tr>
					<td>E-mail: </td> <td> <input type="text" name="email" value="<%=formHandler.getEmail() %>" /></td>
				</tr>
				<tr>
					<td>Pracuje jako:</td><td><input type=text name="role" value="<%=formHandler.getRole() %>" list=roles><datalist id=roles>
					<%
					UserManagement userManagement = new UserManagement();
				 	List<Role> roles = userManagement.getAllRoles();
				 	for(Role role : roles) {
				 	%>
				 	if(formHandler.getEmai)
						<option value="<%=role.getRolName()%>">
					<% } %></datalist></td>
				</tr>
				<tr>
					<td>Dzial:</td><td><input type=text name="section" value="<%=formHandler.getSection() %>" list=sections><datalist id=sections>
					<%
				 	List<Section> sections = userManagement.getAllSection();
				 	for(Section section : sections) {
				 	%>
						<option value="<%=section.getSecName()%>">
					<% } %></datalist></td>
				</tr>
				<tr>
					<td>Przelozony:</td><td><input type=text name="boss" value="<%=formHandler.getBoss() %>" list=bosses><datalist id=bosses>
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
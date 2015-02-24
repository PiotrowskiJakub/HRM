<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.hrm.DAOFactory"%>
<%@ page import="java.io.*,java.text.*,java.util.*,com.hrm.pm.UserProjectsManagement,com.hrm.db.model.Project,
com.hrm.db.model.Task, com.hrm.db.model.Comment, com.hrm.db.model.TaskPriority, com.hrm.db.model.WorkLog,
com.hrm.db.model.User,com.hrm.DAOFactory, com.hrm.db.dao.ProjectManagerDao;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
	String userId = "";
	String projectId = (String) session.getAttribute("projectid");
	if (session.getAttribute("userid") == null || ((String)session.getAttribute("userid")).equals("")) {
		response.sendRedirect("index.jsp?login=false");	
	} else {
		userId = (String) session.getAttribute("userid");
	}
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>HRM</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="pm.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="JS/pmGeneralFunctions.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker();
	});
	
	var Msg ='<%=session.getAttribute("getAlert")%>';
	if (Msg == "Yes") {
		alert("Niepoprawne dane, operacja przerwana."); 
		<% session.setAttribute("getAlert", "No"); %>
	}
</script>


</head>
<body>

<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#">hrm<sup>PM</sup></a></h1>
		<h2><div id="score"></div></h2>
	</div>
	<div id="menu">
			<ul>
				<c:url value="selectPMPanel.jsp" var="mainUrl">
							<c:param name="type" value="1" />
							<c:param name="userid" value="<%= userId %>" />
				</c:url>
				<li><a href="${mainUrl}">Strona Startowa</a></li>
				<c:url value="selectPMPanel.jsp" var="employeesUrl">
							<c:param name="type" value="2" />
							<c:param name="userid" value="<%= userId %>" />
				</c:url>
				<li><a href="${employeesUrl}">Pracownicy</a></li>
				<li>
					<a href="#">Twoje projekty</a>
					<ul>
						<% UserProjectsManagement uspm = new UserProjectsManagement(userId);
						   List<Project> projects = uspm.getUserProjects();
						   String prjName;
						   String textDecoration;
						   for(Project project : projects) {
						   		prjName = project.getPrjName();
						   		if(project.getPrjFinished()) {
						   			textDecoration = "text-decoration: line-through;";
						   		} else {
						   			textDecoration = "text-decoration: none;";
						   		}				   		
						   %>
						<c:url value="selectPMPanel.jsp" var="projectUrl">
							<c:param name="type" value="3" />
							<c:param name="projectid" value="<%= prjName %>" />
							<c:param name="userid" value="<%= userId %>" />
						</c:url>
						<li><a href="${projectUrl}"><font style="<%= textDecoration %>">
							<%= prjName %></font></a></li>
						<% } %>
					</ul></li>
					<li><a href="logout.jsp">Wyloguj</a></li>
			</ul>

			
		</div>
</div>
<!-- end header -->

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
			<div class="post">
				<h1 class="title"><%= projectId %> Dodaj zadanie</h1>
				<div class="editForm">
					<form id="formCheck" action="addTask.jsp" method="POST">
						<table>
							<tr>
								<td>Nazwa:</td><td><input type=text name="name">
							</tr>
							<tr>
								<td>Wykonuje:</td><td>
								<select name="assignee" form="formCheck">
								<%
									ProjectManagerDao pmDao = DAOFactory.getProjectManagerDAO();
									User user = pmDao.getUser(userId);
									%><option value=<%= user.getUsrLogin() %>><%= user.getUsrName()+" "+user.getUsrSurname() %></option> <%
									Set<User> users = pmDao.getUser(user.getUsrLogin()).getUsers();
									for(User u : users) {
										%><option value=<%= u.getUsrLogin() %>><%= u.getUsrName()+" "+u.getUsrSurname() %></option> <%
									}
								%>
								</select></td>
							</tr>
							<tr>
								<td>Priorytet:</td><td>
								<select name="priority" form="formCheck">
									<option value="low">Niski</option>
									<option value="medium">&#346;redni</option>
									<option value="high">Wysoki</option>
								</select></td>
							</tr>
							<tr>
								<td>Status:</td><td>
								<select name="status" form="formCheck">
									<option value="0">W trakcie realizacji</option>
									<option value="1">Zamkni&#281;ty</option>
								</select></td>
							</tr>
							<tr>
								<td>Przeznaczony czas:
								(w godzinach)</td><td><input type=text name="time">
							</tr>
							<tr>
								<td>Opis:</td>
								<td>
									<textarea name="description" form="formCheck"></textarea>
								</td>
							</tr>
							<input type=hidden name="creator" value="<%= user.getUsrLogin() %>"></input>
							<tr>
								<td colspan="2" style="text-align: right;"><input
									type="submit" value="Zapisz" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	<!-- end content -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->

<div id="footer"></div>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.io.*,java.text.*,java.util.*,com.hrm.pm.UserProjectsManagement,com.hrm.db.model.Project,
 com.hrm.admin.UserManagement, java.util.List, com.hrm.db.dao.AdminDao, 
 com.hrm.db.model.User, com.hrm.db.dao.ProjectManagerDao, com.hrm.DaoInitializer,
 com.hrm.db.model.Task" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%!
private String getTimeOutput(int tskTime) {
	String result = "";
	int minutes = (int) ((tskTime / (1000*60)) % 60);
	int hours   = (int) ((tskTime / (1000*60*60)) % 24);
	int days   = (int) ((tskTime / (1000*60*60*24)));
	int weeks   = (int) ((tskTime / (1000*60*60*24*7)));
	
	if(weeks > 0) {
		result += weeks + "w ";
	} if(days > 0) {
		result += days + "d ";
	} if(hours > 0) {
		result += hours + "h ";
	} if(minutes > 0) {
		result += minutes + "min ";
	}
	
	return result;
}
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>HRM</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="pm.css" rel="stylesheet" type="text/css" />
<%
	String userId = "";
	String login = "";
	String name = "";
	String surname = "";
	if (session.getAttribute("userid") == null || ((String)session.getAttribute("userid")).equals("")) {
		response.sendRedirect("index.jsp?login=false");	
	} else {
		userId = (String) session.getAttribute("userid");
		login = (String) request.getParameter("login");
		name = (String) request.getParameter("name");
		surname = (String) request.getParameter("surname");
	}
%>

<!-- Display current time script -->
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#score').load('reload-window.jsp').fadeIn("slow");
     }, 1000); // refresh every 5000 milliseconds
</script>

<!-- Row in table as link -->
<script type="text/javascript">
	jQuery(document).ready(function($) {
	    $(".clickableRow").click(function() {
	          window.document.location = $(this).attr("href");
	    });
	});
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
			<div class="entry">
				<h2 style="color:green">
					<%= name + " " + surname %>
				</h2><br><br>
				<p>
					<table>
					<thead>
					<tr>
						<th><b>Nazwa zadania:  </b></th>
						<th><b>Osoba odpowiedzialna:  </b></th>
						<th><b>Przeznaczony czas:</b></th>	
					</tr>
						</thead>
						<tbody>
						<%
						ProjectManagerDao pmDao = DaoInitializer.getDao(ProjectManagerDao.class);
						User user = pmDao.getUser(login);
						Set<Task> tasks = user.getTasksForTskUsrWorkerId();
									
						for(Task t : tasks) {
							String nazwa = t.getNazwa();
							String assignee = t.getUserByTskUsrWorkerId().getUsrName();
							String time = getTimeOutput(t.getTskTime());
						%>
						<c:url value="selectPMPanel.jsp" var="taskUrl">
							<c:param name="type" value="4" />
							<c:param name="taskid" value="<%= nazwa %>" />
							<c:param name="userid" value="<%= userId %>" />
						</c:url>
						<tr class='clickableRow' href="${taskUrl}">
							<td><%= nazwa %></td>
							<td><%= assignee %></td>
							<td><%= time %></td>
						</tr>		
						<% } %>
					</tbody>
				</table>
				</p>
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

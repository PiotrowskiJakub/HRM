<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.io.*,java.text.*,java.util.*,com.hrm.pm.UserProjectsManagement,com.hrm.db.model.Project,
com.hrm.db.model.Task, com.hrm.db.model.Comment, com.hrm.db.model.TaskPriority, com.hrm.db.model.WorkLog,
com.hrm.db.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%!
private String getTimeOutput(double tskTime) {
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

<%
	String userId = "";
	String taskId = (String) session.getAttribute("taskid");
	SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy HH:mm:ss");
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
				<li><a href="${employeesUrl}">Zarz&#261;dzaj</a></li>
				<li onmouseover="lowOpacity()" onmouseout="normalOpacity()">
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
				<%
				Task task = uspm.getTask(taskId);
				String description = task.getTskDescription();
				Set<Comment> comments = task.getComments();
				Set<WorkLog> worklogs = task.getWorkLogs();
				User reporter = task.getUserByTskUsrLeaderId();
				User assignee = task.getUserByTskUsrWorkerId();
				Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String taskCreation = formatter.format(task.getTskCreationDate());
				TaskPriority tskPrio = task.getTaskPriority();
				String finished;
				if(task.getTskFinished()) {
					finished = "Zamkni&#281;ty";
				} else {
					finished = "W trakcie realizacji";
				}
				String timeLeft = getTimeOutput(task.getTskTime());
			%>
				<h1 class="title"><%= taskId %> dodaj zapis pracy</h1>
				<div class="editForm">
					<form id="formCheck" action="addWorklog.jsp" method="POST">
						<table>
							<input type="hidden" name="wloUser"><%= userId %></input>
							<input type="hidden" name="wloTask"><%= taskId %></input>
							<tr>
								<td>Ile czasu:</td>
								<td><input type="text" name="wloTime"></td>
							</tr>
							<tr>
								<td>Data rozpocz&#281;cia:</td>
								<td><input type="text" id="datepicker" name="wloDate"></input></td>
							</tr>
							<tr>
								<td>Komentarz:</td>
								<td><input type="text" name="wloComment"></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: right;"><input
									type="submit" value="Dodaj" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	<!-- end content -->
	
	<!-- start sidebar -->
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
	<!-- end sidebar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->

<div id="footer"></div>
</body>
</html>

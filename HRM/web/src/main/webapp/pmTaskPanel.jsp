<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.io.*,java.text.*,java.util.*,com.hrm.pm.UserProjectsManagement,com.hrm.db.model.Project,
com.hrm.db.model.Task, com.hrm.db.model.Comment, com.hrm.db.model.TaskPriority, com.hrm.db.model.WorkLog,
com.hrm.db.model.User"%>
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
	String taskId = (String) session.getAttribute("taskid");
	if (session.getAttribute("userid") == null || ((String)session.getAttribute("userid")).equals("")) {
		response.sendRedirect("index.jsp?login=false");	
	} else {
		userId = (String) session.getAttribute("userid");
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
		<h1><a href="#">HRM<sup><font class="uppercase">PM</font></sup></a></h1>
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
			<h1 class="title"><font style="text-transform: capitalize;"><%= taskId %></font></h1>
			<c:url value="selectPMPanel.jsp" var="editTaskUrl">
							<c:param name="type" value="5" />
							<c:param name="userid" value="<%= userId %>" />
							<c:param name="taskid" value="<%= taskId %>" />
			</c:url>
			<a href="${editTaskUrl}">
				<button>Edytuj</button>
			</a>
			<div class="entry">
				<h2 style="color:green">Detale</h2><br>
				<ul id ="limheight" style="list-style-type:none">
					<li><font face="Impact">Utworzy&#322;:</font></li>
					<li><%= reporter.getUsrLogin() %></li>
					
					<li><font face="Impact">Wykonuje:</font></li>
					<li><%= assignee.getUsrLogin() %></li>
				</ul>
				<ul id ="limheight" style="list-style-type:none">
					<li><font face="Impact">Data utworzenia:</font></li>
					<li><%= taskCreation %></li>
					
					<li><font face="Impact">Priorytet:</font></li>
					<li><%= tskPrio.getTprCode() %></li>
				</ul>
				<ul id ="limheight" style="list-style-type:none">
					<li><font face="Impact">Status:</font></li>
					<li><%= finished %></li>
					
					<li><font face="Impact">Przeznaczony czas:</font></li>
					<li><%= timeLeft %></li>
				</ul>
			</div>
			<h2 class="withup" style="color:green">Opis</h2>
			
			<div class="entry">
				<p><%= description %></p>
			</div>
			<ul class="tabs">
		        <li>
		          <input type="radio" checked name="tabs" id="tab1">
		          <label for="tab1">Komentarze</label>
		          <div id="tab-content1" class="tab-content animated fadeIn">
		    		...
		          </div>
		        </li>
		        <li>
		          <input type="radio" name="tabs" id="tab2">
		          <label for="tab2">Zapis pracy</label>
		          <div id="tab-content2" class="tab-content animated fadeIn">
		            ...
		          </div>
		        </li>
			</ul>
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

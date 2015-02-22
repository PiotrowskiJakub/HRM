<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.io.*,java.text.*,java.util.*,com.hrm.pm.UserProjectsManagement,com.hrm.db.model.Project,
 com.hrm.admin.UserManagement, java.util.List, com.hrm.db.dao.AdminDao, 
 com.hrm.db.model.User, com.hrm.db.dao.ProjectManagerDao, com.hrm.DaoInitializer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>HRM</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="pm.css" rel="stylesheet" type="text/css" />
<%
	String userId = "";
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
					HRM &mdash; Human Resource Management
				</h2><br><br>
				<p>
					<table>
					<thead>
						<tr>
							<th><b>Imie:  </b></th>
							<th><b>Nazwisko:  </b></th>
						</tr>
					</thead>
					<tbody>
					<%
						ProjectManagerDao pmDao = DaoInitializer.getDao(ProjectManagerDao.class);
						User user = pmDao.getUser(userId);
						Set<User> users = user.getUsers();
						for(User u : users) {
				          String login = u.getUsrLogin();
				          String name = u.getUsrName();
				          String surname = u.getUsrSurname();
						  %>
						  		<c:url value="pmUserPanel.jsp" var="userUrl">
									<c:param name="login" value="<%= login %>" />
									<c:param name="name" value="<%= name %>" />
									<c:param name="surname" value="<%= surname %>" />
								</c:url>
								<tr class='clickableRow' href="${userUrl}">
									<td><%= name %></td>
									<td><%= surname %></td>
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

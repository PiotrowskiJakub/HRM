<%@page import="com.hrm.db.model.UserLog"%>
<%@page import="com.hrm.db.model.WorkLog"%>
<%@page import="com.hrm.db.dao.EmployeeDao"%>
<%@page import="com.hrm.singleton.Singelton"%>
<%@page import="com.hrm.observer.ObserverManager"%>
<%@page import="com.hrm.observer.Observer"%>
<%@page import="com.hrm.observer.ObserverUser"%>
<%@page import="com.hrm.db.model.Comment"%>
<%@page import="java.util.Date"%>
<%@page import="com.hrm.db.model.Task"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="com.hrm.user.EmployeeManager"%>
<%@page import="com.hrm.admin.UserManagement, java.util.List, com.hrm.db.dao.AdminDao, com.hrm.db.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Panel uzytkownika</title>
<link href="css/user.css" rel="stylesheet" type="text/css" />
<style type="text/css">
tr:hover {    background: #47A9BC !important; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">

	function showUp(userName, userSurname, actionCode){
		$("#message_content.message").empty().append("User: " + userName + " " + userSurname + "was " + actionCode);
		$("#message_content").show();
	}
     var auto = setInterval(    function ()
     {
          $('#score').load('reload-window.jsp').fadeIn("slow");
     }, 1000); // refresh every 5000 milliseconds
     
</script>

</head>
<body>

<!--  initialize EmployeeManager -->
<%



String userId;
EmployeeManager employeeManager = null;

if ((userId = (String)session.getAttribute("userid")) != null && !userId.equals("")) {
	employeeManager = new EmployeeManager((String)session.getAttribute("userid"));
	
}else{
	%>
	<jsp:forward page="index.jsp?login=false" />
	<%
}

if(employeeManager == null){
	%>
	<jsp:forward page="index.jsp?login=false" />
	<%
	}


%>

<div id="loader" style="display: none; position:absolute; top: 0; left: 0; z-index: 100; background-color: rgba(0,0,0,0.6); width:100%; height:500%;">
<img style="position:absolute; margin-top:200px; right:48%; height:100px; width:100px" src="images/loader.gif" width="100" height="100" />
</div>



<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#">HRM</a></h1>
		<h2><div id="score"></div></h2>
	</div>
	<div id="menu">
			<ul>
				<li><a href="index.jsp">Strona Startowa</a></li>
				<li><a href="workLogsUser.jsp">Work logs. </a></li>
				<li><a href="showLogs.jsp">Wszystkie Logs</a></li>
				<li><a href="logout.jsp">Wyloguj się</a></li>
			</ul>

			
		</div>
</div>
<!-- end header -->

<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="left">
		<table border="1" cellspacing="2" cellpadding="2">
		<tr>
		<td>ID</td>
		<td>Nazwa zadania</td>
		<td>Czas trwania</td>
		<td>Komentarz</td>
		<td>Data</td>
		</tr>
		
		<% 
		int key = 1;
		for (WorkLog currentWorkLog : employeeManager.getAllWorkLogs()){ %>
		<tr <% if(key % 2 == 0){ %> style="background-color: #777777"<%}else{ %> style="background-color: #B2B2B2"<% } %> >
		<td><%=key++ %></td>
		<td><%=currentWorkLog.getTask().getNazwa() %></td>
		<td><%=currentWorkLog.getWloTime()%></td>
		<td><%=currentWorkLog.getWloComment() %></td>
		<td><%=currentWorkLog.getWloDate()%></td>
		</tr>
			
		<% } %>
		</table>		
		
		</div>
		 
		<div class="right account">		
				<div class="title">Moje konto:</div>
				<hr style="border:solid 1px #bcbcbc; margin: 0 7px;"/>
				
				<div class="avatar_board">
					<div class="avatar">
						<img src="images/avatars/user.png" />
					</div>
					
					<div class="details">
						<div class="name"><%=employeeManager.getFullName()%></div>
						<div class="email"><a href="mailto:<%=employeeManager.getEmail()%> "><%=employeeManager.getEmail()%></a></div>
						<div class="logout"><a href="logout.jsp">Wyloguj sie</a></div>
					</div>
				</div>
				<div style="clear:both">&nbsp;</div>
				
				<div class="title">Moje otwarte zadania:</div>
				<hr style="border:solid 1px #bcbcbc; margin: 0 7px;"/>
				
				<div class="task_sidebar">
				<%
				
				for(Map.Entry<String,Integer[]> task_info : employeeManager.getAllTitlesTask()){
									
				%>
					<p class="task_sidebar_description">
						<span class="task_sidebar_title"><%=task_info.getKey() %></span>
						<span class="task_sidebar_time"><%=employeeManager.getTimeString(task_info.getValue()[1]) %></span>
					</p>
					<p class="task_amount"><%=task_info.getValue()[0] %></p>
					<div style="clear:both">&nbsp;</div>		
				<% } %>
				</div>
				
			
		</div>
			<div style="height:500px;">&nbsp;</div>
		
	</div>
	
	<!-- start sidebar -->
	
	<!-- end sidebar -->
	<div style="clear: both;">&nbsp;</div>
 </div>
 
 <!-- start footer -->
<div id="footer">
	<div class="wrap">
		
	</div>
</div>
<!-- end footer -->
</body>
</html>

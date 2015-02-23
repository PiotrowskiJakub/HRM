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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.io.*,java.text.*,java.util.*" %>
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
		result += minutes + "m ";
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
<link href="css/user.css" rel="stylesheet" type="text/css" />
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



	$( window ).load(function() {
	    $( "form#addWorkLog" ).submit(function( event ) {
	    	 
	    	 event.preventDefault();
	    	  var $form = $( this ),
	    	    user = $form.find( "input[name='userId']" ).val(),
	    	    task = $form.find( "input[name='taskId']" ).val(),
	    	    hours = $form.find( "input[name='hours']" ).val(),
	    	    minutes = $form.find( "input[name='minutes']" ).val(),
	    	    comment = $form.find( "input[name='comment']" ).val();
	    	    
	    	    
	    	  if ($.isNumeric(hours) && $.isNumeric(minutes)){
				
	    		  $("#loader").show();
	    	  var posting = $.post( 'addWorkLogUser.jsp', { userId: user, taskId:task, hours:hours, minutes:minutes, comment:comment} );
	    	  posting.done(function( data ) {
		    	  console.log("wyslalo sie");
		    	  $("#loader").hide();
		    	  $form.empty().append('<span style="text-align:center; width:500px;">Work log zostal dodany do bazy!</span>');	     
		    	  
		      });
			 }else{
	  			alert("minuty lub godziny nie sa liczba calkowita!!");
	  		}
	    	  return false;
	    	});
	    

    	
	});
     
</script>



</head>
<body>
<!--  initialize EmployeeManager -->
<%



ObserverManager observerInstance = Singelton.getInstance();

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

ObserverUser observer = new ObserverUser(observerInstance,employeeManager.getUser()); 


%>


<div id="loader" style="display: none; position:absolute; top: 0; left: 0; z-index: 100; background-color: rgba(0,0,0,0.6); width:100%; height:500%;">
<img style="position:absolute; margin-top:200px; right:48%; height:100px; width:100px" src="images/loader.gif" width="100" height="100" />
</div>

<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#">hrm<sup>USER</sup></a></h1>
		<h2><div id="score"></div></h2>
	</div>
	<div id="menu">
			<ul>
				<li><a href="index.jsp">Strona Startowa</a></li>
				<li><a href="workLogsUser.jsp">Work logs. </a></li>
				<li><a href="logout.jsp">Wyloguj się</a></li>
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
				String taskId = "";
				Integer taskIdInt = 0;
				taskId = (String)request.getParameter("idtask");
				if(taskId == null || taskId.equals("")){
				%>
					<jsp:forward page="index.jsp?login=false" />
				<%
				}else{
					taskIdInt = Integer.parseInt(taskId);
				}
				Task currentTask = employeeManager.getCurrentTask(taskIdInt);
					
				
			%>
				<h1 class="title"><%= taskId %> dodaj zapis pracy</h1>
				<div class="editForm">
					<form id="addWorkLog"  method="post">
						<table>
							<tr>
								<td>U&#380;ytkownik:</td>
								<td><%=employeeManager.getUser().getUsrName() + " " + employeeManager.getUser().getUsrSurname() %></td>
								<input type="hidden" name="userId" value="<%= userId %>" />
							</tr>
							<tr>
								<td>Zadanie:</td>
								<td><input type="hidden" name="taskId" value="<%= taskId %>"/> 
								<%=currentTask.getNazwa() %>
								</td>
							</tr>							
							<tr>
								<td>Liczba godzin:</td>
								<td><input type="text" name="hours"></td>
							</tr>
							<tr>
								<td>Liczba minut:</td>
								<td><input type="text" name="minutes"></td>
							</tr>
							<tr>
								<td>Komentarz:</td>
								<td><input type="text" name="comment"></td>
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
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->

<div id="footer"></div>
</body>
</html>

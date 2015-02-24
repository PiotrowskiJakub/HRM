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


	$(document).ready(function(){
		function lowOpacity(x) {
			document.getElementById("sidebar").style.opacity = "0.2";
			document.getElementyById("menu").style.position = "absolute";
		}

		function normalOpacity(x) {
			document.getElementById("sidebar").style.opacity = "1.0";
		}
	    $(".comments_hidden").hide();

	    $("div.show_more_comments").click(function(){
	    	
		    $(this).toggleClass("active").next().slideToggle("slow");
    	});
    	
	    $("#close_button").click(function(){
        	$("#message_content").hide();
        });
	    $("button#close_button").click(function(){
        	$("#message_content").hide();
        	location.reload();
        });
        
    });

	$( window ).load(function() {
	    $( "form#addComment" ).submit(function( event ) {
	    	 console.log("dziala?");
	    	 $("#loader").show();
	    	 event.preventDefault();
	    	  var $form = $( this ),
	    	    commentValueForm = $form.find( "input[name='commentValue']" ).val(),
	    	    idTaskForm = $form.find( "input[name='idTask']" ).val();
	    	    
	    	 
	    	  var posting = $.post( 'addCommentUser.jsp', { idTask: idTaskForm, commentValue:commentValueForm} );
	    	  posting.done(function( data ) {
		    	  console.log("wyslalo sie");
		    	  $("#loader").hide();
		    	  $form.empty().append('<span style="text-align:center; width:500px;">Komenatrz został dodany</span>');	     
		    	  
		      });
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
		<h1><a href="#">HRM<sup><font class="uppercase">USER</font></sup></a></h1>
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
		<div class="left task">
			
			<select>
				<option>Wszystkie zadania</option>
      			<option>Zadania w toku</option>
      			<option>Zrealizowane zadania</option>
   			</select>
   			<div class="clear" style="height: 10px;"></div>
   			
   			
   			<% for(Task currentTask : employeeManager.getAllTasks()){ 
   						%>
   			
   				
   			
   		
   			<!-- task container -->
   			<div class="main_task">
   				<div class="main_task_avatar"><img src="images/avatars/user.png" /></div>
   				<div class="main_task_description">
   					<div class="main_task_description_who"><%=currentTask.getUserByTskUsrLeaderId().getUsrName() + " " + currentTask.getUserByTskUsrLeaderId().getUsrSurname() %> 
   					<%
   					Date dataTask = currentTask.getTskCreationDate();
   					String dataString = dataTask.getDay() + "/" + (dataTask.getMonth()+1) + "/" + (dataTask.getYear()+ 1900) + " " + dataTask.getHours() + ":" + dataTask.getMinutes();
   					out.println(dataTask);
   					%></div>
   					<div class="main_task_description_desc"><a href="addWorkLogUserForm.jsp?idtask=<%=currentTask.getTskId()%>" title="addWorkLog"><%=currentTask.getNazwa() %></a></div>
   					<div class="main_task_description"><%=currentTask.getTskDescription() %></div>
   				</div>
   				<div class="main_task_icon">
   				
   				<% if(currentTask.getTskFinished()){ %>
   				<img src="images/task/task_done.png" />
   				<% }else{ %>
   				<img src="images/task/task_undone.png" />
   				<% } %>
   				</div>
   				
   				<div class="clear" style="height: 10px"></div>
   				<% Set<Comment> comments = employeeManager.getAllComentsToTask(currentTask.getTskId()); %>
   				
   				<% if(comments.size() > 1 ){ %>
   				<div class="show_more_comments">
   					<div class="how_much"><%=(comments.size() - 1)%> komentarzy wiecej</div>
   					<div class="show right tigger"><a>pokaz <img src="images/task/more.png" /></a></div>
   				</div>
   				<% } %>
   				
   				<div class="comments_hidden" >
   						<% 
   						int last = 0;
   						for (Comment currentComment : comments){
   							
   							if(last == comments.size() - 1 ){
   							
   						%>
   						
   						
   						<div class="clear"></div>
   						</div>
   						<div class="comments">
   						<div class="comment">
			   				<div class="comment_avatar"><img src="images/avatars/user.png" width="35" height="35" /></div>
			   				<div class="comment_description">
			   					<div class="comment_who"><%= currentComment.getUser().getUsrName() + " " + currentComment.getUser().getUsrSurname() %>
			   					<%=currentComment.getComDate() %>
			   					</div>
			   					<div class="comment_description_desc">
			   						<%=currentComment.getComComment() %> 
			   					</div>
			   				</div>
	   					</div>
	   					
   						<%		
   							}else{
   						%>
   						<div class="comment">
			   				<div class="comment_avatar">
			   				<% if(currentComment.getUser().getRole().getRolId() == 1){ %>
			   				<img src="images/avatars/user.png" width="35" height="35" />
			   				<% }else if(currentComment.getUser().getRole().getRolId() == 2){ %>
			   				<img src="images/avatars/user.png" width="35" height="35" />
			   				<% }else if(currentComment.getUser().getRole().getRolId() == 3){ %>
			   				<img src="images/avatars/user.png" width="35" height="35" />
			   				<% } %>
			   				</div>
			   				<div class="comment_description">
			   					<div class="comment_who"><%= currentComment.getUser().getUsrName() + " " + currentComment.getUser().getUsrSurname() %>
			   					<%=currentComment.getComDate() %>
			   					</div>
			   					<div class="comment_description_desc">
			   						<%=currentComment.getComComment() %> 
			   					</div>
			   				</div>
		   				</div>
		   				
		   				<div class="clear"></div>
		   				
		   				<%
   								
   							}
   							last++;
   						
   						}
   						
   						%>
   						
   				</div>
   				
   				<div class="clear"></div>
   				
   				<div class="add_comment">
   				<form id="addComment" method="post">
	   				<input type="text" value="Wpisz komentarz..." 
						onclick="if(this.value=='Wpisz komentarz...'){this.value=''}" 
	   					onblur="if(this.value==''){this.value='Wpisz komentarz...'}" name="commentValue" id="comment_value"/>
   					<input type="hidden" name="idTask" id="id_task" value="<%=currentTask.getTskId()%>" />
   					<input type="submit" style="background-image: url('images/task/send_comment.png'); width:33px; height: 23px; "  value =""/>
   				</form>
   				</div>
   			
		</div>
		<div class="clear" style="height:27px;"></div>
		<!-- end task container -->
		
			<% } %>
			
	
		
		
		
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
						<div class="logout"><a href="logout.jsp">Wyloguj się</a></div>
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

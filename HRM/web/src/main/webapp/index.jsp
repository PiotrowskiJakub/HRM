<%@page import="com.hrm.login.CheckLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login to HRM</title>
<link href="default.css" rel="stylesheet" type="text/css" />

<%
	String userId;
    if ((userId = (String)session.getAttribute("userid")) != null &&  userId != "") {
    	CheckLogin login = new CheckLogin();
    	login.setLoginName(userId);
    	switch(login.getRole()){
		case 1:
			response.sendRedirect("userpanel.jsp");
			break;
		case 2:
			response.sendRedirect("adminpanel.jsp");
			break;
		case 3:
			response.sendRedirect("pmpanel.jsp");
			break;
		default:
			response.sendRedirect("errorpage.jsp");
			break;
		}			
    }
    
    String errMsg = "";
    
    if (request.getParameter("logout") != null) {
      errMsg = "Zostałeś wylogowany!";
    } 
    if (request.getParameter("login") != null) {
        errMsg = "Nie jesteś zalogowany, zaloguj się, aby oglądać zawartość strony.";
    } 
    
%>

</head>
<body>

<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#">HRM<sup>Login</sup></a></h1>
		<h2>Human Resource Management</h2>
	</div>
	
</div>
<!-- end header -->

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
		<div class ="errorMsg" >
		<%=errMsg%>
		</div>
		<div class="login">
			<h1>Login</h1>
			<form id="formCheck" action="check_login.jsp" method="POST">
			<table>
				<tr>
					<td>Nazwa: </td> <td><input type="text" name="loginName"></td>
				</tr>
				<tr>
					<td>Hasło: </td> <td> <input type="password" name="password" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:right;"><input type="submit" value="Submit" /></td>
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
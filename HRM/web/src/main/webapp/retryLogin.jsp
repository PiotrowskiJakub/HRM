<jsp:useBean id="formHandler" class="com.hrm.login.CheckLogin" scope="request"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login to HRM</title>
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body>

<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#">HRM<sup>1.0</sup></a></h1>
		<h2>Human Resource Management</h2>
	</div>
	
</div>
<!-- end header -->

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="login">
			<h1>Login</h1>
			
			<form action="check_login.jsp" method="POST">
			<table>
				<tr>
				<td colspan="2"><span class="error"><%=formHandler.getErrorMsg("badLoginPassword")%></span></td>
				<tr>
					<td>User name: </td> <td><input type="text" name="loginName" value='<%=formHandler.getLoginName()%>' 
					<% if (!formHandler.isValid("loginName")) %> class = "errorInput" />
					<br /> 
					<span class="error"><%=formHandler.getErrorMsg("loginName")%></span>
					</td>
				</tr>
				<tr>
					<td>Password: </td> <td> <input type="password" name="password" 
					<% if (!formHandler.isValid("password")) %> class = "errorInput" /><br />
					<span class="error"><%=formHandler.getErrorMsg("password")%></span>
					</td>
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
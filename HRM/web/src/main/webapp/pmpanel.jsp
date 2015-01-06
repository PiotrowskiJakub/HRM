<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.io.*,java.text.*,java.util.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>HRM</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="csspm.css" rel="stylesheet" type="text/css" />

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
				<li><a href="#">Strona Startowa</a></li>
				<li><a href="#">Zarz&#261;dzaj</a></li>
				<li onmouseover="lowOpacity()" onmouseout="normalOpacity()"><a href="#">Twoje projekty</a>
					<ul>
						<li><a href="#">Drupal</a></li>
						<li><a href="#">WordPress</a></li>
						<li><a href="#">Concrete 3</a></li>
						<li><a href="#">Concrete 4</a></li>
						<li><a href="#">Concrete 5</a></li>
						<li><a href="#">Concrete 6</a></li>
						<li><a href="#">Concrete 7</a></li>
						<li><a href="#">Concrete 8</a></li>
						<li><a href="#">Concrete 9</a></li>
						<li><a href="#">Concrete 10</a></li>
						<li><a href="#">Concrete 11</a></li>
						<li><a href="#">Concrete 12</a></li>
						<li><a href="#">Concrete 13</a></li>
					</ul></li>
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
					<font class="uppercase">HRM &mdash; </font><font class="capitalize">Human Resource Management</font>
				</h2><br><br>
				<p>
					Witamy na stronie Project Managera!<br>
					Aplikacja Human Resource Management zosta&#322;a napisana przez student&#243;w Akademii G&#243;rniczo-Hutniczej 
					<br>na Wydziale Elektrotechniki, Automatyki, Informatyki i In&#380;ynierii Biomedycznej,
					na potrzeby <br>przedmiotu "Wprowadzenie do wzorc&#243;w projektowych" prowadzonego przez
					dr. Rafa&#322;a Mr&#243;wk&#281;.<br><br>
					Autorzy:
					<ul>
						<li>Batko Sebastian</li>
						<li>Hopek Konrad</li>
						<li>Jasi&#324;ski Przemys&#322;aw</li>
						<li>Piotrowski Jakub</li>
					</ul>
				</p>
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

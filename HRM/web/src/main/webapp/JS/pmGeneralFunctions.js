/**
 * Display current time script
 */
var auto = setInterval(function() {
	$('#score').load('reload-window.jsp').fadeIn("slow");
}, 1000); // refresh every 5000 milliseconds

/**
 * Display dynamic tabs
 * @param tab
 */
function tab(tab) {
	document.getElementById('tab1').style.display = 'none';
	document.getElementById('tab2').style.display = 'none';
	document.getElementById('li_tab1').setAttribute("class", "");
	document.getElementById('li_tab2').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
	document.getElementById('li_' + tab).setAttribute("class", "active");
}

/**
 * Changes the opacity of sidebar while menu list is displayed
 * @param x
 */
function lowOpacity() {
	document.getElementById("sidebar").style.opacity = "0.2";
	document.getElementyById("menu").style.position = "absolute";
}

function normalOpacity() {
	document.getElementById("sidebar").style.opacity = "1.0";
}
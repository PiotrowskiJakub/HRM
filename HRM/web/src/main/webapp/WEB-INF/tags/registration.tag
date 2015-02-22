<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="registrationTitle" fragment="true"%>
<%@attribute name="registrationContent" fragment="true"%>
<html>
<head>
<style>
#body1 {
	color:#555;
    border-radius:10px;
    font-family:Tahoma,Geneva,Arial,sans-serif;
    font-size:11px;
    padding:10px 10px 10px 36px;
    margin-left : 10px;	
    margin-right : 10px;
    background:#A9BCF5;
	overflow: hidden;
}

#div1 {
	color:#555;
    border-radius:10px;
    font-family:Tahoma,Geneva,Arial,sans-serif;
    font-size:11px;
    padding:10px 10px 10px 36px;
    margin-left : 10px;	
    margin-right : 10px;
    background:#D8D8D8;
	overflow: hidden;
}

#div2 {
	color:#555;
    border-radius:10px;
    font-family:Tahoma,Geneva,Arial,sans-serif;
    font-size:11px;
    padding:10px 10px 10px 36px;
    margin-left : 10px;	
    margin-right : 10px;
    background:#D8D8D8;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="body1">
		<div id="div1">
			<jsp:invoke fragment="registrationTitle" />
		</div>
		<br />
		<div id="div2">
			<jsp:invoke fragment="registrationContent" />
		</div>
	</div>
</body>
</html>
<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="createDate" fragment="true"%>
<%@attribute name="user" fragment="true"%>
<%@attribute name="text" fragment="true"%>
<%@attribute name="id" fragment="true"%>
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
    background:#e9ffd9;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="pageheader">
		<jsp:invoke fragment="user" />
		<jsp:invoke fragment="createDate" />
	</div>
	<div id="body1">
		<jsp:invoke fragment="text" />
	</div>
</body>
</html>
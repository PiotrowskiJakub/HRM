<%@page contentType="text/html" import="java.util.Date, java.text.SimpleDateFormat" %>
<font size="1">
<% SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy HH:mm:ss"); %>
<%= sdf.format(new Date()) %>
</font>
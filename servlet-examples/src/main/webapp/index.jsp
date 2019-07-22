<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello JSP!</title>
</head>
<body>
	<h1>Hello JSP!</h1>
	<%
		List l = new ArrayList();
		for (int i = 0; i < 10; i++) {
	%>
			<div>Hello World! <%= i %></div>
	<%
		}
	%>
</body>
</html>
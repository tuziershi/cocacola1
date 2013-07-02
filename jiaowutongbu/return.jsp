<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	response.setHeader("cache-control", "no-cache");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader("Expires", -10);

	String login = (String)session.getAttribute("login");
	if(login==null || !login.equals("yes"))
	{
		response.sendRedirect("login.jsp");
		return;
	}
	
	session.removeAttribute("login");
	session.removeAttribute("name");
	response.sendRedirect("login.jsp");
%>

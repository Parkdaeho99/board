<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.model1.dao.UserDAO" %>
<%@ page import="javax.naming.*" %>
<%
	session.invalidate();
	out.println("<script>");
	out.println("location.href='main.jsp'");
	out.println("</script>");
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.model1.dao.UserDAO" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="com.test.model1.vo.User" scope="page"/>
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPassword" />
<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserId(), user.getUserPassword());
	if (result == 1) {
		session.setAttribute("userId", user.getUserId());
		out.println("<script>");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	} else if (result == 0) {
		out.println("<script>");
		out.println("alert('비밀번호가 틀렸습니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else if (result == -1) {
		out.println("<script>");
		out.println("alert('아이디가 존재하지 않습니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else if (result == -2) {
		out.println("<script>");
		out.println("alert('데이터베이스 오류가 발생했습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	
	userDAO.udClose();
%>
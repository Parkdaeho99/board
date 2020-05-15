<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.model1.dao.BbsDAO" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="com.test.model1.vo.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle" param="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" param="bbsContent" />
<%
	bbs.setUserID((String)session.getAttribute("userId"));
	
	BbsDAO bbsDAO = new BbsDAO();
	int result = bbsDAO.write(bbs.getBbsTitle(), bbs.getBbsContent(), bbs.getUserID());
	if (result != -1) {
		out.println("<script>");
		out.println("location.href='bbs.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('글쓰기 오류입니다. 관리자에게 문의바랍니다.')");
		out.println("history.back()");
		out.println("</script>");
	} 
	System.out.println("페이지 이동했는데 왜 실행됩니까?");
	bbsDAO.bdClose();
%>
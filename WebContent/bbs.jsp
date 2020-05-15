<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.test.model1.dao.BbsDAO, com.test.model1.vo.Bbs, java.util.Vector" %>
<%
	request.setCharacterEncoding("UTF-8");
	BbsDAO bbsDAO = new BbsDAO();	
	int pageNumber = 1;
	
	if (request.getParameter("pageNumber") != null)
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	Vector<Bbs> list = bbsDAO.getList(pageNumber);
%>
<!DOCTYPE HTML>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />

<title>메인페이지</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="main.jsp">메인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="bbs.jsp">게시판<span
							class="sr-only">(current)</span></a>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 접속하기 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<% if(session.getAttribute("userId") == null) { %>
						<a class="dropdown-item" href="login.jsp">로그인 </a>
					<% } else { %>
						<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
					<% } %>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="join.jsp">회원가입</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container pt-3">
		<div class="row">
			<table class="table table-striped text-center table table-bordered">
				<thead class="thead-dark">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Bbs bbs : list) {
						out.println("<tr>");
						out.println("<td>"+bbs.getBbsId()+"</td>");
						out.println("<td>"+bbs.getBbsTitle()+"</td>");
						out.println("<td>"+bbs.getUserID()+"</td>");
						out.println("<td>"+bbs.getBbsDate()+"</td>");
						out.println("</tr>");
					}
				%>
				</tbody>
			</table>
		</div>
		<a href="write.jsp" class="btn btn-primary float-right" id="writeBtn"> 글쓰기</a>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
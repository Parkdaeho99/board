<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("userId")==null) {
		out.println("<script>");
		out.println("alert('로그인이 필요한 서비스입니다.')");
		out.println("location.href='bbs.jsp'");
		out.println("</script>");
	}
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
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped text-center table-borderd">
					<thead class="thead-light">
						<tr>
							<th>게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 내용" name="bbsTitle" maxlength="50"/></td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="65535" style="height: 350px; resize:none;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<a href="bbs.jsp" class="btn btn-primary float-left">목록</a>
				<button type="submit" class="btn btn-primary float-right">글쓰기</button>
			</form>
		</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
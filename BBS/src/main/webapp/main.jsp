<!-- 메인페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href ="css/bootstrap.css">
<link rel="stylesheet" href ="css/custom.css">
 
<title>JSP 웹사이트 게시판</title>
</head>
	<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String) session.getAttribute("userID");
	}
	%>
						<%@include file ="header.jsp" %>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
			<h1>웹 사이트 소개</h1>
			<p>이 웹 사이트는 부트스트랩으로 만든 jsp 웹사이트 입니다. 최소한의 로직으로만 개발했습니다. 디자인 템플릿으로는 부트스트랩을 이용했습니다.</p>
			<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
	
			</div>
		</div>
	</div>
						<%@include file ="footer.jsp" %>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>

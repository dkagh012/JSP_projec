<!-- 게시판 목록 페이지-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %> <!--게시판의 목록출력 -->

<link rel="stylesheet" href ="css/custom.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href ="css/bootstrap.css">
 
<title>JSP 웹사이트</title>
<style type="text/css">
 a, a:hover{
 	color: #000000;
 	text-decoration : none;
 }
</style>
</head>
	<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String) session.getAttribute("userID");
	}
	 int pageNumber = 1;	
	 if(request.getParameter("pageNumber")!= null)
		 	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));	
	%>
										<%@include file ="header.jsp" %>
	<div class"container">
	 <div class="row">
	 	<table class="table table-striped" style="text-align: center; border: 1px solid #dddd">
	 		<thead>
	 			<tr>
	 				<th style="background-color : # eeee; text-align: center;">번호</th>
	 				<th style="background-color : # eeee; text-align: center;">제목</th>
	 				<th style="background-color : # eeee; text-align: center;">작성자</th>
	 				<th style="background-color : # eeee; text-align: center;">작성일</th>
	 			</tr>
	 		</thead>
	 		<tbody>
	 		<%
	 		BbsDAO bbsDAO = new BbsDAO();
	 		ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
	 		for(int i=0; i < list.size(); i++){
	 		int bbsId= list.get(i).getBbsID();
	 		%>
	 			<tr>
	 				<td><%= bbsId %></td>
	 				<td><a href="view.jsp?bbsID=<%= bbsId %>"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>" ) %></a></td>
	 				<td><%= list.get(i).getUserID() %></td>
	 				<td><%=list.get(i).getBbsDate().substring(0, 11)+ list.get(i).getBbsDate().substring(11, 13)+ "시" + list.get(i).getBbsDate().substring(14, 16)+"분"%></td>

	 				</tr>
	 			<%
	 		} 
	 			%>
	 		</tbody>
	 		</table>
	 		<%
	 		if(pageNumber !=1){
	 			 %>
 				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class ="btn btn-success btn-arraw-left" > 이전</a>
 			 <%
 			}if(bbsDAO.nextPage(pageNumber+1)){
	 		 %>
	 		 <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class ="btn btn-success btn-arraw-left" >다음</a>
 			
	 		 <%
 			}
	 		 %>
	 		<a href="write.jsp" class="btn btn-primary pull-right"> 글쓰기</a>
	 </div>
	</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>

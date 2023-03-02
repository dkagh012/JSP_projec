<!--게시판 글 보는 페이지-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="file.FileDAO" %>
<%@ page import="file.FileDTO" %>
<%@ page import="java.io.File"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
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
	int bbsID = Integer.parseInt(request.getParameter("bbsID"));
	//int bbsID=0;
	//if(request.getParameter("BbsID") != null){
	//bbsID= Integer.parseInt(request.getParameter("bbsID"));
	//}
	if(bbsID ==0 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}

	Bbs bbs= new BbsDAO().getBbs(bbsID);


	%>
		    <%
        String directory = "C:\\Users\\광태예슬\\git\\JSP_projec\\BBS\\src\\main\\webapp\\bbsUpload";
        int maxSize = 1024 * 1024 * 100;
        String encoding = "UTF-8";

        MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
            new DefaultFileRenamePolicy());

        Enumeration fileNames = multipartRequest.getFileNames();
        while (fileNames.hasMoreElements()) {
            out.write("저장되는 경로(실제 서버) : " + directory + "<br>");

            String parameter = (String) fileNames.nextElement();
            String fileName = multipartRequest.getOriginalFileName(parameter);
            String fileRealName = multipartRequest.getFilesystemName(parameter);

            new FileDAO().upload(fileName, fileRealName);
        }
    %>
		
								<%@include file ="header.jsp" %>
	<div class="container">
	 <div class="row"> 
	 <table class="table table-striped" style="text-align: center; border: 1px solid #dddd">
	 		<thead>
	 			<tr>
	 				<th colspan="3" style="background-color : # eeee; text-align: center;">게시판 글보기</th>
 
	 			</tr>
	 		</thead>
	 			<tbody>			
	 				 	<tr>
	 		
	 					<td>글 제목</td>
	 					<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>" ) %></td>
	 				</tr> 
	 				<tr>	 				
	 					<td> 작성자 </td>
	 					<td colspan="2"><%=bbs.getUserID() %></td>
	 				</tr>	 				
	 				<tr>
	 					<td> 작성일자 </td>
	 					<td colspan="2"><%=bbs.getBbsDate().substring(0, 11)+ bbs.getBbsDate().substring(11, 13)+ "시" + bbs.getBbsDate().substring(14, 16)+"분"%></td>
	 				</tr>
	 				
					<tr>
	 				
	 					<td> 내용 </td>
	 					<td colspan="2" style="height:200px; text-align: left;" ><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>" ) %></td>
	  					<img src=<%= FileDAO.getFileRealName() %>>
	  				</tr>
	  				
	  				 
	 			</tbody>
	 		</table>
	 		<a href="bbs.jsp" class="btn btn-primary"> 목록</a>
	 		<%
	 			if(userID != null && userID.equals(bbs.getUserID())){
	 		%>
	 			<a href="update.jsp?bbsID=<%= bbsID %>" class= "btn btn-primary">수정	</a>	 			
	 			<a onclick="return confirm('정말로 삭제하시겠습니까?')"href="deleteAction.jsp?bbsID=<%= bbsID %>" class= "btn btn-primary">삭제 </a>	 			
	 		
	 		<%
	 			}
	 		%> 
	 </div>
	</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>

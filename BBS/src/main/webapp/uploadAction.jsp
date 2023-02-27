<%@ page import="java.io.File"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/custom.css">
<title>JSP 웹사이트 게시판</title>
</head>
<body>
	<%
	String directory = application.getRealPath("bbsUpload");
	int maxSize = 1024 * 1024 * 100 ; 
	String encoding = "UTF-8";
	
	MultipartRequest multipartRequest
	=new MultipartRequest(request, directory, maxSize , encoding , new DefaultFileRenamePolicy());
	
	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealName = multipartRequest.getOriginalFileName("file");
	
	new FileDAO().upload(fileName,fileRealName);
	out.write("파일명:" + fileName + "<br>");
	out.write("실제파일명:" + fileRealName + "<br>");
	%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/custom.css">
<title>JSP 웹사이트 게시판</title>
</head>
<body>
	<from action="uploadAction.jsp" method="post"encType="multipart/form-data"> 
		파일 : <input type="file" name="file"> <br>
	<input type="submit" value="업로드"> </from>
</body>
</html>

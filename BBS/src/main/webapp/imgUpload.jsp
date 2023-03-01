<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 이미지 업로드 폼</title>
</head>
<body>
	<h2>JSP이미지 업로드</h2>
	<form action="uploadAction.jsp" method="post"
		enctype="multipart/form-data">
		이미지 : <input type="file" name="file1"><br> 
		이미지 : <input type="file" name="file2"><br> 
		이미지 : <input type="file" name="file3"><br> 
		<input type="submit" value="submit">
	</form>


</body>
</html>

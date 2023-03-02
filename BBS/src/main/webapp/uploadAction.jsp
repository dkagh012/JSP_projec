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
<title>File Upload Action</title>
</head>
<body>
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
            out.write("파일명:" + fileName + "<br>");
            out.write("실제파일명:" + fileRealName + "<br>");
        }
    %>
    <h1>테스트</h1>
</body>
</html>
<!--header  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  <title>Document</title>
</head>

<body>
  <div class="header">
    <header>
      <div class="headerArea container">
        <div class="logo">
          <a href="main.jsp">
            <img src="images/logo.png" alt="">
          </a>
        </div>
        <ul class="headerList">
          <li><a href="main.jsp">HOME</a></li>
          <li><a href="bbs.jsp">NEWS</a></li>
          <li><a>COMMUNITY</a></li>
          <li><a>ART</a></li>
          <li><a>CONTACT US</a></li>
        </ul>
        <%
				if(userID ==null){
					
			%>
        <div class="headerLogin notLogin">
          <button type="button" onClick="location.href='login.jsp'" class="LoginBtn">로그인/회원가입</button>
        </div>
        <%
      }else{
    %>
        <div class="headerLogin Login">
          <div class="Userarm">
            <i class="xi-bell-o"></i>
            <span>0</span>
          </div>
          <div class="UserProfile">
            <img src="images/profile.png" alt="">
          </div>
        </div>
        <%
      }
    %>
      </div>
    </header>
  </div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="digitalSign.*" import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >
<meta charset="UTF-8">
<title>DigitSign Complete</title>
</head>
<body>
	<div class="center">
		<%
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "file/download";
			
			File plainTxt = new File("/Users/aylee/Documents/DigitalSignature/src/main/webapp/file/upload/plain.txt");
			File privKey = new File("/Users/aylee/Documents/DigitalSignature/src/main/webapp/file/upload/private.key");
			
			DigitSign sig = new DigitSign();
			sig.sign(plainTxt, privKey, path);
		%>
		<h1>전자서명을 만들었습니다!</h1>
		전자서명 이름은 <b>sig</b>입니다<br>
		<a href='http://localhost:8080/DigitalSignature/download.jsp?filename=sig&orgfilename=sig'><button class="button">전자서명 저장</button></a>
		<br><br>
		<a href='main.jsp'><button class="button">메인화면으로 이동</button></a>
	</div>
</body>
</html>
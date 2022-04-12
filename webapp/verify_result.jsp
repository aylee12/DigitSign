<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="digitalSign.*" import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify Complete</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="center">
		<%
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "file/download";
			
			DigitSign receiver = new DigitSign();
			
			File pubkey = new File("/Users/aylee/Documents/DigitalSignature/src/main/webapp/file/upload/public.key");
			File plaintxt = new File("/Users/aylee/Documents/DigitalSignature/src/main/webapp/file/upload/plain.txt");
			File sig = new File("/Users/aylee/Documents/DigitalSignature/src/main/webapp/file/upload/sig");
			
			boolean result = receiver.verify(plaintxt, sig, pubkey);
			if (result) {
		%>
		<h1>서명이 일치합니다!</h1>
		<%
			}else{
		%>
		<h1>서명이 불일치합니다!</h1>
		<%
			}
		%>
		<a href='main.jsp'><button class="button">메인화면으로 이동</button></a>
	</div>
</body>
</html>
<%@page import="java.security.KeyPair"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="digitalSign.*" import="java.io.File" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>sender</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="center">
		<div class="inner">
			<form method="post" action="sender.jsp">
				키가 없으신가요?<br>
				<input type="hidden" name="download">
				<input class="button" type="submit" value="키 만들기">
			</form>	
			<%
				if (request.getParameter("download") != null) {
					String root = request.getSession().getServletContext().getRealPath("/");
					String path = root + "file/download";
					MyKeyPair keyPair = new MyKeyPair();
					keyPair = keyPair.getInstance(1024);
					keyPair.createKeys();
					keyPair.saveKeyPair(path, keyPair);
			%>
			<br><br>키를 만들었습니다!<br>
			&#x2757;개인키 이름은 <b>private.key</b>, 공개키 이름은 <b>public.key</b>입니다.<br>
			<a href='http://localhost:8080/DigitalSignature/download.jsp?filename=private.key&orgfilename=private.key'><button class="button">개인키 저장</button></a>
			<a href='http://localhost:8080/DigitalSignature/download.jsp?filename=public.key&orgfilename=public.key'><button class="button">공개키 저장</button></a>
			<%
				} 
			%>
		</div>
		
		<div class="inner">
			<form method="post" name="sender" action="upload.jsp" enctype="multipart/form-data">
				<div class="filebox">
					<p>전자서명을 생성할 <b>평문</b> 파일을 선택해주세요.</p>
					<input type="file" id="file1" name="plaintxt" onchange="document.getElementById('filename1').value = this.value;">
					<input id="filename1" value="선택된 파일 없음">
					<input type="button" class="file_button" onclick="document.getElementById('file1').click();" value="파일 선택">
				
					<p>전자서명에 사용할 <b>개인키</b> 파일을 선택해주세요.</p>
					<input type="file" id="file2" name="prikey" onchange="document.getElementById('filename2').value = this.value;">
					<input id="filename2" value="선택된 파일 없음">
					<input type="button" class="file_button" onclick="document.getElementById('file2').click();" value="파일 선택">
				</div>
				<input type="hidden" name="from" value="sender">
				<input class="button" type="submit" value="전자서명 생성"> <input type="reset" class="button" value="초기화">
			</form>
			<a href='main.jsp'><button class="button" class="footer">메인화면으로 이동</button></a>
		</div>
	</div>
</body>
</html>
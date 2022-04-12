<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receiver</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="center">
		<h1>전자서명 검증</h1>
		<form method="post" name="reveiver" action="upload.jsp" enctype="multipart/form-data">
			<div class="filebox">
				<p>검증에 사용할 <b>평문</b> 파일을 선택해주세요.</p>
				<input type="file" id="file1" name="plaintxt" onchange="document.getElementById('filename1').value = this.value;">
				<input id="filename1" value="선택된 파일 없음">
				<input type="button" class="file_button" onclick="document.getElementById('file1').click();" value="파일 선택">
				
				<p>검증에 사용할 <b>공개키</b> 파일을 선택해주세요.</p>
				<input type="file" id="file2" name="priKey" onchange="document.getElementById('filename2').value = this.value;">
				<input id="filename2" value="선택된 파일 없음">
				<input type="button" class="file_button" onclick="document.getElementById('file2').click();" value="파일 선택">
				
				<p>검증에 사용할 <b>전자서명</b> 파일을 선택해주세요.</p>
				<input type="file" id="file3" name="sig" onchange="document.getElementById('filename3').value = this.value;">
				<input id="filename3" value="선택된 파일 없음">
				<input type="button" class="file_button" onclick="document.getElementById('file3').click();" value="파일 선택">
			</div>
			<input type="hidden" name="from" value="receiver">
			<input class="button" type="submit" value="전자서명 검증"> <input class="button" type="reset" value="초기화">
		</form>
		<a href='main.jsp'><button class="button" class="footer">메인화면으로 이동</button></a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>file uploading</title>
</head>
<body>
	<%
	String encType = "UTF-8";
	int maxSize = 10 * 1024 * 1024; 
	ServletContext context = request.getServletContext();
	String realFolder = context.getRealPath("file") + "/upload";
	String value = "";
	try {
			MultipartRequest multi = null;
		    multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		    Enumeration<?> params = multi.getParameterNames();
	 	
		    while(params.hasMoreElements()) {
		        String name = (String)params.nextElement();
		        value = multi.getParameter(name);
		    }
	 
		    Enumeration<?> files = multi.getFileNames();
		    
		    while(files.hasMoreElements()) {
		        String name = (String)files.nextElement();
		        String filename = multi.getFilesystemName(name);
		        String orgfilename = multi.getOriginalFileName(name);
		        String type = multi.getContentType(name);
		        File file = multi.getFile(name);
		        
		        out.println("파라미터 이름" + name + "<br>");
		        out.println("실제 파일 이름" + orgfilename + "<br>");
		        out.println("저장된 파일 이름" + filename + "<br>");
		        out.println("파일 타입 이름" + type + "<br>");
		    }
	 	
		}catch (IOException ioe) {
			System.out.println(ioe);
		} catch (Exception ex) {
			System.out.println(ex);
		}
	out.print(value);
	if (value.equals("sender")) {
		out.print("from sender");
	%>
	<jsp:forward page="sign_result.jsp"></jsp:forward>
	<%
	} else if (value.equals("receiver")) {%>
	<jsp:forward page="verify_result.jsp"></jsp:forward>
	<%} %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file downloading</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String savePath = request.getSession().getServletContext().getRealPath("/") + "/file/download";
	String filename = (String)request.getParameter("filename");
	String orgfilename = (String)request.getParameter("orgfilename");
	
	InputStream in = null;
	OutputStream os = null;
	File file = null;
	boolean skip = false;
	String client = "";
	
	try {
		try {
			file = new File(savePath, filename);
			in = new FileInputStream(file);
		} catch (FileNotFoundException fe) {
			skip = true;
		}
		client = request.getHeader("User-Agent");
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Description", "JSP Generated Data");
		
		if (!skip) {
			if (client.indexOf("MSIE") != -1) {
				response.setHeader("Content-Disposition", "attachment; filename=" + 
			new String(orgfilename.getBytes("KSC5601"), "ISO8859_1"));
			} else {
				orgfilename = new String(orgfilename.getBytes("UTF-8"), "iso-8859-1");
				
				response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
				response.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
			}
			response.setHeader("Content-Length", "" + file.length());
			
			os = response.getOutputStream();
			byte b[] = new byte[(int)file.length()];
			int leng = 0;
			
			while ((leng = in.read(b)) > 0) {
				os.write(b, 0, leng);
			}
		}else {
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다.');history.back();</script>");
		}
		in.close();
		os.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
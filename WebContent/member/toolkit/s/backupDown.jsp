<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");

	if (fileName == null) {
		out.println("<h1>参数错误</h1>");
	} else {
		String reallyPath = application.getRealPath("/backup") + "/";
		FileReader fr = null;
		BufferedReader br = null;
		String tmp = null;

		try {
			response.setHeader("content-disposition",
					"attachment; filename=" + fileName);
			response.setCharacterEncoding("utf-8");
			fr = new FileReader(reallyPath + fileName);
			br = new BufferedReader(fr);
			while ((tmp = br.readLine()) != null) {
				out.println(tmp);
			}
			out.close();//终止页面输入内容 , 这行代码会导致错误，不知道为啥
		} catch (Exception e) {
			out.print("服务器内部出错");
		} finally {
			if (br != null) {
				br.close();

			}
		}
	}
%>

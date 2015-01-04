<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="restor" class="DB.BackUp" scope="page"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div id="map"  style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="../dataBackup.jsp">数据备份</a></div>
<div style="padding-top: 20px;">
<%
	String restorPath = request.getParameter("restorPath");
	if(restor.load(restorPath)){
		out.println("数据恢复成功");
	}else{
		out.println("数据恢复失败");
	}
%>
,<a class="xh" href="../dataBackup.jsp">点此</a>返回</div>
</body>
</html>
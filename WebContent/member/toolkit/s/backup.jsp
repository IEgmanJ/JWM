<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Mybackup" class="DB.BackUp" scope="page"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在备份</title>
<link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
</head>
<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="../dataBackup.jsp">数据备份</a></div>
<div style="padding-top: 20px;">
<%
	String backupPath = application.getRealPath("/backup"); //网站根目录下的backup文件夹
	System.out.println(backupPath);
	if(Mybackup.backup(backupPath)){
		out.println("数据备份成功");
	}else{
		out.println("数据操作失败");
	}
%>
,<a class="xh" href="../dataBackup.jsp">点此</a>返回</div>
</body>
</html>
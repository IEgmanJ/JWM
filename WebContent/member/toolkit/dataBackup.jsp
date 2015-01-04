<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="MybackupRestor" class="DB.BackUp" scope="page"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/JWM.css">
<title>数据备份</title>
<style type="text/css">
#result{
	margin-top:10px;
	width:600px;
	
}
#backupList{
	margin-top:10px;
	width: 250px;
	float: left;
	background-color:rgba(250,250,250,1.00);
}
</style>
</head>
<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">数据备份</a></div>
	<div style="margin-top: 10px; clear: both">
		<div>
		<button style=" margin-right: 30px; width: 200px; height: 60px; background-color: rgb(0, 113, 197); border-width: 0px; color: white; font-size:x-large;" onclick="window.location='s/backup.jsp'">立 即 备 份</button>
		<button style=" margin-right: 30px; width: 200px; height: 60px; background-color: rgb(0, 113, 197); border-width: 0px; color: white; font-size:x-large;" onclick="window.location='s/backupClear.jsp'">清 空 备 份</button>
		</div>
	</div>
	<%
		ArrayList<String[]> files = MybackupRestor.refreshFileList(application.getRealPath("/backup"));
		if(files.isEmpty()){
			out.println("空");
		}
		for(String[] r : files){
			%>
			<!--     查询结果    -->
			<div   id="result">
			    <div id="backupList" ><%=r[1] %></div>
		<!-- 	    <div id="backupList" > <a class="xh" href="s/restor.jsp?restorPath=<%=r[0]%>">恢复</a><a style="margin-left: 20px"  class="xh" href="../../../backup/<%=r[1]%>">下载</a></div>  -->
				<div id="backupList" > <a class="xh" href="s/restor.jsp?restorPath=<%=r[0]%>">恢复</a><a style="margin-left: 20px"  class="xh" href="s/backupDown.jsp?fileName=<%=r[1]%>">下载</a></div>
			</div> 
			<% 
		}
	%>

</body>
</html>
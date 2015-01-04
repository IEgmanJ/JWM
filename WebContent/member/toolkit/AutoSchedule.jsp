<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动排课</title>
<link rel="stylesheet" type="text/css" href="../../css/JWM.css">
<script>
function loadXMLDoc(){
	document.getElementById("info").innerHTML = "正在排课请稍后……<img src='../../img/wait.gif' />";
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}else{
		xmlhttp = new ActiveXObjext("Microsoft.XMLHTTP");
	}	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			document.getElementById("info").innerHTML = xmlhttp.responseText;
			
		}
	}
	xmlhttp.open("post","s/reAutoSchedule.jsp",true);
	xmlhttp.setRequestHeader("Content-type" , "application/x-www-form-urlencoded");
	xmlhttp.send();	
}
</script>
<style type="text/css">
#info{
	font-size:medium;
	color: rgb(0, 113, 197);
	margin-top: 20px;
	text-align: left;
}
</style>
</head>
<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">自动排课</a></div>
	<div style="margin-top: 10px; clear: both">
		<button style="margin-right: 30px; width: 200px; height: 60px; background-color: rgb(0, 113, 197); border-width: 0px; color: white; font-size:x-large;" onclick="loadXMLDoc()">重 新 排 课</button>
		<div id='info'>强烈建议你重新排课之前，<a class="xh" href="dataBackup.jsp">备份</a>一下数据</div>
	</div>
</body>
</html>
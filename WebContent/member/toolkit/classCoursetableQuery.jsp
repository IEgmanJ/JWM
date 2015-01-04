<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean>
<%
	String first = request.getParameter("first");
	
	String keywd = request.getParameter("keywd");
	String by = request.getParameter("by");   //byname OR bycode
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级课程查询</title>
<link rel="stylesheet" type="text/css" href="../../css/JWM.css">
<style type="text/css">
#searchBox{
	width:300px; 
	height:30px;
}
#searchButton{
	width:100px;
	height:37px; 
	background-color:rgb(0, 113, 197);
	color:rgba(255,255,255,1.00); 
	font-weight:bold; 
	border-width:0px;
}
#result{
	margin-top:10px;
	padding-top:10px;
	padding-bottom:10px;
	width:600px;
}
#classname{
	font-size:medium;
}
#classcode{
	font-size:small;
	color: black;
}
</style>
<script>
function check(){
	if(document.getElementById("searchBox").value == ""){
		document.getElementById("ErrInfo").innerHTML = "嘿，小朋友，妈妈说搜索东西是要输入关键字的……";
		document.getElementById("searchBox").focus();
		return false;
	}
}
function clearErr(){
	document.getElementById("ErrInfo").innerHTML = "";
}
</script>
</head>


<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">课程表查询</a></div>
<!--   
	if(第一次打开){
-->
<%
	if(first == null){
%>
	<div style="margin:0 auto; margin-top:100px; width:410px; ">
		<form action="classCoursetableQuery.jsp" onsubmit="return check();" method="get">
    	<div style="text-align:center ; margin:0 auto; margin-bottom:30px; font-size:36px ;color:rgb(0, 113, 197);"><span>班级课程查询</span></div>
    	<div id = "ErrInfo" style="height: 20px; color: RED; font-size:12px;" ></div>
		<div style="float:left; width:304px;"><input id="searchBox" name="keywd" placeholder="想看看谁家的课程表" onclick="clearErr()" ></div>
        <div style="float:left; width:100px;"><input id="searchButton" type="submit"  value="搜 索"></div>
        <div>
        	<input type="hidden" name="first" value="true">
        	<input type="radio" name="by" id="by" value="byname" checked>专业名称
            <input type="radio" name="by" id="by" value="bycode">专业代码
        </div>
        </form>
	</div>
<%
	}else if("true".equals(first)){	// 不是第一次打开，即执行了搜索
		
		String sql = "";
		if("byname".equals(by)){ //通过专业名称搜索
			sql = "SELECT g.g_mj_code , g.g_name FROM  courser_table AS ct INNER JOIN grades AS g ON ct.ct_g_mj_code = g.g_mj_code AND g.g_name LIKE '%"+keywd+"%' GROUP BY g_name ORDER BY g.g_mj_code"; 
		}else{					//通过专业代码搜索
			sql = "SELECT g.g_mj_code , g.g_name FROM  courser_table AS ct INNER JOIN grades AS g ON ct.ct_g_mj_code = g.g_mj_code AND g.g_mj_code LIKE '%"+keywd+"%' GROUP BY g_name ORDER BY g.g_mj_code";
		}
		
		String[][] result = sqlQuery.reads(sql, "g.g_mj_code" , "g.g_name").toArray(new String[0][0]);
		%>
	<div id="top" style="margin:0 auto; ">
    	<form action="classCoursetableQuery.jsp" onsubmit="return check();"  method="get">
    	<div id = "ErrInfo" style="height: 20px; color: RED; font-size:12px;" ></div>
		<div style="float:left; width:304px;"><input id="searchBox" name = "keywd" value = "<%=request.getParameter("keywd") %>" onclick="clearErr()"></div>
        <div style="float:left; width:100px;"><input id="searchButton" type="submit" value="搜 索"></div>
        <div style="clear:both">
        	<input type="hidden" name="first" value="true">
        	<input type="radio" name="by" id="by" value="byname" <%="byname".equals(by)?"checked":"" %> />专业名称
            <input type="radio" name="by" id="by" value="bycode" <%="bycode".equals(by)?"checked":"" %> />专业代码
        </div>
        </form>
        <div style="height:2px; background-color:rgb(0, 113, 197); margin-top:30px;"></div>
        <%
        if(result.length == 0){
        	%><div style="text-align:center; color: rgb(0, 113, 197)"><h3>很抱歉没有搜索到东西</h3>别问为什么，这个没有为什么！<br>要不换个关键词在搜索，祝你好运……</div>
        	<%
        }
        %>
	</div>
		
		<%
		for(String[] r : result){
			%>
			<!--     查询结果    -->
	<div   id="result">
	    <div id="classname" ><a class="xh" href="s/showtable.jsp?searchObject=class&code=<%=r[0]%>"><%=r[1] %></a></div>
	    <div id="classcode">班级代码：<%=r[0] %></div>
	</div> 
			<% 
		}
		%>
	<div style="height:2px; background-color:rgb(0, 113, 197); margin-top:30px;"></div>
		<%
	}
%>		


</body>
</html>
<%@ page language="java"  pageEncoding="UTF-8"%>
<jsp:useBean id="sqlQuery" class="DB.SQLquery" scope="session"></jsp:useBean> 
<html>
  <head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>课程信息修改</title>
	<link rel="stylesheet" type="text/css" href="../../../css/JWM.css">
	<style type="text/css">
	.input{
		height:30px;
		width:350px; 
	}
	.btn{
		background-color:rgb(0, 113, 197);
		color:rgb(255, 255, 255);
		border-width:0px;
		margin-right:40px;
		height:30px;
		width:100px;
	}
	table{
		margin:0 auto;
		line-height:30px;
	}
	td{
		padding-top:10px;
		padding-bottom:10px;
	}
	</style>
	<script type="text/javascript">
	function check(){		
		if(form.c_code.value=="" ){
			document.getElementById('c_code').innerHTML="<font color=red>课程代码不能为空</font>";
			form.c_code.focus();
			return false;
		}
		if(form.c_name.value=="" ){
			document.getElementById('c_name').innerHTML="<font color=red>课程名称不能为空</font>";
			form.c_name.focus();
			return false;
		}
			
		if(form.c_period.value=="" ){
			document.getElementById('c_period').innerHTML="<font color=red>课时不能为空</font>";
			form.c_period.focus();
			return false;
		}
	}
</script>
  </head>
  
	<body>
	<div id="map"  style="padding-top:5px;">你的位置：<a class="xh" href="../../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">课程信息修改</a></div>
	<%
		String c_code = request.getParameter("c_code");
		String info[] = sqlQuery.read("SELECT c_name, c_code, c_period FROM courser where c_code='"+c_code+"'", "c_name", "c_code", "c_period");
	%>
	<form action="courseUpdateInsert.jsp" method="get"  name="form" id="form"  onSubmit="return check()">
		<table>
			<tr>
				<td>课程名称</td>
				<td><input class="input"  name="c_name" type="text" value="<%=info[0]%>"/></td>
				</tr>
			<tr>
				<td>课程代码</td>
				<td><input class="input" name="c_code" type="text" value="<%=info[1]%>"/></td>
				</tr>
			<tr>
				<td>课程时长</td>
				<td><input class="input" name="c_period" type="text" value="<%=info[2]%>"></td>
				</tr>
			<tr>
				<td></td>
				<td><input class="btn" type="submit" value="提交"/> 
		    		<input class="btn" type="reset" value="重置"/></td>
		    	</tr>
		</table>
	</form>
  </body>
</html>

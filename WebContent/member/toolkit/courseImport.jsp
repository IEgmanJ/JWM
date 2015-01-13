<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程信息修改</title>
		<link rel="stylesheet" type="text/css" href="../../css/JWM.css"/>
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
	</head>
	<body>
	<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">课程信息录入</a></div>
	
	<form action="s/courseImportInsert.jsp" name="form" id="form"  onSubmit="return check()">
		<table>
			<tr>
				<td>课程代码</td>
				<td><input class="input" name="c_code"><div class="div" id="c_code"></div></td>
				</tr>
			<tr>
				<td>课程名称</td>
				<td><input class="input" name="c_name"><div class="div" id="c_name"></div></td>
				</tr>
			<tr>
				<td>每周课时</td>
				<td><input class="input" name="c_period"><div class="div" id="c_period"></div></td>
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
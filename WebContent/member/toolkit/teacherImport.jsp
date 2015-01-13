<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date
"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
<head>
<script type="text/javascript">
function loadXMLDoc(code){

	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}else{
		xmlhttp = new ActiveXObjext("Microsoft.XMLHTTP");
	}	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var s = <%=DateFormat.getDateInstance().format(new Date()).substring(5, 7)+""%>+code+xmlhttp.responseText; 
			document.getElementById("t_id").value = s.trim();
		}
	}
	xmlhttp.open("post","s/getCount.jsp?insertObject=teacher&code="+code,true);
	xmlhttp.setRequestHeader("Content-type" , "application/x-www-form-urlencoded");
	xmlhttp.send();	
}
</script>
<script type="text/javascript">

	function check(){
		if(form.t_name.value=="" ){
		document.getElementById('t_name').innerHTML="<font color=red>姓名不能为空</font>";
			form.t_name.focus();
			return false;
		}
		if(form.t_pwd.value=="" ){
			document.getElementById('t_pwd').innerHTML="<font color=red>密码不能为空</font>";
				form.t_pwd.focus();
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
			padding-top:5px;
			padding-bottom:5px;
		}
		</style>
<link rel="stylesheet" type="text/css" href="../../css/JWM.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息录入</title>
</head>
<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">教师信息录入</a></div>
<form name="form" id="form"onSubmit="return check()" action="s/teacherImportInsert.jsp" method="get">
<table>
<tr><td >姓名</td><td><input class="input"  name="t_name" type="text"/><div class="div" id="t_name"></div></td></tr>
<tr><td>性别</td><td><input name="t_sex" type="radio" value="女"/><span style="margin-right:40px">女</span><input  name="t_sex" type="radio" value="男"/>男 </td></tr>
<tr><td>教工号</td><td><input autocomplete="off" placeholder="当选择课程时自动生成"  class="input" name="t_id" id="t_id" readonly="readonly" type="text"/></td></tr>
<tr><td colspan="2"><div class="div" id="t_pwd"></div></td></tr>
<tr><td>登录密码</td><td><input autocomplete="off" placeholder="与教工号相同" class="input" name="t_pwd" type="text"/></td></tr>
  <tr><td>课程</td><td> 
   <select class="input" name="t_c_code" onchange="loadXMLDoc(this.value)"> 
  <option value="01">课程一</option>
  <option value="02">课程二</option>
  <option value="03">课程三</option>
  <option value="04">课程四</option>
  <option value="05">课程五</option>
  </select></td></tr>
  <tr><td>联系方式</td><td><input class="input" name="t_tell" type="text"></td></tr>
  <tr><td>家庭住址</td><td><input class="input" name="t_address" type="text"></td></tr>
  <tr><td></td><td><input style="margin-right:50px;margin-left:60px;"  class="btn" type="submit" value="提交"/> <input  class="btn" type="reset" value="重置"/></td></tr>
</table>
</form>

</body>
</html>
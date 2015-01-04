<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date
"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
body{
    font-size:14px;
}
 .input{
 font-size:14px;
    margin-top:0px;
      height:25px;
      width:300px;
      margin-top:5px;
      margin-bottom:5px     }


.input1{
    height:40px;
    width:60px;
   
}
</style>
<link rel="stylesheet" type="text/css" href="../../css/JWM.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息录入</title>
</head>
<body>
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">教师信息录入</a></div>
<form name="form" id="form"onSubmit="return check()" action="s/teacherImportInsert.jsp" method="get">
<table style="text-align:center">
<tr><td >姓名</td><td><input class="input"  name="t_name" type="text"/></td></tr>
<tr><td colspan="2"><div class="div" id="t_name"></div></td></tr>
<tr><td>性别</td><td><input name="t_sex" type="radio" value="女"/><span style="margin-right:80px">女</span><input  name="t_sex" type="radio" value="男"/>男 </td></tr>
<tr><td>教工号</td><td><input autocomplete="off" placeholder="当选择课程时自动生成"  class="input" name="t_id" id="t_id" readonly="readonly" type="text"/></td></tr>
<tr><td colspan="2"><div class="div" id="t_pwd"></div></td></tr>
<tr><td>登录密码</td><td><input autocomplete="off" placeholder="与教工号相同" class="input" name="t_pwd" type="text"/></td></tr>
  <tr><td>课程</td><td> 
   <select name="t_c_code" onchange="loadXMLDoc(this.value)" style="width:300px; margin-bottom:5px; margin-top:5px; height:33px; font-size:14px"> 
  <option value="01">课程一</option>
  <option value="02">课程二</option>
  <option value="03">课程三</option>
  <option value="04">课程四</option>
  <option value="05">课程五</option>
  </select></td></tr>
  <tr><td>联系方式</td><td><input class="input" name="t_tell" type="text"></td></tr>
  <tr><td>家庭住址</td><td><input class="input" name="t_address" type="text"></td></tr>
  <tr><td colspan="2"><input style="margin-right:50px;margin-left:60px;"  class="input1" type="submit" value="提交"/> <input  class="input1" type="reset" value="重置"/></td></tr>
</table>
</form>

</body>
</html>
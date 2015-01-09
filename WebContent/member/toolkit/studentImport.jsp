<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
			var s = <%=DateFormat.getDateInstance().format(new Date()).substring(0, 4)+""%>+code+xmlhttp.responseText; 
			document.getElementById("s_id").value = s.trim();
		}
	}
	xmlhttp.open("post","s/getCount.jsp?insertObject=student&code="+code,true);
	xmlhttp.setRequestHeader("Content-type" , "application/x-www-form-urlencoded");
	xmlhttp.send();	
}
</script>
<script type="text/javascript">

	function check(){
		if(form.s_name.value=="" ){
		document.getElementById('s_name').innerHTML="<font color=red>姓名不能为空</font>";
			form.s_name.focus();
			return false;
		}
		if(form.s_pwd.value=="" ){
			document.getElementById('s_pwd').innerHTML="<font color=red>密码不能为空</font>";
				form.s_pwd.focus();
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
<div id="map" style="padding-top:5px;">你的位置：<a class="xh" href="../welcome.html">欢迎</a> > <a class="xh" href="javascript:void(0)">学生信息录入</a></div>
<form action="s/studentImportInsert.jsp" method="get" name="form" id="form"  onSubmit="return check()">
<table style="text-align:center">
<tr><td >姓名</td><td><input class="input"  name="s_name" type="text"/></td></tr>
<tr><td colspan="2"><div class="div" id="s_name"></div></td></tr>
<tr><td>学号</td><td><input class="input"  placeholder="当选专业时自动生成" name="s_id" id="s_id" readonly="readonly"  type="text"/></td></tr>
<tr><td>登录密码</td><td><input  placeholder="与学号相同" class="input" name="s_pwd" type="text"/></td></tr>
<tr><td colspan="2"><div class="div" id="s_pwd"></div></td></tr>
<tr><td>民族</td><td><input class="input" name="s_nation" type="text"/></td></tr>
<tr><td>性别</td><td><input name="s_sex" type="radio" value="女"/><span style="margin-right:80px">女</span><input  name="s_sex" type="radio" value="男"/>男 </td></tr>
<tr><td>所属二级学院</td><td> 
   <select name="s_sc_code" style="width:300px;margin-bottom:5px; margin-top:5px; height:33px; font-size:14px">
  <option value="11111">电子信息工程学院 </option>
  </select></td></tr>
  <tr><td>所属专业</td><td> 
   <select name="s_mj_code" onchange="loadXMLDoc(this.value)" style="width:300px; margin-bottom:5px; margin-top:5px; height:33px; font-size:14px"> 
  <option value="1501">计算机应用技术 </option>
  <option value="1502">计算机网络技术</option>
  <option value="1503">软件技术</option>
  <option value="1504">计算机多媒体技术</option>
  <option value="1505">软件外包服务</option>
  <option value="1506">联想专班</option>
  <option value="1507">思科网络技术学院</option>
  <option value="1508">移动通信技术 </option>
  <option value="1509">软件外包服务（校企合作班）</option>
  </select></td></tr>
  <tr><td>联系方式</td><td><input class="input" name="s_tell" type="text"></td></tr>
  
  <tr><td>家庭住址</td><td><input class="input" name="s_address" type="text"></td></tr>
  <tr><td colspan="2"><input  style="margin-right:50px;margin-left:60px;"  class="input1" type="submit" value="提交"/> <input  class="input1" type="reset" value="重置"/></td></tr>
</table>
</form>

</body>
</html>